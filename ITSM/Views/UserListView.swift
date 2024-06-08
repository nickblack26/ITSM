//
//  UserListView.swift
//  ITSM
//
//  Created by Nick Black on 6/7/24.
//

import SwiftUI
import RealmSwift

struct UserListView: View {
    @ObservedResults(User.self) private var users

    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink(user.name ?? "") {
                    UserDetailView(user: user)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Users")
    }
}

#Preview {
    UserListView()
}
