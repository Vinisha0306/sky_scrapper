import 'package:sky_scrapper/headers.dart';

Widget designContainer({required String text, required String word}) {
  return Container(
    height: 100,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.blue.shade200,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: Colors.blue.shade800,
        width: 2,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          word,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
