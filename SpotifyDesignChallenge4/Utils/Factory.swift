//
//  Factory.swift
//  SpotifyDesignChallenge4
//
//  Created by Edwin Cardenas on 3/25/23.
//

import UIKit

let buttonHeight: CGFloat = 40

class Factory {
    
    static func makeImageView(named: String) -> UIImageView {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: named)
        
        // By making the image hug itself a little bit less and less resistant to beign compressed
        // we allow the image to stretch and grow as required
        view.setContentHuggingPriority(UILayoutPriority(249), for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
        
        return view
    }
    
    static func makeTrackLabel(withText text: String) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }
    
    static func makeAlbumLabel(withText text: String) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        
        return label
    }
    
    static func makePlayButton() -> UIButton {
        let image = UIImage(named: "play")
        //        let image = UIImage(systemName: "play.circle")!.withTintColor(.black, renderingMode: .alwaysOriginal)
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        return button
    }
    
    static func makePreviewLabel(withText text: String) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        
        return label
    }
    
    static func makeProgressView() -> UIProgressView {
        let progressView = UIProgressView()
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.tintColor = .gray
        
        return progressView
    }
    
    static func makeSpotifyButton(withText text: String) -> UIButton {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .spotifyGreen
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: buttonHeight, bottom: 10, trailing: buttonHeight)
        
        button.configuration = config
        
        let attributedText = NSMutableAttributedString(string: text, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: 1 // letters spacing
        ])
        
        button.setAttributedTitle(attributedText, for: .normal) // note how we don't use button.setTitle()
        
        return button
    }
    
    static func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        
        return stackView
    }
}
