# MVVM Practice
This repository is a MVVM code base for my projects.
This Project is using MVVM pattern, Coordinator pattern...
# What's Inside?
## Layout by storyboard
Why storyboard? Because it easy :)

## Coordinator pattern
Using the coordinator pattern in iOS apps lets us remove the job of app navigation from our view controllers, helping make them more manageable and more reusable, while also letting us adjust our app's flow whenever we need.

Coorinator pattern make everything look simple
```swift
    @IBAction func signInButtonButton(_ sender: Any) {
        coordinator?.gotoSignInViewController()
    }
```

see more [here][coordinator]

[coordinator]: https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps

## MVVM with RxSwift
Instead of shoving everything into your view controller, we’re going to do a Model, View, and ViewModel.

see more [here][mvvm]

[mvvm]: https://academy.realm.io/posts/slug-max-alexander-mvvm-rxswift/

## Custom View by BaseCustomView

## Styleable UIView (Without Library)

For example you need to set titleLabel style font regular with large text and color black.

```swift
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.style.largeRegular().black()
        }
    }
```

## “Rx-able” custom view

```swift
class FavoriteCheckBox: UIButton {
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            self.setImage( isChecked ? #imageLiteral(resourceName: "IconFavouritesActive") : #imageLiteral(resourceName: "IconFavouritesInactive"), for: UIControl.State.normal)
        }
    }
    
    var isCheckedObservable: Observable<Bool> {
        return self.rx.controlEvent(UIControl.Event.touchUpInside).map { _ in
            self.isChecked = !self.isChecked
            return self.isChecked
        }
    }
    
    func bind(value: BehaviorRelay<Bool>) -> Disposable {
        return isCheckedObservable.bind(to: value)
    }
}
```

## Register and dequeue Reusable Cell easier.

register multiple cells
```swift
    tableView.register(DocumentTypeTableViewCell.string,
                               TextTableViewCell.string,
                               UploadTableViewCell.string)
```
dequeue cell
```swift
    let cell: DocumentTypeTableViewCell = tableView.dequeueReusableCell(for: indexPath)
```
