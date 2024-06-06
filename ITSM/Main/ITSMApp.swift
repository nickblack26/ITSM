import SwiftUI
import RealmSwift

@main
struct ITSMApp: SwiftUI.App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let app: RealmSwift.App? = RealmSwift.App(id: "application-0-sdvzftl")

    var body: some Scene {
        WindowGroup {
            // Using Sync?
            if let app = app {
                SyncContentView(app: app)
//                    .tint(.tint)
            } else {
                EmptyView()
            }
        }
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unifiedCompact)
    }
}
