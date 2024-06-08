import SwiftUI

struct WorkspaceSettings: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(Tab.allCases, id: \.self) {
                    NavigationLink($0.rawValue, value: $0)
                }
            }
            .navigationDestination(for: Tab.self) { tab in
                switch tab {
                case .general:
                    GeneralSettingsView()
                default:
                    Text("Other")
                }
            }
        }
    }
}

extension WorkspaceSettings {
    private enum Tab: String, CaseIterable, Hashable {
        case general, security, members, labels, projects, templates, roadmaps, slas, asks, applications, emojis, plans, billing, export, integrations
    }
}

#Preview {
    WorkspaceSettings()
}
