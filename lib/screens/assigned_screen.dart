import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dil/constant.dart';
import 'package:dil/models/order_model.dart';
import 'package:dil/widgets/delivery_list.dart';
import 'package:flutter/material.dart';

class AssignedScreen extends StatefulWidget {
  @override
  _AssignedScreenState createState() => _AssignedScreenState();
}

class _AssignedScreenState extends State<AssignedScreen> {
  final orders = FirebaseFirestore.instance.collection('order').where(
        'assigned',
        isEqualTo: carrierId,
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('RocketDelivery'),
          leading: Icon(Icons.podcasts),
          elevation: 0,
          backgroundColor: Colors.indigo,
          actions: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Transform.rotate(
              angle: 60,
              child: Transform.scale(
                scale: 4,
                child: Container(
                  color: Colors.grey[200],
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Column(
                children: [
                  Text(
                    'Orders assigned',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Colors.indigo,
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: orders.get(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        // Check for errors
                        if (snapshot.hasError) {
                          return Text('Error...');
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          final fetchOrderList = snapshot.data?.docs.map(
                            (e) {
                              final data = e.data() as Map<String, dynamic>;
                              return Order(
                                e.id,
                                data['nr'],
                                data['address'],
                                data['time'],
                              );
                            },
                          ).toList();

                          return DeliveryList(
                            dataList: fetchOrderList ?? [],
                            onSelect: (_) {},
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
