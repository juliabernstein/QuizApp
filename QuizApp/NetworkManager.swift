//
//  NetworkManager.swift
//  QuizApp
//
//  Created by Julia Bernstein on 5/7/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import Foundation
import Alamofire

enum ExampleDataResponse<T: Any> {
    case success(data: T)
    case failure(error: Error)
}


class NetworkManager {
    
    static func getQuestions(endpoint: String, completion: @escaping (([Question]) -> Void)) {
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                if let questionsData = try? decoder.decode(ResultsObject.self, from: data) {
                    let questions = questionsData.results
                    completion(questions)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
