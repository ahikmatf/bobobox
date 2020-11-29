//
//  PodDTO+Mapping.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

struct PodListDTO: Decodable {
    let status: Int
    let code: Int
    let message: String
    let data: [PodDTO]
    let params: [String]
    
    private enum CodingKeys: String, CodingKey {
        case status, code, message, data, params
    }
}

extension PodListDTO {
    struct PodDTO: Decodable {
        let roomId: Int
        let roomStatus: Int
        let roomStatusCode: String
        let roomStatusLabel: String
        let roomName: String
        let roomType: String
        let roomTypeLabel: String
        let qrCode: String
        let description: String
        let mqttTopic: String
        let roomNotes: [PodNoteDTO]
        
        private enum CodingKeys: String, CodingKey {
            case roomId, roomStatus, roomStatusCode, roomStatusLabel, roomName
            case roomType, roomTypeLabel, qrCode, description, mqttTopic, roomNotes
        }
    }
}

extension PodListDTO.PodDTO {
    struct PodNoteDTO: Decodable {
        let noteId: Int
        let noteName: String
        let noteCode: String
        
        private enum CodingKeys: String, CodingKey {
            case noteId, noteName, noteCode
        }
    }
}

extension PodListDTO {
    func toDomain() -> [Pod] {
        var pods = [Pod]()
        data.forEach { (podDTO) in
            pods.append(Pod(roomId: podDTO.roomId,
                            roomStatusCode: podDTO.roomStatusCode,
                            roomStatusLabel: podDTO.roomStatusLabel,
                            roomName: podDTO.roomName,
                            qrCode: podDTO.qrCode
            ))
        }
        
        return pods
    }
}
