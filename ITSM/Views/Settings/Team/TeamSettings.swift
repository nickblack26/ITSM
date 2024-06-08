//
//  TeamSettings.swift
//  ITSM
//
//  Created by Nick Black on 6/7/24.
//

import SwiftUI
import RealmSwift

struct TeamSettings: View {
    @ObservedResults(Team.self) private var teams
    
    var body: some View {
        List {
            ForEach(teams, id: \.id) { team in
                Section(team.name) {
                    TeamGeneralSettings(team: team)
                }
            }
        }
    }
}

#Preview {
    TeamSettings()
}
