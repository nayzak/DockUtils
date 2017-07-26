//
//  NSWorkspace.swift
//  DockUtils
//
//  Created by Ian Kazlauskas on 26/07/2017.
//  Copyright © 2017 Ian Kazlauskas. All rights reserved.
//

import AppKit

extension NSWorkspace {

  var dockApplication: NSRunningApplication? {
    return self.runningApplications.first { $0.bundleIdentifier == "com.apple.dock" }
  }
  
}
