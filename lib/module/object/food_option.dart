class Options {
  final String name;
  final String image;
  Options({required this.name, required this.image});
}

List<Options> getAllOptions() {
  return <Options>[
    Options(name: "Bán chạy", image: 'assets/images/car.png'),
    Options(name: "Đặc sản ngon rẻ", image: 'assets/images/food.png'),
    Options(name: "Gần đây", image: 'assets/images/express.png'),
  ];
}
