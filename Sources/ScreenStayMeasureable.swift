public protocol ScreenStayMeasureable: class {
    var screenName: String { get }
    var extraScreenMeasurementInfo: [String : Any] { get }
    func didScreenStayTimerFinishMeasuring(screenStayDuration: TimeInterval)
}

public extension ScreenStayMeasureable where Self: UIViewController {
    var extraScreenMeasurementInfo: [String : Any] { return [:] }

    private func prepareLifecycleHookViewController() {
        let viewController = LifecycleHookViewController()
        viewController.view.frame = .zero
        self.addChildViewController(viewController)
        self.view.insertSubview(viewController.view, at: 0)
        viewController.didMove(toParentViewController: self)
    }

    func setUpDefaultMeasurement() {
        prepareLifecycleHookViewController()

        NotificationCenter.default.addObserver(forName: .UIViewControllerViewDidAppear,
                                               object: nil,
                                               queue: nil) { [weak self] notification in
                                                self?.startScreenStayTimer()
        }

        NotificationCenter.default.addObserver(forName: .UIViewControllerViewWillDisappear,
                                               object: nil,
                                               queue: nil) { [weak self] notification in
                                                self?.stopScreenStayTimer()
        }

        NotificationCenter.default.addObserver(forName: .UIApplicationWillEnterForeground,
                                               object: nil,
                                               queue: nil) { [weak self] notification in
                                                self?.startScreenStayTimer()
        }

        NotificationCenter.default.addObserver(forName: .UIApplicationDidEnterBackground,
                                               object: nil,
                                               queue: nil) { [weak self] notification in
                                                self?.stopScreenStayTimer()
        }
    }

    func startScreenStayTimer() {
        if !(isViewLoaded && view.window != nil) { return }
        ScreenStayMeasureTimer.shared.startTimer()
    }

    func stopScreenStayTimer() {
        if !(isViewLoaded && view.window != nil) { return }
        let screenStayDuration = ScreenStayMeasureTimer.shared.stopTimer()
        if let screenStayDuration = screenStayDuration {
            didScreenStayTimerFinishMeasuring(screenStayDuration: screenStayDuration)
        }
    }
}
