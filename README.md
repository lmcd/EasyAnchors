# EasyAnchors

EasyAnchors is a super lightweight set of UIKit extensions/operators to ease the process of setting up layout constraints. Inspired by [Cartography](https://github.com/robb/Cartography), but adapted to use layout anchors introduced in iOS 9

Before:

````
image.topAnchor.constraint(equalTo: view.topAnchor, constant: 15)
image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
image.widthAnchor.constraint(equalToConstant: 200)
image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.5)
````

After:

````
image.topAnchor == view.topAnchor + 15
image.leadingAnchor == view.leadingAnchor + 15
image.widthAnchor == 200
image.heightAnchor == image.widthAnchor * 0.5
````

### Centering Views

````
image.cenerAnchors == view.centerAnchors
````

### Fill to Edges

````
image.edgeAnchors == view.edgeAnchors
````

## TODO

- [ ] Add priority
- [ ] macOS compatibility
- [ ] Add way of applying insets to edges
- [ ] Division operator
