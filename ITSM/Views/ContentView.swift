import SwiftUI
import RealmSwift
import AVKit

struct ContentView: View {
    @ObservedObject var app: RealmSwift.App
    
    @State private var tab: TabSelection? = .user(.inbox)
    
    @ObservedResults(Organization.self) private var organizations
    @ObservedResults(Team.self) private var teams
    @ObservedResults(Issue.self) private var myIssues
    
    @Environment(\.realm) private var realm
    @Environment(\.realmConfiguration) private var realmConfig
    
    var body: some View {
        NavigationSplitView {
            List(selection: $tab) {
                Section {
                    ForEach(Tab.allCases, id: \.self) {
                        Label(
                            $0.rawValue.capitalized,
                            systemImage: $0.icon
                        )
                        .tag(TabSelection.user($0))
                        .listRowBackground(Color.background)
                    }
                }
               
                
                Section("Workspace") {
                    ForEach(WorkspaceTab.allCases, id: \.self) {
                        Label(
                            $0.rawValue.capitalized,
                            systemImage: $0.icon
                        )
                        .tag(TabSelection.workspace($0))
                        .listRowBackground(Color.background)
                    }
                }
                
                Section {
                    ForEach(teams) {
                        Label(
                            $0.name,
                            systemImage: $0.icon ?? ""
                        )
                        .listRowBackground(Color.background)
                    }
                } header: {
                    HStack {
                        Text("Teams")
                        
                        Spacer()
                        
                        Button {
//                            print(realm.realm)
//                            guard let realm = realm.realm else { return }
                            
                            withAnimation {
                                let organization = Organization()
                                organization._id = .init()
                                organization.name = "Testing Org"
                                organization.urlKey = "testing-org"
                                
                                do {
                                    try realm.write {
                                        realm.add(organization)
                                    }
                                } catch {
                                    print(error)
                                }
                                
//                                $organizations.append(organization)
//                                
//                                let team = Team()
//                                team._id = .init()
//                                team.name = "Team C"
//                                team.identifier = "TEC"
//                                team.color = "#ff0080"
//                                team.icon = "laptopcomputer"
//                                team.organization = organization
//                                
//                                do {
//                                    try realm.write {
//                                        realm.add(team)
//                                    }
//                                } catch {
//                                    print(error)
//                                }
                                
//                                $teams.append(team)
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .secondaryAction) {
                    WorkspaceSelectorMenuView()
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.background)
        } detail: {
            switch tab {
            case .user(let userTab):
                switch userTab {
                case .inbox:
                    Text("Inbox view")
                case .myIssues:
                    MyIssuesView()
                }
            case .workspace(let workspaceTab):
                switch workspaceTab {
                case .assets:
                    AssetListView()
                default:
                   TextNode()
                }
            default:
                TextNode()
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
