> ### ๐ฑ SeSAC Weekly Session  </br>
> **Moya๊ฐ ๋ชจ์ผ?** _(feat.๋ชจ์ผ ์์ด ๋ชจ์ผ์ฒ๋ผ ํต์ ํ๊ธฐ)_

</br>
</br>

## ํ๋ก์ ํธ & ๋ ํฌ์งํ ๋ฆฌ ์ค๋ช
ํด๋น ํ๋ก์ ํธ๋ iOS/Swifit์์ ๋คํธ์ํฌ ํต์ ์ ํ  ๋ ๋ง์ด ์ฌ์ฉํ๋ Moya์ Alamofire๋ฅผ 
1. ์ด๋ป๊ฒ ์ฌ์ฉํ๋์ง ์๊ฐํ๊ณ 
2. ๋์ ์ฐจ์ด๋ ๋ฌด์์ธ์ง, (๋ชจ์ผ์ ๊ด์ ์์ ์ดํด๋ณด๊ฒ ์ต๋๋ค.)
3. Moya์์ด, Alamofire๋ฅผ ์ถ์ํํ๋ ๋ฐฉ๋ฒ์ ์ด๋ค ๊ฒ์ด ์๋์ง
๋ฑ์ ์ค์ฌ์ ์ผ๋ก ๋ค๋ฃน๋๋ค. 

</br>
์ถ๊ฐ๋ก, Moya์ ๋ํ(= ๋ผ์ด๋ธ๋ฌ๋ฆฌ์ ๋ํ) ์  ๊ฐ์ธ์ ์ธ ๋๋ ๋ฐ ๊ฒฌํด๋ฅผ ์ ์์ต๋๋ค. ์ฐธ๊ณ ํด์ฃผ์ธ์ :) </br>
ํน์ ์๋ชป๋ ๋ด์ฉ, ๋ถ์กฑํ ์ ์ด ์๊ฑฐ๋/๊ถ๊ธํ์  ์ ์ด ์๋ค๋ฉด ์ธ์ ๋ ์ง ์ฐ๋ฝ์ฃผ์ธ์. 
</br>
</br>
</br>

## ๊ฐ๋ ์ค๋ช
ํ๋ก์ ํธ๋ฅผ ์ดํด๋ณด๊ธฐ ์ ์ ๋จผ์  ๊ฐ๋์ ๊ฐ๋จํ๊ฒ ์ดํด๋ณด๊ฒ ์ต๋๋ค. </br>
์์์ ๋ง์๋๋ฆฐ ๊ฒ๊ณผ ๊ฐ์ด ์ด ํ๋ก์ ํธ์์๋ Moya์ Alamofire๋ฅผ ํตํ ๋คํธ์ํฌ ํต์  ๋ฐฉ๋ฒ์ ์ ๊ณตํฉ๋๋ค. </br></br>

### Alamofire
๋จผ์ , Alamofire๊ฐ ๋ฌด์์ธ์ง ์์๋ณผ๊น์? </br>
Alamofire๋ URLSession ์ ๊ธฐ๋ฐํ ๋ผ์ด๋ธ๋ฌ๋ฆฌ๋ก, ์ฝ๋์ ๊ฐ์ํ ๋ฐ ๊ฐ๋์ฑ ์ธก๋ฉด์์ ๋ณด๋ค ์ฑ๋ฅ์ด ๊ฐ์ ๋์๋ค๊ณ  ํ  ์ ์์ต๋๋ค. </br></br>

### Moya
๊ทธ๋ ๋ค๋ฉด, Moya๋ ๋ฌด์์ผ๊น์? </br>
์์ ์ค๋ช๋๋ฆฐ Alamofire๋ฅผ ์ด๊ฑฐํ enum ์ ์ฌ์ฉํด์ ์์ ํ๊ณ  ์ ๋๋ ๋ฐฉ์์ผ๋ก ์บก์ํํ์ฌ ๋ณด๋ค Type-Safeํ ๋ฐฉ์์ผ๋ก ํต์ ์ ํ  ์ ์์ต๋๋ค. </br></br>

### Alamofire VS Moya
๊ทธ๋ฌ๋ฉด, Moya๋ Alamofire๊ฐ ์๋ก ๋ค๋ฅด๊ฒ ํต์ ํ ๊น์? </br>
โ ๊ทธ๋ ์ง ์์ต๋๋ค. </br>
Moya๋ Alamofire๋ ๊ฒฐ๊ตญ ๋คํธ์ํฌ ํต์ ์ URLSession์ผ๋ก ํต์ ํฉ๋๋ค. Network Layer ๋ฅผ ํํ๋ฆฟํ ํด์ ์ฌ์ฌ์ฉ์ฑ์ ๋์ธ ๊ฒ์ด Moya๋ผ๊ณ  ํ  ์ ์์ต๋๋ค. </br></br>

