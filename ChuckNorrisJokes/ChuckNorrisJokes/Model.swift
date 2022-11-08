//
//  Model.swift
//  ChuckNorrisJokes
//
//  Created by Максим Юрисов on 24.10.2022.
//
/*{
"icon_url" : "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
"id" : "xqBqGOvST6mkKdZDmBaIHQ",
"url" : "",
"value" : "Chuck Norris went ice fishing and caught an igloo, the Titanic iceberg and a dead Polar Bear."
}
*/

import Foundation

//https://api.chucknorris.io/jokes/random

func getrandomJoke(block: (String)->Void){
    
    let url = URL(string: "https://api.chucknorris.io/jokes/random")!
    do{
        let data = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String,Any>
        let joke = json["value"] as! String
        print(joke)
        
        block(joke)
        return
    }catch{
        print(error)
    }
    
    block("")
}


var jokes: [String] {
    set{
        UserDefaults.standard.set(newValue, forKey: "jokes")
        UserDefaults.standard.synchronize()
    }
    get{
        if let array = UserDefaults.standard.array(forKey: "jokes"){
            return array as! [String]
            
        }
        return []
    }
}

func addJokeToFavorites(newjoke:String){
    
    for j in jokes {
        if j == newjoke {
            return
        }
    }
    jokes.append(newjoke)
}




