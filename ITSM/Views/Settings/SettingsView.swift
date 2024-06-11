import SwiftUI
import RealmSwift

struct SettingsView: View {
    @Environment(MongoManager.self) private var mongo
    
    @State private var organization: Organization?
    
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
        .task {
            guard let innerOptional = mongo.currentUser?.customData["organizationId"], let anyBSON = innerOptional, case let .objectId(objectId) = anyBSON else { return }
            let queryFilter: Document = ["_id": anyBSON]

            mongo.client?.database(named: "public").collection(withName: "organizations").findOneDocument(filter: queryFilter) { result in
                switch result {
                case .failure(let error):
                    print("Did not find matching documents: \(error.localizedDescription)")
                    
                    return
                case .success(let document):
                    print("Found a matching document: \(String(describing: document))")
                    self.organization = document as? Organization
                }
            }
        }
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
