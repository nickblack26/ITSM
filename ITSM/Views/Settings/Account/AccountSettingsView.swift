import SwiftUI

struct AccountSettingsView: View {
    var body: some View {
        List {
            NavigationLink("Profile") {
                ProfileSettings(user: .user1)
            }
            
            NavigationLink("Preferences") {
                ProfileSettings(user: .user1)
            }
            
            NavigationLink("Notifications") {
                ProfileSettings(user: .user1)
            }
            
            NavigationLink("Security & Access") {
                ProfileSettings(user: .user1)
            }
            
            NavigationLink("API") {
                ProfileSettings(user: .user1)
            }
        }
        .navigationTitle("Profile")
    }
}

#Preview {
    NavigationStack {
        AccountSettingsView()
    }
    .frame(minWidth: 500, minHeight: 500)
}
