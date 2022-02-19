//
//  SLog.swift
//  WHLogKit
//
//  Created by William Hale on 2/4/16.
//

import Foundation

public struct SLog {

    public static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        if let slog = ProcessInfo.processInfo.environment["slog"], slog == "off" { // 190308
            return
        }
        let text = items.map { "\($0)" }.joined(separator: separator)
        Swift.print(text, separator: "", terminator: terminator)
        #endif
    }

    public static func debugPrint(_ item:String) { // wch: use to show in a view
        #if DEBUG
            NotificationCenter.default.post(name: Notification.Name(rawValue: "debugNotification"), object: item)
        #endif
    }
}
