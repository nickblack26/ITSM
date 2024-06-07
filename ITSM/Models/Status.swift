import Foundation
import RealmSwift

class Status: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var icon: String = ""
    @Persisted var name: String = ""
    @Persisted var organization: ObjectId?
}
