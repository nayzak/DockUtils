//
//  main.swift
//  Test
//
//  Created by Ian Kazlauskas on 26/07/2017.
//  Copyright © 2017 Ian Kazlauskas. All rights reserved.
//

import Darwin
import AppKit
import ApplicationServices

let options = [
  kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String : true
] as CFDictionary

guard AXIsProcessTrustedWithOptions(options) else {
  print("No Accessibility permitions.")
  exit(1)
}

guard let dockApp = NSWorkspace.shared().dockApplication else {
  print("Dock is not running.")
  exit(1)
}

let dockAX = AXUIElementCreateApplication(dockApp.processIdentifier)
let applicationDockItems = dockAX.children?.first?.children?.flatMap(ApplicationDockItem.init) ?? []
let itemsWithNotifications = applicationDockItems.filter { $0.badgeValue != nil }

let output = itemsWithNotifications.isEmpty ? "No notifications" : itemsWithNotifications
  .map { "\($0.title): \($0.badgeValue!)" }
  .joined(separator: "  ")

print(output)
exit(0)
