//
//  WebService.swift
//  NVGTest
//
//  Created by iOS Dev on 7/9/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Moya
import Result

/// The class manages all web service requests.
public class WebService {
    
    /// All sent requests.
    private var requests = [CancellableRequest]()
    
    @discardableResult func request<T: Codable>(withTarget target: ServiceTarget,ignoreCache: Bool = false,  progress: ProgressBlock? = nil, completion: @escaping ((RequestResult<T>, Response?) -> Void)) -> Cancellable? {
        guard Reachability.isInternetAvailable else {
            completion(.failure(error: WebServiceError.networkDown), nil)
            return nil
        }
        let provider = createProvider(withTarget: target)
        let id = UUID().uuidString
        var request = CancellableRequest(id: id, cancellable: nil)
        let cancellable = provider.request(target, callbackQueue: nil, progress: progress) { [unowned self] (result) in
            self.handleResult(result: result, completion: completion)
            self.requests = self.requests.filter { $0.id != id }
        }
        request.cancellable = cancellable
        requests.append(request)
        return cancellable
    }
    
    func cancelAllRequests() {
        for request in requests {
            request.cancellable?.cancel()
        }
    }
}

extension WebService {
    private func handleResult<T: Codable>(result: Result<Moya.Response, MoyaError>, completion: @escaping ((RequestResult<T>, Response?) -> Void)) {
        switch result {
        case .success(let response):
            let statusCode = response.statusCode
            switch statusCode {
            case 200..<300:
                if let model = try? response.map(T.self) {
                    completion(.success(model: [model]), response)
                } else if let modelList = try? response.map([T].self) {
                    completion(.success(model: modelList), response)
                } else {
                    completion(.failure(error: .emptyResponse), response)
                }
            case 400..<500:
                if let errorMessageModel = try? response.map(ErrorMessageModel.self) {
                    completion(.failure(error: .authenticationError(message: errorMessageModel.message)), response)
                } else {
                    completion(.failure(error: .authenticationError(message: nil)), response)
                }
            default:
                completion(.failure(error: .httpError(errorCode: statusCode)), response)
            }
        case .failure(let error):
            completion(.failure(error: WebServiceError.moyaError(error: error)), nil)
            break
        }
    }
}

// MARK: - Convenient methods

extension WebService {
    
    private func createManager(withTimeOut timeOut: TimeInterval) -> Manager {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeOut
        configuration.timeoutIntervalForResource = timeOut
        return Manager(configuration: configuration, serverTrustPolicyManager: nil)
    }
    
    private func createProvider(withManager manager: Manager) -> MoyaProvider<ServiceTarget> {
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(verbose: true),
            NetworkActivityPlugin.init(networkActivityClosure: { (type, target) in
                print(" NetworkActivityPlugin \(type) ")
            })
        ]
        return MoyaProvider<ServiceTarget>(manager: manager, plugins: plugins)
    }
    
    private func createProvider(withTarget target: ServiceTarget) -> MoyaProvider<ServiceTarget> {
        let manager = createManager(withTimeOut: target.timeOut)
        let provider = createProvider(withManager: manager)
        return provider
    }
}
