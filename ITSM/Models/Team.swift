import Foundation
import RealmSwift

class Team: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var color: String?

    @Persisted var icon: String?

    @Persisted var identifier: String = ""

    @Persisted var name: String = ""

    @Persisted var organization: Organization?
    
    @Persisted var organizationId: ObjectId
}
