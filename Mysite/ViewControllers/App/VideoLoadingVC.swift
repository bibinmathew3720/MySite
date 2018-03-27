//
//  VideoLoadingVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 03/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import WebKit

class VideoLoadingVC: UIViewController,UIWebViewDelegate {
    var projectUrl:String?
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        webView.allowsInlineMediaPlayback = true
        webView.mediaPlaybackRequiresUserAction = false
        
        let urlString = projectUrl!
        let url = NSURL(string: urlString)
        let url_request = NSURLRequest(url: url! as URL,
                                       cachePolicy: NSURLRequest.CachePolicy.returnCacheDataElseLoad,
                                       timeoutInterval: 20.0)
        self.webView.loadRequest(url_request as URLRequest)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
