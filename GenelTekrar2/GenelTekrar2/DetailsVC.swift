//
//  DetailsVC.swift
//  GenelTekrar2
//
//  Created by Hasan Hüseyin Kılıç on 15.10.2024.
//

import UIKit
import CoreData


class DetailsVC: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var artistText: UITextField!
    
    
    @IBOutlet weak var yearText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        imageView.isUserInteractionEnabled = true // image a tıklanmayı etkınlestırdık
        let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapGestureRecognizer)
        
    }
    
    @objc func selectImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        
        self.dismiss(animated: true,completion: nil)
        
    }

    @IBAction func buttonSave(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newArt = NSEntityDescription.insertNewObject(forEntityName: "ArtBook", into: context)
        newArt.setValue(nameText.text!, forKey: "name")
        newArt.setValue(artistText.text!, forKey: "artist")
        
        if let year = Int(yearText.text!) {
            newArt.setValue(year, forKey: "year")
        }
        
        newArt.setValue(UUID(), forKey: "id")
        let data =  imageView.image!.jpegData(compressionQuality: 0.5)
        newArt.setValue(data, forKey: "image")
        do{
            try context.save()
            print("success")
        }catch {
            print("Error")
        }
        //mesaj gonderıyo uyarı dıger ekranlarada
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)//newdata dıye ekranlara mesaj gonderdı // kayıt olan gozlemcıler ıcın kayıt yollama
       
        
        self.navigationController?.popViewController(animated: true)
            }
    
}