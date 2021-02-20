//
//  CMEditorWebView.swift
//  CodeMirror
//
//  Created by Raghav Ahuja on 20/02/21.
//

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct CMEditorWebView: CMViewRepresentable {
    
    @Binding public var text: String
    public let mimeType: String
    public let isReadOnly: Bool
    
    public let onLoadSuccess: () -> Void
    public let onLoadError: (Error) -> Void
    
    var fontSize: CGFloat {
        #if os(macOS)
        if #available(macOS 11.0, *) {
            return NSFont.preferredFont(forTextStyle: .body, options: [:]).pointSize
        } else {
            return NSFont.systemFontSize
        }
        #elseif os(iOS)
        return UIFont.preferredFont(forTextStyle: .body, compatibleWith: .none).pointSize
        #endif
    }
    
    init(_ text: Binding<String>, mimeType: String, isReadOnly: Bool = false,
         onLoadSuccess: @escaping () -> Void = { },
         onLoadError: @escaping (Error) -> Void = { _ in }) {
        _text = text
        self.isReadOnly = isReadOnly
        self.mimeType = mimeType
        self.onLoadSuccess = onLoadSuccess
        self.onLoadError = onLoadError
    }
    
    // MARK: iOS
    public func makeUIView(context: Context) -> CodeMirrorWebView {
        createWebView(context: context)
    }
    
    public func updateUIView(_ uiView: CodeMirrorWebView, context: Context) {
        updateWebView(uiView, context: context)
    }
    
    // MARK: macOS
    public func makeNSView(context: Context) -> CodeMirrorWebView {
        createWebView(context: context)
    }
    
    public func updateNSView(_ nsView: CodeMirrorWebView, context: Context) {
        updateWebView(nsView, context: context)
    }
    
    // MARK: Common
    
    private func createWebView(context: Context) -> CodeMirrorWebView {
        let view = CodeMirrorWebView()
        view.delegate = context.coordinator
        view.setContent(text)
        view.setReadonly(isReadOnly)
        view.setMimeType(mimeType)
        return view
    }
    
    private func updateWebView(_ view: CodeMirrorWebView, context: Context) {
        switch context.environment.colorScheme {
        case .light:
            view.setThemeName("base16-light")
        case .dark:
            view.setThemeName("yonce")
        @unknown default:
            break
        }
        
        view.setFontSize(Int(fontSize))
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(text: $text,
                    onLoadSuccess: onLoadSuccess,
                    onLoadError: onLoadError)
    }
    
    public class Coordinator: CodeMirrorWebViewDelegate {
        
        @Binding var text: String
        let onLoadSuccess: () -> Void
        let onLoadError: (Error) -> Void
        
        init(text: Binding<String>, onLoadSuccess: @escaping () -> Void, onLoadError: @escaping (Error) -> Void) {
            _text = text
            self.onLoadSuccess = onLoadSuccess
            self.onLoadError = onLoadError
        }
        
        public func codeMirrorViewDidLoadSuccess(_ sender: CodeMirrorWebView) {
            onLoadSuccess()
        }
        
        public func codeMirrorViewDidLoadError(_ sender: CodeMirrorWebView, error: Error) {
            onLoadError(error)
        }
        
        public func codeMirrorViewDidChangeContent(_ sender: CodeMirrorWebView, content: String) {
            text = content
        }
    }
}
#endif
