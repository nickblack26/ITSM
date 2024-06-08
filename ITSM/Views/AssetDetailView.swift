import SwiftUI
import RealmSwift

struct RssItem: Decodable {
    var title: String
    var message: String
}

struct AssetDetailView: View {
    @ObservedRealmObject var asset: Asset
    
    
    var body: some View {
        Grid(alignment: .topLeading) {
            GridRow(alignment: .center) {
                HStack {
                    Image("windows")
                        .resizable()
                        .frame(width: 72, height: 72)
                    
                    VStack(alignment: .leading) {
                        Text(asset.name)
                            .font(.title)
                        
                        HStack {
                            Circle()
                                .frame(width: 6, height: 6)
                            
                            Text("Active")
                        }
                    }
                }
            }
            
            GridRow {
                HStack {
                    ForEach(Tab.allCases, id: \.self) {
                        Label($0.rawValue.capitalized, systemImage: $0.icon)
                    }
                }
            }
            
            GridRow {
                Grid(verticalSpacing: 18) {
                    GridRow {
                        VStack {
                            Text("Operating system")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                        
                        VStack {
                            Text("Operating system")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    GridRow {
                        VStack {
                            Text("Operating system")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                        
                        VStack {
                            Text("Operating system")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    GridRow {
                        VStack {
                            Text("Operating system")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                        
                        VStack {
                            Text("Operating system")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .task {
            do {
                let url = URL(string: "https://developer.apple.com/news/releases/rss/releases.rss")!
                let task = try await URLSession.shared.download(from: url)
                print("FEED: ", task)
            } catch {
                print(error)
            }
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}

extension AssetDetailView {
    private enum Tab: String, CaseIterable, Hashable {
        case details, software, policies
        
        var icon: String {
            switch self {
            case .details:
                "computermouse"
            case .software:
                "apple.terminal"
            case .policies:
                "doc.text.magnifyingglass"
            }
        }
    }
}

#Preview {
    AssetDetailView(asset: Asset.asset1)
        .frame(minWidth: 500, minHeight: 500)
}

