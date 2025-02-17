//
//  HotelDTO+Mapping.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

struct HotelListDTO: Decodable {
    let status: Int
    let code: Int
    let message: String
    let data: [HotelDTO]
    let params: [String]
    
    private enum CodingKeys: String, CodingKey {
        case status, code, message, data, params
    }
}

extension HotelListDTO {
    struct HotelDTO: Decodable {
        let id: Int
        let name: String
        let rating: String
        let city: String
        let address: String
        let pictureUrl: String
        let slug: String
        let email: String
        let telephone: String
        let latitude: String
        let longitude: String
        let mqttTopic: String
        
        private enum CodingKeys: String, CodingKey {
            case id, name, rating, city, address, pictureUrl, slug, email, telephone, latitude, longitude, mqttTopic
        }
    }
}

extension HotelListDTO {
    func toDomain() -> [Hotel] {
        var hotels = [Hotel]()
        data.forEach { (hotelDTO) in
            hotels.append(Hotel(id: hotelDTO.id, name: hotelDTO.name))
        }
        
        return hotels
    }
}
