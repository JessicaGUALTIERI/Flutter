import 'package:flutter/material.dart';

class ArtworkWidget extends StatefulWidget {
  const ArtworkWidget({super.key, required this.title});

  final String title;

  @override
  State<ArtworkWidget> createState() => _ArtworkWidgetState();
}

class _ArtworkWidgetState extends State<ArtworkWidget> {

  bool _isFavorite = false;
  bool _isDescriptionShown = false;

  void _addToFavorites() {
    setState(() {
      _isFavorite = !(_isFavorite);
      if (_isFavorite) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Oeuvre ajoutée à vos favoris'),
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.red,
            ),
        );
      }
    });
  }

  void _showDescription() {
    setState(() {
      _isDescriptionShown = !(_isDescriptionShown);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: false,
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.bold,
            ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const Image(
                  image: AssetImage('images/Mona_Lisa.jpg'),
                ),
                Opacity(
                  opacity: _isFavorite ? 1 : 0.75,
                  child: Icon(
                      Icons.favorite,
                      color: _isFavorite ? Colors.red : Colors.white,
                      size: 100,
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  color: _isDescriptionShown ? Colors.black.withOpacity(0.60) : Colors.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20.0, right: 20.0, bottom: 20.0, left: 20.0),
                    child: _isDescriptionShown ? const Text(
                      "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au XXIe siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                      style: TextStyle(
                        color: Colors.white,
                      )
                    ) : Container(),
                  )                  
                )
              ]
            ),
            const Text(
              'Mona Lisa',
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 30,
                color: Colors.brown,
                ),
              ),
            const Text(
              'Léonard De Vinci',
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.article),
                  onPressed: _showDescription,
                  color: Colors.brown,
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: _addToFavorites,
                  color: _isFavorite ? Colors.red : Colors.brown,
                ),
              ],
            ),  
          ],
        ),
      ),
    );
  }
}

