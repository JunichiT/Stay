import Foundation

class ScreenStayMeasureTimer: NSObject {
    static let shared = ScreenStayMeasureTimer()
    private var startedAt: Date?

    func startTimer() {
        startedAt = Date()
    }

    @discardableResult
    func stopTimer() -> TimeInterval? {
        guard let startedAt = startedAt else { return nil }
        let stoppedAt = Date()
        let delta = stoppedAt.timeIntervalSince(startedAt)
        self.startedAt = nil
        return delta > 0 ? delta : nil // always returns positive(valid) value
    }
}
