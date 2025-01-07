//
//  ViewController.swift
//  TravelBook
//
//  Created by Hasan Hüseyin Kılıç on 16.10.2024.
//

import UIKit
import MapKit
import CoreLocation
import CoreData
class ViewController: UIViewController , MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        locationManager.delegate = self// bunları yapmamızın amacaı vıewcontrollerdan bu prtocollerden fonksıyonları kullanacbılmek ıcın yapıyoruz
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest  //bu kullandıgımızda tam dogru gosterımı metresıne kadar
        //konumun keskinliğini belirleme ne kadar  dogru olarak tam yerslestırme gibi birşey diyebiikriz
        
        locationManager.requestWhenInUseAuthorization() // ara ara takip ediyo kullanıccıyı
        locationManager.startUpdatingLocation()// baslatıyo takıp etmeyı
        //Pin ekleme . harıtaya tıkladıgımızda kırmızı noktayla ısaretleme
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer: )))//longpress uzun basım
        
        gestureRecognizer.minimumPressDuration = 3 // kaç saniye bastıgında algıla 3 dedik
        mapView.addGestureRecognizer(gestureRecognizer)
        
        
    }
    
    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer){
//        gestureRecognizer.state = .began // tıkladı - state durumları
        if gestureRecognizer.state == .began{ // başladı ise
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let touchedCoordinate = mapView.convert(touchedPoint, toCoordinateFrom: mapView)//nerden ceviriyim nereye ceviriyim bir noktayı koordinat sistemine cevirecek. dokunulan koordinatları vercek
            let annotions = MKPointAnnotation()
            annotions.coordinate = touchedCoordinate
           
            chosenLatitude = touchedCoordinate.latitude
            chosenLongitude = touchedCoordinate.longitude
            
            
            annotions.title = nameText.text
            annotions.subtitle = commentText.text
            self.mapView.addAnnotation(annotions)
            
            
        }
        
    }
                                                                                        //CLLocation enlem ve boylam verir
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {//guncellenen lokasyonu dızı ıcerısınde verıyor
//        locations[0]
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        //zoomlama
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
     
        
    }
    
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey:  "latitude")
        newPlace.setValue(chosenLongitude, forKey:  "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do{
            try context.save()
            print("success")
            
        }
        catch{
            print("error")
        }
        
    }
    
    
    
}

