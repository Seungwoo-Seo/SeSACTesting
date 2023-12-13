//
//  NetworkManager.swift
//  SeSACTesting
//
//  Created by 서승우 on 2023/12/13.
//

import Foundation
import Alamofire

// 인터넷이 연결이 되어 있어야만 테스트가 성공하겠군 -> X
// 외부환경에 영향을 받으면 안됌

protocol NetworkProvider {
    func fetchLotto(completion: @escaping (Lotto) -> Void)
}

// 네트워크를 테스트할 때는, Mock데이터를 통해 실제 네트워크 통신을 하지 않고 테스트를 진행하는 것이 적합

class NetworkManager: NetworkProvider {

    static let shared = NetworkManager()

    private init() {}

    let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1000"

    func fetchLotto(completion: @escaping (Lotto) -> Void) { // 실제 네트워크 통신을 진행하는 부분
        AF
            .request(url)
            .responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let success):
                    print(success)
                    completion(success)

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}

struct Lotto: Codable {
    let drwNoDate: String
    let bnusNO: Int
    let drwtNo1: Int
}
