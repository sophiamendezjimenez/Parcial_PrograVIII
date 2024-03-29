import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombreM = '';
  String _nombreD = '';
  String _fecha = '';
  String _edad = '';
  String _telefono = '';
  String _raza = '';
  String _sexo = '';

  String _opcionSeleccionada = 'Canino';

  List<String> _tipoMascota = ['Canino', 'Felino', 'Acuático', 'Ave'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingresar información de mascotas'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput2(),
          Divider(),
          _crearInput(),
          Divider(),
          _crearEdad(),
          Divider(),
          _crearTel(),
          Divider(),
          _crearRaza(),
          Divider(),
          _crearSexo(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
            child: RaisedButton(
              child: Text('Visualizar'),
              color: Colors.green.shade900,
              textColor: Colors.white,
              shape: StadiumBorder(),
              onPressed: () => _mostrarAlert(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
            child: RaisedButton(
              child: Text('Limpiar'),
              color: Colors.green.shade900,
              textColor: Colors.white,
              shape: StadiumBorder(),
              onPressed: () => _limpiarDatos(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre de la mascota',
          labelText: 'Nombre mascota',
          suffixIcon: Icon(Icons.pets),
          icon: Icon(Icons.pets_rounded)),
      onChanged: (valor) {
        setState(() {
          _nombreM = valor;
        });
      },
    );
  }

  Widget _crearInput2() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Su nombre',
          labelText: 'Nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombreD = valor;
        });
      },
    );
  }

  Widget _crearEdad() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Edad de la mascota',
          labelText: 'Edad',
          icon: Icon(Icons.pin)),
      onChanged: (valor) {
        setState(() {
          _edad = valor;
        });
      },
    );
  }

  Widget _crearSexo() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Indique el sexo de su mascota',
          labelText: 'Sexo',
          icon: Icon(Icons.pets_rounded)),
      onChanged: (valor) {
        setState(() {
          _sexo = valor;
        });
      },
    );
  }

  Widget _crearTel() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Su número de teléfono',
          labelText: 'Teléfono',
          suffixIcon: Icon(Icons.phone_android),
          icon: Icon(Icons.phone)),
      onChanged: (valor) {
        setState(() {
          _telefono = valor;
        });
      },
    );
  }

  Widget _crearRaza() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Raza de su mascota',
          labelText: 'Raza',
          icon: Icon(Icons.pending_actions_sharp)),
      onChanged: (valor) {
        setState(() {
          _raza = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2005),
        lastDate: new DateTime(2022),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _tipoMascota.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.list),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            title: Text('Datos de la mascota'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Nombre dueño: ' + _nombreD),
                Text('Nombre mascota: ' + _nombreM),
                Text('Edad mascota: ' + _edad),
                Text('Telefono: ' + _telefono),
                Text('Raza: ' + _raza),
                Text('Sexo: ' + _sexo),
                Text('Fecha de nacimiento: ' + _fecha),
                Text('Ripo mascota: ' + _opcionSeleccionada),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Entendido'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _limpiarDatos(BuildContext context) {
    _nombreD = "";
    _nombreM = '';
    _edad = '';
    _telefono = '';
    _raza = '';
    _sexo = '';
    _fecha = '';
    _opcionSeleccionada = 'Canino';
  }
}
