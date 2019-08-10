//
//  ViewController.swift
//  webviewTest
//
//  Created by Adrian Barnes on 8/9/19.
//  Copyright © 2019 Adrian Barnes. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url:url!)
        
        webView.load(request)
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

