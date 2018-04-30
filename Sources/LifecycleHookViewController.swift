extension Notification.Name {
    static let UIViewControllerViewDidAppear = Notification.Name("UIViewControllerViewDidAppear")
    static let UIViewControllerViewWillDisappear = Notification.Name("UIViewControllerViewWillDisappear")
}

class LifecycleHookViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.post(name: .UIViewControllerViewDidAppear, object: self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: .UIViewControllerViewWillDisappear, object: self)
    }
}
