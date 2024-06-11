//
//  Project.swift
//  ITSM
//
//  Created by Nick Black on 6/10/24.
//

import Foundation
import RealmSwift

final class Project: Object, ObjectKeyIdentifiable {
    @Persisted var _id: ObjectId
    @Persisted var archivedAt: Date?
    @Persisted var autoArchivedAt: Date?
    @Persisted var canceledAt: Date?
    @Persisted var color: String
    @Persisted var completedAt: Date?
    @Persisted var completedIssueCountHistory: Date?
    @Persisted var content: Date?
    @Persisted var convertedFromIssue: Date?
    @Persisted var createdAt: Date = Date()
    @Persisted var creator: User?
    @Persisted var brief: String
    @Persisted var favorite: Favorite?
    @Persisted var icon: String
    @Persisted var issues: List<Issue>
    @Persisted var lead: User?
    @Persisted var members: List<User>
    @Persisted var name: String
    @Persisted var progress: Float
    @Persisted var slugId: String
    @Persisted var sortOrder: Int
    @Persisted var startDate: Date?
    @Persisted var startedAt: Date?
    @Persisted var status: Status?
    @Persisted var targetDate: Date?
    @Persisted var teams: List<Team>
    @Persisted var trashed: Bool = false
    @Persisted var updatedAt: Date = .now
    @Persisted var url: String = ""
    
    init(
        archivedAt: Date? = nil,
        autoArchivedAt: Date? = nil,
        canceledAt: Date? = nil,
        color: String,
        completedAt: Date? = nil,
        completedIssueCountHistory: Date? = nil,
        content: Date? = nil,
        convertedFromIssue: Date? = nil,
        creator: User? = nil,
        brief: String,
        favorite: Favorite? = nil,
        icon: String,
        issues: List<Issue>,
        lead: User? = nil,
        members: List<User>,
        name: String,
        progress: Float,
        sortOrder: Int,
        startDate: Date? = nil,
        startedAt: Date? = nil,
        status: Status? = nil,
        targetDate: Date? = nil,
        teams: List<Team>
    ) {
        self._id = .init()
        self.archivedAt = archivedAt
        self.autoArchivedAt = autoArchivedAt
        self.canceledAt = canceledAt
        self.color = color
        self.completedAt = completedAt
        self.completedIssueCountHistory = completedIssueCountHistory
        self.content = content
        self.convertedFromIssue = convertedFromIssue
        self.createdAt = .now
        self.creator = creator
        self.brief = brief
        self.favorite = favorite
        self.icon = icon
        self.issues = issues
        self.lead = lead
        self.members = members
        self.name = name
        self.progress = progress
        self.slugId = name.lowercased().split(separator: " ").joined(separator: "-")
        self.sortOrder = sortOrder
        self.startDate = startDate
        self.startedAt = startedAt
        self.status = status
        self.targetDate = targetDate
        self.teams = teams
        self.trashed = false
        self.updatedAt = .now
        self.url = name.lowercased().split(separator: " ").joined(separator: "-")
    }
}
