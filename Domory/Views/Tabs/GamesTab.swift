//
//  Games.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/22/26.
//
// GameListView.swift

import SwiftUI

struct GamesTabView: View {
	let games = [
		Game(id: "1", name: "Memory Match", gameDescription: "Flip cards to find matching pairs", soundNeeded: true, category: "memory"),
		Game(id: "2", name: "Speed Tap", gameDescription: "Tap the target before it disappears", soundNeeded: true, category: "reflex"),
		Game(id: "3", name: "Word Scramble", gameDescription: "Unscramble the letters to find the word", soundNeeded: false, category: "word"),
		Game(id: "4", name: "Color Rush", gameDescription: "Match the color before the timer runs out", soundNeeded: false, category: "reflex"),
		Game(id: "5", name: "Number Crunch", gameDescription: "Solve simple math problems as fast as you can", soundNeeded: false, category: "math")
	]

	var body: some View {
		ScrollView {
			VStack (alignment: .leading) {
				Text("Games")
					.font(.customHeading()).padding(.leading).foregroundStyle(Color.App.primary)
				GameSection(title: "Categories", type: .category, games: games)
				GameSection(title: "New", type: .new, games: games)
				GameSection(title: "All Games", type: .list, games: games)
				Spacer()
			}.padding(.bottom, 20)
			
		}
		.foregroundStyle(Color.App.primaryText)
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
			.background(Color.App.background)
			.padding(0)
			
		}
}

struct GameRow: View {
	let game: Game
	@State private var showDescription = false  // ← tracks toggle

	var body: some View {
		VStack(alignment: .leading, spacing: 5) {
			HStack {
				Text(game.name)
					.font(.headline)
				Spacer()
				Text(game.soundNeeded ? "yes" : "no")
					.font(.caption)
			}

			Text(game.category)
				.font(.caption)
				.foregroundStyle(Color.App.bodyText)

			if showDescription {
				Text(game.gameDescription)
					.font(.subheadline)
					.foregroundStyle(Color.App.mutedText)
					.transition(.opacity)  // fades in/out
			}
		}
		.padding()
		.background(Color.App.surface)
		.foregroundStyle(Color.App.primaryText)
		.cornerRadius(20)
		.overlay( /// apply a rounded border
			RoundedRectangle(cornerRadius: 20)
				.stroke(Color.App.border, lineWidth: 2)
		)
		
		.onLongPressGesture {
			withAnimation {
				showDescription.toggle()
			}
		}
	}
}

enum GameSectionType {
	case category
	case new
	case list
}


