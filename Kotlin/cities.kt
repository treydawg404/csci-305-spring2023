data class City(val name: String, val latitude: Double, val longitude: Double){ 
}

fun haversine(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Double {
	val R = 6372.8 // in kilometers
	val l1 = Math.toRadians(lat1)
	val l2 = Math.toRadians(lat2)
	val dl = Math.toRadians(lat2 - lat1)
	val dr = Math.toRadians(lon2 - lon1)
	return 2 * R * Math.asin(Math.sqrt(Math.pow(Math.sin(dl / 2), 2.0) +
		Math.pow(Math.sin(dr / 2), 2.0) * Math.cos(l1) * Math.cos(l2)))
}

fun listCities() : List<City> {
    val cities: List<City> = listOf(
        City("Atlanta", 33.7490, -84.3880),
    	City("Bozeman", 45.6770, -111.0429),
    	City("New York", 40.7128, -74.0060),
    	City("San Francisco", 37.7749, -122.4194),
    	City("Tacoma", 47.2529, -122.4443))
    return cities
}

fun distanceFromSeattle(city: City) : Double {
    return haversine(47.6062, -122.3321, city.latitude, city.longitude)
}

fun main() {
    println("**********Step Two**********")
    var cityLocations = listCities()
    cityLocations.forEach{
        println(it)
    }
    
    println("**********Step Three**********")
    println("The distance between Seattle and Tacoma is\n" + distanceFromSeattle(cityLocations[4]) + " km")
    
    println("**********Step Four**********")
    val transform1: (City) -> Double = {distanceFromSeattle(it)}
    val distances = cityLocations.map(transform1)
    println("A new List with the distances of all cities in list to Seattle:")
    println(distances)
        
    println("**********Step Five**********")
    var filtered = cityLocations.filter{distanceFromSeattle(it) > 1000}
    println("List of cities over 1000KM from Seattle (used the return list from the Filter function and just printed the city name)")
    filtered.forEach{
        println(it.name)
    }
    
    println("**********Step Six**********")
    filtered = cityLocations.filter{it.longitude < -89.97803}
    val transform2: (City) -> String = {it.name}
    val result = filtered.map(transform2)
    println(result)
    
    println("**********Step Seven**********")
    var maxDist = cityLocations.maxBy{distanceFromSeattle(it)}
    println("Max Distance: " + maxDist)
    
    println("**********Step Eight**********")
    var mappedCities: Map<String, City> = cityLocations.associate({Pair(it.name, it)})
    mappedCities.forEach{
        println("Name " + it.key + " City " + it.value)
    }
}