์ถ์ํ ๋ ์ ๋๋ฅผ ๋น๊ตํ๋ฉด ์๋์ ๊ฐ์ต๋๋ค. </br>
**URLSession < Alamofire < Moya**

</br>
</br>

```
์ถ์ํ๋?
๊ฐ์ฒด๋ค์ ๊ณตํต์ ์ธ ๋ถ๋ถ์ ๋ฝ์๋ด์ ๋ฐ๋ก ๊ตฌํํด ๋์ ๊ฒ์ ์๋ฏธ,
๊ณตํต์ ์ธ ๋ถ๋ถ๋ง ๊ณจ๋ผ ๊ตฌํ์ ํ๊ธฐ ๋๋ฌธ์, ํ๋ ํ๋ ์์ธํ๊ฒ ๊ตฌํํ์ง ๋ชปํ๊ณ  ์ถ์์ ์ผ๋ก ๊ตฌํ์ด ๋์ด ์๊ธฐ ๋๋ฌธ์ ์ถ์ํ๋ผ๊ณ  ํ๋ค.  
```

</br>
</br>


## ํ๋ก์ ํธ ๊ตฌ์ฑ

ํ๋ก์ ํธ์ ๊ตฌ์ฑ์ ์ดํด๋ณด๋ฉด ์๋์ ๊ฐ์ต๋๋ค. (ํด๋๋ง) </br>


์ค์  ํ๋ก์ ์์ ์ฌ์ฉํ๋ ํด๋๋ง๊ณผ ์กฐ๊ธ ์์ดํ  ์ ์์ผ๋ฏ๋ก ์ฐธ๊ณ ๋ฐ๋๋๋ค. </br>
๊ฐ ๋คํธ์ํฌ ํต์  ๋ฐฉ๋ฒ์ ๋ฐ๋ผ์ ํฐ ํด๋๋ฅผ ๋๋ด์ต๋๋ค. (๊ณตํต์ ์ผ๋ก, ์ ์ญ์ ์ผ๋ก ์ฌ์ฉ๋๋ ํ์ผ์ ๋ชจ๋ Base ํด๋์์ ๊ด๋ฆฌํ๊ณ  ์์ต๋๋ค.)


</br>
</br>

## ํ๋ก์ ํธ ์ค๋ช 
์์ ๋ง์ ๋๋ฆฐ ๊ฒ๊ณผ ๊ฐ์ด, ํด๋น ํ๋ก์ ํธ๋ Alamofire์ Moya๋ก ๋คํธ์ํธ ํต์ ์ ํ๋ ๋ฐฉ๋ฒ์ ์ ์ํ๊ณ  ์์ต๋๋ค. </br>
๊ฐ๋ฐ์ ๋๋ ํ์ ์ปจ๋ฒค์์ ๋ฐ๋ผ์ ์ฝ๊ฐ์ด ์ฐจ์ด๊ฐ ์์ ์ ์์ผ๋ ์ ๋ฐ์ ์ธ ํ๋ฆ์ ๋์ผํ  ๊ฒ์ด๋ผ ์๊ฐํฉ๋๋ค. </br>
์ฌ๊ธฐ์๋ ๋คํธ์ํฌ์ ํ๋ฆ ์ ๋๋ฅผ ์ฐธ๊ณ ํ๋ฉด ์ข์ ๊ฒ ๊ฐ์ต๋๋ค. :) 

</br>

### Common
๋จผ์  ๊ณตํต์ ์ผ๋ก ์ฑ์ ํ๋ฆ์ ๋ค์๊ณผ ๊ฐ์ต๋๋ค. </br>
์ฑ์ ์คํํ๋ฉด ๊ฐ ๋ผ์ด๋ธ๋ฌ๋ฆฌ๋ฅผ ํตํด ์๋ฒ ํต์ ์ ํ๊ณ , ๊ทธ ๊ฒฐ๊ณผ๋ฅผ ํ์ด๋ธ ๋ทฐ์ ๋ณด์ฌ์ฃผ๋ ํ๋ก์ ํธ์๋๋ค. (๊ฐ๋จํ์ฃ ?) </br></br>

