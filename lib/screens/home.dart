import 'package:colorapp/services/color_service.dart';
import 'package:flutter/material.dart';


/// Home screen
/// The background color changes to a random color after tapping anywhere
/// on the screen. Default color is also random.
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  Color _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  @override
  initState() {
    super.initState();
    _backgroundColor = ColorService.randomColor();
  }

  /// Changes backgroundColor
  _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  /// Builds a widget based on AnimatedContainer, that changes its color
  /// after tapping on it
  Widget _buildBody() {
    return GestureDetector(
      child: AnimatedContainer(
        color: _backgroundColor,
        duration: Duration(milliseconds: 2000),
        curve: Curves.fastOutSlowIn,
        child: Center(
            child: Text(
              'Hey there!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
        ),
      ),
      onTap: () {
        Color newBackgroundColor = ColorService.randomColor();
        _changeBackgroundColor(newBackgroundColor);
      },
    );
  }


}
