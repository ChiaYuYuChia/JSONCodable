//
//  ContentView.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/3.
//

import SwiftUI

struct ContentView: View {
    
    @State private var optionInfo: OptionInfo? // 單一物件解析
    @State private var optionInfos: [OptionInfo]? // 陣列物件解析
    
    var body: some View {
        
        List {
            
            // 物件解析
            if let optionInfo = optionInfo {
                
                Section(header: Text("物件解析: \(optionInfo.title ?? "")")) {
                    
                    if let subs = optionInfo.subs, !subs.isEmpty {
                        
                        ForEach(0 ..< subs.count, id: \.self) { index in
                            
                            let sub = subs[index]
                            
                            Button(action: {
                                
                                print("陣列解析: to json string \n\(sub.toJSONString( outputFormatting: .prettyPrinted) ?? "")")
                            },
                            label: {
                                
                                Text(sub.title ?? "")
                            })
                        }
                    }
                }
                .textCase(nil) // 維持原本大小寫狀態
            }
            
            // 陣列解析
            if let optionInfos = optionInfos, !optionInfos.isEmpty {
                
                Section(header: Text("陣列解析:")) {
                    
                    ForEach(0 ..< optionInfos.count, id: \.self) { index in
                        
                        let info = optionInfos[index]
                        
                        Button(action: {
                            
                            print("陣列解析: to json Dictionary \n\(info.toJSON() ?? [:])")
                        },
                        label: {
                            
                            Text("\(info.title ?? "") sub:(\(info.subs?.count ?? 0))")
                        })
                    }
                }
            }
        }
        .onAppear(perform: {
            
            load()
        })
    }
    
    /** 載入資料 */
    private func load() {
        
        optionInfo = .toJsonInfo(assetName: "DemoInfo")
        optionInfos = .toJsonInfos(assetName: "DemoArray")
    }
}

#Preview {
    
    ContentView()
}
