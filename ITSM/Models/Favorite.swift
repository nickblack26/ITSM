import Foundation
import RealmSwift

class Favorite: Object {
    @Persisted(primaryKey: true) var _id: ObjectId = .init()

    @Persisted var createdAt: Date = Date()

    @Persisted var owner: ObjectId?

    @Persisted var type: String = ""

    @Persisted var updatedAt: Date = Date()
}
