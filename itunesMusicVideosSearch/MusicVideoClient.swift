//
//  musicVideoClient.swift
//  itunesMusicVideosSearch
//
//  Created by Mohamed Ayadi on 8/30/17.
//
//

import Foundation
// Input: term, entity
// Return: array of MusicVideo
// Algo: Use ApplEndPoint to generate the URL and feeds it into Network handler

struct MusicVideoClient
{
    func fetchMusicVideos(withTerm term: String, inEntity entity: String, completion: @escaping ([MusicVideo]?) -> Void)
    {
        //endpoint
        let searchEndpoint = AppleEndpoint.search(term: term, entity: entity)
        let searchUrlRequest = searchEndpoint.request
        
        //network handler
        let networkHandler = NetworkHandler(request: searchUrlRequest)
        networkHandler.downloadJSON { (jsonResponse, httpResponse, error) in
            // THIS IS NOW OFF-THE-MAIN-THREAD!!!!
            // NOW, WE NEED TO GET BACK TO THE MAIN THREAD
            
            DispatchQueue.main.async {
                //get the array of musicVideo dictionaries
                guard let json = jsonResponse,
                    let resultDictionaries = json["results"] as? [[String : Any]] else {
                        completion(nil)
                        return
                }
                
                //create an array of musicVideo
                let musicVideos = resultDictionaries.flatMap({ musicVideoDictionary in
                    return MusicVideo(dictionary: musicVideoDictionary)
                })
                
                //call completion
                completion(musicVideos)
            }
        }
    }
}
