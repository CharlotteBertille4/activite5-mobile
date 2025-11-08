import 'package:activite1/redacteurs_interface.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MonAppli());
}

class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magazine Infos',
      home: const RedacteursInterface(),
    );
  }
}

class pageAccueil extends StatelessWidget {
  const pageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magazine Infos', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const RedacteursInterface(),
              ),
            );
          },
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image(
                image: AssetImage("assets/images/magazineInfo.png"),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            partieTitre(),
            partieTexte(),
            partieIcone(),
            partieRubrique(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.redAccent,
      //   onPressed: () {
      //     print('Tu as cliqué dessus');
      //   },
      //   child: Text('Click', style: TextStyle(color: Colors.white)),
      // ),
    );
  }
}

class partieTitre extends StatelessWidget {
  const partieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BIENVENU AU MAGAZINE INFOS",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            Text(
              "Votre magazine numérique, votre source d'inspiration",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class partieTexte extends StatelessWidget {
  const partieTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "Magazine Infos est votre source incontournable pour découvrir les dernières nouvelles, "
        "tendances et analyses dans les domaines de la culture, de la mode et de la technologie. "
        "Explorez des articles inspirants et restez informé grâce à notre équipe de rédacteurs passionnés",
        style: TextStyle(fontSize: 18, color: Colors.black54),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class partieIcone extends StatelessWidget {
  const partieIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            //color: Colors.pink,
            child: Column(
              children: [
                Icon(Icons.phone, color: Colors.pink),
                SizedBox(height: 10),
                Text("TEL", style: TextStyle(color: Colors.pink)),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            child: Column(
              children: [
                Icon(Icons.email, color: Colors.pink),
                Text("MAIL", style: TextStyle(color: Colors.pink)),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            // color: Colors.pink,
            child: Column(
              children: [
                Icon(Icons.share, color: Colors.pink),
                Text("PARTAGE", style: TextStyle(color: Colors.pink)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class partieRubrique extends StatelessWidget {
  const partieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/magazine1.png",
              width: 150,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/magazine2.png",
              width: 150,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
