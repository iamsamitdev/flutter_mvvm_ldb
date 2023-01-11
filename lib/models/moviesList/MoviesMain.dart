// ignore_for_file: file_names

import 'dart:convert';

MoviesMain? moviesMainFromJson(String str) => MoviesMain.fromJson(json.decode(str));

String moviesMainToJson(MoviesMain? data) => json.encode(data!.toJson());

class MoviesMain {
    MoviesMain({
        // required this.page,
        this.results,
        // required this.totalPages,
        // required this.totalResults,
    });

    // int? page;
    List<Result?>? results;
    // int? totalPages;
    // int? totalResults;

    factory MoviesMain.fromJson(Map<String, dynamic> json) => MoviesMain(
        // page: json["page"],
        results: json["results"] == null ? [] : json["results"] == null ? [] : List<Result?>.from(json["results"]!.map((x) => Result.fromJson(x))),
        // totalPages: json["total_pages"],
        // totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        // "page": page,
        "results": results == null ? [] : results == null ? [] : List<dynamic>.from(results!.map((x) => x!.toJson())),
        // "total_pages": totalPages,
        // "total_results": totalResults,
    };
}

class Result {
    Result({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    bool? adult;
    String? backdropPath;
    List<int?>? genreIds;
    int? id;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    DateTime? releaseDate;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null ? [] : json["genre_ids"] == null ? [] : List<int?>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds == null ? [] : genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

