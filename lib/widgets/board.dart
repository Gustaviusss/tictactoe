import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  Function tapFunc;
  List<String> label;
  bool end;

  Board(this.tapFunc, this.label, this.end);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    end ? null : tapFunc(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[700])),
                    child: Center(
                      child: Text(label[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                          )),
                    ),
                  ));
            }),
      ),
    );
  }
}
