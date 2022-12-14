//
//  ViewController.swift
//  YoutubeClone
//
//  Created by Ali Eldeeb on 11/6/22.
//

import UIKit

private let reuseIdentifier = "cvId"

class HomeController: UICollectionViewController {
    //MARK: - Properties
    private let TaylorChannel: Channel = {
        let channel = Channel(name: "TaylorSwiftVEVO", profileImageName: "taylor_swift_profile")
        return channel
    }()
    
    private lazy var videos: [Video] = {
        let blankSpaceVideo = Video(thumbnailImageName: "taylor_swift_blank_space", title: "Taylor Swift - Blank Space", channel: TaylorChannel, numberOfViews: 1.6, date:  Date())
        let badBloodVideo = Video(thumbnailImageName: "taylor_swift_bad_blood", title: "Taylor Swift - Bad Blood ft. Kendrick Lamar", channel: TaylorChannel, numberOfViews: 1.5, date: Date())
        return [blankSpaceVideo, badBloodVideo]
    }()
    private let menuBar: MenuBar = {
        let view = MenuBar()
        view.setDimesions(height: 50, width: 0)
        return view
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupMenuBar()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    //MARK: - Helpers
    private func configureUI(){
        collectionView.backgroundColor = .white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        //to fix the menuBar overlapping cell content we will add an inset of the height of the menuBar
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        //collectionview scroll view goes underneath the menu bar, need to change the scroll insets
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        navigationController?.navigationBar.backgroundColor = UIColor.setRGB(red: 230, green: 32, blue: 31)
        navigationController?.navigationBar.barStyle = .black
        //navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationBar.prefersLargeTitles = true
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
    }
    
    private func setupMenuBar(){
        view.addSubview(menuBar)
        menuBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        navigationItem.rightBarButtonItems = [ UIBarButtonItem(image: UIImage(named: "navMoreIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMoreButtonTapped)), UIBarButtonItem(image: UIImage(named: "searchIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSearchButtonTapped))]
    }
    
    //MARK: - Selectors
    @objc private func handleSearchButtonTapped(){
        print("search pressed")
    }
    
    @objc private func handleMoreButtonTapped(){
        print("more pressed")
    }
}

extension HomeController{
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        videos.count
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.width - 12 - 12) * (9 / 16)
        return CGSize(width: collectionView.frame.width, height: height + 12 + 68)
    }
    
}

