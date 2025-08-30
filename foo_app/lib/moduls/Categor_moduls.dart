

class Category{
  final int id;
  final String title;
  final String ImgUrl;

  Category({required this.id, required this.title, required this.ImgUrl});

  
}

List categories=[
  Category(id: 0, title: "All", ImgUrl: "assets/filter.png"),
  Category(id: 1, title: "Burger", ImgUrl: "assets/burger.png"),
  Category(id: 2, title: "Pizza", ImgUrl: "assets/pizza.png"),
  Category(id: 3, title: "Pasta", ImgUrl: "assets/spaguetti.png")
];