# AlphaCamp_appDataSaveLocal

![Alt text](/screen.png?raw=true "main screen")

User input something at text field, press 'Add!' to add input data into data array, update screen to show all array elments, by the time, write the array data on local file in order to reuse next time app open. 'Delete All!' almost the same concept, delete all elements on array, update screen, write empty to the local file.

`@IBOutlet weak var userInput: UITextField!
 @IBOutlet weak var dataShow: UITextView!`
 var data:[String] = []
 let destination = ((NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)).first! as NSString).stringByAppendingPathComponent("/data.txt")`
    
user input text field, result text view, data store in string array, defined local file destination path.


