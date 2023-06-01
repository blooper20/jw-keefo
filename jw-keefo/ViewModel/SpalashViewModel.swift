//
//  SpalashViewModel.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/23.
//

import Foundation
import LabCodeSDK

class SplashViewModel {
    let network: Network = Network()
    var userResponse: UserResponse!
    private var newsResponse: NewsResponse!
}

extension SplashViewModel {
    
    func loginSDK(completion: @escaping((Bool) -> Void)) {
        /// SDK 연동이 잘 되었는지 확인하는 함수
        LabCodeSDK.LoginManager.shared.labcode(
            apiKey: "0483e5fc-19e1-4669-a994-d3c5d9255dff",
            apiSecret: "18a300f8-e201-42f3-accd-a491838d1cad",
            completion: { (result) in
                if result == .success {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        )
    }
    
    func userCheck() {
        /// 유저를 성공적으로 받아오는지 검증하는 함수
        Task {
            userResponse = await network.getUserData()
            guard let userResponse = userResponse else { return }
            if userResponse.statusCode == 200 {
                guard let message = userResponse.message else { return }
                print("<User> Verification",message)
            } else {
                print("user 생성")
                //            newsResponse.statusCode에 따른 예외처리 예를 들면 else if newsResponse = newsResponse.statusCode == 404 { }
            }
        }
    }
    
    func getNewsData() async throws -> [Datum] {
        newsResponse = await network.getNewsData()
        guard let newsResponse = newsResponse else {
            fatalError("newsResponse를 받아오지 못했습니다.")
        }
        if newsResponse.statusCode == 200 {
            print("<Data> Load Success")
            let data = newsResponse.data.compactMap { $0 }
            return data
        } else {
            print("<Data> Load Failed")
            //            newsResponse.statusCode에 따른 예외처리 예를 들면 else if newsResponse = newsResponse.statusCode == 404 { }
            return []
        }
    }
}
