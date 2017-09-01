//
//  MusicVideoCell.swift
//  itunesMusicVideosSearch
//
//  Created by Mohamed Ayadi on 8/30/17.
//
//

import UIKit
// Input: MusicVideo
// Output: cell with text and detailText with downloaded image
class MusicVideoCell: UITableViewCell
{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
     }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var musicVideo: MusicVideo! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        self.textLabel?.text = musicVideo.artistName
        self.detailTextLabel?.text = musicVideo.trackName
        
        self.imageView?.image = UIImage(named: "cellPlaceHolder")
        if let url = musicVideo.artworkUrl {
            let request = URLRequest(url: url)
            let networkHandler = NetworkHandler(request: request)
            
            networkHandler.downloadData(completion: { (data, response, error) in
                // WE'RE OFF THE MAIN QUEUE!!!!!!!!!
                // WE NEED TO GET BACK ON THE MAIN QUEUE
                DispatchQueue.main.async {
                    if let imageData = data {
                        self.imageView?.image = UIImage(data: imageData)
                        self.imageView?.layer.cornerRadius = 10.0
                        self.imageView?.layer.masksToBounds = true
                     }
                }
            })
        }
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        self.imageView?.frame = CGRect(x:0.0,y:0.0,width:100.0,height:90.0)
    }
    
}
