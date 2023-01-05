import Foundation

struct Hospital: Codable {
    let id: Int
    let mediDeapartment: String
    let hospitalMainImageURL: String
    let hospitalName: String
    let hospitalDetail: HospitalDetail
}

struct HospitalDetail: Codable {
    let address: String
    let koreanAddress: String
    // let addressImageURL: String
    let tel: String
    let hospitalURL: String
    let eMail: String
    let services: String
}
