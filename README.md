# Stay-Swift
A Library that Help Measure Screen Stay Duration of ViewController.

## Installation

CocoaPods installation is supported.

```
use_framework!

pod "Stay"
```

## Setup
### Confirm to protocol
- Confirms to ScreenStayMeasureable protocol to the VC you want to measure screen stay duration

```
import Stay

class FooViewController: UIViewController, ScreenStayMeasureable {
…
}

```

### Set screenName

```
private(set) var screenName: String = "foo_screen"
```

### Add a setup method
- The simplest way: 
    - Put `setUpDefaultMeasurement()` method to VC 
Note: `setUpDefaultMeasurement()` must be called before viewDidAppear of the UIViewController’s lifecycle

ex: 
```
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDefaultMeasurement()
    }
```

- If you want a fine control of the measurement, put following methods to the points you wants to start/stop measurement
    - `startScreenStayTimer()`
    - `stopScreenStayTimer()`


### Get and handle screen stay duration

```
extension FooViewController: ScreenStayMeasureable {
        func didScreenStayTimerFinishMeasuring(screenStayDuration: Int64) {
            // Put your code here
            // e.g. Send screenStayDuration to logger
    }
}
```

