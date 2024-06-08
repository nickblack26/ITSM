import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId = .init()
    @Persisted var active: Bool = false
    @Persisted var admin: Bool = false
    @Persisted var authUserId: String?
    @Persisted var avatarUrl: String?
    @Persisted var company: Company?
    @Persisted var createdDate: Date = Date()
    @Persisted var createdIssueCount: Int = 0
    @Persisted var displayName: String = ""
    @Persisted var email: String = ""
    @Persisted var guest: Bool = false
    @Persisted var lastSeen: Date?
    @Persisted var name: String?
    @Persisted var organization: Organization?
    @Persisted var organizationId: ObjectId?
    @Persisted var settings: UserSettings?
    @Persisted var teams: List<Team>
    @Persisted var timezone: String?
    
    convenience init(name: String, email: String, displayName: String?) {
        self.init()
        self.email = email
        self.name = name
        self.displayName = displayName ?? email
    }
}


class UserSettings: EmbeddedObject {
    @Persisted var archivedAt: Date?
    @Persisted var createdAt: Date?
    @Persisted var showFullUserNames: Bool?
    @Persisted var subscribedToChangelog: Bool?
    @Persisted var updatedAt: Bool?
}
