//
//  musicVideo.swift
//  itunesMusicVideosSearch
//
//  Created by Mohamed Ayadi on 8/30/17.
//
//

import Foundation

struct MusicVideo
{
    var artistName: String?
    var trackName: String?
    var artworkUrl: URL?
    var trackViewUrl: URL?
    
    private struct APIKeys {
        static let artistName = "artistName"
        static let trackName = "trackName"
        static let artworkURL = "artworkUrl100"
        static let trackViewUrl = "trackViewUrl"
    }

    
    init?(dictionary: [String : Any])
    {
        self.artistName = (dictionary[APIKeys.artistName] as? String)!
        self.artworkUrl = URL(string: (dictionary[APIKeys.artworkURL] as? String)!)
        self.trackName = (dictionary[APIKeys.trackName] as? String)!
        self.trackViewUrl = dictionary[APIKeys.trackViewUrl] as? URL
    }
}
