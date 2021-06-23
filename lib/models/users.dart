class Users {
  Users({
    this.batchcomplete,
    this.usersContinue,
    this.query,
  });

  bool batchcomplete;
  Continue usersContinue;
  Query query;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    batchcomplete: json["batchcomplete"],
    usersContinue: Continue.fromJson(json["continue"]),
    query: Query.fromJson(json["query"]),
  );

  Map<String, dynamic> toJson() => {
    "batchcomplete": batchcomplete,
    "continue": usersContinue.toJson(),
    "query": query.toJson(),
  };
}

class Query {
  Query({
    this.pages,
  });

  List<UserPages> pages;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
    pages: List<UserPages>.from(json["pages"].map((x) => UserPages.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
  };
}

class UserPages {
  UserPages({
    this.pageid,
    this.ns,
    this.title,
    this.index,
    this.terms,
    this.thumbnail,
  });

  int pageid;
  int ns;
  String title;
  int index;
  Terms terms;
  Thumbnail thumbnail;

  factory UserPages.fromJson(Map<String, dynamic> json) => UserPages(
    pageid: json["pageid"],
    ns: json["ns"],
    title: json["title"],
    index: json["index"],
    terms: json['terms'] == null ? null : Terms.fromJson(json["terms"]),
    thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
  );

  Map<String, dynamic> toJson() => {
    "pageid": pageid,
    "ns": ns,
    "title": title,
    "index": index,
    "terms": terms.toJson(),
    "thumbnail": thumbnail == null ? null : thumbnail.toJson(),
  };
}

class Terms {
  Terms({
    this.description,
  });

  List<String> description;

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
    description: List<String>.from(json["description"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "description": List<dynamic>.from(description.map((x) => x)),
  };
}

class Thumbnail {
  Thumbnail({
    this.source,
    this.width,
    this.height,
  });

  String source;
  int width;
  int height;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    source: json["source"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "width": width,
    "height": height,
  };
}

class Continue {
  Continue({
    this.gpsoffset,
    this.continueContinue,
  });

  int gpsoffset;
  String continueContinue;

  factory Continue.fromJson(Map<String, dynamic> json) => Continue(
    gpsoffset: json["gpsoffset"],
    continueContinue: json["continue"],
  );

  Map<String, dynamic> toJson() => {
    "gpsoffset": gpsoffset,
    "continue": continueContinue,
  };
}
