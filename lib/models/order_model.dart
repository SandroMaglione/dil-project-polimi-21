import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String docId;
  final int nr;
  final String address;
  final Timestamp time;

  const Order(this.docId, this.nr, this.address, this.time);
}
