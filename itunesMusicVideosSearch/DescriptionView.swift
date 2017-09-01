//
//  DescriptionView.swift
//  itunesMusicVideosSearch
//
//  Created by Mohamed Ayadi on 8/31/17.
//
//

import UIKit

class DescriptionView: UIView {
    var artistName: String!
    var trackName: String!
    
    init(frame: CGRect, artistName: String, trackName: String){
        super.init(frame: frame)
        self.artistName = artistName
        self.trackName = trackName
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(){
        let artistNameLabel = UILabel()
        artistNameLabel.text = self.artistName
        artistNameLabel.backgroundColor = UIColor.red
        artistNameLabel.textAlignment = .center
        
        let trackNameLabel = UILabel()
        trackNameLabel.text = self.trackName
        trackNameLabel.textAlignment = .center
        trackNameLabel.numberOfLines = 4
        trackNameLabel.lineBreakMode = .byTruncatingTail
        trackNameLabel.sizeToFit()
        trackNameLabel.backgroundColor = UIColor.blue
        
       let labelsStackView = UIStackView(arrangedSubviews: [artistNameLabel, trackNameLabel])
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 0.0
        labelsStackView.distribution = .fillEqually
     
        addSubview(labelsStackView)
        
        //constraints
        labelsStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        labelsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        labelsStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        labelsStackView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
     }
    
}
