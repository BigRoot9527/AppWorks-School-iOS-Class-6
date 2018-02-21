//
//  AssignmentProvider.swift
//  FunFacts
//
//  Created by 許庭瑋 on 2018/2/21.
//  Copyright © 2018年 許庭瑋. All rights reserved.
//
import GameKit

struct AssignmentProvider {
    
    let text = ["Loremipsumdolorsitamet,consecteturadipiscingelit.Maecenastempus.",
                "Contrarytopopularbelief,LoremIpsumisnotsimplyrandomtext." ,
                "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
                "lookeduponeofthemoreobscureLatinwords,consectetur",
                "from a Lorem Ipsum passage, and going through the cites of the word",
                "Thisbookisatreatiseonthetheoryofethics,verypopularduringthe.",
                "ThefirstlineofLoremIpsum,Loremipsumdolorsitamet.." ,
                "ThestandardchunkofLoremIpsumusedsincethe1500sisreproduced.",
                "TherearemanyvariationsofpassagesofLoremIpsumavailable." ,
                "but the majority have suffered alteration in some form"
    ]
    
    
    func randomtext() -> String {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: text.count)
        return text[randomNumber]
    }
}
