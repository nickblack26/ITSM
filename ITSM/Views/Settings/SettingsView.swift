import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            WorkspaceSettings()
                .tabItem {
                    Label("Workspace", systemImage: "building")
                }
                .tag(Tab.workspace)
            
            AccountSettings()
                .tabItem {
                    Label("My Account", systemImage: "person.circle")
                }
                .tag(Tab.account)
            
            TeamSettings()
                .tabItem {
                    Label("Teams", systemImage: "person.crop.square")
                }
                .tag(Tab.team)
        }
        .frame(width: 750, height: 750)
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    private enum Tab: Hashable {
        case workspace, account, team
    }
}
