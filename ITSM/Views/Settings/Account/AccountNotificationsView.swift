import SwiftUI

struct AccountNotificationsView: View {
    var body: some View {
        Form {
            Section("Notification Methods") {
                Toggle("Inbox", isOn: .constant(true))
            }
            
            Section("Email") {
                Toggle("Receive an email digest for unread notifications. Notifications will be grouped together and sent based on their urgency.", isOn: .constant(true))
            }
        }
        .navigationTitle("Notifications")
    }
}

#Preview {
    NavigationStack {
        AccountNotificationsView()
    }
}
