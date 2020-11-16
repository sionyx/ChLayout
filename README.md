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

### Basic layout: add subview and align with safe area 

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    view.safeAreaLayout {
        UIView.ch.create()
    }
}
```

### Vertically stacked array of views: 

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

### Special vertical stack for UIScrollView:

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

### Assign views to view controller variables:

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

### Setup basic properties:

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

### Setup any other properties: 
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
                $0.layer.cornerRadius = 8
            }
    }
}
```

### Setup any other properties inline:

```swift
var titleLabel: UILabel!

override func viewDidLoad() {
    super.viewDidLoad()
    view.safeAreaLayout {
        UILabel.ch.create()
            .ch.named(&titleLabel)
            .ch.set(\.text, "ChLayout")
            .ch.set(\.backgroundColor, .blue)
            .ch.set(\.layer.borderWidth, 1)
    }
}
```
Note: Avoid using .ch.set() for properties that already have methods in ChLayout 

### Use already created views of view controller:

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

### Create custom elements from xib:

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

### Call method by block inline: 

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    view.safeAreaLayout {
        UILabel.ch.create()
            .ch.exec(\.myConfigureFont)
    }
}

extension UILabel {
    var myConfigureFont: (() -> Void) {
        return _myConfigureFont
    }

    private func _myConfigureFont() {
        font = UIFont.systemFont(ofSize: 24)
    }
}
```

Note: Same method perform() can be used for NSObject based classes:

```swift
// Call to sizeToFit is shown only as demonstration of perform syntax!
UILabel.ch.create()
    .ch.perform(#selector(UIView.sizeToFit))
```

## Layouts

* UIView.fillLayout - child view(s) will be located inside parent view
* UIView.safeAreaLayout - child views(s) will be located inside safe area
* UIView.verticalSplitLayout - two views will be located vertically
* UIView.horizontalSplitLayout - two views will be located next to each other
* UIView.verticalStackLayout - child views will be located one under another
* UIView.positionLayout - child view will be positioned to the left/center/right and to the top/center/bottom
* UIView.floodLayout - child views will be alligned to one our two columns
* UIScrollView.scrollableVerticalStackLayout - child view will be located into scrollable stack 


## Layout helpers

* .margins(_:) - sets specified margins to view
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
  * shadow
  * clipToBounds
  * hidden
  * alpha
  * contentHuggingPriority
  * horizontalContentHuggingPriority
  * verticalContentHuggingPriority
* UILabel
  * text
  * font
  * textColor
  * textAlignment
  * numberOfLines
  * adjustsFontSizeToFitWidth
  * minimumScaleFactor
* UIImageView
  * image
  * imageNamed - shorten for image(UIImage(named: ))
  * contentMode
* UIButton
  * title
  * titleColor
  * titleFont
  * image
  * imageNamed
  * backgroundImage
  * backgroundImageNamed
  * contentEdgeInsets
  * titleEdgeInsets
  * imageEdgeInsets
* UITextField
  * text
  * font
  * textColor
  * textAlignment
  * placeholder
  * placeholder(: color:)
  * attributedPlaceholder
  * placeholder(: color:) - specific version of attributedPlaceholder
* UIScrollView
  * bounceHorizontal
  * bounceVertical
  * horizontalScrollIndicator
  * verticalScrollIndicator
  * contentInset
  * contentInsetAdjustmentBehavior
* UICollectionView
  * allowsSelection
* UITableView
  * allowsSelection
  * separatorStyle
  * separatorColor
* UIActivityIndicatorView
  * color
  * style
  * hidesWhenStopped
* UIRefreshControl
  * tintColor
  * attributedTitle
  
## Inline helpers:
* .addSubview - inline method to add subview
* .insertSubview - inline method to insert subview
* .ch.setup - inline access to object
* .ch.set - inline method to set property by keypath
* .ch.exec - inline method to call block property by keypath
* .ch.perform - inline method to perform selector for classes based on NSObject 
