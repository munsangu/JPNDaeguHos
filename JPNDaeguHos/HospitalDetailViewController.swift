    import UIKit
    import Kingfisher

    class HospitalDetailViewController: UIViewController {
        
        var hospitalDetail: HospitalDetail?
        var hospitalName: String?

        @IBOutlet weak var serviceLabel: UILabel!
        @IBOutlet weak var emailLabel: UILabel!
        @IBOutlet weak var urlLabel: UILabel!
        @IBOutlet weak var telLabel: UILabel!
        @IBOutlet weak var addressLabel: UILabel!
        @IBOutlet weak var hospitalNameLabel: UILabel!
        @IBOutlet weak var addressImageView: UIImageView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            hospitalNameLabel.text = hospitalName
            
            guard let detail = hospitalDetail else { return }
            print(detail)
            addressLabel.text = detail.address
            telLabel.text = detail.tel
            urlLabel.text = detail.hospitalURL
            emailLabel.text = detail.eMail
            serviceLabel.text = detail.services
            let addressImage = URL(string: detail.addressImgURL)
            addressImageView.kf.setImage(with: addressImage)
    //        print(detail.koreanAddress)
            
            // 전화번호 클릭 시 전화 앱으로 이동
            let callNum = UITapGestureRecognizer(target: self, action: #selector(calling))
            telLabel.isUserInteractionEnabled = true
            telLabel.addGestureRecognizer(callNum)
            
            // 웹페이지 URL 클릭 시 해당 페이지로 이동
            let urlPage = UITapGestureRecognizer(target: self, action: #selector(hyperlink))
            urlLabel.isUserInteractionEnabled = true
            urlLabel.addGestureRecognizer(urlPage)
            
        }
        
        @objc func calling(sender: UITapGestureRecognizer) {
            guard let telNumber = telLabel.text else { return }
            // URLScheme 문자열을 통해 URL Instance를 만들기
            // canOpenURL(_:) Method를 통해서 URL 체계를 처리하는데 앱을 사용할 수 있는지 여부를 점검
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
