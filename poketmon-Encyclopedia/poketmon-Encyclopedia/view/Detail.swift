//
//  Detail.swift
//  poketmon-Encyclopedia
//
//  Created by 송명균 on 7/30/25.
//

import UIKit
import SnapKit
import Kingfisher

final class PokemonDetailViewController: UIViewController {
    private let pokemon: Pokemon
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let typeLabel = UILabel()
    private let heightLabel = UILabel()
    private let weightLabel = UILabel()

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        setupUI()
        configure()
    }

    private func setupUI() {
        [imageView, nameLabel, typeLabel, heightLabel, weightLabel].forEach {
            view.addSubview($0)
            if let label = $0 as? UILabel {
                label.textAlignment = .center
                label.font = .systemFont(ofSize: 16, weight: .medium)
            }
        }

        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        typeLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        heightLabel.snp.makeConstraints {
            $0.top.equalTo(typeLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        weightLabel.snp.makeConstraints {
            $0.top.equalTo(heightLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }

    private func configure() {
        title = pokemon.name.capitalized
        if let urlStr = pokemon.sprites.front_default, let url = URL(string: urlStr) {
            imageView.kf.setImage(with: url)
        }
        nameLabel.text = "#\(pokemon.id) \(pokemon.name.capitalized)"
        typeLabel.text = "Type: \(pokemon.types.map { $0.type.name }.joined(separator: ", "))"
        heightLabel.text = "Height: \(pokemon.height)cm"
        weightLabel.text = "Weight: \(pokemon.weight)kg"
    }
}
