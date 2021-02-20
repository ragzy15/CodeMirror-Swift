//
//  Data+Extension.swift
//  CodeMirror
//
//  Created by Raghav Ahuja on 20/02/21.
//

import Foundation

extension Data {
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
