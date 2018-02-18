# MoyaSample

[![mit licensed](https://img.shields.io/badge/License-MIT-d94c32.svg)](./license)
![swift](https://img.shields.io/badge/Swift-4-ffac45.svg)

## Bootstrap
```
❯ git clone https://github.com/atsushi130/MoyaSample.git
❯ cd MoyaSample
❯ carthage bootstrap --platform iOS
❯ json-server --watch db.json
```

## Sample Code
```swift
SampleApi.Testy.shared.fetch()
    .subscribe(onNext: { testies in
        print(testies)
    }, onError: { error in
        print(error)
    }).disposed(by: self.disposeBag)
```

## License
MoyaSample is available under the MIT license. See the [LICENSE file](https://github.com/atsushi130/MoyaSample/blob/master/license).
