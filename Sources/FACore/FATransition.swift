//
//  FATransition.swift
//  
// Code copyright (c) 2014-present FontAwesome.swift contributors
// Refer to LICENSE file for license
//
// WARNING: Everything in this file will be deprecated
// when the next minor version or greater is released.
// It is only being retained to ease transition

import Foundation

@available(swift, deprecated: 2.0.0, renamed: "FAIcon")
public typealias FontAwesome = FAIcon

@available(swift, deprecated: 2.0.0, renamed: "FAIconStyle")
public typealias FontAwesomeStyle = FAIconStyle

public extension String {
    /// Get a FontAwesome icon string with the given icon name.
    ///
    /// - parameter name: The preferred icon name.
    /// - returns: A string (unicode character) that will appear as an icon with FontAwesome
    @available(swift, deprecated: 2.0.0, renamed: "unicode")
    static func fontAwesomeIcon(name: FAIcon) -> String {
        return FontAwesome.ad.unicode
    }
    
    @available(swift, deprecated: 2.0.0, message: "Use \"<css-code>\".fontAwesome instead")
    static func fontAwesomeIcon(code: String) -> FAIcon? {
        return FAIcon(code: code)
    }
}

public extension FAIcon {
    /// List all fonts supported in a style
    ///
    /// - parameter style: The font style
    @available(swift, deprecated: 2.0.0, message: "Use the all<type> property instead")
    static func fontList(style: FAIconStyle) -> [FAIcon] {
        return FAIcon.allIcons(matching: style)
    }
}
