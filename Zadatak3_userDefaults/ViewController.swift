//
//  ViewController.swift
//  Zadatak3_userDefaults
//
//  Created by Andjela Rakic on 10/12/21.
//

import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    //  @IBOutlet weak var enterStoresNameField: UITextField!
    
    var store = Store(name: "None", city: "", storeLogoURL: "Image")
   // var city = kCGImagePropertyDNGProfileHueSatMapData1
  //  var storeLogoURL = kCGImagePropertyDNGProfileHueSatMapData1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        updateTextField()
        
        let value = UserDefaults.standard.string(forKey: "myTextData")
        
        if value != nil {
            textLabel.text = value
        }
        else {
            textLabel.text = "Your Text Here"
            
        }
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        textLabel.text = inputField.text
        UserDefaults.standard.set(inputField.text, forKey: "myTextData")

        
        if let name = textLabel.text, name != "", let city = cityLabel.text, city != "" {
            
            self.store = Store(name: name, city: city, storeLogoURL: "Image")
            let encoder = JSONEncoder()
            
            if let encodedStore = try? encoder.encode(self.store) {
                
                UserDefaults.standard.set(encodedStore, forKey: "store")
            }
            
        } else {
            
            self.store = Store(name: "", city: "", storeLogoURL: "Image")
            
        }
        
        updateUI()
    }
    
    func getStoreFromLocalStorage() {
        let decoder = JSONDecoder()
        
        if let storedObject = UserDefaults.standard.object(forKey: "store") as? Data,
           let decodedStore = try? decoder.decode(Store.self, from: storedObject) {
            
            self.store = decodedStore
            
        }
        
    }
    
    
    
    func updateUI() {
        
        textLabel.text = "Store which you were looking for is \(store.name)"
        inputField.text = store.name
        cityLabel.text = store.city
        
        
    }
    
    func updateTextField() {
        
        textLabel.text = store.name
        cityLabel.text = store.city
        
        
    }
    
     

    let json = JSON(data: jsonData!)
    for (index, subjson): (String, JSON) in json{
        let value = subjson["key"].stringValue
        
    }
}
