import Cocoa
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        if let window = NSApplication.shared.windows.first {
            window.titleVisibility = .hidden
            window.titlebarAppearsTransparent = true
            window.isOpaque = true
            window.backgroundColor = NSColor.background
        }
    }
}


//        if let applicationWindow = NSApplication.shared.mainWindow {
//            applicationWindow.titleVisibility = .hidden
//            applicationWindow.titlebarAppearsTransparent = true
//            applicationWindow.isOpaque = true
//            applicationWindow.backgroundColor = NSColor.background
//
//            let customNavbar = NSHostingView(rootView: CustomNavbarView())
//            let floatingWindow = NSWindow()
//            floatingWindow.styleMask = .borderless
//            floatingWindow.contentView = customNavbar
//            floatingWindow.backgroundColor = .yellow
//            floatingWindow.title = "Navbar"
//
//            applicationWindow.addChildWindow(floatingWindow, ordered: .above)
//        }

//if let mainMenu = NSApplication.shared.mainMenu {
//    let item: NSMenuItem = .separator()
//    mainMenu.presentationStyle = .palette
//    mainMenu.showsStateColumn = true
//    mainMenu.userInterfaceLayoutDirection = .rightToLeft
//    mainMenu.addItem(item)
//    print(mainMenu)
//}
