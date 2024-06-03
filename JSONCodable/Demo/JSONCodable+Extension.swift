//
//  JSONCodable+Extension.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/3.
//

import UIKit

// MARK: - Asset 解析

extension Decodable {
    
    /** 解析成 json 物件 從 Assets 檔案載入  */
    static func toJsonInfo<T: Decodable>(assetName: String, bundle: Bundle = .main) -> T? {
        
        let asset = NSDataAsset(name: assetName, bundle: bundle)
        
        return toJsonInfo(data: asset?.data)
    }
    
    /** 解析成 json 陣列 從 Assets 檔案載入  */
    static func toJsonInfos<T: Decodable>(assetName: String, bundle: Bundle = .main) -> [T]? {
        
        let asset = NSDataAsset(name: assetName, bundle: bundle)
        
        return toJsonInfos(data: asset?.data)
    }
}
