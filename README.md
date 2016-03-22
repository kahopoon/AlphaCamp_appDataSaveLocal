# AlphaCamp_appDataSaveLocal

![Alt text](/screen.png?raw=true "main screen")

User input something at text field, press 'Add!' to add input data into data array, update screen to show all array elments, by the time, write the array data on local file in order to reuse next time app open. 'Delete All!' almost the same concept, delete all elements on array, update screen, write empty to the local file.

`import UIKit

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

}`
