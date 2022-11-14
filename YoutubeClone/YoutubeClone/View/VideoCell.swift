//
//  VideoCell.swift
//  YoutubeClone
//
//  Created by Ali Eldeeb on 11/6/22.
//

import UIKit

class VideoCell: UICollectionViewCell{
    //MARK: - Properties
    var video: Video? {
        didSet{
            guard let video = video else{ return }
            guard let channel = video.channel else{ return }
            self.videoImageView.image = UIImage(named: video.thumbnailImageName)
            self.videoTitleLabel.text = video.title
            if let iconImage = UIImage(named: channel.profileImageName!){
                self.creatorIconImage.image = iconImage
            }
            if let name = channel.name, let views = video.numberOfViews{
                self.videoDescriptionLabel.text = "\(name) • \(views)B views • 8 years ago"
            }
        }
    }
    private var videoImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var creatorIconImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.setDimesions(height: 40, width: 40)
        iv.layer.cornerRadius = 35 / 2
        return iv
    }()
    
    private let videoTitleLabel: UILabel = {
        let label = UILabel().makeLabel(textColor: .label, withFont: UIFont.boldSystemFont(ofSize: 18))
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let videoDescriptionLabel: UILabel = {
        let label = UILabel().makeLabel(textColor: .gray, withFont: UIFont.systemFont(ofSize: 14))
        return label
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.setRGB(red: 230, green: 230, blue: 230)
        view.setDimesions(height: 1, width: 0)
        return view
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        configureCellComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func configureCellComponents(){
        contentView.addSubview(videoImageView)
        videoImageView.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor, paddingTop: 10, paddingLeading: 12, paddingBottom: 5, paddingTrailing: 12)
        
        contentView.addSubview(creatorIconImage)
        creatorIconImage.anchor(top: videoImageView.bottomAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor,paddingTop: 5, paddingLeading: 12)
        
        contentView.addSubview(dividerView)
        dividerView.anchor(top: creatorIconImage.bottomAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: contentView.safeAreaLayoutGuide.bottomAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor, paddingTop: 12)
        
        let videoDetailStack = UIStackView(arrangedSubviews: [videoTitleLabel, videoDescriptionLabel])
        videoDetailStack.axis = .vertical
        videoDetailStack.spacing = 2
        videoDetailStack.distribution = .fillEqually
        
        contentView.addSubview(videoDetailStack)
        
        videoDetailStack.anchor(top: creatorIconImage.topAnchor, leading: creatorIconImage.trailingAnchor, bottom: dividerView.topAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor, paddingTop: 5, paddingLeading: 5, paddingBottom: 10, paddingTrailing: 12)
    }
}
