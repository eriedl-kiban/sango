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

func findOption(args:[String], option:String) -> Bool
{
    var found = false
    for argument in args {
        if (argument == option) {
            found = true
        }
    }
    return found
}

func getOption(args:[String], option:String) -> String?
{
    var found:String? = nil
    for argument in args {
        if argument == option {
            var indx = args.indexOf(argument)
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

func getOptions(args:[String], option:String) -> [String]?
{
    var found:[String]? = nil
    for argument in args {
        if (argument == option) {
            var indx = args.indexOf(argument)
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
private let env = NSProcessInfo.processInfo().environment
private var args = Process.arguments
args.removeFirst()

let verbose = findOption(args, option: "-verbose")
Utils.setVerbose(verbose)

Shell.setup()

App().start(args)
exit(0)


// eof



