//
//  codegen.swift
//
// Code copyright (c) 2014-present FontAwesome.swift contributors
// Refer to LICENSE file for license
//

import Foundation
import SwiftCLI

class CodegenCommand: Command {
    let name = "codegen"

    enum IconSet: String, ConvertibleFromString, CaseIterable {
        case fontAwesome, fontAwesomePro
    }
    @Param var iconSet: IconSet
    
    func execute() throws {
        switch iconSet {
        case .fontAwesome   : try generateFontAwesome(usePro: false)
        case .fontAwesomePro: try generateFontAwesome(usePro: true)
        }
    }
    
    private func generateFontAwesome(usePro fapro: Bool) throws {
        let path: String = "FortAwesome/" + ((fapro) ? "Font-Awesome-Pro" : "Font-Awesome") + "/metadata/icons.json"
        
        guard let json = FileManager.default.contents(atPath: path) else {
            let checkpro = (fapro) ? " Did you make sure you have access to FontAwesome Pro?" : ""
            fatalError("Bad json path. Did you forget to initialize submodules?\(checkpro)")
        }

        let data = try JSONDecoder().decode(FAIcons.self, from: json).sorted { $0.key < $1.key }
        
        var faEnum = FAIcon.preamble
        faEnum += """
        
        /// An enum of FontAwesome icons
        public enum FAIcon: String, CaseIterable, CustomStringConvertible {
        """
        
        for (k, _) in data {
            let ek = k.keywordFilter().camelCased(with: "-")
            faEnum += "\n\tcase \(ek) = \"fa-\(k)\""
        }
        
        faEnum += """
        
            /// The unicode value of this icon
            public var unicode: String {
                switch self {
        """
        
        for (k, v) in data {
            let ek = k.keywordFilter().camelCased(with: "-")
            faEnum += "\n\t\t\tcase .\(ek): return \"\\u{\(v.unicode)}\""
        }
        
        faEnum += """
        
                    default: return ""
                }
            }

            /// The supported styles of this icon
            public var supportedStyles: [FAIconStyle] {
                switch self {
        """
        
        for (k, v) in data {
            let ek = k.keywordFilter().camelCased(with: "-")
            let vs = v.styles.map { $0.rawValue }.joined(separator: ", .")
            faEnum += "\n\t\t\tcase .\(ek): return [.\(vs)]"
        }
        
        faEnum += """
        
                    default: return []
                }
            }
        
            public var description: String {
                switch self {
        """
        
        for (k, v) in data {
            let ek = k.keywordFilter().camelCased(with: "-")
            faEnum += "\n\t\t\tcase .\(ek): return \"\(v.label)\""
        }
        
        faEnum += """
        
                    default: return ""
                }
            }
        }
        """
        
        FileManager.default.createFile(atPath: "Sources/FASCore/FAEnum.swift", contents: faEnum.data(using: .utf8), attributes: nil)
    }
}

// MARK: - Convenience string exts

extension String {
    func keywordFilter() -> String {
        switch self {
        case "500px":
            return "fiveHundredPixels"
        // Some of these cases are not currently in any icon set, but we're future-proofing here
        case "break", "fallthrough", "final", "import", "lazy", "public", "repeat", "subscript", "throw":
            return "`\(self)`"
        default:
            return self
        }
    }
    
    func camelCased(with separator: Character) -> String {
        return split(separator: separator).reduce("") { r, e in
            let c = r.count > 0 ? String(e.capitalized) : String(e)
            return "\(r)\(c)"
        }
    }
}
