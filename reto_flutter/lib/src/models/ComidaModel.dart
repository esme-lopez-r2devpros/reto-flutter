// To parse this JSON data, do
//
//     final comidaModel = comidaModelFromJson(jsonString);

import 'dart:convert';

ComidaModel comidaModelFromJson(String str) => ComidaModel.fromJson(json.decode(str));

String comidaModelToJson(ComidaModel data) => json.encode(data.toJson());

class ComidaModel {
    ComidaModel({
        this.mealId,
        this.dateStart,
        this.dateEnd,
        this.type,
        this.name,
        this.description,
        this.imageUrl,
        this.rating,
        this.tags,
        this.suggestions,
        this.comidaModelNew,
    });

    String mealId;
    DateTime dateStart;
    DateTime dateEnd;
    String type;
    String name;
    String description;
    String imageUrl;
    int rating;
    List<String> tags;
    List<Suggestion> suggestions;
    bool comidaModelNew;

    factory ComidaModel.fromJson(Map<String, dynamic> json) => ComidaModel(
        mealId: json["mealId"],
        dateStart: DateTime.parse(json["dateStart"]),
        dateEnd: DateTime.parse(json["dateEnd"]),
        type: json["type"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        rating: json["rating"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        suggestions: List<Suggestion>.from(json["suggestions"].map((x) => Suggestion.fromJson(x))),
        comidaModelNew: json["new"],
    );

    Map<String, dynamic> toJson() => {
        "mealId": mealId,
        "dateStart": dateStart.toIso8601String(),
        "dateEnd": dateEnd.toIso8601String(),
        "type": type,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "rating": rating,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "suggestions": List<dynamic>.from(suggestions.map((x) => x.toJson())),
        "new": comidaModelNew,
    };
}

class Suggestion {
    Suggestion({
        this.name,
        this.imageUrl,
    });

    String name;
    String imageUrl;

    factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        name: json["name"],
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
    };
}
