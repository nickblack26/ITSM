import Foundation
import RealmSwift

class Organization: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var integrations: List<String>

    @Persisted var name: String = ""

    @Persisted var urlKey: String = ""

    @Persisted var workSchedule: List<Organization_workSchedule>
}

class Organization_workSchedule: EmbeddedObject {
    @Persisted var closed: Bool = false

    @Persisted var endTime: String?

    @Persisted var startTime: String?
}
