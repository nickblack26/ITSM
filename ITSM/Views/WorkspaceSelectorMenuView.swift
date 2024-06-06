import SwiftUI

struct WorkspaceSelectorMenuView: View {
    @State private var isPresented = false
    @State private var isHovering = false
    
    var body: some View {
        Button {
            isPresented.toggle()
        } label: {
            Image("hourglass")
                .resizable()
                .frame(width: 24, height: 24)
            
            Text("Hourglass")
        }
        .buttonStyle(HoverButton())
        .popover(isPresented: $isPresented) {
            List {
                Text("Preferences")
                    .badge("⌃⇧E")
                
                
                Divider()
                
                Text("Workspace settings")
                
                Text("Invite and manage members")
                
                
                Divider()
                
                Text("Download desktop app")
                
                
                Divider()
                
                Text("Switch workspace")
                
                Text("Log out")
                
            }
            .listSectionSeparatorTint(.accentColor)
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    WorkspaceSelectorMenuView()
}