ํฌ๊ฒ ๋๊ฐ์ง๋ฅผ ํต์ ํ๊ณ  ์์ต๋๋ค. </br>
์ฑ์ ์คํํ๋ฉด ๋ฐ๋ก ์ต์  ํธ๋ ๋์ ๋ฏธ๋์ด ์ ๋ณด๊ฐ ๋ณด์ผ ๊ฒ์ด๊ณ , ๊ทธ ์ค ํ๋๋ฅผ ์ ํํ๋ฉด ๊ทธ ๋ฏธ๋์ด์ ๋น์ทํ ๋ค๋ฅธ ์ํ๋ค์ ๋ชฉ๋ก์ด ๋ํ๋ฉ๋๋ค. </br>
๊ทธ๋ฌ๋ฏ๋ก ์ฌ๊ธฐ์ ํธ๋ ๋ ์ ๋ณด๋ฅผ GETํ๊ณ , ๋น์ทํ ์ํ ๋ชฉ๋ก์ GETํ๊ณ  ์์ต๋๋ค. </br>

</br>
</br>

๊ทธ๋ฌ๋ฉด ์ด์ , ๊ฐ ๋ผ์ด๋ธ๋ฌ์์ ์ด๋ป๊ฒ ํต์ ํ๋์ง ์ดํด๋ด์๋ค.

</br>

### Alamofire
_AlamofireTrendAPIManager.swift_
```
import Alamofire

final class AlamofireTrendAPIManager {
    
    static let shared = AlamofireTrendAPIManager()
    
    private init() { }
    
    func fetchMovieList(type: String, time: String, completionHandler: @escaping (NetworkResult<Any>) -> Void) {
        let url = EndPoint.trend.requestURL + "/\(type)" + "/\(time)"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let params: Parameters = ["api_key" : "\(APIKey.KEY)",
                                  "language" : "en-US"]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: params,
                                     encoding: URLEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completionHandler(networkResult)
                
            case .failure:
                completionHandler(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(TrendResponse.self, from: data) else { return .pathErr }
        
        switch statusCode {
        case 200:
            return .success(decodedData.results)
        case 400:
            return .requestErr("Bad Request")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
```

</br>
์์ ์ฝ๋๋ฅผ ์ฐจ๊ทผ ์ฐจ๊ทผ ์ดํด๋ณด๋ฉด </br>

1. ์ฑ๊ธํค ํจํด์ ํตํด์ ๋คํธ์ํฌ ํต์ ์ ํ๊ณ  ์๋ค.
2. url, header, parameter๋ฅผ ์ค์ ํ ๋ค์, Alamofire๋ฅผ ํตํด ํด๋น ์ ๋ณด๋ฅผ ์๋ฒ์ ๋ณด๋ด, GET ์ ๋ณด๋ฅผ ๋ฐ์์ต๋๋ค. 
3. ๋ฐ์ ์ ๋ณด๋ฅผ `judgeStatus`๋ฅผ ํตํด ๊ฐ ์ํฉ์ ๋ง๋ ๊ฐ์ผ๋ก ๋ฐํํฉ๋๋ค.
4. ๋ชจ๋  ํต์  ๊ณผ์ ์ด ์ฑ๊ณต์ ์ผ๋ก ์ด๋ค์ก๋ค๋ฉด, ํ์ํ ๋ฐ์ดํฐ ๊ฐ์ ๋ฐ์ ์ ์๊ณ  ์ด๋ฅผ ํ์ถ ํด๋ก์ ๋ฅผ ํตํด ๋ณด๋๋๋ค. (์ดํ ViewController์์ ์ฌ์ฉํ๊ฒ ์ฃ ?)

</br>

๊ทธ๋ฆฌ๊ณ  ViewController์์ `AlamofireTrendAPIManager`๋ฅผ ํธ์ถํ์ฌ ๋ฐ์ดํฐ๋ฅผ ๋ฐ์, </br>
TableView์ UI๋ฅผ ๋ณด์ฌ์ค๋๋ค. </br>
์ดํ์ ์์ ์ ํํ์ ๋๋ ๋น์ทํ ํ๋ฆ์ผ๋ก ๋คํธ์ํฌ ํต์ ์ด ์ด๋ฃจ์ด์ง๋๋ค. 

</br>
</br>

