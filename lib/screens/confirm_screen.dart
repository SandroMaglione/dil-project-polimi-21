import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dil/constant.dart';
import 'package:dil/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';

class ConfirmScreen extends StatelessWidget {
  final Order order;
  const ConfirmScreen(this.order);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('RocketDelivery'),
          leading: Icon(Icons.flight_takeoff_rounded),
          elevation: 0,
          backgroundColor: Colors.indigo,
          actions: [
            // IconButton(
            //   onPressed: null,
            //   icon: Icon(
            //     Icons.person,
            //     color: Colors.white,
            //   ),
            // ),
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 50,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Delivery proposal',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.indigo.withOpacity(0.7),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Address: ${order.address}',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.indigo.withOpacity(0.9),
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Time: ${DateFormat('dd MMMM, HH:mm').format(order.time.toDate())}',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.indigo.withOpacity(0.9),
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _confirm(context),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              side: BorderSide(
                                width: 4,
                                color: Colors.green,
                              ),
                            ),
                            child: Text(
                              'Accept',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _refuse(context),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              side: BorderSide(
                                width: 4,
                                color: Colors.redAccent,
                              ),
                            ),
                            child: Text(
                              'Refuse',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirm(BuildContext context) {
    FirebaseFirestore.instance.collection('order').doc(order.docId).update({
      'assigned': carrierId,
    }).then(
      (value) => context.router.pop(),
    );
  }

  void _refuse(BuildContext context) async {
    final data = (await FirebaseFirestore.instance
            .collection('order')
            .doc(order.docId)
            .get())
        .data()?['refused'] as List<dynamic>?;

    if (data == null) {
      FirebaseFirestore.instance.collection('order').doc(order.docId).update({
        'refused': [carrierId],
      }).then(
        (value) => context.router.pop(),
      );
    } else {
      FirebaseFirestore.instance.collection('order').doc(order.docId).update({
        'refused': [...data, carrierId],
      }).then(
        (value) => context.router.pop(),
      );
    }
  }
}
