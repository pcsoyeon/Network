# Network

> ### 🌱 SeSAC Weekly Session  </br>
> **Moya가 모야?** _(feat.모야 없이 모야처럼 통신하기)_

</br>
</br>

## 프로젝트 & 레포지토리 설명
해당 프로젝트는 iOS/Swifit에서 네트워크 통신을 할 때 많이 사용하는 Moya와 Alamofire를 
1. 어떻게 사용하는지 소개하고
2. 둘의 차이는 무엇인지, (모야의 관점에서 살펴보겠습니다.)
3. Moya없이, Alamofire를 추상화하는 방법은 어떤 것이 있는지
등을 중심적으로 다룹니다. 

</br>
추가로, Moya에 대한(= 라이브러리에 대한) 제 개인적인 느낌 및 견해를 적었습니다. 참고해주세요 :) </br>
혹시 잘못된 내용, 부족한 점이 있거나/궁금하신 점이 있다면 언제든지 연락주세요. </br>


------------
</br>
</br>

## 개념 설명
프로젝트를 살펴보기 전에 먼저 개념을 간단하게 살펴보겠습니다. </br>
위에서 말씀드린 것과 같이 이 프로젝트에서는 Moya와 Alamofire를 통한 네트워크 통신 방법을 제공합니다. </br></br>

### Alamofire
먼저, Alamofire가 무엇인지 알아볼까요? </br>
Alamofire는 URLSession 에 기반한 라이브러리로, 코드의 간소화 및 가독성 측면에서 보다 성능이 개선되었다고 할 수 있습니다. </br></br>

### Moya
그렇다면, Moya는 무엇일까요? </br>
앞서 설명드린 Alamofire를 열거형 enum 을 사용해서 안전하고 정돈된 방식으로 캡슐화하여 보다 Type-Safe한 방식으로 통신을 할 수 있습니다. </br></br>

### Alamofire VS Moya
그러면, Moya랑 Alamofire가 서로 다르게 통신할까요? </br>
❌ 그렇지 않습니다. </br>
Moya도 Alamofire도 결국 네트워크 통신은 URLSession으로 통신합니다. Network Layer 를 템플릿화 해서 재사용성을 높인 것이 Moya라고 할 수 있습니다. </br></br>

추상화 된 정도를 비교하면 아래와 같습니다. </br>
**URLSession < Alamofire < Moya**

</br>
</br>

_추상화란?_ </br>
객체들의 공통적인 부분을 뽑아내서 따로 구현해 놓은 것을 의미, </br>
공통적인 부분만 골라 구현을 했기 때문에, 하나 하나 자세하게 구현하지 못하고 추상적으로 구현이 되어 있기 때문에 추상화라고 한다.  

------------
</br>
</br>


## 프로젝트 구성

프로젝트의 구성을 살펴보면 아래와 같습니다. (폴더링) </br>


실제 프로젝에서 사용하는 폴더링과 조금 상이할 수 있으므로 참고바랍니다. </br>
각 네트워크 통신 방법에 따라서 큰 폴더를 나눴습니다. (공통적으로, 전역적으로 사용되는 파일은 모두 Base 폴더에서 관리하고 있습니다.)

------------
</br>
</br>

## 프로젝트 설명 
앞서 말씀 드린 것과 같이, 해당 프로젝트는 Alamofire와 Moya로 네트워트 통신을 하는 방법을 제시하고 있습니다. </br>
개발자 또는 팀의 컨벤션에 따라서 약간이 차이가 있을 수 있으나 전반적인 흐름은 동일할 것이라 생각합니다. </br>
여기서도 네트워크의 흐름 정도를 참고하면 좋을 것 같습니다. :)

### Common
먼저 공통적으로 앱의 흐름은 다음과 같습니다. </br>
앱을 실행하면 각 라이브러리를 통해 서버 통신을 하고, 그 결과를 테이블 뷰에 보여주는 프로젝트입니다. (간단하죠?) </br></br>

크게 두가지를 통신하고 있습니다. </br>
앱을 실행하면 바로 최신 트렌드의 미디어 정보가 보일 것이고, 그 중 하나를 선택하면 그 미디어와 비슷한 다른 영화들의 목록이 나타납니다. </br>
그러므로 여기서 트렌드 정보를 GET하고, 비슷한 영화 목록을 GET하고 있습니다. </br>

</br>
</br>

그러면 이제, 각 라이브러에서 어떻게 통신하는지 살펴봅시다.
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
위의 코드를 차근 차근 살펴보면 </br>

1. 싱글톤 패턴을 통해서 네트워크 통신을 하고 있다.
2. url, header, parameter를 설정한 다음, Alamofire를 통해 해당 정보를 서버에 보내, GET 정보를 받아옵니다. 
3. 받은 정보를 `judgeStatus`를 통해 각 상황에 맞는 값으로 반환합니다.
4. 모든 통신 과정이 성공적으로 이뤄졌다면, 필요한 데이터 값을 받을 수 있고 이를 탈출 클로저를 통해 보냅니다. (이후 ViewController에서 사용하겠죠?)

</br>

그리고 ViewController에서 `AlamofireTrendAPIManager`를 호출하여 데이터를 받아, </br>
TableView에 UI를 보여줍니다. </br>
이후의 셀을 선택했을 때도 비슷한 흐름으로 네트워크 통신이 이루어집니다. 

</br>
</br>

