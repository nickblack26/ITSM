//
//  RealmManager.swift
//  ITSM
//
//  Created by Nick Black on 6/4/24.
//

import Foundation
import RealmSwift
import Observation

@Observable
final class RealmManager {
    let app: RealmSwift.App
    var realm: Realm?
    var config: Realm.Configuration? = Realm.Configuration.defaultConfiguration
    var currentUser: RealmSwift.User?
    
   init() {
       self.app = RealmSwift.App(id: "application-0-sdvzftl")
    }
    
    func login() async {
        // Authenticate with the instance of the app that points
        // to your backend. Here, we're using anonymous login.
        do {
            let user = try await app.login(
                credentials: .emailPassword(
                    email: "nick@thehourglassagency.co",
                    password: "Bl@ck1998!"
                )
            )
            
            self.currentUser = user
            
            self.realm = try await openSyncedRealm(user: user)
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func openSyncedRealm(user: RealmSwift.User) async throws -> Realm? {
        guard var config = config else { return try await .init() }
        self.config = user.flexibleSyncConfiguration { subs in
            guard let _ = subs.first(named: "organizations") else { return }
            guard let _ = subs.first(named: "companies") else { return }
            guard let _ = subs.first(named: "teams") else { return }
            guard let _ = subs.first(named: "my_issues") else { return }
            
            subs.append(QuerySubscription<Organization>(name: "organizations"))
            
            subs.append(QuerySubscription<Company>(name: "companies"))
            
            subs.append(QuerySubscription<Team>(name: "teams"))
            
//            subs.append(QuerySubscription<Issue>(name: "my_issues", query: {
//                do {
//                    let currentUser = try ObjectId(string: user.id)
//                    return $0.assignee == currentUser
//                } catch {
//                    return $0.assignee == .generate()
//                }
//            }))
        }
        
        config.objectTypes = [Organization.self, Company.self, Team.self, Issue.self]
        return try await Realm(configuration: config, downloadBeforeOpen: .always)
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
