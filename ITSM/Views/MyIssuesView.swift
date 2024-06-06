//
//  MyIssuesView.swift
//  ITSM
//
//  Created by Nick Black on 6/5/24.
//

import SwiftUI
import RealmSwift

struct MyIssuesView: View {
    @State private var selectedTab: Tab? = .assigned
    @ObservedResults(Issue.self) private var myIssues

    var body: some View {
        VStack {
            HStack {
                Text("My issues")
                
                ForEach(Tab.allCases, id: \.self) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
            
            Grid {
                GridRow(alignment: .top) {
                    List(myIssues) { issue in
                        HStack {
                            Text(issue.identifier ?? "")
                            
                            Text(issue.name ?? "")
                            
                            Spacer()
                            
                            Text(
                                issue.completedAt ?? Date(),
                                format: .dateTime
                            )
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

extension MyIssuesView {
    enum Tab: String, CaseIterable {
        case assigned
        case created
        case subscribed
        case activity
    }
}

#Preview {
    MyIssuesView()
}
