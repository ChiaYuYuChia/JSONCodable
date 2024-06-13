//
//  JSONCodable.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/3.
//

import Foundation

/** 解析 共用介面 */
protocol ParseProtocol {
    
    func onParse(parse: JSONCodable.Parse)
}

/** Json 解析元件 */
class JSONCodable: Codable {
    
    /** 解析/編碼  */
    enum Parse {
        
        case from(Decoder) // 解析
        case to(Encoder) // 編碼
    }
    
    init() {
        
    }
    
    required init(from decoder: any Decoder) throws {
        
        self.onParse(parse: .from(decoder))
    }
    
    final func encode(to encoder: any Encoder) throws {
        
        self.onParse(parse: .to(encoder))
    }
    
    /** 解析/編碼  */
    func onParse(parse: JSONCodable.Parse) {
        
        JSONCodable.assistParse(info: self, parse: parse) // 輔助解析
    }
}

// MARK:-

extension JSONCodable {
    
    /** 輔助解析 for ParseProtocol */
    static func assistParse(info: Any?, parse: JSONCodable.Parse) {
        
        if let info = info {
            
            let mirror = JSONCodable.toMirror(info: info)
            
            let children = mirror.children
            
            if !children.isEmpty {
                
                for (_, value) in children {
                    
                    // 包含介面實作項目
                    if let parseProtocol = value as? ParseProtocol {
                        
                        parseProtocol.onParse(parse: parse) // 解析
                    }
                }
            }
        }
    }
}

// MARK:-

private extension JSONCodable {
    
    /** 轉換 Mirror */
    static func toMirror(info: Any) -> Mirror {
        
        let mirror = Mirror(reflecting: info)
        
        return mirror
    }
}

// MARK: - 編碼

extension Encodable {
    
    /** 轉換 JSON Dictionary */
    func toJSON(options: JSONSerialization.ReadingOptions = .allowFragments) -> [String: Any]? {
        
        let encoder: JSONEncoder = .init()
        
        if let data = try? encoder.encode(self) {
            
            let json = try? JSONSerialization.jsonObject(with: data, options: options)
            
            let dictionary = json as? [String: Any]
            
            return dictionary
        }
        
        return nil
    }
    
    /** 轉換 JSON 文字 */
    func toJSONString(encoding: String.Encoding = .utf8, outputFormatting: JSONEncoder.OutputFormatting = []) -> String? {
        
        let encoder: JSONEncoder = .init()
        
        encoder.outputFormatting = outputFormatting
        
        let data = try? encoder.encode(self)
        
        if let data = data {
            
            let result = String(data: data, encoding: encoding)
            
            return result
        }
        
        return nil
    }
}

// MARK: - 解析

extension Decodable {
    
    /** 解析成 json 物件 for string */
    static func toJsonInfo<T: Decodable>(jsonString: String?, encoding: String.Encoding) -> T? {
        
        if let jsonString = jsonString, !jsonString.isEmpty,
           let data = jsonString.data(using: encoding) {
            
            return toJsonInfo(data: data)
        }
        
        return nil
    }
    
    /** 解析成 json 物件 for data */
    static func toJsonInfo<T: Decodable>(data: Data?) -> T? {
        
        if let data = data {
            
            let dencoder: JSONDecoder = .init()
            
            let info = try? dencoder.decode(T.self, from: data)
            
            return info
        }
        
        return nil
    }
    
    /** 解析成 json 陣列 for string */
    static func toJsonInfos<T: Decodable>(jsonString: String?, encoding: String.Encoding) -> [T]? {
        
        if let jsonString = jsonString, !jsonString.isEmpty,
           let data = jsonString.data(using: encoding) {
            
            return toJsonInfos(data: data)
        }
        
        return nil
    }
    
    /** 解析成 json 陣列 for data */
    static func toJsonInfos<T: Decodable>(data: Data?) -> [T]? {
        
        if let data = data {
            
            let dencoder: JSONDecoder = .init()
            
            let info = try? dencoder.decode([T].self, from: data)
            
            return info
        }
        
        return nil
    }
}

// MARK: -

extension JSONCodable {
    
    /** 解析 */
    func container<Key: CodingKey>(coder: Decoder, type: Key.Type) -> KeyedDecodingContainer<Key>? {
        
        let container = try? coder.container(keyedBy: type)
        
        return container
    }
    
    /** 編碼 */
    func container<Key: CodingKey>(coder: Encoder, type: Key.Type) -> KeyedEncodingContainer<Key> {
        
        let container = coder.container(keyedBy: type)
        
        return container
    }
}

// MARK: - KeyedDecodingContainer 解析

extension KeyedDecodingContainer {
    
    /** 解析 */
    func parse<Value: Decodable>(key: Key) -> Value? {
        
        let decode = try? decode(Value.self, forKey: key)
        
        return decode
    }
}

// MARK: - KeyedEncodingContainer 編碼

extension KeyedEncodingContainer {
    
    /** 編碼, 過濾 nil 轉換資訊 */
    mutating func parse<Value: Encodable>(
        value: Value?, key: Key) {
        
        if let value = value {
                
            try? encode(value, forKey: key)
        }
    }
}

// MARK: -
