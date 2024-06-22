import 'package:flutter/material.dart';
import 'package:wp_clone/theme.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({super.key, required this.body, required this.title});
  final Widget body;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 245, 245),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "...",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
              ),
              body,
            ],
          ),
        ),
      ),
    );
  }
}
