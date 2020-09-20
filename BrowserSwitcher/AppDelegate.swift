//
//  AppDelegate.swift
//  BrowserSwitcher
//
//  Created by Don Schnitzius on 9/18/20.
//  Copyright © 2020 Don Schnitzius. All rights reserved.
//

//  Menus and Popovers in Menu Bar Apps for macOS [18 Aug 2017]
//  www.raywenderlich.com/450-menus-and-popovers-in-menu-bar-apps-for-macos

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem   = NSStatusBar.system.statusItem(withLength : NSStatusItem.squareLength)
    let menu         = NSMenu()
    let subMenu      = NSMenu()
//    let mainDropDown = NSMenuItem(title: "Pick One:", action: nil, keyEquivalent: "")

    let safari  = NSMenuItem(title: "Safari",  action: #selector(AppDelegate.actionMenuSafari(_:)),  keyEquivalent: "S")
    let firefox = NSMenuItem(title: "Firefox", action: #selector(AppDelegate.actionMenuFirefox(_:)), keyEquivalent: "F")
    let chrome  = NSMenuItem(title: "Chrome",  action: #selector(AppDelegate.actionMenuChrome(_:)),  keyEquivalent: "C")
    
    @objc func printQuote(_ sender: Any?) {
        let quoteText   = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name("Icon"))
            button.action = #selector(printQuote(_:))
        }
        
        constructMenu()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func constructMenu() {
        menu.addItem(NSMenuItem(title: "Set Default Browser…", action: nil, keyEquivalent: ""))
        menu.addItem(NSMenuItem.separator())
        
//        menu.addItem(mainDropDown)
//        menu.setSubmenu(subMenu, for: mainDropDown)
        menu.addItem(safari)
        menu.addItem(firefox)
        menu.addItem(chrome)
        
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        statusItem.menu = menu
        
        safari.state = NSControl.StateValue.on
    }
    
    func changeState(_ sender: NSMenuItem) {
        // Loops over the array of menu items
        for menuItem in menu.items {
            // Switches off the first (and unique) 'on' item
            if  menuItem.state == NSControl.StateValue.on {
                menuItem.state = NSControl.StateValue.off
                break
            }
        }
        // Previous 'on' item is now 'off', time to set the current item to 'on'
        sender.state = NSControl.StateValue.on
    }
    
    @objc func actionMenuSafari(_ sender: NSMenuItem) {
        changeState(sender)
        // do menu 1 stuff
    }
    
    @objc func actionMenuFirefox(_ sender: NSMenuItem) {
        changeState(sender)
        // do menu 2 stuff
    }
    
    @objc func actionMenuChrome(_ sender: NSMenuItem) {
        changeState(sender)
        // do menu 2 stuff
    }
}

//    Create a macOS Menu Bar Application Using SwiftUI [18 Dec 2019]
//    medium.com/@acwrightdesign/creating-a-macos-menu-bar-application-using-swiftui-54572a5d5f87

// import Cocoa
// import SwiftUI
//
// @NSApplicationMain
// class AppDelegate: NSObject, NSApplicationDelegate {
//    var popover       : NSPopover!
//    var statusBarItem : NSStatusItem!
//
//    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        // Create the SwiftUI view that provides the window contents.
//        let contentView = ContentView()
//
//        // Create the popover
//        let popover = NSPopover()
//        popover.contentSize           = NSSize(width:400, height:400)
//        popover.behavior              = .transient
//        popover.contentViewController = NSHostingController(rootView: contentView)
//        self.popover                  = popover
//
//        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
//        if let button = statusBarItem.button {
//            button.image = NSImage(named: "Icon")
//            button.action = #selector(togglePopover(_:))
//        }
//    }
//
//    // Create the status item
//    @objc func togglePopover(_ sender: AnyObject?) {
//        if let button = statusBarItem.button {
//            if popover.isShown {
//                popover.performClose(sender)
//            } else {
//                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
//                popover.contentViewController?.view.window?.becomeKey()
//            }
//        }
//    }
// }
