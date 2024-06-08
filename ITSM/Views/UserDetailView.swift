import SwiftUI
import RealmSwift

struct UserDetailView: View {
    @ObservedRealmObject var user: User
    
    var body: some View {
        Grid(alignment: .topLeading) {
            GridRow(alignment: .center) {
                HStack {
                    AsyncImage(
                        url: URL(string: user.avatarUrl ?? "https://uploads-ssl.webflow.com/61d87d426829a9bac65eeb9e/654d2b113b66e71152acc84c_Nick_Headshot_Fall2023.jpg")
                    ) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 72, height: 72)
                            .clipShape(Circle())
                    } placeholder: {
                        Image("placeholder")
                            .resizable()
                            .frame(width: 72, height: 72)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(user.name ?? "")
                                .font(.title)
                            
                            HStack {
                                Circle()
                                    .frame(width: 6, height: 6)
                                
                                Text("Fikri Studio")
                            }
                            .padding(.horizontal, 6)
                            .foregroundStyle(.green)
                            .background(.green.opacity(0.125))
                            .clipShape(Capsule())
                            
                            HStack {
                                Circle()
                                    .frame(width: 6, height: 6)
                                
                                Text("Fikri Studio - 5 Days ago")
                            }
                            .padding(.horizontal, 6)
                            .foregroundStyle(.gray)
                            .background(.gray.opacity(0.125))
                            .clipShape(Capsule())
                        }
                       
                        Text(user.company?.name ?? "")
                    }
                }
                .gridCellColumns(3)
            }
            
            GridRow(alignment: .center) {
                List {
                    Section("Source") {
                        
                    }
                    .listRowBackground(Color.background)
                    
                    Section("Phone Number") {
                        
                    }
                    .listRowBackground(Color.background)

                    
                    Section("Email") {
                        
                    }
                    .listRowBackground(Color.background)

                    Section("Location") {
                        
                    }
                    .listRowBackground(Color.background)
                    
                    Section("Languages Spoken") {
                        
                    }
                    .listRowBackground(Color.background)
                    
                    Section("Timezone") {
                        
                    }
                    .listRowBackground(Color.background)
                    
                    Section("Response Time") {
                        
                    }
                    .listRowBackground(Color.background)
                    
                    Section("Company") {
                        
                    }
                    .listRowBackground(Color.background)
                    
                    Section("Description") {
                        
                    }
                    .listRowBackground(Color.background)
                }
                .listRowBackground(Color.background)
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                
                Grid {
                    GridRow {
                        VStack(alignment: .leading) {
                            Text("Tickets")
                                .foregroundStyle(.secondary)
                            
                            Text("16")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Overdue Tickets")
                                .foregroundStyle(.secondary)
                            
                            Text("16")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Overdue Tickets")
                                .foregroundStyle(.secondary)
                            
                            Text("16")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Overdue Tickets")
                                .foregroundStyle(.secondary)
                            
                            Text("16")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    GridRow {
                        Table(of: Team.self) {
                            TableColumn("ID") { issue in
                                Text("issue")
                            }
                        } rows: {
                            ForEach(user.teams) {
                                TableRow($0)
                            }
                        }
                        .gridCellColumns(4)
                    }
                }
                .gridCellColumns(2)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                Button("Previous user", systemImage: "chevron.down") {
                    
                }
                .buttonStyle(HoverButton())
                
                Button("Next user", systemImage: "chevron.up") {
                    
                }
                .buttonStyle(HoverButton())

                Text("4 of 142")
            }
            
            ToolbarItemGroup(placement: .primaryAction) {
                ControlGroup {
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                    
                    Button("Add new ticket") {
                        
                    }
                    
                    Divider()
                        .frame(maxWidth: 1, maxHeight: .infinity)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.down")
                    }
                }
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

#Preview {
    UserDetailView(user: User.user1)
        .background(Color.background)
}

extension User {
    static let user1 = User(
        name: "Nick Black",
        email: "nblack@velomethod.com",
        displayName: "Nick"
    )
}
