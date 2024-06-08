import SwiftUI
import RealmSwift

struct ProfileSettings: View {
    @ObservedRealmObject var user: User
    
    var body: some View {
        Form {
            Section {
                TextField("Email", text: $user.email)
                
                TextField("Full name", text: Binding(value: $user.name))
                
                TextField("Display name", text: $user.displayName)
            }
            
            Section("Personal integrations") {
                
            }
        }
    }
}

#Preview {
    ProfileSettings(user: User.user1)
}