> Alamofire์ ํต์  ๊ณผ์ ์ ์์ฝํ๋ฉด ์๋์ ๊ฐ์ต๋๋ค. </br> 
> ํต์ ์ ํ๋ APIManger์ ๋ง๋ค๊ณ , ์ ๋๋ก ์๋ฒ ํต์ ์ด ๋๋ฉด, ํ์ถ ํด๋ก์ ๋ฅผ ํตํด ๋ฐ์ดํฐ๋ฅผ ๋ฐํํฉ๋๋ค. </br>
> ๊ทธ๋ฆฌ๊ณ  ํต์ ์ด ํ์ํ ๊ณณ์์ APIManager๋ฅผ ํธ์ถํ๊ณ , ํด๋ก์  ๊ตฌ๋ฌธ์์ ๋ฐ์ดํฐ๋ฅผ ๋ฐ์, ์ํ๋ ์์์ ์ฒ๋ฆฌํฉ๋๋ค. 

</br>
</br>

### Moya
๊ทธ๋ ๋ค๋ฉด, Moya์์๋ ์ด๋ป๊ฒ ํต์ ์ ํ๊ณ  ์์๊น์? </br>
Moya๋ ๋คํธ์ํฌ ํต์ ์ ํ๋ฒ ์ถ์ํํด์ ํต์ ์ ํ๊ณ  ์๋ค๊ณ  ๋งํ์์ฃ ? 
</br>
</br> 
๊ทธ ๋ง์ ๊ณง, ๋ณธ๊ฒฉ์ ์ธ ํต์ ์ ํ๊ธฐ ์  ํต์ ์ ์ํด์ ๊ณตํต์ ์ธ ๋ถ๋ถ๋ง ๋ฌถ์ด์ ๋ฐ๋ก ๋ง๋ค์ด๋์ ์ถ์ํ ๊ณ์ธต, ์ฆ ์ถ์ํ ํ์ผ์ด ์๋ค๋ ๊ฒ์๋๋ค! </br>

'์, ๊ทธ๋ฌ๋๊น .. Alamofire์ APIManager์ฒ๋ผ ๋ณธ๊ฒฉ์ ์ธ ํต์ ์ ํ๊ธฐ ์ ์ **์ถ์ํ๋ฅผ ์ํ ๋ฌด์ธ๊ฐ๊ฐ ์๋ค**๋ ๊ฒ์ด๊ฒ ์ง?' </br>
์ ๋๋ก ์๊ฐํ  ์ ์์ต๋๋ค. 

</br>
</br>

๊ทธ๋ผ ์ด์  ์ฝ๋๋ก ์ดํด๋ณด์ฃ  !! </br>
์ถ์ํ๋ฅผ ์ํ ํ์ผ์ Service ํ์ผ์ด๋ผ๊ณ  ํฉ์๋ค. 

</br>
</br>

์ด Service ํ์ผ์ ์๋์ ๊ฐ์ต๋๋ค. </br>
```
import Moya

enum MovieService {
    case trend(type: String, time: String)
    case similar(id: Int)
}

extension MovieService: BaseTargetType {
    var path: String {
        switch self {
        case .trend(let type, let time):
            return "/trending/\(type)/\(time)"
        case .similar(let id):
            return  "/movie/\(id)/similar"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .trend, .similar:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .trend, .similar:
            return .requestParameters(parameters: ["api_key": APIKey.KEY, "language" : "en-US"], encoding: URLEncoding.default)
        }
    }
}

```

</br>

๋ง์ฐจ๊ฐ์ง๋ก ์์์ ๋ถํฐ ์ดํด๋ณด๋ฉด, </br>
1. enum์ผ๋ก MovieSerice๋ฅผ ๊ด๋ฆฌํ๊ณ  ์์ต๋๋ค. ์ํ ๊ด๋ จ๋ API์์ ์ด๋ค ํต์ ์ ํ  ์ง ์ข๋ฅ๋ฅผ ๋๋๋ ๊ฒ์ด๋ผ๊ณ  ๋ณผ ์ ์์ต๋๋ค. ์์์ ๋งํ ๊ฒ์ฒ๋ผ ํธ๋ ๋ ๋ฆฌ์คํธ์, ๋น์ทํ ์ํ ์ ๋ณด๋ฅผ GETํ๋ฏ๋ก case๋ฅผ ๋๊ฐ์ง ๋๋ ์ ์์ต๋๋ค.
2. ๊ทธ๋ฆฌ๊ณ  ๊ทธ ์ด๊ฑฐํ์ extensionํด์ BaseTargetType์ ์ฑํํ๊ณ  ์์ต๋๋ค. 
3. BaseTargetType์ด ๋ฌด์์ธ์ง ์ ๋ชฐ๋ผ๋, ์ด๋ ํ ํ๋กํ ์ฝ์ด๋ผ๋ ๊ฒ์ ์ ์ ์์ต๋๋ค. ํ๋กํ ์ฝ์ ๊ทธ ์์ ์ ์ธํ ๊ฒ์ ๊ตฌํํด์ผ ํฉ๋๋ค. (UITableViewDataSource, UICollectionViewDataSource ๋ฑ์ ์๊ฐํ  ์ ์๊ฒ ์ฃ ?) BaseTargetType์์ ์ ์ธํ ๊ฒ๋ค์ ๊ตฌํํ๊ณ  ์์ต๋๋ค/
4. URL Path, Method, Task๋ฅผ ๊ตฌํํ ๊ฒ์ ํ์ธํ  ์ ์์ต๋๋ค. 

