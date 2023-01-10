import UIKit
import Kingfisher
import FirebaseDatabase

class HospitalListViewController: UITableViewController {
    //Firebase Realtime Database
    var ref: DatabaseReference!
    
    var hospitalList: [Hospital] = []
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // UITableView cell 등록
        let nibName = UINib(nibName: "HospitalListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "HospitalListCell")
        
        // Database 선언
        self.ref = Database.database().reference()
        
        self.ref.observe(.value) { snapshot in
            guard let value = snapshot.value as? [String: [String: Any]] else { return }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value)
                let hospitalData = try JSONDecoder().decode([String: Hospital].self, from: jsonData)
                let hosList = Array(hospitalData.values)
                self.hospitalList = hosList.sorted { $0.id < $1.id }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("ERROR JSON Parsing \(error)")
            }
        }

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitalList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HospitalListCell", for: indexPath) as? HospitalListCell else { return UITableViewCell() }
        cell.mediDepartmentLabel.text = hospitalList[indexPath.row].mediDeapartment
        cell.hospitalNameLabel.text = hospitalList[indexPath.row].hospitalName
        
        let mainImageURL = URL(string: hospitalList[indexPath.row].hospitalMainImageURL)
        cell.hospitalMainImageView.kf.setImage(with: mainImageURL)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 상세화면으로
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "HospitalDetailViewController") as?  HospitalDetailViewController else { return }
        detailViewController.hospitalName = hospitalList[indexPath.row].hospitalName
        detailViewController.hospitalDetail = hospitalList[indexPath.row].hospitalDetail
        self.show(detailViewController, sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? HospitalDetailViewController {
            if let idx = sender as? Int {
                vc.hospitalName = hospitalList[idx].hospitalName
            }
        }
    }

}
