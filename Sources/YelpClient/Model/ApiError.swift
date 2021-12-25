import Foundation

public enum ApiError: Error {
    case urlConversionFailed
    case invalidStatusCode(URLResponse)
    case decodingFailed(Swift.DecodingError)
    case sessionFailed(error: URLError)
    case parameterEncodingFailed(reason: ParameterEncodingFailureReason)
    case unknown
    
    public enum ParameterEncodingFailureReason {
        case missingURL
    }
}
