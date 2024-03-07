class Services {
  final String name;
  final String image;
  Services({required this.name, required this.image});
}

List<Services> getAllServices() {
  return <Services>[
    Services(name: "Ô tô", image: 'assets/images/car.png'),
    Services(name: "Đồ ăn", image: 'assets/images/food.png'),
    Services(name: "Giao hàng", image: 'assets/images/express.png'),
    Services(name: "Mart", image: 'assets/images/mart.png'),
    Services(name: "Offer", image: 'assets/images/offer.png'),
  ];
}
