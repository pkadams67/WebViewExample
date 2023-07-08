//
//  ContentView.swift
//  WebViewExample
//
//  Created by Paul Adams on 7/8/23.
//

import SwiftUI
import WebKit

struct ContentView: View {

	let webView = WebView(request: URLRequest(url: URL(string: "https://www.swift.org")!))

	var body: some View {
		VStack {
			HStack {
				Button(action: {
					self.webView.goBack()
				}){
					Image(systemName: "arrowtriangle.left.fill")
						.font(.title)
						.foregroundColor(.blue)
						.padding()
				}
				Spacer()
				Button(action: {
					self.webView.goHome()
				}){
					Image(systemName: "house.fill")
						.font(.title)
						.foregroundColor(.blue)
						.padding()
				}
				Spacer()
				Button(action: {
					self.webView.refresh()
				}){
					Image(systemName: "arrow.clockwise.circle.fill")
						.font(.title)
						.foregroundColor(.blue)
						.padding()
				}
				Spacer()
				Button(action: {
					self.webView.goForward()
				}){
					Image(systemName: "arrowtriangle.right.fill")
						.font(.title)
						.foregroundColor(.blue)
						.padding()
				}
			}
			webView
		}
	}
}

struct WebView: UIViewRepresentable {
	let request: URLRequest
	private var webView: WKWebView?

	init(request: URLRequest) {
		self.webView = WKWebView()
		self.request = request
	}

	func makeUIView(context: Context) -> WKWebView {
		return webView!
	}

	func updateUIView(_ uiView: WKWebView, context: Context) {
		uiView.load(request)
	}

	func goBack(){
		webView?.goBack()
	}

	func goForward(){
		webView?.goForward()
	}

	func refresh() {
		webView?.reload()
	}

	func goHome() {
		webView?.load(request)
	}
}
