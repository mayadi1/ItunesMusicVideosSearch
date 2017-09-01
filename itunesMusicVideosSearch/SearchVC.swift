//
//  SearchVC.swift
//  itunesMusicVideosSearch
//
//  Created by Mohamed Ayadi on 8/30/17.
//
//

import UIKit
// This is the main view present search bar witht tableView showing the searchResult

class SearchVC: UIViewController, UITableViewDelegate,UITableViewDataSource, UISearchResultsUpdating {
    
    var tableView: UITableView = UITableView()
    var musicVideos: [MusicVideo]? //Array of musicVideo
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Itunes music videos Search"
        fetchMusicVideo(term: "Jack Johnson", entity: "musicVideo")
        initializeTableView()
        setSearchController()
    }
    
    //fetch MusicVidew
    //Input: term and entity
    //Return: reloadData in tableVIew and load musicVideos array
    func fetchMusicVideo(term: String, entity: String)
    {
        let musicVideoClient = MusicVideoClient()
        musicVideoClient.fetchMusicVideos(withTerm: term, inEntity: entity) { (musicVideos) in
            self.musicVideos = musicVideos
            self.tableView.reloadData()
        }
    }
    
    //tableView initialization
    func initializeTableView() {
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MusicVideoCell.self, forCellReuseIdentifier: "cell") // register cell name
        
        self.view.addSubview(self.tableView)
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let musicVideos = musicVideos {
            return musicVideos.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MusicVideoCell
        
        //configure cell
        cell.musicVideo = musicVideos?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.isActive = false
        let selectedMusicVideo = MusicVideoVC()
        selectedMusicVideo.passedMusicVideo = self.musicVideos?[indexPath.row]
        selectedMusicVideo.passedImage = tableView.cellForRow(at: indexPath)?.imageView?.image
        selectedMusicVideo.modalTransitionStyle = .flipHorizontal
        navigationController?.pushViewController(selectedMusicVideo, animated: true)
    }
    
    func setSearchController(){
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
    
    // MARK: - searchController searchResults
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            
        } else {
            // Update the results
            fetchMusicVideo(term: searchController.searchBar.text!, entity: "musicVideo")
        }
     }
}
