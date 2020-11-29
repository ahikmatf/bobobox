//
//  FileReader.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

class FileReader {
    static let instance = FileReader()
    init() {}
    
    func fromJSON<T: Decodable>(named: String) -> T? {
        let decoder = JSONDecoder()
        
        guard let url = Bundle.main.url(forResource: named, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? decoder.decode(T.self, from: data)
        else {
            return nil
        }
        
        return decoded
    }
}
