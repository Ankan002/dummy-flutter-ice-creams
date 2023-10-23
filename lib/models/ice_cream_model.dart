import "dart:convert";

IceCreamsData iceCreamsDataFromJSON(String response) {
  final Map<String, dynamic> json = jsonDecode(response);
  return IceCreamsData.fromJson(json);
}

class IceCreamsData {
  List<IceCream> iceCreams;

  IceCreamsData({
    required this.iceCreams,
  });

  factory IceCreamsData.fromJson(Map<String, dynamic> json) => IceCreamsData(
        iceCreams: List<IceCream>.from(
          json["ice_creams"]
              .map((rawIceCream) => IceCream.fromJSON(rawIceCream)),
        ),
      );

  Map<String, List<IceCream>> toJSON() => {
        "ice_creams": iceCreams,
      };
}

class IceCream {
  String flavour;
  String description;
  List<String>? toppings;
  num price;
  String? image;
  List<Ingredients> ingredients;

  IceCream({
    required this.flavour,
    required this.description,
    this.toppings,
    required this.price,
    this.image,
    required this.ingredients,
  });

  factory IceCream.fromJSON(Map<String, dynamic> rawIceCream) => IceCream(
        flavour: rawIceCream["flavour"],
        description: rawIceCream["description"],
        toppings: rawIceCream["toppings"] != null
            ? List<String>.from(rawIceCream["toppings"])
            : null,
        price: rawIceCream["price"],
        image: rawIceCream["image"],
        ingredients: List<Ingredients>.from(rawIceCream["ingredients"]
            .map((rawIngredient) => Ingredients.fromJSON(rawIngredient))),
      );

  Map<String, dynamic> toJson() => {
        "flavour": flavour,
        "description": description,
        "toppings": toppings,
        "price": price,
        "image": image,
        "ingredients": ingredients,
      };
}

class Ingredients {
  String name;
  String quantity;

  Ingredients({
    required this.name,
    required this.quantity,
  });

  factory Ingredients.fromJSON(Map<String, dynamic> rawIngredients) =>
      Ingredients(
        name: rawIngredients["name"],
        quantity: rawIngredients["quantity"],
      );

  Map<String, dynamic> toJSON() => {"name": name, "quantity": quantity};
}
