import Foundation
import RealmSwift

class Issue: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var archivedAt: Date?
    @Persisted var assignee: User?
    @Persisted var assigneeId: String?
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
