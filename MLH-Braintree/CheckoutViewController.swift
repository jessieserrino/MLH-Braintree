//
//  CheckoutViewController.swift
//  MLH-Braintree
//
//  Created by Jessie Serrino on 4/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

import UIKit
import WebKit

class CheckoutViewController: UIViewController {

    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = WKWebView(frame: CGRectZero)
        view.addSubview(webView)

        
        self.loadCheckoutPage()
        // Do any additional setup after loading the view.
        
        
        let url = NSURL(string:"http://brainbeacon.herokuapp.com/braintree/checkout")
        let request = NSURLRequest(URL:url!)
        
        
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCheckoutPage()
    {
        webView.setTranslatesAutoresizingMaskIntoConstraints(false)
        let height = NSLayoutConstraint(item: webView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: webView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
        view.addConstraints([height, width])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
