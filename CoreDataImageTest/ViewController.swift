//
//  ViewController.swift
//  CoreDataImageTest
//
//  Created by HappyDuck on 2022/01/20.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textField: UITextField!
    
    let imagePicker = UIImagePickerController()
    var arrPhotos: [Image]?
    var textArray = [MyText]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

    }

    @IBAction func saveImageBtnPressed(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let photo = NSEntityDescription.insertNewObject(forEntityName: "Image", into: context) as! Image
  
        let png = self.imageView.image?.pngData()
        photo.storedImage = png
        
        do{
            try context.save()
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func retrieveImageBtnPressed(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
        do{
            arrPhotos = try context.fetch(fetchRequest) as? [Image]
            if let photo = arrPhotos?.last {
                imageView.image = UIImage(data: photo.storedImage!)
            }
        }catch let error {
            print(error.localizedDescription)
        }
    }
    @IBAction func imageSelectBtnPressed(_ sender: UIButton) {
        print("Pressed")
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let img = info[.originalImage] as? UIImage {
            self.imageView.image = img
        }
    }
}


