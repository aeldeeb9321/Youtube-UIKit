//
//  VideoCell.swift
//  YoutubeClone
//
//  Created by Ali Eldeeb on 11/6/22.
//

import UIKit

class VideoCell: UICollectionViewCell{
    //MARK: - Properties
    
    private lazy var videoImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .blue
        return iv
    }()
    
    private lazy var creatorIconImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .green
        iv.setDimesions(height: 35, width: 35)
        iv.layer.cornerRadius = 35 / 2
        return iv
    }()
    
    private let videoTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        return label
    }()
    
    private let videoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
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
        videoImageView.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor, paddingTop: 10, paddingLeading: 10, paddingBottom: 5, paddingTrailing: 10)
        
        contentView.addSubview(creatorIconImage)
        creatorIconImage.anchor(top: videoImageView.bottomAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: contentView.safeAreaLayoutGuide.bottomAnchor,paddingTop: 5, paddingLeading: 10)
        
        let videoDetailStack = UIStackView(arrangedSubviews: [videoTitleLabel, videoDescriptionLabel])
        videoDetailStack.axis = .vertical
        videoDetailStack.spacing = 2
        videoDetailStack.distribution = .fillEqually
        
        contentView.addSubview(videoDetailStack)
        
        videoDetailStack.anchor(top: creatorIconImage.topAnchor, leading: creatorIconImage.trailingAnchor, bottom: creatorIconImage.bottomAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor, paddingTop: 5, paddingLeading: 10, paddingBottom: 10, paddingTrailing: 10)
    }
}
