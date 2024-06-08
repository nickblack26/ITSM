import SwiftUI
import RealmSwift

struct IssueDetailView: View {
    @ObservedRealmObject var issue: Issue

    var body: some View {
        Grid {
            Text("Heyllo there")
        }
        .navigationTitle(Binding(get: {
            return issue.name ?? ""
        }, set: { newValue in
            issue.name = newValue
        }))
    }
}

#Preview {
    NavigationStack {
        IssueDetailView(issue: .init())
    }
    .frame(maxWidth: 500, maxHeight: 500)
}
