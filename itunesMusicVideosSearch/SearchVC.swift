//
//  SearchVC.swift
//  itunesMusicVideosSearch
//
//  Created by Mohamed Ayadi on 8/30/17.
//
//

import UIKit

class SearchVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var tableView: UITableView = UITableView()
    var musicVideos: [MusicVideo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Itunes music videos Search"
        fetchMusicVideo()
        initializeTableView()
    }
    
    
    func fetchMusicVideo()
    {
        let musicVideoClient = MusicVideoClient()
        musicVideoClient.fetchMusicVideos(withTerm: "Jack Johnson", inEntity: "musicVideo") { (musicVideos) in
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


}
