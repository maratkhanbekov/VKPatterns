//
//  NewsAdapter.swift
//  homeWork_1
//
//  Created by Marat Khanbekov on 26.12.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation
import Alamofire

final class NewsAdapter {
    func getFeed(startFrom: String, then completion: @escaping ([VkFeed]) -> Void) {
        let method = "newsfeed.get"
        let fullRow = "\(GlobalConstants.vkApi)\(method)"
        let params: Parameters = [
            "access_token": Session.instance.token,
            "filters": "post",
            "v": "5.87",
            "count":"20",
            "start_from":"\(startFrom)"
        ]
        
        Alamofire.request(fullRow, method: .get, parameters: params)
            .responseJSON(queue: DispatchQueue.global(qos: .userInteractive)) { response in
                let feeds = VkResponseParser.instance.parseNews(result: response.result)
                DispatchQueue.main.async {
                    completion(feeds)
                }
        }
    }
}
