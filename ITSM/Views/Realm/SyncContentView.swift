import SwiftUI
import RealmSwift

struct SyncContentView: View {
    @ObservedObject var app: RealmSwift.App
    
    var body: some View {
        if let user = app.currentUser {
            let config: Realm.Configuration = user.flexibleSyncConfiguration { subs in
                guard let innerOptional = user.customData["organizationId"], let anyBSON = innerOptional, case let .objectId(objectId) = anyBSON else { return }
            
                subs.append(QuerySubscription<Organization>(name: "organizations", query: {
                    $0._id == objectId
                }))
                print("Appended organizations query")
                
                subs.append(QuerySubscription<Asset>(name: "assets"))
                print("Appended assets query")
                
                subs.append(QuerySubscription<Company>(name: "companies"))
                print("Appended companies query")
                
                subs.append(QuerySubscription<Team>(name: "teams", query: {
                    $0.organizationId == objectId
                }))
                print("Appended teams query")
                
                subs.append(QuerySubscription<Issue>(name: "issues"))
                print("Appended my_issues query")
                
                subs.append(QuerySubscription<User>(name: "users"))
                print("Appended users query")
            }
            
            OpenSycnedRealmView(app: app)
                .environment(\.realmConfiguration, config)
        } else {
            NavigationStack {
//                LoginView(app: app)
            }
        }
    }
}

#Preview {
    SyncContentView(app: .init(id: ""))
}
