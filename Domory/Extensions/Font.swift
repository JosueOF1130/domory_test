//
//  Font.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/7/26.
//

import Foundation

import SwiftUI


extension Font {

    enum Family: String {
        case spaceGrotesk = "SpaceGrotesk"
        case sono = "Sono"
        case manrope = "Manrope"
    }

    enum Style: Int {
        case heading, sectionHeader, strongStatement, paragraph, description, uiText, metaData

        var size: CGFloat {
            switch self {
                case .heading: return 35
                case .sectionHeader: return 33
                case .strongStatement: return 30
                case .paragraph: return 18
                case .description: return 16
                case .uiText: return 14
                case .metaData: return 12
            }
        }
  }

  private static func weightSuffix(for weight: Font.Weight) -> String {
    switch weight {
        case .light: return "Light"
        case .regular: return "Regular"
        case .medium: return "Medium"
        case .semibold: return "SemiBold"
        case .bold: return "Bold"

        default: return "Regular"
    }
  }

/*
    font extension where you select
    - type
    - weight
    - family
*/

    static func customFont(_ type: Style, weight: Font.Weight = .regular, family: Family) -> Font {
            let suffix = weightSuffix(for: weight)
            let fontName = "\(family.rawValue)-\(suffix)"
            return .custom(fontName, size: type.size)
        }


/* Predetermined fonts we can use with the ability to override */
        // Space grotesk
        static func customHeading(weight: Font.Weight = .bold, family: Family = .spaceGrotesk) -> Font {
			customFont(.heading, weight: weight, family: family)
        }

        static func sectionHeader(weight: Font.Weight = .thin, family: Family = .spaceGrotesk) -> Font {
            customFont(.sectionHeader, weight: weight, family: family)
        }

        static func strongStatement(weight: Font.Weight = .bold, family: Family = .spaceGrotesk) -> Font {
            customFont(.strongStatement, weight: weight, family: family)
        }

        // Manrope
        static func paragraph(weight: Font.Weight = .regular, family: Family = .manrope) -> Font {
            customFont(.paragraph, weight: weight, family: family)
        }

        static func description(weight: Font.Weight = .regular, family: Family = .manrope) -> Font {
            customFont(.description, weight: weight, family: family)
        }

    
        // Sono
        static func uiText(weight: Font.Weight = .medium, family: Family = .sono) -> Font {
            customFont(.uiText, weight: weight, family: family)
        }

        static func metaData(weight: Font.Weight = .light, family: Family = .sono) -> Font {
            customFont(.metaData, weight: weight, family: family)
        }

}
