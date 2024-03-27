import Foundation

//1.შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)

enum Gender {
    case male
    case female
}

//2.შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender

protocol SuperBeing {
    var name: String { get }
    var strength: Int { get }
    var speed: Int { get }
    var weakness: String { get }
    var gender: Gender { get }
    
}

//3.SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა

extension SuperBeing {
    var strength: Int { 60  }
    var speed: Int { 90  }
    
}

//4. შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.
//5.გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String

class Superhero: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var outfitColor: String
    var equipment: String
    var vehicle: String
    
    init(name: String, weakness: String, gender: Gender, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
    }
    
    //გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს
    
    func rescue(victimName: String) {
        print("\(name) არ შეუშინდა სახიფათო სიტუაციას და \(victimName) გადაარჩინა სიკვდილს.")
    }
    
    //    გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს
    
    func combat(villain: SuperVillain) {
        print("\(name)  შეერკინა და დაამარცხა \(villain.name)")
    }
}

let batman = Superhero(name: "ბეტმენი", weakness: "ქალები", gender: .male, outfitColor: "შავი", equipment: "წიწაკის სპრეი", vehicle: "ტრანგალეტკა")


//გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String
class SuperVillain: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var evilScheme: String
    var obsession: String
    var rivalry: String
    
    init(name: String, weakness: String, gender: Gender, evilScheme:String, obsession:String, rivalry: String ) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.evilScheme = evilScheme
        self.obsession = obsession
        self.rivalry = rivalry
    }
    
    //    გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს
    
    func attack(superhero: Superhero) {
        print("\(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(superhero.name) მის შეჩერებას თუ შეძლებს")
        
    }
    
    //    გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
    
    func experimentation(subject: String) {
        print("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(subject)ა" )
    }
    
}


let joker = SuperVillain(name: "ჯოკერი", weakness: "ალკოჰოლი", gender: .male, evilScheme: "a", obsession: "სიმღერა", rivalry: "b")

// დაბეჭდავს - “‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).

batman.rescue(victimName: "გელა")

//დაბეჭდავს - “‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)

batman.combat(villain:joker )

//დაბეჭდავს -
//“ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)
joker.attack(superhero: batman)

//დაბეჭდავს
//“‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)

joker.experimentation(subject: "გელა")


//შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან
let flash = Superhero(name: "The Flash", weakness: "Time travel complications", gender: .male, outfitColor: "Red and Yellow", equipment: "Speed Force", vehicle: "None")
let thor = Superhero(name: "Thor", weakness: "Depowerment", gender: .male, outfitColor: "Red and Silver", equipment: "Mjolnir", vehicle: "None")
let storm = Superhero(name: "Storm", weakness: "Claustrophobia", gender: .female, outfitColor: "White", equipment: "Weather manipulation", vehicle: "None")
let superman = Superhero(name: "Superman", weakness: "Kryptonite", gender: .male, outfitColor: "Blue", equipment: "Cape", vehicle: "None")
let hulk = Superhero(name: "Hulk", weakness: "Control", gender: .male, outfitColor: "Green", equipment: "Unlimited strength", vehicle: "None")


let magneto = SuperVillain(name: "Magneto", weakness: "Non-metallic objects", gender: .male, evilScheme: "Mutant supremacy", obsession: "Defeating the X-Men", rivalry: "X-Men")
let loki = SuperVillain(name: "Loki", weakness: "Hubris", gender: .male, evilScheme: "Subjugation of Asgard", obsession: "Outdoing Thor", rivalry: "Thor")
let thanos = SuperVillain(name: "Thanos", weakness: "His ego", gender: .male, evilScheme: "Universal balance", obsession: "Obtaining all Infinity Stones", rivalry: "Avengers")
let venom = SuperVillain(name: "Venom", weakness: "Sonics and fire", gender: .male, evilScheme: "Destroying Spiderman", obsession: "Becoming stronger", rivalry: "Spiderman")
let deadshot = SuperVillain(name: "Deadshot", weakness: "Code of honor", gender: .male, evilScheme: "Assassination for hire", obsession: "Perfecting his aim", rivalry: "Batman")

magneto.attack(superhero: storm)
superman.rescue(victimName: "შმაგი")
flash.combat(villain: loki)
venom.attack(superhero: hulk)


//
//Optional:
//
//
//
//წარმოიდგინეთ სცენა სადაც ორი სუპერგმირი - დრეიკი და ლექს-სენი ერთმანეთს ეჯიბრებიან თუ რომელი უფრო სწრაფია. დრეიკი ამბობს რომ ის ყველაზე სწრაფია მსოფლიოში და რიანაც უდასტურებს.
//
//-“ლექს-სენს არცერთი შეჯიბრი არ წაუგია ისტორიაში” აცხადებს მისი კოლაბორატორი თაკო და დასძენს, რომ დრეიკი შიშისაგან უნდა კანკალებდეს, რადგან არც კი იცის რა ელოდება. ამ სუპერგმირების ბედი თქვენზეა დამოკიდებული, თქვენ უნდა გადაწყვიტოთ ვინ არის მსოფლიოში ყველაზე სწრაფი და ვინ შეძლებს ბილბორდის ტოპ ჩარტების განადგურებას.

//დაწერეთ ჯენერიკ ფუნქცია compareSwiftness რომელიც იღებს მხოლოდ ორ პარამეტრს პირველ და მეორე სუპერგმირებს რომლებიც დაქვემდებარებულები იქნებიან SuperBeing პროტოკოლზე, ფუნქცია უნდა აბრუნებდეს სტრინგს


func compareSwiftness<T: SuperBeing>(first: T, second: T) -> String {
    let firstSpeed = first.speed + 40 // რადგან default მნიშვნელობა ზემოთ მინიჭებულია შედეგი თანაბარი გამოდის ან მომიწევდა ყველა სუპერგმირს ახლიდან გავუწერო საკუთარი სიჩქარე var                                       speed: Int { get set }  რომ ჩამეწერს პროტოკოლში
    let secondSpeed = second.speed
    
    if firstSpeed > secondSpeed {
        return "\(first.name) is faster than \(second.name)!"
    } else if firstSpeed < secondSpeed {
        return "\(second.name) is faster than \(first.name)!"
    } else {
        return "\(first.name) and \(second.name) are equally fast!"
    }
}

var drake = Superhero(name: "Drake", weakness: "სიმღერა", gender: .male, outfitColor: "Black", equipment: "Super speed", vehicle: "None")

let lexSen = Superhero(name: "Lex-Sen", weakness: "სიმღერა", gender: .male, outfitColor: "Blue", equipment: "Super speed", vehicle: "None")

let result = compareSwiftness(first: drake, second: lexSen)
print(result)
