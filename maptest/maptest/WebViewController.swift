//
//  WebViewController.swift
//  maptest
//
//  Created by Yuto Kumagai on 2015/05/26.
//  Copyright (c) 2015年 Yuto Kumagai. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    
    @IBAction func myBackButton(sender: AnyObject) {
        self.myWebView.goBack()
    }
    @IBAction func myNextButton(sender: AnyObject) {
        self.myWebView.goForward()
    }
    @IBAction func myRefreshButton(sender: AnyObject) {
        self.myWebView.reload()
    }
    @IBAction func myStopButton(sender: AnyObject) {
        self.myWebView.stopLoading()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myWebView.delegate = self
        var myURL = NSURL(string: "http://www.fun.ac.jp")
        var myURLReq = NSURLRequest(URL: myURL!)
        myWebView.loadRequest(myURLReq)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
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
