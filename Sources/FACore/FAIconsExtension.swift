//
//  FAIconsExtension.swift
//  
// Code copyright (c) 2014-present FontAwesome.swift contributors
// Refer to LICENSE file for license
//

import Foundation

// A quick extension that returns all icons for a given style
extension FAIcon {
    internal static func allIcons(matching type: FAIconStyle) -> [FAIcon] {
        return FAIcon.allCases.filter { $0.supportedStyles.contains(type) }
    }
    
    /// Check if current icon supports a specific style
    public func isSupported(style: FAIconStyle) -> Bool {
        return self.supportedStyles.contains(style)
    }
    
    /// All icons that are in the Brands font
    public var allBrands: [FAIcon] {
        return FAIcon.allIcons(matching: .brands)
    }
    /// All icons that are in the Duotone font
    public var allDuotone: [FAIcon] {
        return FAIcon.allIcons(matching: .duotone)
    }
    /// All icons that are in the Solid font
    public var allSolid: [FAIcon] {
        return FAIcon.allIcons(matching: .solid)
    }
    /// All icons that are in the Regular font
    public var allRegular: [FAIcon] {
        return FAIcon.allIcons(matching: .regular)
    }
    /// All icons that are in the Light font
    public var allLight: [FAIcon] {
        return FAIcon.allIcons(matching: .light)
    }
    
    /// Initialize a Font Awesome icon from a css code
    public init?(code: String) {
        var mutcode = code
        if !mutcode.starts(with: "fa-") { mutcode = "fa-\(mutcode)" }
        
        guard let icon = FAIcon.allCases.filter({ $0.rawValue == mutcode }).first else {
            return nil
        }
        self = icon
    }
}

// A quick extension that returns all icons for a given instance style
extension FAIconStyle {
    /// All icons that match this style
    public var allIcons: [FAIcon] {
        return FAIcon.allIcons(matching: self)
    }
}
