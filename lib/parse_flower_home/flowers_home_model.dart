class FlowersHome {
  // int currentPage;
  // String firstPageUrl;
  // int from;
  // String nextPageUrl;
  // String path;
  // String perPage;
  // int to;
  List<Data> data;

  FlowersHome(
      {
      //   this.currentPage,
      // this.firstPageUrl,
      // this.from,
      // this.nextPageUrl,
      // this.path,
      // this.perPage,
      // this.to,
      this.data});

  factory FlowersHome.fromJson(Map<String, dynamic> json) {
    return FlowersHome(
        // currentPage: json['current_page'],
        // firstPageUrl: json['first_page_url'],
        // from: json['from'],
        // nextPageUrl: json['next_page_url'],
        // path: json['path'],
        // perPage: json['per_page'],
        // to: json['to'],
        data: json['data']
            .map((element) => Data.fromJson(element))
            .toList()
            .cast<Data>());
  }
}

class Data {
  int id;
  String name;
  String image;
  int price;
  String category;
  String tab;
  String description;
  int leftInStock;
  String size;
  int timesBought;
  int timesLiked;

  Data(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.category,
      this.tab,
      this.description,
      this.leftInStock,
      this.size,
      this.timesBought,
      this.timesLiked});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'] == null
            ? 'is null'
            : json['id'] == ''
                ? 'Empty'
                : json['id'],
        name: json['name'] == null
            ? 'is null'
            : json['name'] == ''
                ? 'Empty'
                : json['name'],
        image: json['image'] == null
            ? 'is null'
            : json['image'] == ''
                ? 'Empty'
                : json['image'],
        price: json['price'] == null
            ? 'is null'
            : json['price'] == ''
                ? 'Empty'
                : json['price'],
        category: json['category'] == null
            ? 'is null'
            : json['category'] == ''
                ? 'Empty'
                : json['category'],
        tab: json['tab'] == null
            ? 'is null'
            : json['tab'] == ''
                ? ''
                : json['tab'],
        description: json['description'] == null
            ? 'is null'
            : json['description'] == ''
                ? 'Empty'
                : json['description'],
        leftInStock: json['left_in_stock'] == null
            ? 'is null'
            : json['left_in_stock'] == ''
                ? 'Empty'
                : json['left_in_stock'],
        size: json['size'] == null
            ? 'is null'
            : json['size'] == ''
                ? 'Empty'
                : json['size'],
        timesBought: json['times_bought'] == null
            ? 'is null'
            : json['times_bought'] == ''
                ? 'Empty'
                : json['times_bought'],
        timesLiked: json['times_liked'] == null
            ? 'is null'
            : json['times_liked'] == ''
                ? 'Empty'
                : json['times_liked']);
  }
}
