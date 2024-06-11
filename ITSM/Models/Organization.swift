import Foundation
import RealmSwift

class Organization: Object, ObjectKeyIdentifiable, Codable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var allowMembersToInvite: Bool?
    @Persisted var allowedAuthServices: List<String>
    @Persisted var archivedAt: Date?
    @Persisted var createdAt: Date = Date()
    @Persisted var createdIssueCount: Int = 0
    @Persisted var deletionRequestedAt: Date?
    @Persisted var features: Features?
    @Persisted var fiscalYearStartMonth: Int = 0
    @Persisted var integrations: List<String>
    @Persisted var logoUrl: String?
    @Persisted var name: String = ""
    @Persisted var periodUploadVolume: Double = 0
    @Persisted var themeSettings: Theme?
    @Persisted var trialEndsAt: Date?
    @Persisted var updatedAt: Date = Date()
    @Persisted var urlKey: String = ""
    @Persisted var userCount: Int = 0
    @Persisted var workSchedule: List<WorkSchedule>
}

class Features: EmbeddedObject, Codable {
    @Persisted var roadmap: Bool?
    @Persisted var saml: Bool?
    @Persisted var samlSettings: SAMLSettings?
}

class Theme: EmbeddedObject, Codable {
    @Persisted var color: String?
}


class SAMLSettings: EmbeddedObject, Codable {
    @Persisted var entityId: String?
    @Persisted var metaDataUrl: String?
    @Persisted var metaDataDownloadUrl: String?
    @Persisted var acsUrl: String?
    @Persisted var sloUrl: String?
    @Persisted var nameId: String?
}


class WorkSchedule: EmbeddedObject, Codable {
    @Persisted var closed: Bool = false
    @Persisted var endTime: String?
    @Persisted var startTime: String?
}
