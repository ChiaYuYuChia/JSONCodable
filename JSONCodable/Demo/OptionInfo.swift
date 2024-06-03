//
//  OptionInfo.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/3.
//

import Foundation

/** 選項資訊 */
class OptionInfo: JSONCodable {
    
    var onlyIdentify: String? // 唯一識別
    var title: String? // 選項名稱
    var description: String? // 描述
    
    var subs: [OptionInfo]? // 子選項
    
    /** 轉換 Key */
    private enum CodingKeys: String, CodingKey {
        
        case onlyIdentify = "ID"
        case title = "Title"
        case description = "Description"
        case subs = "Subs"
    }
    
    /** 解析/編碼  */
    override func onParse(parse: OptionInfo.Parse) {
        
        super.onParse(parse: parse)
        
        switch parse {
            
        case .from(let decoder): // 解析
            
            let container = container(coder: decoder, type: CodingKeys.self)
            
            onlyIdentify = container?.parse(key: .onlyIdentify)
            title = container?.parse(key: .title)
            description = container?.parse(key: .description)
            subs = container?.parse(key: .subs)
            
        case .to(let encoder): // 編碼
            
            var container = container(coder: encoder, type: CodingKeys.self)
            
            container.parse(value: onlyIdentify, key: .onlyIdentify)
            container.parse(value: title, key: .title)
            container.parse(value: description, key: .description)
            container.parse(value: subs, key: .subs)
        }
    }
}
