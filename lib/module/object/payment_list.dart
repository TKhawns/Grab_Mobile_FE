import 'package:flutter/material.dart';

class PaymentList {
  final String name;
  final Widget icon;
  PaymentList({required this.name, required this.icon});
}

List<PaymentList> getPaymentList() {
  return <PaymentList>[
    PaymentList(
        icon: const Icon(
          Icons.account_balance_wallet_outlined,
          color: Color(0xFF58BC6B),
        ),
        name: "Nạp tiền"),
    PaymentList(
        icon: const Icon(
          Icons.qr_code_scanner_rounded,
          color: Color(0xFF58BC6B),
        ),
        name: "Quét để thanh toán"),
    PaymentList(
        icon: const Icon(
          Icons.arrow_outward_outlined,
          color: Color(0xFF58BC6B),
        ),
        name: "Gửi"),
    PaymentList(
        icon: const Icon(
          Icons.account_balance_rounded,
          color: Color(0xFF58BC6B),
        ),
        name: "Rút tiền"),
    PaymentList(
        icon: const Icon(
          Icons.add_card_rounded,
          color: Color(0xFF58BC6B),
        ),
        name: "Thêm Card"),
  ];
}
