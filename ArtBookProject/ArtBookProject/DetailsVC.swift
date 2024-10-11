//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Hasan Hüseyin Kılıç on 10.10.2024.
//

import UIKit
import CoreData
class DetailsVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)//?
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
    }
    
    @objc func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary // foto kutuphanesini acıccak galeri yani
        picker.allowsEditing = true  // fotoyu edıtleme kbuyutmek kucultem
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {//görseli seçince kapatıcak ve ne ypacak gibi bişey
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)//kapat
        
    }
    

    @objc func hideKeyboard() {
        view.endEditing(true)//klavyeyi kapatma için
    }
  
    @IBAction func saveButtonClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        newPainting.setValue(nameText.text!, forKey: "name")
        newPainting.setValue(artistText.text!, forKey: "artist")
//        newPainting.setValue(nameText.text, forKey: "name")
        if let year = Int(yearText.text!) {
            newPainting.setValue(year, forKey: "year")
        }
        newPainting.setValue(UUID(), forKey: "id")
        let data =  imageView.image!.jpegData(compressionQuality: 0.5)
        newPainting.setValue(data, forKey: "image")
        do {
            try context.save()
            print("success")
            
        }catch {
            print("error")
        }
            
    }
    
}
