class UserPage {
  UserPage({
    this.batchcomplete,
    this.query,
  });

  String batchcomplete;
  Query query;

  factory UserPage.fromJson(Map<String, dynamic> json,pageid) => UserPage(
    batchcomplete: json["batchcomplete"],
    query: Query.fromJson(json["query"],pageid),
  );

  Map<String, dynamic> toJson() => {
    "batchcomplete": batchcomplete,
    "query": query.toJson(),
  };
}

class Query {
  Query({
    this.pages,
  });

  Pages pages;

  factory Query.fromJson(Map<String, dynamic> json,pageid) => Query(
      pages: Pages.fromJson(json["pages"],pageid),
  );

  Map<String, dynamic> toJson() => {
    "pages": pages.toJson(),
  };
}

class Pages {
  Pages({
    this.pageLinkDetails,
    this.pageid
  });

  PageLinkDetails pageLinkDetails;
  String pageid;

  factory Pages.fromJson(Map<String, dynamic> json,pageid) => Pages(
    pageLinkDetails: PageLinkDetails.fromJson(json[pageid]),
    pageid: pageid
  );

  Map<String, dynamic> toJson() => {
    pageid: pageLinkDetails.toJson(),
  };
}

class PageLinkDetails {
  PageLinkDetails({
    this.pageid,
    this.ns,
    this.title,
    this.contentmodel,
    this.pagelanguage,
    this.pagelanguagehtmlcode,
    this.pagelanguagedir,
    this.touched,
    this.lastrevid,
    this.length,
    this.fullurl,
    this.editurl,
    this.canonicalurl,
  });

  int pageid;
  int ns;
  String title;
  String contentmodel;
  String pagelanguage;
  String pagelanguagehtmlcode;
  String pagelanguagedir;
  DateTime touched;
  int lastrevid;
  int length;
  String fullurl;
  String editurl;
  String canonicalurl;

  factory PageLinkDetails.fromJson(Map<String, dynamic> json) => PageLinkDetails(
    pageid: json["pageid"],
    ns: json["ns"],
    title: json["title"],
    contentmodel: json["contentmodel"],
    pagelanguage: json["pagelanguage"],
    pagelanguagehtmlcode: json["pagelanguagehtmlcode"],
    pagelanguagedir: json["pagelanguagedir"],
    touched: DateTime.parse(json["touched"]),
    lastrevid: json["lastrevid"],
    length: json["length"],
    fullurl: json["fullurl"],
    editurl: json["editurl"],
    canonicalurl: json["canonicalurl"],
  );

  Map<String, dynamic> toJson() => {
    "pageid": pageid,
    "ns": ns,
    "title": title,
    "contentmodel": contentmodel,
    "pagelanguage": pagelanguage,
    "pagelanguagehtmlcode": pagelanguagehtmlcode,
    "pagelanguagedir": pagelanguagedir,
    "touched": touched.toIso8601String(),
    "lastrevid": lastrevid,
    "length": length,
    "fullurl": fullurl,
    "editurl": editurl,
    "canonicalurl": canonicalurl,
  };
}
