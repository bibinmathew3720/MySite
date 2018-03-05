//
//  VideoLoadingVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 03/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import WebKit

class VideoLoadingVC: UIViewController {
    
    @IBOutlet weak var Webview2: UIWebView!
    
    @IBOutlet weak var activityAction: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        func videoplaying (){
            
            Webview2.loadHTMLString("<iframe width=\"\(Webview2.frame.width - 2)\" height=\"\(Webview2.frame.height)\" src=\"https://www.youtube.com/embed/Yqu21vPBylY\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)

//            activityAction.isHidden=true
            
        }
        
        func loader (){
            if Webview2.isLoading{
                activityAction.stopAnimating()
                videoplaying()
                
            }else{
                activityAction.startAnimating()
                videoplaying()
                activityAction.isHidden=true            }
            
        }
        
        loader()
        
        videoplaying()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
