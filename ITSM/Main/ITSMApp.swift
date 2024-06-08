import SwiftUI
import RealmSwift

@main
struct ITSMApp: SwiftUI.App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let app: RealmSwift.App? = RealmSwift.App(id: "application-0-sdvzftl")

    var body: some Scene {
        WindowGroup {
            if let app = app {
                SyncContentView(app: app)
            } else {
                EmptyView()
            }
        }
//        .settings {
//            SettingsTab(.new(title: "General", icon: .gearshape), id: "general", color: .gray) {
//               SettingsSubtab(.noSelection, id: "general") { GeneralSettingsView() }
//           }
//        }
//        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unifiedCompact)
        
        Settings {
            SettingsView()
        }
    }
}
