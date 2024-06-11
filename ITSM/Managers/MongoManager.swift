import Foundation
import RealmSwift
import Observation

@Observable
final class MongoManager {
    private let app: RealmSwift.App = RealmSwift.App(id: "application-0-sdvzftl")
    var client: RealmSwift.MongoClient?
    var currentUser: RealmSwift.User?
    var customUserData: Document?
    var userId: ObjectId?
    var organizationId: ObjectId?
    
    init() {
        print("Running mongo")
        setupUser(user: app.currentUser)
        self.client = currentUser?.mongoClient("mongodb-atlas")
    }
    
    func login() async {
        do {
            let user = try await app.login(
                credentials: .emailPassword(
                    email: "nick@thehourglassagency.co",
                    password: "Bl@ck1998!"
                )
            )
            
//            self.currentUser = user
            self.client = user.mongoClient("mongodb-atlas")
        } catch {
            print(error)
        }
    }
    
    private func setupUser(user: RealmSwift.User?) {
        guard let currentUser = app.currentUser else { return }
        self.currentUser = currentUser
        self.customUserData = currentUser.customData
        
        if let orgInnerOptional = currentUser.customData["organizationId"], let orgAnyBSON = orgInnerOptional, case let .objectId(orgId) = orgAnyBSON {
            self.organizationId = orgId
        }
        
        if let userInnerOptional = currentUser.customData["_id"], let userAnyBSON = userInnerOptional, case let .objectId(userId) = userAnyBSON {
            self.userId = userId
        }
    }
    
//    @MainActor
//    func useRealm(_ realm: Realm, _ user: User) {
//        // Add some tasks
//        let todo = Todo(name: "Do laundry", ownerId: user.id)
//        try! realm.write {
//            realm.add(todo)
//        }
//    }
}

actor RealmActor {
    // An implicitly-unwrapped optional is used here to let us pass `self` to
    // `Realm(actor:)` within `init`
    var realm: Realm!
    init() async throws {
        realm = try await Realm(actor: self)
    }

    var count: Int {
        realm.objects(Company.self).count
    }
    
//    func createTodo(name: String, owner: String, status: String) async throws {
//        try await realm.asyncWrite {
//            realm.create(Todo.self, value: [
//                "_id": ObjectId.generate(),
//                "name": name,
//                "owner": owner,
//                "status": status
//            ])
//        }
//    }
//    
//    func getTodoOwner(forTodoNamed name: String) -> String {
//        let todo = realm.objects(Todo.self).where {
//            $0.name == name
//        }.first!
//        return todo.owner
//    }
//    
//    struct TodoStruct {
//        var id: ObjectId
//        var name, owner, status: String
//    }
//    
//    func getTodoAsStruct(forTodoNamed name: String) -> TodoStruct {
//        let todo = realm.objects(Todo.self).where {
//            $0.name == name
//        }.first!
//        return TodoStruct(id: todo._id, name: todo.name, owner: todo.owner, status: todo.status)
//    }
//    
//    func updateTodo(_id: ObjectId, name: String, owner: String, status: String) async throws {
//        try await realm.asyncWrite {
//            realm.create(Todo.self, value: [
//                "_id": _id,
//                "name": name,
//                "owner": owner,
//                "status": status
//            ], update: .modified)
//        }
//    }
//    
//    func deleteTodo(id: ObjectId) async throws {
//        try await realm.asyncWrite {
//            let todoToDelete = realm.object(ofType: Todo.self, forPrimaryKey: id)
//            realm.delete(todoToDelete!)
//        }
//    }
    
    func close() {
        realm = nil
    }
}
