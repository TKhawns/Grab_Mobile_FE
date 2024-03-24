class BookingNow {
  final String name;
  final String image;
  BookingNow({required this.name, required this.image});
}

List<BookingNow> getAllBookingNows() {
  return <BookingNow>[
    BookingNow(
        name: "Đặt đơn đông, tặng món 0 đồng",
        image: 'assets/images/don0d.png'),
    BookingNow(
        name: "Đặt đơn nhóm giảm thêm 25.000đ",
        image: 'assets/images/don0d.png'),
    BookingNow(
        name: "Triệu món ăn no, giá chỉ 33.000đ",
        image: 'assets/images/don0d.png'),
  ];
}
