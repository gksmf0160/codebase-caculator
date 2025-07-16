//
//  ViewController.swift
//  URL
//
//  Created by 송명균 on 7/3/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAutolayouts()
        imageView.backgroundColor = .gray

        // ✅ 이미지 다운로드 시작
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon/151") {
            let task = loadImage(url: url) { [weak self] image in
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
            task.resume()
        }
    }
    
    private func setAutolayouts() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(400)
        }
    }
    
    private func loadImage(url: URL, completion: @escaping (UIImage?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }
        return task
    }
}
