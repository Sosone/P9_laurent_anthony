import Foundation

struct Weather
{
    let cityOne: CityWeather
    let cityTwo: CityWeather
    let date: Date
}

struct CityWeather
{
    let icon: String
    let name: String
    let description: String
    let temperature: Double
}
