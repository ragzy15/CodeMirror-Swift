//
//  JavascriptFunction.swift
//  CodeMirror
//
//  Created by Raghav Ahuja on 20/02/21.
//

// MARK: JavascriptFunction

// JS Func
struct JavascriptFunction {

    let functionString: String
    let callback: JavascriptCallback?

    init(functionString: String, callback: JavascriptCallback? = nil) {
        self.functionString = functionString
        self.callback = callback
    }
}
