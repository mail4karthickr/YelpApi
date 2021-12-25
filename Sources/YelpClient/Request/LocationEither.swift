
public enum LocationEither {
    /// Specifies the combination of address, neighborhood, city, state or zip, optional country
    case location(location: String)
    case coordinate(coordinate: Coordinates)
}

extension LocationEither: Encodable {}
