//
//  VegaWebView.swift
//  VegaView
//
//  Created by Arnold Devos on 29/3/2024.
//

import SwiftUI
import WebKit


struct VegaWebView: NSViewRepresentable  {
    func makeNSView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        var content: String = ""
        while let line = readLine(strippingNewline: false) {
            content += line
        }
        nsView.loadHTMLString(content, baseURL: nil)
    }
    
    typealias NSViewType = WKWebView
    

}
