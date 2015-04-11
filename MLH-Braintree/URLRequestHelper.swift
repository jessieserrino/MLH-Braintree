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
        var request = NSMutableURLRequest(URL: NSURL(string: "http://brainbeacon.herokuapp.com/braintree/test-page")!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "GET"
        
        
        return request
    }
}
