//
//  PlayerView.swift
//  SpotifyDesignChallenge4
//
//  Created by Edwin Cardenas on 3/25/23.
//

import UIKit

class PlayerView: UIView {
    
    var stackView: UIStackView
    var topAnchorConstraint = NSLayoutConstraint()
    var centerYConstraint = NSLayoutConstraint()
    
    init() {
        
        stackView = Factory.makeStackView(withOrientation: .vertical)
        stackView.distribution = .fillProportionally
        
        super.init(frame: .zero)
        
        setupViews()
        setupInitialOrientation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }
}

extension PlayerView {
    func setupViews() {
        let trackLabel = Factory.makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = Factory.makeAlbumLabel(withText: "Rush • Moving Pictures (2011 Remaster)")
        let progressView = ProgressView()
        let spotifyButtonView = makeSpotifyButtonCustomView()
                
        stackView.addArrangedSubview(trackLabel)
        stackView.addArrangedSubview(albumLabel)
        stackView.addArrangedSubview(progressView)
        stackView.addArrangedSubview(spotifyButtonView)

        addSubview(stackView)
        
        // static constraint
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupInitialOrientation() {
        topAnchorConstraint = stackView.topAnchor.constraint(equalTo: topAnchor)
        centerYConstraint = stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        if UIDevice.current.orientation.isPortrait {
            topAnchorConstraint.isActive = true
            centerYConstraint.isActive = false
        } else {
            topAnchorConstraint.isActive = false
            centerYConstraint.isActive = true
        }
    }
    
    func adjustForOrientation() {
        guard let orientation =  window?.windowScene?.interfaceOrientation else { return }
        
        if orientation.isPortrait {
            topAnchorConstraint.isActive = true
            centerYConstraint.isActive = false
        } else {
            topAnchorConstraint.isActive = false
            centerYConstraint.isActive = true
        }
    }
    
    func makeSpotifyButtonCustomView() -> UIView {
        let spotifyButton = Factory.makeSpotifyButton(withText: "PLAY ON SPOTIFY")
        
        let container = UIView()
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        container.addSubview(spotifyButton)
        
        NSLayoutConstraint.activate([
            spotifyButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            spotifyButton.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            spotifyButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
        
        return container
    }
}
