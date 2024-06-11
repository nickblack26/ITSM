import SwiftUI
import RealmSwift

struct SidebarView: View {
    @Environment(\.realm) private var realm
    @Environment(\.realmConfiguration) private var realmConfig
    
    @Binding var tab: ContentView.TabSelection?
    @ObservedResults(Organization.self) private var organizations
    @ObservedResults(Team.self) private var teams
    @ObservedResults(Issue.self) private var myIssues
    
    var body: some View {
        SwiftUI.List(selection: $tab) {
            Section {
                ForEach(ContentView.Tab.allCases, id: \.self) {
                    Label(
                        $0.rawValue.capitalized,
                        systemImage: $0.icon
                    )
                    .tag(ContentView.TabSelection.user($0))
                    .listRowBackground(Color.background)
                }
            }
            
            Section("Workspace") {
                ForEach(ContentView.WorkspaceTab.allCases, id: \.self) {
                    Label(
                        $0.rawValue.capitalized,
                        systemImage: $0.icon
                    )
                    .tag(ContentView.TabSelection.workspace($0))
                    .listRowBackground(Color.background)
                }
            }
            
            Section("Teams") {
                ForEach(teams) {
                    Label(
                        $0.name,
                        systemImage: $0.icon ?? ""
                    )
                    .tag(ContentView.TabSelection.team($0))
                    .listRowBackground(Color.background)
                }
            }
        }
        .toolbar(removing: .sidebarToggle)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Create new project", systemImage: "plus") {
                    withAnimation {
//                        try! realm.write {
//                            let project: Project = .init(
//                                color: "yellow",
//                                brief: "",
//                                icon: "grid",
//                                issues: [],
//                                members: [],
//                                name: "CMDB Project",
//                                progress: 0,
//                                sortOrder: teams.count,
//                                teams: teams.first ?? []
//                            )
//                            realm.create(Project.self, value: project)
//                        }
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.background)
        .searchable(
            text: .constant(""),
            placement: .sidebar,
            prompt: Text("Search anything...")
        )
    }
}

#Preview {
    @Previewable @State var tab: ContentView.TabSelection? = .user(.inbox)
    
    return NavigationSplitView {
        SidebarView(tab: $tab)
    } detail: {
        
    }
}
