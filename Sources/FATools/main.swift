//
//  main.swift
//  
//
// Code copyright (c) 2014-present FontAwesome.swift contributors
// Refer to LICENSE file for license
//

import Foundation
import SwiftCLI

let cli = CLI(name: "tools", version: "1.0.0", description: "FontAwesome.swift toolkit", commands: [CodegenCommand()])
cli.go()
