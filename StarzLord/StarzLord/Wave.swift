//
//  Waves.swift
//  StarzLord
//
//  Created by Aurelien Waxin on 08/03/2022.
//

import SpriteKit

struct Wave: Codable {
    struct WaveEnemy: Codable {
        let position: Int
        let xOffset: CGFloat
        let moveStraight: Bool
    }
    
    let name: String
    let enemies: [WaveEnemy]
}
