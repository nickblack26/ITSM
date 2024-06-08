import SwiftUI
import RealmSwift

struct OpenSycnedRealmView: View {
    @ObservedObject var app: RealmSwift.App
    @AsyncOpen(appId: "application-0-sdvzftl", timeout: 4000) var asyncOpen

    var body: some View {
        switch asyncOpen {
        case.connecting:
            ProgressView()
        case.waitingForUser:
            ProgressView("Waiting for the user to log in...")
        case.open(let realm):
            ContentView(app: app)
                .environment(\.realm, realm)
        case .progress(let progress):
            ProgressView(progress)
        case .error(let error):
            Text(error.localizedDescription)
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    OpenSycnedRealmView(app: .init(id: ""))
}
