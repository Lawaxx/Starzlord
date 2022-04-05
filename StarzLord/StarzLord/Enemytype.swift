//
//  Enemytype.swift
//  StarzLord
//
//  Created by Aurelien Waxin on 08/03/2022.
//

import SpriteKit

struct EnemyType: Codable {
    let name : String
    let shields : Int
    let speed : CGFloat
    let powerUpChance : Int
}
