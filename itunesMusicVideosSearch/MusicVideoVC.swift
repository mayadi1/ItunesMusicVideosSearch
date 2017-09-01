//
//  MusicVideoVC.swift
//  itunesMusicVideosSearch
//
//  Created by Mohamed Ayadi on 8/31/17.
//
//

import UIKit
// Input: passedMusicVideo item and UIImage
// Output: displays image half the screen and two text properties the remaining half equally between them 

class MusicVideoVC: UIViewController {
    var passedMusicVideo: MusicVideo!
    var passedImage: UIImage!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setUI()
    }
    
    func setUI(){
        imageView = UIImageView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height * 0.5))
        imageView.image = passedImage
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        let descriptionView = DescriptionView(frame: CGRect(x: 0, y: self.view.frame.height * 0.5, width: self.view.frame.width , height: self.view.frame.height * 0.5), artistName: passedMusicVideo.artistName!, trackName: passedMusicVideo.trackName!)
        view.addSubview(descriptionView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.imageView.image = nil
    }
    
}

