import SwiftUI

struct AccountPreferencesView: View {
    var body: some View {
        Form {
            Section("Sessions") {
                
            }
            
            Section("Passkeys") {
                
            }
            
            Section("Authorized Applications") {
                
            }
        }
        .navigationTitle("Security & Access")
    }
}

#Preview {
    NavigationStack {
        AccountPreferencesView()
            .frame(minWidth: 500, minHeight: 500)
    }
}
