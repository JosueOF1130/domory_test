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

	@Attribute(.unique) var id: String
	var name: String
	var gameDescription: String
	var soundNeeded: String
	var category: String

	init(
		id: String,
		name: String,
		gameDescription: String,
		soundNeeded: String,
		category: String
	) {
		self.id = id
		self.name = name
		self.gameDescription = gameDescription
		self.soundNeeded = soundNeeded
		self.category = category
	}
}
