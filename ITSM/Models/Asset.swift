import Foundation
import RealmSwift

class Asset: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var company: Company?

    @Persisted var name: String = ""

    @Persisted var type: AssetType?

    @Persisted var user: User?
}
