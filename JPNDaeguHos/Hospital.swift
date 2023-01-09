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
    let addressX: Double
    let addressY: Double
    let hospitalKoreanName: String
    let tel: String
    let hospitalURL: String
    let eMail: String
    let services: String
}
