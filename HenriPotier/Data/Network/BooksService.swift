//
//  BooksService.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import Moya

enum BooksService {
    case books
    case commercialOffers(bookIds: [String])
}

extension BooksService: TargetType {

    var baseURL: URL {
        return URL(string: "http://henri-potier.xebia.fr")!
    }

    var path: String {
        switch self {
        case .books:
            return "/books"
        case .commercialOffers(let bookIds):
            let p = "/books/\(bookIds.joined(separator: ","))/commercialOffers"
            return p
        }
    }

    var method: Moya.Method {
        switch self {
        case .books:
            return .get
        case .commercialOffers(_):
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .books:
            return "[{\"isbn\": \"c8fabf68-8374-48fe-a7ea-a00ccd07afff\", \"title\": \"Henri Potier à l'école des sorciers\", \"price\": 35, \"cover\": \"http://henri-potier.xebia.fr/hp0.jpg\"}]".utf8Encoded
        case .commercialOffers(_):
            return "{\"offers\": [{ \"type\": \"percentage\", \"value\": 5}]}".utf8Encoded
        }
    }

    var task: Task {
        switch self {
        case .books:
            return .requestPlain
        case .commercialOffers(_):
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return nil
    }
}

private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
