//
//  CodeMirrorWebViewDelegate.swift
//  CodeMirror
//
//  Created by Raghav Ahuja on 20/02/21.
//

// MARK: CodeMirrorWebViewDelegate

public protocol CodeMirrorWebViewDelegate: AnyObject {

    func codeMirrorViewDidLoadSuccess(_ sender: CodeMirrorWebView)
    func codeMirrorViewDidLoadError(_ sender: CodeMirrorWebView, error: Error)
    func codeMirrorViewDidChangeContent(_ sender: CodeMirrorWebView, content: String)
}
