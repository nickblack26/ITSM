import Foundation
import RealmSwift

class AssetType: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var childTypes: List<AssetType>

    @Persisted var icon: String = ""

    @Persisted var name: String = ""

    @Persisted var organization: Organization?
}
