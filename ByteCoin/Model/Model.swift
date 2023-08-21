//
//  Model.swift
//  ByteCoin
//
//  Created by Muhammet Emre Kemancı on 21.08.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Model: Codable {
    let time, asset_id_base, asset_id_quote: String
    let rate: Double

    enum CodingKeys: String, CodingKey {
        case time
        case asset_id_base
        case asset_id_quote
        case rate
    }
}
