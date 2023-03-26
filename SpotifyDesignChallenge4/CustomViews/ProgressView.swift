//
//  ProgressView.swift
//  SpotifyDesignChallenge4
//
//  Created by Edwin Cardenas on 3/25/23.
//

import UIKit

class ProgressView: UIView {
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: buttonHeight)
    }
}

extension ProgressView {
    func setupViews() {
        let playButton = Factory.makePlayButton()
        let previewStartLabel = Factory.makePreviewLabel(withText: "0:00")
        let previewEndLabel = Factory.makePreviewLabel(withText: "0:30")
        let progressView = Factory.makeProgressView()
        
        addSubview(playButton)
        addSubview(previewStartLabel)
        addSubview(progressView)
        addSubview(previewEndLabel)
        
        // playButton
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: topAnchor),
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            playButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            playButton.widthAnchor.constraint(equalToConstant: buttonHeight)
        ])
        
        // previewStartLabel
        NSLayoutConstraint.activate([
            previewStartLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            previewStartLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 8)
        ])
        
        // progressView
        NSLayoutConstraint.activate([
            progressView.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: previewStartLabel.trailingAnchor, constant: 8)
        ])
        
        // previewEndLabel
        NSLayoutConstraint.activate([
            previewEndLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            previewEndLabel.leadingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: 8),
            previewEndLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
