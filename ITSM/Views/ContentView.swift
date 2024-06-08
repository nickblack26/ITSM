import SwiftUI
import RealmSwift
import AVKit

struct ContentView: View {
    @ObservedObject var app: RealmSwift.App
    @State private var tab: TabSelection? = .user(.inbox)
    
    var body: some View {
        NavigationSplitView {
            SidebarView(tab: $tab)
//                .toolbar {
//                    ToolbarItem {
//                        WorkspaceSelectorMenuView()
//                    }
//                }
        } detail: {
            NavigationStack {
                DetailView(tab: $tab)
            }
        }
    }
}

#Preview {
    ContentView(app: .init(id: ""))
}

extension ContentView {
    enum TabSelection: Hashable, Codable {
        case user(Tab)
        case workspace(WorkspaceTab)
//        case team(Team)
    }
    
    enum Tab: String, CaseIterable, Codable {
        case inbox
        case myIssues = "My issues"
        
        
        var icon: String {
            switch self {
            case .inbox:
                "tray"
            case .myIssues:
                "dot.viewfinder"
            }
        }
    }
    
    enum WorkspaceTab: String, CaseIterable, Codable {
        case assets
        case tickets
        case companies
        case users
        
        var icon: String {
            switch self {
            case .assets:
                "cable.connector"
            case .tickets:
                "tag"
            case .companies:
                "building"
            case .users:
                "person.2"
            }
        }
    }
}
