import SwiftUI
import RealmSwift

struct GeneralSettingsView: View {
    @State private var file: URL?
    @State private var importing = false
    @ObservedResults(Organization.self) private var organizations
    
    var body: some View {
        @ObservedObject var organization: Organization = organizations.first ?? .init()
        Form {
            Section {
                Button {
                    importing.toggle()
                } label: {
                    AsyncImage(url: file) { image in
                        image
                            .resizable()
                            .frame(width: 48, height: 48)
                    } placeholder: {
                        Image("hourglass")
                            .resizable()
                            .frame(width: 48, height: 48)
                    }
                }
                .fileImporter(
                    isPresented: $importing,
                    allowedContentTypes: [.image]
                ) { result in
                    switch result {
                    case .success(let file):
                        self.file = URL(filePath: file.absoluteString)
                        
                        print(file.absoluteString)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            } header: {
                Text("Logo")
                    .fontWeight(.medium)
            } footer: {
                Text("Pick a logo for your workspace. Recommended size is 256x256px.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            Section {
                TextField(
                    "Workspace name",
                    text: $organization.name,
                    prompt: Text("Acme, Inc.")
                )
                TextField(
                    "Workspace URL",
                    text: $organization.urlKey,
                    prompt: Text("acme-inc")
                )
            } header: {
                Text("General")
                    .fontWeight(.medium)
            } footer: {
                Button("Update") {
                    
                }
            }
            
            Divider()
            
            Section {
               Text("If you want to permanently delete this workspace and all of its data, including but not limited to users, issues, and comments, you can do so below.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            } header: {
                Text("Delete workspace")
                    .fontWeight(.medium)
            } footer: {
                Button("Delete this workspace") {
                    
                }
            }
        }
        .navigationTitle("Workspace")
    }
}

#Preview {
    NavigationStack {
        GeneralSettingsView()
    }
    .frame(width: 500, height: 500)
}
