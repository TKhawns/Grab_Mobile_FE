class GrabReward {
  final String title;
  final String content;
  final String image;
  GrabReward({required this.title, required this.content, required this.image});
}

List<GrabReward> getAllGrabRewards() {
  return <GrabReward>[
    GrabReward(
        title: "GrabReward", content: "2024", image: 'assets/images/crown.png'),
    GrabReward(
        title: "Tài khoản",
        content: "Xác thực Email",
        image: 'assets/images/user.png'),
    GrabReward(
        title: "Kích hoạt",
        content: "Grab Pay",
        image: 'assets/images/grab_pay.png'),
  ];
}
