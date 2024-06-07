import Foundation
import RealmSwift

class Communication: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var company: ObjectId?

    @Persisted var `default`: String = ""

    @Persisted var type: String = ""

    @Persisted var value: String = ""
}
