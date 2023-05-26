////
////  HomeViewModel.swift
////  jw-keefo
////
////  Created by 스냅태그 on 2023/05/23.
////
//
//import Foundation
//
//class HomeViewModel {
//    let network: Network = Network()
//    private var newsResponse: NewsResponse?
//}
//
//extension HomeViewModel {
//    func getNewsData() async throws -> [Datum] {
//        newsResponse = try await network.getNewsData()
//        guard let newsResponse = newsResponse else { return [] }
//        if newsResponse.statusCode == 200 {
//            print("<Data> Load Success")
//            return newsResponse.data
//        } else {
//            print("<Data> Load Failed")
//            return []
//        }
//    }
//
//}
