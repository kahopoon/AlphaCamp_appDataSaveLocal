# AlphaCamp_appDataSaveLocal

![Alt text](/screen.png?raw=true "main screen")

User input something at text field, press 'Add!' to add input data into data array, update screen to show all array elments, by the time, write the array data on local file in order to reuse next time app open. 'Delete All!' almost the same concept, delete all elements on array, update screen, write empty to the local file.

## declaration
`@IBOutlet weak var userInput: UITextField!`  
`@IBOutlet weak var dataShow: UITextView!`  
`var data:[String] = []`  
`let destination = ((NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)).first! as NSString).stringByAppendingPathComponent("/data.txt")`  
    
user input text field, result text view, data store in string array, defined local file destination path.

## function of update view and uploda file to local
`func updataUpload() {`  
        userInput.text?.removeAll()`  
        view.endEditing(true)`  
        dataShow.text = data.joinWithSeparator("\n\n")`  
        NSArray(array: data).writeToFile(destination, atomically: true)`  
    }`  

1st line clear user input textfield, 2nd line dismiss keyboard, 3rd line take array data into text view (as text view do not accept array, I join data array into a single string but separate by two new line among elements), 4th line take string array casting into NSArray and write file to pre-defined destination path(string array do not have 'writeToFile' while NSArray cannot 'append', another methond is to create NSMutableArray at start)

## view start
`override func viewDidLoad() {`  
`        super.viewDidLoad()`  
`        if let readData = NSArray(contentsOfFile: destination) {`  
`            for row in readData {`  
`                data.append(row as! String)`  
`            }`  
`            updataUpload()`  
`        }`  
`    }`  

first to find if local file exist, if so, take all row data into data array, then execute updateUpload function
