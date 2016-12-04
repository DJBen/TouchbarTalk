//
//  WindowController.swift
//  TouchbarTalk
//
//  Created by Sihao Lu on 12/4/16.
//  Copyright © 2016 Sihao. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBarItemIdentifier {
    static let label = NSTouchBarItemIdentifier("com.squareup.sihao.TouchbarTalk.label")
}

fileprivate extension NSTouchBarCustomizationIdentifier {
    static let master = NSTouchBarCustomizationIdentifier("com.squareup.sihao.TouchbarTalk.master")
}

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.customizationIdentifier = .master
        touchBar.defaultItemIdentifiers = [.label]
        touchBar.customizationAllowedItemIdentifiers = [.label]
        touchBar.delegate = self
        return touchBar
    }
}

extension WindowController: NSTouchBarDelegate {
    
    // MARK: - touch bar delegate
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        switch identifier {
        case NSTouchBarItemIdentifier.label:
            let item = NSCustomTouchBarItem(identifier: .label)
            item.view = {
                let text = NSTextField(labelWithString: "TouchBar 😃🐻🍔⚽")
                text.font = NSFont.systemFont(ofSize: 19)
                return text
            }()
            return item
        default:
            return nil
        }
    }
}

