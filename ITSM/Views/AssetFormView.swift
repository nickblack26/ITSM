import SwiftUI
import RealmSwift

struct AssetFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    @State private var asset: Asset
    
    @ObservedResults(Organization.self) private var organizations
    @ObservedResults(Company.self) private var companies
    @ObservedResults(User.self) private var users
    
    init(asset: Asset? = nil) {
        self._asset = State(initialValue: asset ?? .init())
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $asset.name)
            
            Picker("Company", selection: $asset.company) {
                ForEach(companies.sorted(by: \.name)) {
                    Text($0.name)
                        .tag(Optional($0))
                }
            }
            
            Picker("User", selection: $asset.user) {
                ForEach(users) {
                    Text($0.email)
                        .tag(Optional($0))
                }
            }
            
            Button("Save", action: createAsset)
//                .disabled(asset.name.isEmpty)
        }
        .onSubmit(createAsset)
    }
    
    func createAsset() {
        withAnimation {
            let selectedCompany = asset.company
            let companyCopy = companies.first { $0._id == selectedCompany?._id }
            
            try! realm.write {
                // Add the instance to the realm.
                realm.create(Asset.self, value: asset)
            }
            
            dismiss()
        }
    }
}

#Preview {
    AssetFormView()
}
