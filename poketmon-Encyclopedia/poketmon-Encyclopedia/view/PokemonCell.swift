//
//  PokemonCell.swift
//  poketmon-Encyclopedia
//
//  Created by 송명균 on 7/30/25.
//

import UIKit
import SnapKit
import Kingfisher

final class PokemonCell: UICollectionViewCell {
    static let identifier = "PokemonCell"

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.contentMode = .scaleAspectFit
        contentView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        contentView.backgroundColor = UIColor.cellBackground
    }

    func configure(with pokemon: Pokemon) {
        if let urlStr = pokemon.sprites.front_default, let url = URL(string: urlStr) {
                    imageView.kf.setImage(with: url)
                } else {
                    imageView.image = UIImage(systemName: "questionmark")
                }
    }
}