</br>
</br>

๊ทธ๋ผ ์ด์ , ์ด๊ฑฐํ์ด ์ฑํํ BaseTargetType์ ๋ณด๊ฒ ์ต๋๋ค. </br>
```
import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: URLConstant.BaseURL)!
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
```
</br> 
</br> 

BaseTargetType์ ๋ค์ TargetType์ ์ฑํํ๊ณ  ์์ต๋๋ค. </br> 
๊ฒฐ๊ตญ, Service ํ์ผ์ TargetType์ ์ฑํํด์ ๊ตฌํํ๊ณ  ์๋ค๋ ๊ฒ์ ํ์ธํ  ์ ์์ต๋๋ค. </br>

_TargetType์ด ๋ฌด์์ธ๋ฐ??_
```
/// The protocol used to define the specifications necessary for a `MoyaProvider`.
public protocol TargetType {

    /// The target's base `URL`.
    var baseURL: URL { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: Moya.Method { get }

    /// Provides stub data for use in testing. Default is `Data()`.
    var sampleData: Data { get }

    /// The type of HTTP task to be performed.
    var task: Task { get }

    /// The type of validation to perform on the request. Default is `.none`.
    var validationType: ValidationType { get }

    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}
```

</br>
Moya๋ฅผ ํตํด ์ดํด๋ณด๋ฉด, MoyaProvider๋ฅผ ๊ตฌ์ฒดํํ๊ธฐ ์ํด ํ์ํ ํ๋กํ ์ฝ์ด๋ผ๋ ๊ฒ์ ์ ์ ์์ต๋๋ค. </br>
์ด ํ๋กํ ์ฝ์ ์ฑํํจ์ผ๋ก์, ์ฐ๋ฆฌ๋ ๊ทธ ์๋ฒ ํต์ ์ ๋ด๋ถ์ ์ธ ๊ฒ์ ๊ตฌ์ฒด์ ์ผ๋ก ๋ชฐ๋ผ๋, ํ์ํ ๊ฒ๋ค๋ง ์์ฑํจ์ผ๋ก์จ ํต์ ์ ํ  ์ ์์ต๋๋ค. </br>

</br>
</br>

**ํ์ํ ๊ฒ๋ค๋ง ์์ฑ??** </br>
์๋ฒํต์ ์ ํ  ๋ ๊ฐ๋ฐ์(= ํด๋ผ์ด์ธํธ ๊ฐ๋ฐ์)์๊ฒ ํ์ํ ๊ฒ๋ค์ ๊ฒฐ๊ตญ `Request`, `Response`์๋๋ค. </br>
๊ทธ๋ฌ๋ฏ๋ก Moya๋ฅผ ์ฌ์ฉํ๋ฉด, `Request`, `Response`์๋ง ์ง์คํด์ ์๋ฒ ํต์ ์ ํ  ์ ์๋ค๋ ์ฅ์ ์ด ์์ต๋๋ค. 

</br>
</br>

๊ทธ๋ฐ๋ฐ, ์์ง ์๋ฒ ํต์ ์ ํ์ง ์์์ต๋๋ค. </br>
์ด๋ค ์๋ฒ ํต์ ์ ํ  ๊ฒ์ธ์ง, ์ค๋น๋ ํ์ง๋ง ์์ง ์๋ฒ์๊ฒ ์์ฒญ์ ํ ๊ฒ์ ์๋์ฃ . 

</br>
</br>

์ด์  ํต์ ์ ์์ฒญํด๋ณด๊ฒ ์ต๋๋ค. </br>
์ด ๋ ํ์ํ ํ์ผ์ด Alamofire์ ๊ฐ์ด, APIํ์ผ์๋๋ค. 

