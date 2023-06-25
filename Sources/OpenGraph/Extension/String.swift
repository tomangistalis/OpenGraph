//
//  String.swift
//  OpenGraph
//
//  Created by p-x9 on 2021/12/04.
//  Copyright © 2021 Satoshi Takano. All rights reserved.
//

import Foundation

extension String {
    init?(data: Data, textEncodingName: String? = nil, `default`: String.Encoding = .utf8) {
#if os(Linux)
        self.init(data: data, encoding: `default`)
#else
        let encoding: String.Encoding = {
            if let textEncodingName = textEncodingName {
                let cfe = CFStringConvertIANACharSetNameToEncoding(textEncodingName as CFString)
                if cfe != kCFStringEncodingInvalidId {
                    let se = CFStringConvertEncodingToNSStringEncoding(cfe)
                    return String.Encoding(rawValue: se)
                }
            }
            if #available(macOS 10.10, *) {
                return data.stringEncoding ?? `default`
            }
            return `default`
        }()

        self.init(data: data, encoding: encoding)
#endif
    }
}
