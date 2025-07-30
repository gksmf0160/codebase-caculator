//
//  URLSession.swift
//  poketmon-Encyclopedia
//
//  Created by 송명균 on 7/30/25.
//

import Foundation
import RxSwift

extension Reactive where Base: URLSession {
    func data(request: URLRequest) -> Observable<Data> {
        return Observable.create { observer in
            let task = self.base.dataTask(with: request) { data, _, error in
                if let error = error {
                    observer.onError(error)
                } else if let data = data {
                    observer.onNext(data)
                    observer.onCompleted()
                }
            }
            task.resume()
            return Disposables.create { task.cancel() }
        }
    }
}
