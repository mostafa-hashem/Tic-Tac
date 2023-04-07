import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoardState extends StatelessWidget {
  String symbol;
  int index;
  Function(int) onClicked;

  BoardState(this.symbol, this.onClicked, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClicked(index); // تم تحديث الاستدعاء هنا لتمرير index كمعامل لـ onClicked
      },
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(255, 255, 203, 47)),
        fixedSize: const MaterialStatePropertyAll(Size(100,100)) ,
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
      child: Text(
        symbol,
        style: GoogleFonts.coiny(
          textStyle: const TextStyle(color: Colors.white, fontSize: 55),
        ),
      ),
    );
  }
}