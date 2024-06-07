import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var company: Company?

    @Persisted var email: String = ""

    @Persisted var firstName: String = ""

    @Persisted var lastName: String = ""

    @Persisted var organization: Organization?

    @Persisted var teams: List<Team>

    @Persisted var title: String?

    @Persisted var workerSid: String?
}

