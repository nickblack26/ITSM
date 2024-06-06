import SwiftUI
import RealmSwift

struct AssetListView: View {
    @Environment(\.realm) var realm
    @ObservedResults(Asset.self) private var assets
    @State private var openSheet: Bool = false
    
    
    var body: some View {
        List(assets) { asset in
            HStack {
                Text(asset.name)
                
                Text(asset.type?.name ?? "")
                
                Text("\(asset.user?.firstName ?? "") \(asset.user?.lastName ?? "")")
                
                Spacer()
                
                Text(asset.company?.name ?? "")
            }
        }
        .scrollContentBackground(.hidden)
        .sheet(isPresented: $openSheet) {
            NavigationStack {
                AssetFormView()
            }
        }
        .toolbar {
            ToolbarItem {
                Button("Add asset", systemImage: "plus") {
                    openSheet.toggle()
                }
            }
        }
    }
}

#Preview {
    AssetListView()
}
