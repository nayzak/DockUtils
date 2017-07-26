//
//  ApplicationDockItem.swift
//  DockUtils
//
//  Created by Ian Kazlauskas on 26/07/2017.
//  Copyright © 2017 Ian Kazlauskas. All rights reserved.
//

import ApplicationServices

struct ApplicationDockItem {

  let title: String
  let badgeValue: String?

  init?(uiElement: AXUIElement) {
    guard
      let role: String = uiElement.value(ofAttribute: "AXRole"),
      let subrole: String = uiElement.value(ofAttribute: "AXSubrole"),
      let title: String = uiElement.value(ofAttribute: "AXTitle"),
      role == "AXDockItem" && subrole == "AXApplicationDockItem"
      else { return nil }

    self.title = title
    self.badgeValue = uiElement.value(ofAttribute: "AXStatusLabel")
  }
  
}
