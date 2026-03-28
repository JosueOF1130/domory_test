//
//  Game.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//

import Foundation
import SwiftData

@Model
class Game {

	struct Stats: Codable {
		var highscore: Int
		var timesPlayed: Int
		var lastFiveScore: [Int]
	}
	
	@Attribute(.unique) var id: String
	var name: String
	var gameDescription: String
	var soundNeeded: Bool
	var category: String
	var stats: Stats

	init(
		id: String,
		name: String,
		gameDescription: String,
		soundNeeded: Bool,
		category: String
	) {
		self.id = id
		self.name = name
		self.gameDescription = gameDescription
		self.soundNeeded = soundNeeded
		self.category = category
		self.stats = Stats(highscore: 0, timesPlayed: 0, lastFiveScore: [])  // ← add this
	}
}


