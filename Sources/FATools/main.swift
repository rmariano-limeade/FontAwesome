//
//  main.swift
//  
//
//  Created by Mason Phillips on 5/20/20.
//

import Foundation
import SwiftCLI

let cli = CLI(name: "tools", version: "1.0.0", description: "FontAwesome.swift toolkit", commands: [CodegenCommand()])
cli.go()
