//
//  WebPageViewController.swift
//  TTT5
//
//  Created by mobileapps on 4/22/15.
//  Copyright (c) 2015 Mondragon. All rights reserved.
//

import UIKit

class WebPageViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tttRulesWebsite = URL(string: "https://en.wikipedia.org/wiki/Tic-tac-toe")
        let urlRequest = URLRequest(url: tttRulesWebsite!)
        webView.loadRequest(urlRequest)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDone(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }


}