> Alamofire의 통신 과정을 요약하면 아래와 같습니다. </br> 
> 통신을 하는 APIManger을 만들고, 제대로 서버 통신이 되면, 탈출 클로저를 통해 데이터를 반환합니다. </br>
> 그리고 통신이 필요한 곳에서 APIManager를 호출하고, 클로저 구문에서 데이터를 받아, 원하는 작업을 처리합니다. 

</br>
</br>

### Moya
그렇다면, Moya에서는 어떻게 통신을 하고 있을까요? </br>
Moya는 네트워크 통신을 한번 추상화해서 통신을 하고 있다고 말했었죠? 
</br>
</br> 
그 말은 곧, 본격적인 통신을 하기 전 통신을 위해서 공통적인 부분만 묶어서 따로 만들어놓은 추상화 계층, 즉 추상화 파일이 있다는 것입니다! </br>

'아, 그러니까 .. Alamofire의 APIManager처럼 본격적인 통신을 하기 전에 **추상화를 위한 무언가가 있다**는 것이겠지?' </br>
정도로 생각할 수 있습니다. 

</br>
</br>

그럼 이제 코드로 살펴보죠 !! </br>
추상화를 위한 파일을 Service 파일이라고 합시다. 

</br>
</br>

이 Service 파일은 아래와 같습니다. </br>
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

마차가지로 위에서 부터 살펴보면, </br>
1. enum으로 MovieSerice를 관리하고 있습니다. 영화 관련된 API에서 어떤 통신을 할 지 종류를 나누는 것이라고 볼 수 있습니다. 앞에서 말한 것처럼 트렌드 리스트와, 비슷한 영화 정보를 GET하므로 case를 두가지 나눌 수 있습니다.
2. 그리고 그 열거형을 extension해서 BaseTargetType을 채택하고 있습니다. 
3. BaseTargetType이 무엇인지 잘 몰라도, 어떠한 프로토콜이라는 것을 알 수 있습니다. 프로토콜은 그 안에 선언한 것을 구현해야 합니다. (UITableViewDataSource, UICollectionViewDataSource 등을 생각할 수 있겠죠?) BaseTargetType에서 선언한 것들을 구현하고 있습니다/
4. URL Path, Method, Task를 구현한 것을 확인할 수 있습니다. 

</br>
</br>

그럼 이제, 열거형이 채택한 BaseTargetType을 보겠습니다. </br>
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

BaseTargetType은 다시 TargetType을 채택하고 있습니다. </br> 
결국, Service 파일을 TargetType을 채택해서 구현하고 있다는 것을 확인할 수 있습니다. </br>

_TargetType이 무엇인데??_
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
Moya를 통해 살펴보면, MoyaProvider를 구체화하기 위해 필요한 프로토콜이라는 것을 알 수 있습니다. </br>
이 프로토콜을 채택함으로서, 우리는 그 서버 통신의 내부적인 것은 구체적으로 몰라도, 필요한 것들만 작성함으로써 통신을 할 수 있습니다. </br>

</br>
</br>
**필요한 것들만 작성??** </br>
서버통신을 할 때 개발자(= 클라이언트 개발자)에게 필요한 것들은 결국 `Request`, `Response`입니다. </br>
그러므로 Moya를 사용하면, `Request`, `Response`에만 집중해서 서버 통신을 할 수 있다는 장점이 있습니다. 

</br>
</br>

그런데, 아직 서버 통신을 하지 않았습니다. </br>
어떤 서버 통신을 할 것인지, 준비는 했지만 아직 서버에게 요청을 한 것은 아니죠. 

</br>
</br>

이제 통신을 요청해보겠습니다. </br>
이 때 필요한 파일이 Alamofire와 같이, API파일입니다. 

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

이렇게, `MoyaProvider`를 통해서 서버 통신을 하고 있습니다. </br>
이 방식을 통해서만 모야로 서버 통신을 할 수 있고, 그렇기 때문에 Type Safe하다고 할 수 있습니다. </br>

여기서 Moya의 또 다른 장점을 알 수 있습니다. 추상화된 계층을 통해서만 서버 통신을 할 수 있기 때문에, 보다 안정적이라는 것입니다. </br>
또한, 프로토콜을 채택해서 통신을 하고 있기 때문에, 잘못된 정보를 넣어서 요청을 한 것이 아니라면 서버 통신에 필요한 요소를 빼먹는 일을 없겠죠?  </br>



### Alamofire VS Moya
여기까지 살펴봤을 때, </br>
우리는 Alamofire와 Moya의 비교를 아래의 표로 나타낼 수 있습니다. </br>

(..준비중..)

------------
</br>
</br>


## Moya 없이 Moya처럼 통신하기  
그렇다면, 우리는 Moya로만 안정적으로 통신할 수 있는 것일까요? </br>
그렇지 않습니다. Alamofire를 추상화한 계층을 **"편리하게"** 제공해주는 것이 Moya입니다. 

</br>
</br>

그 계층을 직접 만들어서 통신한다면? 우리도 추상화하여 통신할 수 있겠죠? </br>
어떻게 할 수 있을까요? Alamofire도, Moya도 결국 URLSession을 통해서 통신을 하고 있습니다. </br>
그렇기 때문에 추상화를 할 수 있도록 도와주는 것과 결국 !!! **URLSession의 속성을 이용**해서 추상화 할 수 있습니다. 

</br>
</br>

### URLRequestConvertible
참고하면 좋을 블로그 : [Takki Dev](https://taekki-dev.tistory.com/23) 

</br>
</br>

자, 이 URLRequestConvertible 프로토콜을 사용해서 좀 더 안정적으로, 서버 통신을 해봅시다. </br>

(..준비중..)