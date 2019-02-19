//
//  RSSFeedDetailViewController.swift
//  SoccerNews
//
//  Created by Thuannv on 2/18/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import UIKit
import WebKit

class RSSFeedDetailViewController: UIViewController, WKNavigationDelegate {
    var selectedUrl: String?
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let str = selectedUrl, let url = URL(string: str) {
            webView.load(URLRequest(url: url))
            webView.navigationDelegate = self
            webView.allowsBackForwardNavigationGestures = true
        } else {
            let alertController = UIAlertController(title: "Message Error", message: "Link invalid", preferredStyle: .alert)
            let doneAction = UIAlertAction(title: "Done", style: .default, handler: { (action) in
                self.navigationController?.popToRootViewController(animated: true)
            })
            alertController.addAction(doneAction)
            self.present(alertController, animated: true)
        }
    }
}
extension RSSFeedDetailViewController {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("the web view begins to receive web content.")
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("web content begins to load in a web view")
    }
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("web view receives a server redirect")
    }
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        print("Called when the web view needs to respond to an authentication challenge.")
        completionHandler(URLSession.AuthChallengeDisposition.performDefaultHandling, nil)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Called when the navigation is complete.")
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(WKNavigationActionPolicy.allow)
    }
}
