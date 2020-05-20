//
//  FA+Foundation.swift
//  
// Code copyright (c) 2014-present FontAwesome.swift contributors
// Refer to LICENSE file for license
//

import Foundation

extension String {
    var fontAwesome: FAIcon? {
        return FAIcon(code: self)
    }
}
