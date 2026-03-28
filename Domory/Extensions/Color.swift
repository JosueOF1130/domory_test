//
//  Color.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/7/26.
//

import SwiftUI
import UIKit

extension Color {
	
	//    set colors using a hex code
	init(hex: String) {
		let hex = hex.trimmingCharacters(
			in: CharacterSet.alphanumerics.inverted
		)
		var int = UInt64()
		Scanner(string: hex).scanHexInt64(&int)
		
		let a: UInt64
		let r: UInt64
		let g: UInt64
		let b: UInt64
		switch hex.count {
		case 3:  // RGB (12-bit)
			(a, r, g, b) = (
				255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17
			)
		case 6:  // RRGGBB (24-bit)
			(a, r, g, b) = (255, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
		case 8:  // AARRGGBB (32-bit)
			(a, r, g, b) = (
				int >> 24 & 0xFF, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF
			)
		default:
			(a, r, g, b) = (255, 0, 0, 0)
		}
		
		self.init(
			.sRGB,
			red: Double(r) / 255,
			green: Double(g) / 255,
			blue: Double(b) / 255,
			opacity: Double(a) / 255
		)
	}
	
	//    leos own color extension
	func getRGB() -> (red: Double, green: Double, blue: Double)? {
		var red: CGFloat = 0
		var green: CGFloat = 0
		var blue: CGFloat = 0
		var alpha: CGFloat = 0
		
		let uiColor = UIColor(self)
		if uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
			return (red: Double(red), green: Double(green), blue: Double(blue))
		}
		return nil
	}
	
	//    custom color variables
	enum App {
		static let primary = Color(hex: "#5B7FFF")
		static let secondary = Color(hex: "#9C7CFF")
		
		static let background = Color(hex: "#0E0F12")
		static let surface = Color(hex: "#17181D")
		static let border = Color(hex: "#24262D")
		
		static let primaryText = Color(hex: "#E6EAF0")
		static let bodyText = Color(hex: "#9AA3AD")
		static let mutedText = Color(hex: "#6B7280")
		
		static let success = Color(hex: "#22C55E")
		static let error = Color(hex: "#EF4444")
		static let warning = Color(hex: "#F59E0B")
		static let info = Color(hex: "#3B82F6")
		
		


		// Category: Memory
		static let memoryBackground = Color(hex: "#1E3A5F")
		static let memoryBorder = Color(hex: "#2A4A7F")
		static let memoryText = Color(hex: "#7EB8F7")
		static let memoryIcon = Color(hex: "#3B5BDB")

		// Category: Reflex
		static let reflexBackground = Color(hex: "#3D1A0A")
		static let reflexBorder = Color(hex: "#5A2A10")
		static let reflexText = Color(hex: "#F08050")
		static let reflexIcon = Color(hex: "#E8590C")

		// Category: Word
		static let wordBackground = Color(hex: "#1A3D22")
		static let wordBorder = Color(hex: "#2A5A32")
		static let wordText = Color(hex: "#70C97E")
		static let wordIcon = Color(hex: "#2F9E44")

		// Category: Math
		static let mathBackground = Color(hex: "#2D1040")
		static let mathBorder = Color(hex: "#3D2050")
		static let mathText = Color(hex: "#C77DFF")
		static let mathIcon = Color(hex: "#9C36B5")

		// New badge
		static let newBadgeBackground = Color(hex: "#4A1942")
		static let newBadgeText = Color(hex: "#E879F9")
		static let newBadgeBorder = Color(hex: "#7C3AED")

		// Divider
		static let divider = Color(hex: "#222222")
	}
}
