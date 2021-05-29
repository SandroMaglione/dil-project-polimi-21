import 'package:dil/models/order_model.dart';
import 'package:flutter/material.dart';

class DeliveryList extends StatelessWidget {
  final List<Order> dataList;
  final void Function(Order order) onSelect;
  const DeliveryList({
    required this.dataList,
    required this.onSelect,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      padding: EdgeInsets.only(
        top: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: Colors.indigo,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
            ),
            child: Row(
              children: [
                Expanded(child: Text('#nr'), flex: 1),
                Expanded(child: Text('Address'), flex: 2),
                Expanded(child: Text('Time'), flex: 1),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final order = dataList[index];
                return Card(
                  color: index % 2 == 0 ? Colors.grey[100] : Colors.white,
                  elevation: 0,
                  child: InkWell(
                    onTap: () => onSelect(order),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('${order.nr}'), flex: 1),
                          Expanded(child: Text(order.address), flex: 2),
                          Expanded(child: Text(order.time), flex: 1),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
