import SwiftUI
import RealmSwift

struct TeamGeneralSettings: View {
    @ObservedRealmObject var team: Team
    @State private var selectedTimezone: TimeZone = .current
    
    var body: some View {
        let TZidentifiers = TimeZone.knownTimeZoneIdentifiers
        Form {
            Section("General") {
                TextField("Icon & Name", text: $team.name)
                TextField("Identifier", text: $team.identifier)
            }
            
            Section("Timezone") {
                Picker("Timezone", selection: $selectedTimezone) {
                    ForEach(TZidentifiers, id: \.self) {
                        Text($0.description)
                            .tag(TimeZone(identifier: $0))
                    }
                }
                TextField("Timezone", text: $team.identifier)
            }
            
            Section("Estimates") {
                TextField("Issue estimation", text: $team.identifier)
            }
            
            Section("Priorities") {
                TextField("Issue prioritization order", text: $team.identifier)
            }
            
            Section("Create by email") {
                TextField("Enable issue creation by email", text: $team.identifier)
            }
            
            Section("Other") {
                TextField("Disable issue history grouping", text: $team.identifier)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TeamGeneralSettings(team: .team1)
    }
    .frame(minWidth: 500, minHeight: 500)
}

extension Team {
    static let team1: Team = .init()
}
