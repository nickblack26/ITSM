import Foundation
import RealmSwift

class Team: Object, ObjectKeyIdentifiable, Codable {
    @Persisted(primaryKey: true) var _id: ObjectId = .init()
    @Persisted var color: String?
    @Persisted var icon: String?
    @Persisted var identifier: String = ""
    @Persisted var name: String = ""
    @Persisted var organization: Organization?
    @Persisted var organizationId: ObjectId
    
    convenience init(document: Document) {
        self.init()
        guard let _id = document["_id"], let id = _id?.objectIdValue else { return }
        self._id = id
        guard let identifier = document["color"], let identifier = identifier?.stringValue else { return }
        self.identifier = identifier
        guard let name = document["name"], let name = name?.stringValue else { return }
        self.name = name
    }
}
