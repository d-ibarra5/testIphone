import UIKit

protocol AlumnoInterfaz	{
    
    func AprenderIOS(alumno: Alumno)
    func AprenderAndroid(alumno: Alumno)
    
}

class Alumno {
    
    private var nombre: String
    private var apellido: String
    private var delegado: AlumnoInterfaz?
    
    public var nombreCompleto: String{
        return "\(self.nombre) \(self.apellido)"
    }
    
    init(nombre: String, apellido: String, delegado: AlumnoInterfaz?){
        self.nombre = nombre
        self.apellido = apellido
        self.delegado = delegado
    }
    
    func aprender(){
        self.delegado?.AprenderAndroid(alumno: self)
        self.delegado?.AprenderIOS(alumno: self)
    }
    
}


class Institucion {
    
    func dictarClases(){
        
        let franco = Alumno(nombre: "Franco", apellido: "Salcedo", delegado: self)
        franco.aprender()
        
        let guillermo = Alumno(nombre: "Guillermo", apellido: "Anticona", delegado: self)
        guillermo.aprender()
        
    }
}

extension Institucion: AlumnoInterfaz {
    
    func AprenderIOS(alumno: Alumno) {
        print ("Aprender IOS - \(alumno.nombreCompleto)"		)
    }
    
    func AprenderAndroid(alumno: Alumno) {
        print("Aprender ANDROID - \(alumno.nombreCompleto)")
    }
    
}
	
let isil = Institucion()
isil.dictarClases()
