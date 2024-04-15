import 'package:desafio_flutter_hero/components/hero_image.dart';
import 'package:desafio_flutter_hero/components/texttittle.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  final String name;
  final String photoPath;
  final String description;

  const DetailScreen(this.name, this.description, this.photoPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextTitle()),
      body: SizedBox(
        height: 640,
        width: 360,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: HeroImage(photoPath),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: SizedBox(
                  width: 360,
                  child: SingleChildScrollView(
                    child: Text(
                      textAlign: TextAlign.justify,
                      description,
                      style: TextStyle(
                        fontSize: 21,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
