//
//  VegaViewApp.swift
//  VegaView
//
//  Created by Arnold Devos on 29/3/2024.
//

import SwiftUI

@main
struct VegaViewApp: App {
    var body: some Scene {
        Window("Vega View", id: "main") {
            VegaWebView()
        }
    }
}
