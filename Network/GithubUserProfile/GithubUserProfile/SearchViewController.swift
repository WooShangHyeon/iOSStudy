//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import UIKit
import Combine
import Kingfisher

class UserProfileViewController: UIViewController {
    
    let network = NetworkService(configuration: .default)
    
    @Published private(set) var user: UserProfile?
    var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        emnedSearchControl()
        bind()
    }
    
    private func setupUI() {
        thumbnail.layer.cornerRadius = 80
    }
    
    private func emnedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "WooShangHyeon"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        
    }
    
    private func bind() {
        $user
            .receive(on: RunLoop.main)
            .sink { [unowned self] result in
                self.update(result)
            }.store(in: &subscriptions)
    }
    
    private func update(_ user: UserProfile?) {
        guard let user = user else {
            self.nameLabel.text = "n/a"
            self.loginLabel.text = "n/a"
            self.followerLabel.text = ""
            self.followingLabel.text = ""
            self.thumbnail.image = nil
            return
        }
        
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerLabel.text = "followers: \(user.followers)"
        self.followingLabel.text = "folloings: \(user.following)"
        self.thumbnail.kf.setImage(with: user.avatarUrl)
    }
    
}

extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("search : \(keyword)")
    }
}


extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("button clicked: \(searchBar.text)")
        
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        
        //Resource
//        let base = "https://api.github.com/"
//        let path = "users/\(keyword)"
//        
//        let params: [String: String] = [:]
//        let header: [String: String] = ["Content-Type": "apllication/json"]
//        
//        var urlComponents = URLComponents(string: base + path)!
//        let queryItems = params.map { (key: String, value: String) in
//            return URLQueryItem(name: key, value: value)
//        }
//        urlComponents.queryItems = queryItems
//        
//        var request = URLRequest(url: urlComponents.url!)
//        header.forEach { (key: String, value: String) in
//            request.addValue(value, forHTTPHeaderField: key)
//        }
        let resource = Resource<UserProfile>(
            base: "https://api.github.com/",
            path: "users/\(keyword)", 
            params: [:],
            header: ["Content-Type": "apllication/json"])
        
        // Network Service
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                print("completion: \(completion)")
                
                switch completion {
                case .failure(let error):
                    self.user = nil
                case .finished: break
                }
            } receiveValue: { user in
                self.user = user
            }.store(in: &subscriptions)

//        URLSession.shared
//            .dataTaskPublisher(for: request)
//            .tryMap { result -> Data in
//                guard let response = result.response as? HTTPURLResponse,
//                      (200..<300).contains(response.statusCode) else {
//                    let response = result.response as? HTTPURLResponse
//                    let statusCode = response?.statusCode ?? -1
//                    throw NetworkError.responseError(statusCode: statusCode)
//                }
//                return result.data
//            }
//            .decode(type: UserProfile.self, decoder: JSONDecoder())
//            .receive(on: RunLoop.main)
//            .sink { completion in
//                print("completion: \(completion)")
//                
//                switch completion {
//                case .failure(let error):
//                    self.user = nil
//                case .finished: break
//                }
//            } receiveValue: { user in
//                self.user = user
//            }.store(in: &subscriptions)

        
        
    }
    
}


