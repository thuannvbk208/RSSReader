//
//  DetailViewController.swift
//  SoccerNews
//
//  Created by Thuannv on 2/18/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var selectedUrl: String?
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: selectedUrl!)!
        webView.load(URLRequest(url: url))
    }

}
