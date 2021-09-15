//
//  NetworkDataSource.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 15/09/21.
//

import Foundation
import Alamofire

enum NetworkErrors: Error {
    case statusResponseEmpty
    case badRequest
    case unauthorized
    case methodNotAllowed
    case payloadTooLarge
    case unsupportedMediaType
    case tooManyRequests
    case forbidden
    case notFound
    case deserializeJson
    case internalServerError
    case unexpected(String)
}

class NetworkDataSource {

    func request<T: Decodable>(_ url: URLConvertible,
                               method: HTTPMethod,
                               body: [String: Any]?,
                               headers: [String: String],
                               responseObject: T.Type,
                               encoding: ParameterEncoding = JSONEncoding.default,
                               completionHandler: @escaping ((Result<T, NetworkErrors>) -> Void)) {

        AF.request(url,
                   method: method,
                   parameters: body,
                   encoding: encoding,
                   headers: HTTPHeaders(headers)).responseJSON { response in

                    if case .failure(let error) = self.processStatusCode(response: response) {
                        completionHandler(.failure(error))
                    }

                    do {
                        let responseObject = try JSONDecoder().decode(responseObject, from: response.data!)
                        completionHandler(.success(responseObject))
                    } catch {
                        completionHandler(.failure(.deserializeJson))
                    }
                }
    }

    func processStatusCode(response: AFDataResponse<Any>) -> Result<Void, NetworkErrors> {

        guard let statusCode = response.response?.statusCode else {
            return .failure(NetworkErrors.statusResponseEmpty)
        }

        switch statusCode {
        case 200..<300: return .success(())
        case 400: return .failure(NetworkErrors.badRequest)
        case 401: return .failure(NetworkErrors.unauthorized)
        case 403: return .failure(NetworkErrors.forbidden)
        case 404: return .failure(NetworkErrors.notFound)
        case 405: return .failure(NetworkErrors.methodNotAllowed)
        case 413: return .failure(NetworkErrors.payloadTooLarge)
        case 415: return .failure(NetworkErrors.unsupportedMediaType)
        case 429: return .failure(NetworkErrors.tooManyRequests)
        case 500: return .failure(NetworkErrors.internalServerError)
        default:  return .failure(NetworkErrors.unexpected("Unknown error"))
        }
    }

}
