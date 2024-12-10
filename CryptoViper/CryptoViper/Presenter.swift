//
//  Presenter.swift
//  CryptoViper
//
//  Created by Hasan Hüseyin Kılıç on 19.11.2024.
//

import Foundation

//Class , protocol

// talks to - > hepsi gibi interactor ,router ,view

enum NetworkError: Error{
    case NetworkFailed
    case ParsingFailed
}


protocol AnyPresenter{
    var router: AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result : Result<[Crypto], Error>)
}


class CryptoPresenter: AnyPresenter{
    var router:  AnyRouter?
    
    var interactor:  AnyInteractor?{ //didset dememizin amacı değer atanınca
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto],  Error>) {
        switch result{
        case .success(let cryptos):
      //      view?.showCryptos(cryptos: cryptos)
            
            view?.update(with: cryptos)
          
        case .failure(_):
      //      view?.showError(error: error)
            view?.update(with: "Try again Later")
          
        }
    }
    
    
}
