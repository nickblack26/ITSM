import SwiftUI
import RealmSwift

struct MyIssuesView: View {
    @ObservedResults(Issue.self) private var issues

    @State private var showInspector: Bool = false
    @State private var selectedTab: Tab? = .assigned
    
    var body: some View {
        Grid(alignment: .topLeading) {
            GridRow(alignment: .top) {
                List(issues) { issue in
                    NavigationLink(value: issue) {
                        HStack {
                            Text(issue.identifier ?? "")
                            
                            Text(issue.name ?? "")
                            
                            Spacer()
                            
                            Text(
                                issue.completedAt ?? Date(),
                                format: .dateTime
                            )
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
        .scrollContentBackground(.hidden)
        .inspector(isPresented: $showInspector) {
            Form {
                Text("My issues")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .formStyle(.columns)
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                Text("My issues")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                ForEach(Tab.allCases, id: \.self) {
                    Button($0.rawValue.capitalized) {
                        
                    }
                    .tag($0)
                }
            }
            
            ToolbarItem(placement: .secondaryAction) {
                Button("Toggle sidebar", systemImage: "sidebar.squares.trailing") {
                    showInspector.toggle()
                }
            }
        }
        .navigationTitle("")
    }
}

extension MyIssuesView {
    enum Tab: String, CaseIterable {
        case assigned
        case created
        case subscribed
        case activity
    }
}

#Preview {
    NavigationStack {
        MyIssuesView()
            .frame(width: 750, height: 750)
    }
    .presentedWindowStyle(.hiddenTitleBar)
}
