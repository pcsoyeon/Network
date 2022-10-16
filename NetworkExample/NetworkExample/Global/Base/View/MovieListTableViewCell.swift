//
//  MovieListTableViewCell.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/15.
//

import UIKit

final class MovieListTableViewCell: UITableViewCell {
    
    static let identifier = "MovieListTableViewCell"
    
    // MARK: - UI Property
    
    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "영화 제목"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "영화 상세 설명"
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 5
        return label
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Method
    
    private func configureUI() {
        contentView.backgroundColor = .white
    }
    
    private func setLayout() {
        [posterImageView, titleLabel, descriptionLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            posterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 80),
            posterImageView.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        ])
    }
    
    // MARK: - Data
    
    func setData(_ data: TrendMedia) {
        titleLabel.text = data.title
        
        descriptionLabel.text = data.overview
    }
}
