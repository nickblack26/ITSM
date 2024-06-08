import SwiftUI

struct DetailView: View {
    @Binding var tab: ContentView.TabSelection?

    var body: some View {
        ZStack {
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
                case .users:
                    UserListView()
                default:
                   TextNode()
                }
            default:
                TextNode()
            }
        }
        .navigationDestination(for: Issue.self) { issue in
            IssueDetailView(issue: issue)
        }
    }
}

#Preview {
    @State var selectedTab: ContentView.TabSelection? = .user(.inbox)
    
    return DetailView(tab: $selectedTab)
}
