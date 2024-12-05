//
//  PersonViewModel.swift
//  APItableViewPersonProgramatically
//
//  Created by Srikanth Kyatham on 12/5/24.
//

class PersonViewModel{
    private var person: [PersonModel?]? = []
    
    var numberOfpersons: Int{
        person?.count ?? 0
    }
    
    func personAtIndex(index: Int) -> PersonModel?{
        return person?[index]
    }
    
    func fetchPerson(from url: String, completion: @escaping () -> Void){
        Network.sharedInstance.getData(from: url) { [weak self] Person in
            guard let self, let Person else { return }
            self.person = Person
            completion()
        }
    }
}
