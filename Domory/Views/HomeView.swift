//
//  HomeView.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/28/26.
//


import SwiftUI

struct HomeView: View {
	var body: some View {
		TabView {
			HomeTabView()
				.tabItem {
					Label("Home", systemImage: "house")
				}
			
			GamesTabView()
				.tabItem {
					Label("Games", systemImage: "gamecontroller")
				}
			
			Text("Stats")
				.tabItem {
					Label("Stats", systemImage: "chart.bar")
				}
			
			Text("Account")
				.tabItem {
					Label("Account", systemImage: "person")
				}
		}.tint(Color.App.secondary)
	}
}

#Preview {
	HomeView()
}
