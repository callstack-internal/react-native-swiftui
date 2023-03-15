

@objc(SwiftChartsViewManager)
class SwiftChartsViewManager: RCTViewManager {
    
    override func view() -> (SwiftChartsView) {
        return SwiftChartsView()
    }
    
    @objc override static func requiresMainQueueSetup() -> Bool {
        return false
    }
}


