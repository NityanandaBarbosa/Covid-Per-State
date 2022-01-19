import 'dart:convert';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {
    Result({this.results});

    int count;
    String next;
    dynamic previous;
    List<DayResult> results;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        results: List<DayResult>.from(json["results"].map((x) => DayResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class DayResult {
    DayResult({
        this.city,
        this.cityIbgeCode,
        this.confirmed,
        this.confirmedPer100KInhabitants,
        this.date,
        this.deathRate,
        this.deaths,
        this.estimatedPopulation,
        this.estimatedPopulation2019,
        this.isLast,
        this.orderForPlace,
        this.placeType,
        this.state,
    });

    dynamic city;
    String cityIbgeCode;
    int confirmed;
    double confirmedPer100KInhabitants;
    DateTime date;
    double deathRate;
    int deaths;
    int estimatedPopulation;
    int estimatedPopulation2019;
    bool isLast;
    int orderForPlace;
    PlaceType placeType;
    State state;

    factory DayResult.fromJson(Map<String, dynamic> json) => DayResult(
        city: json["city"],
        cityIbgeCode: json["city_ibge_code"],
        confirmed: json["confirmed"],
        confirmedPer100KInhabitants: json["confirmed_per_100k_inhabitants"].toDouble(),
        date: DateTime.parse(json["date"]),
        deathRate: json["death_rate"].toDouble(),
        deaths: json["deaths"],
        estimatedPopulation: json["estimated_population"],
        estimatedPopulation2019: json["estimated_population_2019"],
        isLast: json["is_last"],
        orderForPlace: json["order_for_place"],
        placeType: placeTypeValues.map[json["place_type"]],
        state: stateValues.map[json["state"]],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "city_ibge_code": cityIbgeCode,
        "confirmed": confirmed,
        "confirmed_per_100k_inhabitants": confirmedPer100KInhabitants,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "death_rate": deathRate,
        "deaths": deaths,
        "estimated_population": estimatedPopulation,
        "estimated_population_2019": estimatedPopulation2019,
        "is_last": isLast,
        "order_for_place": orderForPlace,
        "place_type": placeTypeValues.reverse[placeType],
        "state": stateValues.reverse[state],
    };
}

enum PlaceType { STATE }

final placeTypeValues = EnumValues({
    "state": PlaceType.STATE
});

enum State { AC, AL, AM, AP, BA, CE, DF, ES, GO, MA, MG, MT, PA, PB, PE, PI, PR, RJ, RO, RS, SC, SE, SP, MS, RN, RR, TO }

final stateValues = EnumValues({
    "AC": State.AC,
    "AL": State.AL,
    "AM": State.AM,
    "AP": State.AP,
    "BA": State.BA,
    "CE": State.CE,
    "DF": State.DF,
    "ES": State.ES,
    "GO": State.GO,
    "MA": State.MA,
    "MG": State.MG,
    "MS": State.MS,
    "MT": State.MT,
    "PA": State.PA,
    "PB": State.PB,
    "PE": State.PE,
    "PI": State.PI,
    "PR": State.PR,
    "RJ": State.RJ,
    "RN": State.RN,
    "RO": State.RO,
    "RR": State.RR,
    "RS": State.RS,
    "SC": State.SC,
    "SE": State.SE,
    "SP": State.SP,
    "TO": State.TO
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
