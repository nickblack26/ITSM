import SwiftUI
import RealmSwift

@main
struct ITSMApp: SwiftUI.App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State private var mongo = MongoManager()
    @State private var teams: [Team] = []
    let app: RealmSwift.App? = RealmSwift.App(id: "application-0-sdvzftl")
    
    var body: some Scene {
        WindowGroup {
            if let app = app {
                SyncContentView(app: app)
                    .environment(mongo)
            } else {
                EmptyView()
            }
        }
        .windowToolbarStyle(.unifiedCompact(showsTitle: false))
        
        Settings {
            SettingsView()
                .environment(mongo)
        }
    }
}
