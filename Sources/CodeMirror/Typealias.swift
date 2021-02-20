//
//  Typealias.swift
//  CodeMirror
//
//  Created by Raghav Ahuja on 20/02/21.
//

#if canImport(SwiftUI)
import SwiftUI
#endif

#if os(macOS)
import AppKit
public typealias CMView = NSView
public typealias CMRect = NSRect

#if canImport(SwiftUI)
@available(macOS 10.15, *)
public typealias CMViewRepresentable = NSViewRepresentable
#endif

#elseif os(iOS)
import UIKit
public typealias CMView = UIView
public typealias CMRect = CGRect

#if canImport(SwiftUI)
@available(iOS 13.0, *)
public typealias CMViewRepresentable = UIViewRepresentable
#endif

#endif

public typealias JavascriptCallback = (Result<Any?, Error>) -> Void
