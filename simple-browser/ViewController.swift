//
//  ViewController.swift
//  simple-browser
//
//  Created by Liu Teng Hou on 6/2/18.
//  Copyright © 2018 wewantcookies. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
//    default loads view from storyboard
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let appleURL = URL(string:"https://www.apple.com")!
        webView.load(URLRequest(url:appleURL))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func openTapped(){
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "google.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action:UIAlertAction){
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url:url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

