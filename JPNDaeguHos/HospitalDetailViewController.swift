import UIKit
import Kingfisher
import MapKit
import CoreLocation

class HospitalDetailViewController: UIViewController, CLLocationManagerDelegate {
    
    var hospitalDetail: HospitalDetail?
    var hospitalName: String?
    var hospitalX: Double?
    var hospitalY: Double?
        
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var hospitalNameLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationMg = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        locationMg.delegate = self
//        locationMg.requestAlwaysAuthorization()
    }
                
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hospitalNameLabel.text = hospitalName
        
        guard let detail = hospitalDetail else { return }
        addressLabel.text = detail.address
        telLabel.text = detail.tel
        urlLabel.text = detail.hospitalURL
        emailLabel.text = detail.eMail
        serviceLabel.text = detail.services
        hospitalX = detail.addressY
        hospitalY = detail.addressX
        
        // 위치 보기 설정
        mapView.showsUserLocation = true
        mapView.isScrollEnabled = false
        mapView.isZoomEnabled = false
        
        
        let locationAddr = CLLocationCoordinate2D(latitude: detail.addressY, longitude: detail.addressX)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        mapView.setRegion(MKCoordinateRegion(center: locationAddr, span: span), animated: true)
        let annotation = MKPointAnnotation()
        annotation.title = "Here"
        annotation.coordinate = locationAddr
        mapView.addAnnotation(annotation)
        
        // 주소 클릭 시 애플 앱으로 이동
        let destination = UITapGestureRecognizer(target: self, action: #selector(mapping))
        addressLabel.isUserInteractionEnabled = true
        addressLabel.addGestureRecognizer(destination)
        
        // 전화번호 클릭 시 전화 앱으로 이동
        let callNum = UITapGestureRecognizer(target: self, action: #selector(calling))
        telLabel.isUserInteractionEnabled = true
        telLabel.addGestureRecognizer(callNum)
        
        // 웹페이지 URL 클릭 시 해당 페이지로 이동
        let urlPage = UITapGestureRecognizer(target: self, action: #selector(hyperlink))
        urlLabel.isUserInteractionEnabled = true
        urlLabel.addGestureRecognizer(urlPage)
        
    }
        
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        switch status {
//        case .authorizedAlways, .authorizedWhenInUse:
//            print("GPS 권한 설정됨")
//            self.locationMg.startUpdatingLocation()
//        case .restricted, .notDetermined:
//            print("GPS 권한 설정되지 않음")
//            locationMg.requestAlwaysAuthorization()
//        case .denied:
//            print("GPS 권한 요청 거부됨")
//            locationMg.requestAlwaysAuthorization()
//        default:
//            print("GPS: Default")
//        }
//    }
    
    @objc func mapping(sender: UITapGestureRecognizer) {
        guard let destinationX = hospitalY, let destinationY = hospitalX else { return }
        // URLScheme 문자열을 통해 URL Instance를 만들기
        // canOpenURL(_:) Method를 통해서 URL 체계를 처리하는데 앱을 사용할 수 있는지 여부를 점검
        if let url = NSURL(string: "http://maps.apple.com/?ll=\(destinationX),\(destinationY)"),
           UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
        
    @objc func calling(sender: UITapGestureRecognizer) {
        guard let telNumber = telLabel.text else { return }
        if let url = NSURL(string: "tel://\(telNumber)"),
           UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    @objc func hyperlink(sender: UITapGestureRecognizer) {
        guard let fullURL = urlLabel.text else { return }
        if let url = NSURL(string: fullURL),
           UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
}
