//
//  TenantNewMaintenanceViewController.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/15/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit
import Alamofire

class TenantNewMaintenanceViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var imagePicked: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        imagePicked.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func openCameraButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func addJson(_ sender: Any) {
        print("posting params")
        let  parameters = [
            "id":4,
            "title": titleText.text,
            "description": descriptionText.text,
            "photo": "",
            "active":true,
            "property_id":5,"tenant_id":10,
            "created_at":"2018-11-15T23:35:51.547Z",
            "updated_at":"2018-11-15T23:35:51.547Z"
        ] as [String : Any]
        
        Alamofire.request("https://protected-gorge-28359.herokuapp.com/maintenances", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseString { (response:DataResponse<String>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print(response.result.value)
                }
                break
                
            case .failure(_):
                print(response.result.error)
                break
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
