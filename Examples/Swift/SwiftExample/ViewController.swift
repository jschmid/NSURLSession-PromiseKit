//
//  ViewController.swift
//  SwiftExample
//
//  Created by Jonas Schmid on 03/04/15.
//  Copyright (c) 2015 schmid. All rights reserved.
//

import UIKit
import PromiseKit
import NSURLSession_PromiseKit

class ViewController: UIViewController {


//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    self.session = [NSURLSession sessionWithConfiguration:configuration];

    var session: NSURLSession {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: configuration)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func downloadDataClick(sender: UIButton) {
        let URL = NSURL(string: "http://pastebin.com/raw.php?i=1gdNuVSh")!
        session.promiseDataTaskWithURL(URL).then() { data in
            println("ok")
            return nil
        }
    }
}

