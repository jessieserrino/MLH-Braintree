//
//  URLRequestHelper.swift
//  MLH-Braintree
//
//  Created by Jessie Serrino on 4/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

import UIKit

class URLRequestHelper: NSObject {
   
    
    class func httpRequest() -> NSURLRequest
    {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://google.com")!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var params = ["username":"jameson", "password":"password"] as Dictionary<String, String>
        
        
        var err: NSError?

        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        
        return request
    }
}
