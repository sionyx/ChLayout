# ChLayout

ChLayout is small framework for declarative UI building.

## Install

Carthage:

```
github "sionyx/ChLayout"
```

## Usage

- Create views with `ch.create()` function. 
- Set properties with extended functions and chain them into rows.
- Combine views into hierarchical layouts.

## Examples

1. Basic layout: add subview and align with safe area 

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    view.safeAreaLayout {
        UIView.ch.create()
    }
}
```

1. Vertically stacked array of views: 

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    view.verticalStackLayout {[
        UILabel.ch.create(),
        UIImageView.ch.create(),
        UIButton.ch.create(),
    ]}
}
```

1. Special vertical stack for UIScrollView:

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    view.safeAreaLayout {
        UIScrollView.ch.create()
            .scrollableVerticalStackLayout {[
                UILabel.ch.create(),
                UIImageView.ch.create(),
                UIButton.ch.create(),
            ]}
    }
}
```

1. Assign views to view controller variables:

```swift
var titleLabel: UILabel!
var coverImageView: UIImageView!
var submitButton: UIButton!

override func viewDidLoad() {
    super.viewDidLoad()
    view.verticalStackLayout {[
        UILabel.ch.create()
            .ch.named(&titleLabel),
        UIImageView.ch.create(),
            .ch.named(&coverImageView),
        UIButton.ch.create(),
            .ch.named(&submitButton),
    ]}
}
```

1. Setup basic properties:

```swift
var titleLabel: UILabel!

override func viewDidLoad() {
    super.viewDidLoad()
    view.safeAreaLayout {
        UILabel.ch.create()
            .ch.named(&titleLabel)
            .text("ChLayout")
            .textColor(.blue)
    }
}
```

1. Setup any other propertiers: 
```swift
var titleLabel: UILabel!

override func viewDidLoad() {
    super.viewDidLoad()
    view.safeAreaLayout {
        UILabel.ch.create()
            .ch.named(&titleLabel)
            .text("ChLayout")
            .textColor(.blue)
            .ch.setup {
                $0.layer.borderWidth = 1
                $0.layer.cornerRadisu = 8
            }
    }
}
```

1. Use already created views of view controller:

```swift
var titleLabel: UILabel!

override func viewDidLoad() {
    super.viewDidLoad()

    titleLabel = UILabel(...)

    view.safeAreaLayout {
        titleLabel
            .text("ChLayout")
            .textColor(.blue)
    }
}
```

1. Create custom elements from xib:

```swift
var fancyView: MyFancyView!

override func viewDidLoad() {
    super.viewDidLoad()

    view.safeAreaLayout {
        MyFancyView.ch.fromXib()
            .ch.named(&fancyView)
            .ch.setup {
                $0.propertyOne = 1
                $0.propertyTwo = "2"
            }
    }
}
```


## Layouts

* UIView.fillLayout - child view(s) will be located inside parent view
* UIView.safeAreaLayout - child views(s) will be located inside safe area
* UIView.verticalSplitLayout - two views will be located vertically
* UIView.horizontalSplitLayout - two views will be located next to each other
* UIView.verticalStackLayout - child views will be located one under another
* UIScrollView.scrollableVerticalStackLayout - child view will be located into scrollable stack 


## Layout helpers

* .margins(_:) - sets specified margins to view
* .zeroMargins() - sets zero margins to view
* .width(_:) - sets width constraint to view
* .height(_:) - sets height constraing to view

## Property methods

* UIView
  * margins
  * zeroMargins - shorten for margins(.zero)
  * backgroundColor
  * whiteBG - shorten for backgroundColor(.white)
  * cornerRadius
  * borderWidth
  * borderColor (accepts UIColor, finally!)
* UILabel
  * text
  * font
  * textColor
* UIImageView
  * image
  * imageNamed - shorten for image(UIImage(named: ))
  * contentMode
* UIButton
  * title
  * titleColor
  * image
  