</br>

```
import Moya

final class MoyaTrendAPI {
    
    static let shared: MoyaTrendAPI = MoyaTrendAPI()
    
    private let trendProvider = MoyaProvider<MovieService>(plugins: [MoyaLoggingPlugin()])
    
    private init() { }
    
    public private(set) var data: TrendResponse?
    
    func fetchTrendMovieListWithMoya(type: String, time: String, completion: @escaping (TrendResponse?) -> ()) {
        trendProvider.request(.trend(type: type, time: time)) { result in
            switch result {
            case .success(let response):
                do {
                    self.data = try response.map(TrendResponse?.self)
                    guard let data = self.data else { return }
                    completion(data)
                } catch(let error) {
                    print(error.localizedDescription, 500)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
```
</br>

์ด๋ ๊ฒ, `MoyaProvider`๋ฅผ ํตํด์ ์๋ฒ ํต์ ์ ํ๊ณ  ์์ต๋๋ค. </br>
์ด ๋ฐฉ์์ ํตํด์๋ง ๋ชจ์ผ๋ก ์๋ฒ ํต์ ์ ํ  ์ ์๊ณ , ๊ทธ๋ ๊ธฐ ๋๋ฌธ์ Type Safeํ๋ค๊ณ  ํ  ์ ์์ต๋๋ค. </br>

์ฌ๊ธฐ์ Moya์ ๋ ๋ค๋ฅธ ์ฅ์ ์ ์ ์ ์์ต๋๋ค. ์ถ์ํ๋ ๊ณ์ธต์ ํตํด์๋ง ์๋ฒ ํต์ ์ ํ  ์ ์๊ธฐ ๋๋ฌธ์, ๋ณด๋ค ์์ ์ ์ด๋ผ๋ ๊ฒ์๋๋ค. </br>
๋ํ, ํ๋กํ ์ฝ์ ์ฑํํด์ ํต์ ์ ํ๊ณ  ์๊ธฐ ๋๋ฌธ์, ์๋ชป๋ ์ ๋ณด๋ฅผ ๋ฃ์ด์ ์์ฒญ์ ํ ๊ฒ์ด ์๋๋ผ๋ฉด ์๋ฒ ํต์ ์ ํ์ํ ์์๋ฅผ ๋นผ๋จน๋ ์ผ์ ์๊ฒ ์ฃ ?  

</br>
</br>


### Alamofire VS Moya
์ฌ๊ธฐ๊น์ง ์ดํด๋ดค์ ๋, </br>
์ฐ๋ฆฌ๋ Alamofire์ Moya์ ๋น๊ต๋ฅผ ์๋์ ํ๋ก ๋ํ๋ผ ์ ์์ต๋๋ค. </br>

(..์ค๋น์ค..)

</br>
</br>


## Moya ์์ด Moya์ฒ๋ผ ํต์ ํ๊ธฐ  
๊ทธ๋ ๋ค๋ฉด, ์ฐ๋ฆฌ๋ Moya๋ก๋ง ์์ ์ ์ผ๋ก ํต์ ํ  ์ ์๋ ๊ฒ์ผ๊น์? </br>
๊ทธ๋ ์ง ์์ต๋๋ค. Alamofire๋ฅผ ์ถ์ํํ ๊ณ์ธต์ **"ํธ๋ฆฌํ๊ฒ"** ์ ๊ณตํด์ฃผ๋ ๊ฒ์ด Moya์๋๋ค. 

</br>
</br>

๊ทธ ๊ณ์ธต์ ์ง์  ๋ง๋ค์ด์ ํต์ ํ๋ค๋ฉด? ์ฐ๋ฆฌ๋ ์ถ์ํํ์ฌ ํต์ ํ  ์ ์๊ฒ ์ฃ ? </br>
์ด๋ป๊ฒ ํ  ์ ์์๊น์? Alamofire๋, Moya๋ ๊ฒฐ๊ตญ URLSession์ ํตํด์ ํต์ ์ ํ๊ณ  ์์ต๋๋ค. </br>
๊ทธ๋ ๊ธฐ ๋๋ฌธ์ ์ถ์ํ๋ฅผ ํ  ์ ์๋๋ก ๋์์ฃผ๋ ๊ฒ๊ณผ ๊ฒฐ๊ตญ !!! **URLSession์ ์์ฑ์ ์ด์ฉ**ํด์ ์ถ์ํ ํ  ์ ์์ต๋๋ค. 

</br>
</br>

