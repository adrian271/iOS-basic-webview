//
//  ViewController.swift
//  webviewTest
//
//  Created by Adrian Barnes on 8/9/19.
//  Copyright © 2019 Adrian Barnes. All rights reserved.
//  Ref: https://www.youtube.com/watch?v=2ArlCvtL33I

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let contentController = WKUserContentController()
        let scriptSource = "document.getElementsByTagName('input')[2].setAttribute('placeholder', '🤫 tell me your secrets');"
        let script = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        let webView = WKWebView(frame: .zero, configuration: config)
        view.addSubview(webView)
        
        let layoutGuide = view.safeAreaLayoutGuide
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        
        if let url = URL(string: "https://www.google.com") {
            webView.load(URLRequest(url: url))
        }
    }

    
    @IBAction func back(_ sender: Any) {
        
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    
    @IBAction func forward(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    
    
    @IBAction func stop(_ sender: Any) {
        webView.stopLoading()
    }
    
    
}

