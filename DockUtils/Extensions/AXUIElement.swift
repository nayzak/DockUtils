//
//  AXUIElement.swift
//  DockUtils
//
//  Created by Ian Kazlauskas on 26/07/2017.
//  Copyright © 2017 Ian Kazlauskas. All rights reserved.
//

import ApplicationServices

extension AXUIElement {

  func value<T>(ofAttribute attributeName: String) -> T? {
    guard attributes.contains(attributeName) else { return nil }

    var value: AnyObject?
    AXUIElementCopyAttributeValue(self, attributeName as CFString, &value)

    return value as? T
  }

  var children: [AXUIElement]? {
    return self.value(ofAttribute: "AXChildren")
  }

  private var attributes: [String] {
    var attrs: CFArray?
    AXUIElementCopyAttributeNames(self, &attrs)
    return (attrs as? [String]) ?? []
  }
  
}
