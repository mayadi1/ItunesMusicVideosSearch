//
//  MusicVideoVC.swift
//  itunesMusicVideosSearch
//
//  Created by Mohamed Ayadi on 8/31/17.
//
//

import UIKit

class MusicVideoVC: UIViewController {
    var passedMusicVideo: MusicVideo!
    var passedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setUI()
    }
    
    func setUI(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height * 0.5 - 20))
        imageView.image = passedImage
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        let descriptionView = DescriptionView(frame: CGRect(x: 0, y: self.view.frame.height * 0.5, width: self.view.frame.width , height: self.view.frame.height * 0.5), artistName: passedMusicVideo.artistName!, trackName: passedMusicVideo.trackName!)
        view.addSubview(descriptionView)
    }
    
    
    
}