### URLRequestConvertible
์ฐธ๊ณ ํ๋ฉด ์ข์ ๋ธ๋ก๊ทธ : [Taekki Dev](https://taekki-dev.tistory.com/23) 

</br>
</br>

์, ์ด URLRequestConvertible ํ๋กํ ์ฝ์ ์ฌ์ฉํด์ ์ข ๋ ์์ ์ ์ผ๋ก, ์๋ฒ ํต์ ์ ํด๋ด์๋ค. </br>

URLRequestConvertible ???  </br>
๋ชจ๋ฅด๋ฉด ๋ญ๋ค? **๊ณต์ ๋ฌธ์**๋ฅผ ๋ณด์. 

</br>
</br>

๋ฌด์์ธ์ง ์ ๋ชจ๋ฅด๊ฒ ์ง๋ง, URLRequest ํํ๋ฅผ ๋ฐํํ๊ณ  ์๋ ๊ฒ์ ํ์ธํ  ์ ์์ต๋๋ค. </br>

```
// MARK: -

/// Types adopting the `URLRequestConvertible` protocol can be used to safely construct `URLRequest`s.
public protocol URLRequestConvertible {
    /// Returns a `URLRequest` or throws if an `Error` was encountered.
    ///
    /// - Returns: A `URLRequest`.
    /// - Throws:  Any error thrown while constructing the `URLRequest`.
    func asURLRequest() throws -> URLRequest
}

extension URLRequestConvertible {
    /// The `URLRequest` returned by discarding any `Error` encountered.
    public var urlRequest: URLRequest? { try? asURLRequest() }
}

extension URLRequest: URLRequestConvertible {
    /// Returns `self`.
    public func asURLRequest() throws -> URLRequest { self }
}
```
</br>




Moya์์ ์ถ์ํ ๋ ๊ณ์ธต์ ํตํด์ ์๋ฒ ํต์ ์ ํด์, ๋คํธ์ํฌ ์ฝ๋๋ฅผ ๊ฐ์ ํ๋ค. </br>
-> Alamofire๋ก๋ ์ถ์ํ ๋ ์ด๋ ํ ๊ณ์ธต์ ๋ง๋ค๋ฉด ๋์ง ์์๊น ? ?? ? 

</br>
</br>

์ ๋ต. </br>
๐ฅ Router ๐ฅ ๋ฅผ ๋ง๋ค์ด์ ์ถ์ํ ๋ ๊ณ์ธต์ ๋ง๋ค๊ณ , ์ด๊ฒ์ผ๋ก ํต์ ์ ํด๋ณด์.
</br>

**Router**
```
import Foundation

import Alamofire

enum MovieRouter: URLRequestConvertible {
    case trend(type: String, time: String)
    case similar(id: Int)
}

extension MovieRouter {
    var baseURL: URL {
        return URL(string: URLConstant.BaseURL)!
    }
    
    var path: String {
        switch self {
        case .trend(let type, let time):
            return "/trending/\(type)/\(time)"
        case .similar(let id):
            return  "/movie/\(id)/similar"
        }
    }
    
    var headers: [String : String] {
        return ["Content-Type": "application/json"]
    }
    
    var method: HTTPMethod {
        switch self {
        case .trend, .similar:
            return .get
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .trend, .similar:
            return ["api_key": APIKey.KEY, "language" : "en-US"]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        switch self {
        case .trend, .similar:
            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        }
        
        return request
    }
}
```
</br>

URLRequestConvertible ์ ์ฌ์ฉ์ ํด์ </br>
1. enum์ผ๋ก ์ฌ์ฉํ  API์ ์ข๋ฅ๋ฅผ ๋๋๊ณ  
2. ๊ฐ case์ ๋ํด์ baseURL .. path .. ๋ฑ์ ์ค์ ํ๋ค (-> ๋คํธ์ํฌ ์ฐ๊ฒฐ ์์ ํ์ํ ์์ฑ๋ค)
3. ๊ทธ๋ฆฌ๊ณ  asURLRequest๋ฅผ ํตํด์ ์์ ์ผ์ด์ค ๋ณ์ ๋ง๋ ์์ฑ๋ค์ ์ด์ฉํ URLRequest๋ฅผ ๋ฐํํ๋ค. 

</br>
</br>

URLRequest? </br>
์ต์ํ ์ฝ๋์์ ์ฐพ์๋ณด์. ์ด๋์ ์์๊น? </br>

๊ธฐ์กด์ Alamofire ํต์  ์ฝ๋์์ AF.request (url .. ์๋ถ๋ถ !! ) ๊ดํธ ์์ ์  ๋ถ๋ถ์์ URLRequest๋ก ์ํ๋ ํต์ ์ ํ๊ณ  ์์๋ ๊ฒ !! </br>

=> ๊ทธ๋ฌ๋ฏ๋ก !! ์  ๋ถ๋ถ์์ ์ฌ์ฉํ  ์ ์๋๋ก ๋ง๋ ์ผ์ด์ค๋ฅผ ๋ฐํํ๋ฉด ?? ๋ฐ๋ก ํต์  ๊ฐ๋ฅ !! ์๋ ์ฝ๋๋ก ์ดํด๋ณด๊ฒ ์ต๋๋ค ~~ 

</br>
</br>

๊ทธ๋ฆฌ๊ณ  API ํ์ผ์์ ํต์ ์ ํ์ !!! </br>
```
import Foundation

import Alamofire

final class MovieAPI {
    
    static let shared = MovieAPI()
    
    private init() { }
    
    func fetchMovieList(type: String, time: String, completionHandler: @escaping (NetworkResult<Any>) -> Void) {
        AF.request(MovieRouter.trend(type: type, time: time))
            .validate(statusCode: 200...500)
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success:
                    guard let statusCode = dataResponse.response?.statusCode else { return }
                    guard let value = dataResponse.value else { return }
                    
                    let networkResult = self.judgeStatus(by: statusCode, value)
                    completionHandler(networkResult)
                    
                case .failure:
                    completionHandler(.pathErr)
                }
            }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(TrendResponse.self, from: data) else { return .pathErr }
        
        switch statusCode {
        case 200:
            return .success(decodedData.results)
        case 400:
            return .requestErr("Bad Request")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
```
</br>

๊ทธ๋ฌ๋ฉด, Alamofire๋ง ์ด์ฉํด๋, Moya์ฒ๋ผ ์ถ์ํ ๋ ์ฝ๋๋ก ์๋ฒ ํต์ ์ ํ  ์ ์๋ค. </br>
= Type - Safe ํ๋ค. </br>
= ๊ฐํธํ๋ค. </br>

</br>
</br>

## ๋์ผ๋ก ..
๐ค Moya๋ฅผ ๋ฐ๋์ ์ฌ์ฉํด์ผ ํด? </br>
๐ค ๋คํธ์ํธ ์ฝ๋๋ฅผ ์ ์ถ์ํ ํด์ผ ํ๋๋ฐ? 
</br>
</br>

### SOKYTE Says ..
โ ๋์น๋ ๋ถ๋ถ์ ์ก์ ์ ์๋ค. </br>
โ ํ์ ์์ ์ฉ์ดํ๋ค. </br>
โ Request์ Response๋ฅผ ๋ณด๋ค ๋ ์ง์ค์ ์ผ๋ก ์ ๊ฒฝ์ธ ์ ์๋ค.

</br>
</br>


### Moya๊ฐ ๋ชจ์ผ ???
๋ชจ์ผ๋ ์๋ผ๋ชจํ์ด์ด์ ์๋ฒ ํต์  ์ฝ๋๋ฅผ ํ๋ฒ ๋ ์ถ์ํ ํ์ฌ ๋คํฌ์ํฌ ์ฝ๋์ ๊ฐ๋์ฑ์ ๋์ด๊ณ  ๋คํธ์ํฌ ๊ณ์ธต์ ํํ๋ฆฟํํ์ฌ ์ฌ์ฌ์ฉ์ฑ์ ๋์ธ ๋ผ์ด๋ธ๋ฌ๋ฆฌ๋ก, ๊ฐ๋ฐ์๋ ์ด๋ฐ ์ฅ์ ์ผ๋ก ์ค๋ก์ง Response์ Request๋ง์ ์ ๊ฒฝ์ฐ๋ฉด ๋๋ค. ์ปดํ์ผ ์ API Endpoint๊ฐ ์ฌ๋ฐ๋ฅธ์ง ํ์ธํ  ์ ์๊ณ  Enum์ ์ด์ฉํด์ ์ธ์ , ์ด๋์ ์ฌ์ฉ๋ ์ง ์์ ํ๊ฒ ์ฆ, Type-Safeํ๊ฒ ์ ์๋๋ค. ๋ํ ์ ๋ ํ์คํธ์ ์ฉ์ดํ ๊ตฌ์กฐ๋ก ๋์ด ์์ด ํ์คํธ๊ฐ ์ฝ๋ค.