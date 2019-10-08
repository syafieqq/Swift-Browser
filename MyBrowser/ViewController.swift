//
//  ViewController.swift
//  MyBrowser
//
//  Created by Megat Syafiq on 07/10/2019.
//  Copyright © 2019 Megat Syafiq. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webKit: WKWebView!
    
    @IBOutlet weak var webText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        loadURL("https://www.google.com")
    }
    
    @IBAction func goButton(_ sender: UIButton) {
        print ("test")
        if webText.text == "" {
            return
        }
        guard let text = webText.text else {
            return
        }
        
      //  let text:String = webText.text!
        
        
       // infoLabel.isHidden = true
        if text.range(of: ".") != nil {
            
            var finalString:String = text.lowercased()
            
            if finalString.range(of: "http://") == nil {
                finalString = "http://\(finalString)"
            }
            self.loadURL(finalString)
        } else {
            let searchStr = text.replacingOccurrences(of: " ", with: "+")
            let finalString = "https://www.google.com/search?q=\(searchStr)"
            self.loadURL(finalString)
        }
    }
    
    func loadURL(_ str:String) {
        let url = URL(string: str)!
        let request = URLRequest(url: url)
        webKit.load(request)
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        webKit.goBack()
        
    }
    
    
    @IBAction func forwardButton(_ sender: Any) {
        webKit.goForward()
        
    }
    


}

