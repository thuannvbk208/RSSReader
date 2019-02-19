//
//  RSSFeedDetailViewController.swift
//  SoccerNews
//
//  Created by Thuannv on 2/18/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import UIKit
import WebKit

class RSSFeedDetailViewController: UIViewController {
    var selectedUrl: String?
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let str = selectedUrl, let url = URL(string: str) {
            webView.load(URLRequest(url: url))
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
