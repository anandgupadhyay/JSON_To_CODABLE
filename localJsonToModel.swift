static func loadJson(filename fileName: String) -> Data {
            if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
                do {
                    let dataObj = try Data(contentsOf: url)
                    return dataObj
                } catch {
                    print("error:\(error)")
                }
            }
            return Data()
        }

//Usage 
let jsonData = SwiftUtility.loadJson(filename: "MovieDetail")
        let decoderObject = JSONDecoder()
        do {
            self.movieDetailModel.value = try decoderObject.decode(MovieDetailModel.self, from: jsonData)
            resultHandler(.success(jsonData))
        } catch {}
