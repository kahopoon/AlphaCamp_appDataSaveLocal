//
//  ViewController.swift
//  fileTest
//
//  Created by Ka Ho on 22/3/2016.
//  Copyright © 2016 Ka Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var dataShow: UITextView!
    var data:[String] = []
    let destination = ((NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)).first! as NSString).stringByAppendingPathComponent("/data.txt")
    
    func updataUpload() {
        userInput.text?.removeAll()
        view.endEditing(true)
        dataShow.text = data.joinWithSeparator("\n\n")
        NSArray(array: data).writeToFile(destination, atomically: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let readData = NSArray(contentsOfFile: destination) {
            for row in readData {
                data.append(row as! String)
            }
            updataUpload()
        }
    }

    @IBAction func fileAccess(sender: AnyObject) {
        data.append(userInput.text!)
        updataUpload()
    }
    
    @IBAction func dataDelete(sender: AnyObject) {
        data.removeAll()
        updataUpload()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

