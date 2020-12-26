//
//  NewsViewModelFactory.swift
//  homeWork_1
//
//  Created by Marat Khanbekov on 26.12.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import UIKit

struct NewsViewModel {
    let labelDate: String
    let labelFeedGroupHeader: String
    let feedTextCount: Int
    let feedText: String
    let labelText: String
    let labelLike: String
    let labelViews: String
    let labelShare: String
    let labelComment: String
    let sourceUrl: String
    let feedAttachmentsCount: Int
    let feedAttachmentsFirstWidth: CGFloat
    let feedAttachmentsFirstHeight: CGFloat
    let feedAttachmentsFirstImageUrl: String
}

final class NewsViewModelFactory {
    func constructViewModels(from feeds: [VkFeed]) -> [NewsViewModel] {
        return feeds.compactMap(self.viewModel)
    }
    
    func viewModel(from feed: VkFeed) -> NewsViewModel {
        let labelDate = feed.getFeedDate()
        let labelFeedGroupHeader = feed.sourceName
        let feedTextCount = feed.feedText.count
        let feedText = feed.feedText
        let labelText = feed.feedText
        let labelLike = feed.getStringFrom(count: feed.countLikes)
        let labelViews = feed.getStringFrom(count: feed.countViews)
        let labelShare = feed.getStringFrom(count: feed.countReposts)
        let labelComment = feed.getStringFrom(count: feed.countComments)
        let sourceUrl = feed.sourceUrl
        let feedAttachmentsCount = feed.attachments.count
        
        
        let feedAttachmentsFirstWidth =  feedAttachmentsCount > 0 ? CGFloat(feed.attachments[0].width) : 0
        let feedAttachmentsFirstHeight = feedAttachmentsCount > 0 ? CGFloat(feed.attachments[0].height): 0
        let feedAttachmentsFirstImageUrl = feedAttachmentsCount > 0 ? feed.attachments[0].imageUrl : ""
        
        let newsViewModel = NewsViewModel(labelDate: labelDate, labelFeedGroupHeader: labelFeedGroupHeader, feedTextCount: feedTextCount, feedText: feedText, labelText: labelText, labelLike: labelLike, labelViews: labelViews, labelShare: labelShare, labelComment: labelComment, sourceUrl: sourceUrl, feedAttachmentsCount: feedAttachmentsCount, feedAttachmentsFirstWidth: feedAttachmentsFirstWidth, feedAttachmentsFirstHeight: feedAttachmentsFirstHeight, feedAttachmentsFirstImageUrl: feedAttachmentsFirstImageUrl)
        
        return newsViewModel
    }
}
