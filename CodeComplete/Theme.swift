//
//  Theme.swift
//  CodeComplete
//
//  Created by Vijay Sharma on 2020-06-14.
//  Copyright © 2020 Vijay Sharma. All rights reserved.
//

//
//  Unwrap
//
//  Created by Paul Hudson on 09/08/2018.
//  Copyright © 2019 Hacking with Swift.
//

import Sourceful
import UIKit

enum CodeComplete {
	static var theme: Theme {
		get {
			return DarkTheme()
		}
	}
}

protocol Theme {
	var primary: UIColor { get }
	var secondary: UIColor { get }
	var tertiary: UIColor { get }
	
	var sourceCode: SourceCodeTheme { get }
	
	var sectionTitle: UIFont { get }
	var questionTitle: UIFont { get }
	var textPrimary: UIColor { get }
	var textPrimaryHighlighted: UIColor { get }
	
	var action: UIColor { get }
	var disabled: UIColor { get }
	var css: String { get }
	var highlightr: String { get }
	var failedColour: UIColor { get }
	var successColour: UIColor { get }
}

public class DarkTheme: Theme {
	let primary = UIColor(red: 2/255, green: 32/255, blue: 60/255, alpha: 1.0)
	let secondary = UIColor(red: 20/255, green: 50/255, blue: 75/255, alpha: 1.0)
	let tertiary = UIColor(red: 0/255, green: 21/255, blue: 41/255, alpha: 1.0)
	
	let sourceCode: SourceCodeTheme = SourceCodeDarkTheme()
	
	let sectionTitle: UIFont = {
		let font = UIFont.boldSystemFont(ofSize: 28)
		return font
	}()
	let questionTitle: UIFont = {
		let font = UIFont.systemFont(ofSize: 24)
		return font
	}()
	let textPrimary = UIColor.white
	let textPrimaryHighlighted = UIColor(red: 248/255, green: 231/255, blue: 28/255, alpha: 1.0)
	
	let action = UIColor(red: 0/255, green: 70/255, blue: 200/255, alpha: 1.0)
	let disabled = UIColor(red: 74255, green: 74/255, blue: 74/255, alpha: 1.0)
	let highlightr = "railscasts"
	let failedColour = UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
	let successColour = UIColor(red: 126/255, green: 211/255, blue: 33/255, alpha: 1)
	
	let css = """
	.container {
		font-size: 20px;
		font-family: Helvetica,Arial,sans-serif;
	}
	p, li {
		color: #FFF;
		margin: 0 0 10px;
	}
	span {
		border: 1px solid #000;
		background-color: #15314b
		border-radius: 4px;
		padding: 0 5px 2px;
		font-family: monospace;
		display: inline-block;
		line-height: 1.3;
	}
	h3 {
		color: #F8E71C;
		font-size: 21px;
		margin: 30px 0 5px;
		font-weight: 400;
	}
	pre {
		color: #fff;
		background-color: rgb(2, 32, 60);
		border-radius: 4px;
		font-family: monospace;
		overflow: auto;
	}
	.CodeEditor-promptParameter {
		color: #6d9cbe
	}
	"""
}

/// A source code theme that has a dark background and light text.
public struct SourceCodeDarkTheme: SourceCodeTheme {
	public static var codeFont: UIFont {
        let metrics = UIFontMetrics(forTextStyle: .body)
        let baseFont = UIFont(name: "Menlo", size: 17) ?? UIFont.systemFont(ofSize: 17)
        return metrics.scaledFont(for: baseFont)
    }
	
    public var lineNumbersStyle: LineNumbersStyle? = LineNumbersStyle(
		font: codeFont,
		textColor: Color.white
	)
    public let gutterStyle: GutterStyle = GutterStyle(
		backgroundColor: UIColor(red: 0/255, green: 21/255, blue: 41/255, alpha: 1.0),
		minimumWidth: 32
	)

    public let backgroundColor = UIColor(red: 0/255, green: 21/255, blue: 41/255, alpha: 1.0)
    public let font = codeFont

    public func globalAttributes() -> [NSAttributedString.Key: Any] {
		return [.font: SourceCodeDarkTheme.codeFont, .foregroundColor: UIColor.white]
    }

    public func color(for syntaxColorType: SourceCodeTokenType) -> Color {
        switch syntaxColorType {
        case .plain:
            return .white

        case .number:
            return Color(red: 150/255, green: 134/255, blue: 245/255, alpha: 1.0)

        case .string:
            return Color(red: 252/255, green: 106/255, blue: 93/255, alpha: 1.0)

        case .identifier:
            return Color(red: 122/255, green: 200/255, blue: 182/255, alpha: 1.0)

        case .keyword:
            return Color(red: 252/255, green: 95/255, blue: 163/255, alpha: 1.0)

        case .comment:
            return Color(red: 108/255, green: 121/255, blue: 134/255, alpha: 1.0)

        case .editorPlaceholder:
            return backgroundColor
        }
    }
}
