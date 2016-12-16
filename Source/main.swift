//
//  main.swift
//  Sango
//
//  Created by Steve Hales on 8/9/16.
//  Copyright © 2016 Afero, Inc. All rights reserved.
//

// https://www.raywenderlich.com/128039/command-line-programs-os-x-tutorial

import Foundation
import CoreFoundation
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


public func findOption(_ args:[String], option:String) -> Bool
{
    var found = false
    for argument in args {
        if (argument == option) {
            found = true
        }
    }
    return found
}

public func getOption(_ args:[String], option:String) -> String?
{
    var found:String? = nil
    for argument in args {
        if argument == option {
            var indx = args.index(of: argument)
            if (indx != nil) {
                indx = indx! + 1
                if indx < args.count {
                    found = args[indx!]
                }
            }
            break
        }
    }
    return found
}

public func getOptions(_ args:[String], option:String) -> [String]?
{
    var found:[String]? = nil
    for argument in args {
        if (argument == option) {
            var indx = args.index(of: argument)
            if (indx != nil) {
                indx = indx! + 1
                found = []
                for dex in indx!...(args.count - 1) {
                    let str = args[dex]
                    if (str.hasPrefix("-") == false) {
                        found?.append(str)
                    }
                    else {
                        break
                    }
                }
            }
            break
        }
    }
    return found
}

// MARK: main
let env = ProcessInfo.processInfo.environment
var args = CommandLine.arguments
args.removeFirst()

Utils.setVerbose(findOption(args, option: "-verbose"))

Shell.setup()

App().start(args)
exit(0)


// eof



