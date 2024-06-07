import Foundation
import RealmSwift

class Company: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var address: CompanyAddress?

    @Persisted var identifier: String = ""

    @Persisted var name: String = ""

    @Persisted var organization: Organization?

    @Persisted var phoneNumber: String?

    @Persisted var teams: List<Team>
}

class CompanyAddress: EmbeddedObject {
    @Persisted var addressLine1: String?
    @Persisted var addressLine2: String?
    @Persisted var city: String?
    @Persisted var state: String?
    @Persisted var zip: String?
}
