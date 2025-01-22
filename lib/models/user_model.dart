import 'dart:convert';

class UserModel {
  final List<User> results;

  UserModel({required this.results});

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        results: List<User>.from(
            json["results"].map((x) => User.fromMap(x)).cast<User>()),
      );
}

class User {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final Login login;
  final Dob dob;
  final Dob registered;
  final String phone;
  final String cell;
  final Id id;
  final Picture picture;
  final String nat;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        gender: json["gender"] ?? '',
        name: Name.fromMap(json["name"]),
        location: Location.fromMap(json["location"]),
        email: json["email"] ?? '',
        login: Login.fromMap(json["login"]),
        dob: Dob.fromMap(json["dob"]),
        registered: Dob.fromMap(json["registered"]),
        phone: json["phone"] ?? '',
        cell: json["cell"] ?? '',
        id: Id.fromMap(json["id"]),
        picture: Picture.fromMap(json["picture"]),
        nat: json["nat"] ?? '',
      );
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        title: json["title"] ?? '',
        first: json["first"] ?? '',
        last: json["last"] ?? '',
      );
}

class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final Coordinates coordinates;
  final Timezone timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        street: Street.fromMap(json["street"]),
        city: json["city"] ?? '',
        state: json["state"] ?? '',
        country: json["country"] ?? '',
        postcode: json["postcode"], // Handling dynamic type
        coordinates: Coordinates.fromMap(json["coordinates"]),
        timezone: Timezone.fromMap(json["timezone"]),
      );
}

class Street {
  final int number;
  final String name;

  Street({required this.number, required this.name});

  factory Street.fromMap(Map<String, dynamic> json) => Street(
        number: (json["number"] ?? 0) as int,
        name: json["name"] ?? '',
      );
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromMap(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"] ?? '',
        longitude: json["longitude"] ?? '',
      );
}

class Timezone {
  final String offset;
  final String description;

  Timezone({required this.offset, required this.description});

  factory Timezone.fromMap(Map<String, dynamic> json) => Timezone(
        offset: json["offset"] ?? '',
        description: json["description"] ?? '',
      );
}

class Login {
  final String uuid;
  final String username;
  final String password;

  Login({required this.uuid, required this.username, required this.password});

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        uuid: json["uuid"] ?? '',
        username: json["username"] ?? '',
        password: json["password"] ?? '',
      );
}

class Dob {
  final String date;
  final int age;

  Dob({required this.date, required this.age});

  factory Dob.fromMap(Map<String, dynamic> json) => Dob(
        date: json["date"] ?? '',
        age: (json["age"] ?? 0) as int,
      );
}

class Id {
  final String name;
  final String value;

  Id({required this.name, required this.value});

  factory Id.fromMap(Map<String, dynamic> json) => Id(
        name: json["name"] ?? '',
        value: json["value"] ?? '', // Handle potential null values
      );
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({required this.large, required this.medium, required this.thumbnail});

  factory Picture.fromMap(Map<String, dynamic> json) => Picture(
        large: json["large"] ?? '',
        medium: json["medium"] ?? '',
        thumbnail: json["thumbnail"] ?? '',
      );
}
