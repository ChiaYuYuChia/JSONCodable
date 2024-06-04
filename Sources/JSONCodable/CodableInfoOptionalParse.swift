//
//  CodableInfoOptionalParse.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/4.
//

import Foundation

/** Codable 物件 解析器（可選） */
@propertyWrapper
class CodableInfoOptionalParse<T>: ParseProtocol {
    
    private var key: String // json key
    private var defaultValue: T? // 預設值
    private var actualValue: T? // 實際值
    
    var wrappedValue: T? { // 包裝值
        
        get {
            
            return actualValue ?? defaultValue
        }
        
        set(value) {
            
            actualValue = value
        }
    }
        
    init(key: String, defaultValue: T? = nil) {
        
        self.key = key
        self.defaultValue = defaultValue
    }
    
    /** 解析/編碼  */
    func onParse(parse: JSONCodable.Parse) {
        
        switch parse {
            
        case .from(let decoder): // 解析
            
            let container = try? decoder.container(keyedBy: CodingKeyInfo.self)
            
            
            
        case .to(let encoder): // 編碼
            
            let container = encoder.container(keyedBy: CodingKeyInfo.self)
            
            
        }
    }
}

// MARK: -
