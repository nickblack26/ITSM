import Foundation
import RealmSwift

class Asset: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var company: Company?

    @Persisted var name: String = ""

    @Persisted var type: AssetType?

    @Persisted var user: User?
}

class AssetType: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var childTypes: List<AssetType>

    @Persisted var icon: String = ""

    @Persisted var name: String = ""

    @Persisted var organization: Organization?
}

class Communication: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var company: ObjectId?

    @Persisted var `default`: String = ""

    @Persisted var type: String = ""

    @Persisted var value: String = ""
}

class Company: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var address: Company_address?

    @Persisted var identifier: String = ""

    @Persisted var name: String = ""

    @Persisted var organization: Organization?

    @Persisted var phoneNumber: String?

    @Persisted var teams: List<Team>
}

class Company_address: EmbeddedObject {
    @Persisted var addressLine1: String?

    @Persisted var addressLine2: String?

    @Persisted var city: String?

    @Persisted var state: String?

    @Persisted var zip: String?
}

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

class Team: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var color: String?

    @Persisted var icon: String?

    @Persisted var identifier: String = ""

    @Persisted var name: String = ""

    @Persisted var organization: Organization?
    
    @Persisted var organizationId: ObjectId
}

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

class Issue: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var archivedAt: Date?

    @Persisted var assignee: User?
    
    @Persisted var assigneeId: ObjectId?

    @Persisted var autoArchivedAt: Date?

    @Persisted var autoClosedAt: Date?

    @Persisted var botActor: ObjectId?

    @Persisted var branchName: String?

    @Persisted var canceledAt: Date?

    @Persisted var completedAt: Date?

    @Persisted var createdAt: Date?

    @Persisted var creator: ObjectId?

    @Persisted var customerTicketCount: Int?

    @Persisted var cycle: ObjectId?

    @Persisted var estimate: Int?

    @Persisted var identifier: String?

    @Persisted var lastAppliedTemplate: ObjectId?

    @Persisted var name: String?

    @Persisted var number: Int?

    @Persisted var organization: Organization?

    @Persisted var parent: Issue?

    @Persisted var priority: Int?

    @Persisted var status: Status?
}

class Status: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var icon: String = ""
    @Persisted var name: String = ""
    @Persisted var organization: ObjectId?
}