struct GameSection: View {
	var title: String
	var type: GameSectionType
	var games: [Game]
	var body: some View {
		if type == .category {
			VStack(alignment: .leading) {
				Text(title)
					.font(.sectionHeader()).padding(.top ).padding(.leading)
				Grid(horizontalSpacing: 20, verticalSpacing: 20) {
					GridRow {
						Button(action: {
							
						}) {
							VStack(alignment: .leading) {
								Rectangle()
									.frame(width: 25, height: 25)
									.cornerRadius(5)
									.foregroundStyle(Color.App.memoryIcon)
								Text("Math")
									.font(.paragraph())
								Text("2 games")// length of the list of games
									.font(.description())
									.foregroundStyle(Color.App.memoryText).opacity(0.7)
							}
							.padding(.vertical, 20)
							.padding(.trailing, 80)
							.padding(.leading, 20)
							.background(Color.App.memoryBackground)
							.foregroundStyle(Color.App.memoryText)
							.cornerRadius(20)
							.overlay( /// apply a rounded border
								RoundedRectangle(cornerRadius: 20)
									.stroke(Color.App.memoryBorder, lineWidth: 1)
							)
							
							
						}
						Button(action: {
							
						}) {
							VStack(alignment: .leading) {
								Rectangle()
									.frame(width: 25, height: 25)
									.cornerRadius(5)
									.foregroundStyle(Color.App.reflexIcon)
								Text("Math")
									.font(.paragraph())
								Text("2 games")// length of the list of games
									.font(.description())
									.foregroundStyle(Color.App.reflexText).opacity(0.7)
							}
							.padding(.vertical, 20)
							.padding(.trailing, 80)
							.padding(.leading, 20)
							.background(Color.App.reflexBackground)
							.foregroundStyle(Color.App.reflexText)
							.cornerRadius(20)
							.overlay( /// apply a rounded border
								RoundedRectangle(cornerRadius: 20)
									.stroke(Color.App.reflexBorder, lineWidth: 1)
							)
						}
					}
					GridRow() {
						Button(action: {
							
						}) {
							VStack(alignment: .leading) {
								Rectangle()
									.frame(width: 25, height: 25)
									.cornerRadius(5)
									.foregroundStyle(Color.App.memoryIcon)
								Text("Math")
									.font(.paragraph())
								Text("2 games")// length of the list of games
									.font(.description())
									.foregroundStyle(Color.App.memoryText).opacity(0.7)
							}
							.padding(.vertical, 20)
							.padding(.trailing, 80)
							.padding(.leading, 20)
							.background(Color.App.memoryBackground)
							.foregroundStyle(Color.App.memoryText)
							.cornerRadius(20)
							.overlay( /// apply a rounded border
								RoundedRectangle(cornerRadius: 20)
									.stroke(Color.App.memoryBorder, lineWidth: 1)
							)
							
						}
						Button(action: {
							
						}) {
							VStack(alignment: .leading) {
								Rectangle()
									.frame(width: 25, height: 25)
									.cornerRadius(5)
									.foregroundStyle(Color.App.reflexIcon)
								Text("Math")
									.font(.paragraph())
								Text("2 games")// length of the list of games
									.font(.description())
									.foregroundStyle(Color.App.reflexText).opacity(0.7)
							}
							.padding(.vertical, 20)
							.padding(.trailing, 80)
							.padding(.leading, 20)
							.background(Color.App.reflexBackground)
							.foregroundStyle(Color.App.reflexText)
							.cornerRadius(20)
							.overlay( /// apply a rounded border
								RoundedRectangle(cornerRadius: 20)
									.stroke(Color.App.reflexBorder, lineWidth: 1)
							)
							
						}
					}
				}
				.padding()
				.frame(maxWidth: .infinity)
				
				Divider()
					.frame(height: 10)
					.background(Color.App.border)
			}
		}
		
		if type == .new {
			VStack(alignment: .leading) {
				Text(title).font(.sectionHeader()).foregroundStyle(Color.App.newBadgeText).padding(.leading)
				
				Button(action: {}) {
					HStack(alignment: .top, spacing: 10) {
						Rectangle()
							.frame(width: 75, height: 75)
							.cornerRadius(5)
							.foregroundStyle(Color.App.mathBackground)
						VStack(alignment: .leading, spacing: 15) {
							
							Text("New Game").font(.strongStatement())
							Text("New game details, maybe it could be long")
								.font(.description())
								.multilineTextAlignment(.leading)
								.foregroundStyle(Color.App.newBadgeText).opacity(0.7)
							Text("category")
								.padding(.horizontal, 14)
								.padding(.vertical, 8)
								.background(Color.App.memoryBackground)
								.foregroundStyle(Color.App.memoryText)
								.cornerRadius(30)
								.overlay(
									RoundedRectangle(cornerRadius: 30)
										.stroke(Color.App.memoryBorder, lineWidth: 1)
								)
								
						}

						Spacer()
					}
					.padding(20)
					.frame(maxWidth: .infinity, minHeight: 150)
					.background(Color.App.newBadgeBackground)
					.foregroundStyle(Color.App.newBadgeText)
					.cornerRadius(20)
					.overlay(
						RoundedRectangle(cornerRadius: 20)
							.stroke(Color.App.newBadgeBorder, lineWidth: 1)
					)
				}
				.padding(.horizontal, 16)
				.padding(.bottom, 20)
				
				Divider()
					.frame(height: 10)
					.background(Color.App.border)
			}
		}
		
		if type == .list {
			VStack(alignment: .leading, spacing: 15) {
				Text(title)
					.font(.sectionHeader()).padding(.leading)
					ForEach(games) { game in
						GameRow(game: game).padding(.horizontal)
					}
				}
		}
	}
}

#Preview {
	GamesTabView()
}
