//
//  ApiCall.swift
//  ShauryaTask
//
//  Created by admin on 15/09/22.
//

import Foundation

class ApiCall {
    static let shared = ApiCall()
    func apiCall(url: String, completion : @escaping (EmployeeData?) -> ()) {
        guard let url = URL(string: url) else{ return }
        URLSession(configuration: .default).dataTask(with: url) {  data, response, error in
            guard let data = data else{ return }
            print(data)
            do{
                let userData = try JSONDecoder().decode(EmployeeData.self, from: data)
                print(userData)
                completion(userData)
            }
            catch{
                completion(nil)
                print(error.localizedDescription)
            }
        }.resume()
    }
}

