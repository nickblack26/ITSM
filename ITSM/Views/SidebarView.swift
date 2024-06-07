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
        List(selection: $tab) {
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
                    .listRowBackground(Color.background)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.background)
    }
}

#Preview {
    @State var tab: ContentView.TabSelection? = .user(.inbox)
    
    return NavigationSplitView {
        SidebarView(tab: $tab)
    } detail: {
        
    }
}
