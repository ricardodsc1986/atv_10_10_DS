1- Solicitar um número qualquer para o usuário e mostrar a respectiva tabuada

import 'package:flutter/material.dart';

void main() {
  runApp(TabuadaApp());
}

class TabuadaApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabuada',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabuadaScreen(),
    );
  }
}

class Tabuada {
  int _numero;

  
  int get numero => _numero;
  set numero(int n) => _numero = n;

  Tabuada(this._numero);

  List<String> calcularTabuada() {
    List<String> resultado = [];
    for (int i = 1; i <= 10; i++) {
      resultado.add("$numero x $i = ${numero * i}");
    }
    return resultado;
  }
}

class TabuadaScreen extends StatefulWidget {
  
  _TabuadaScreenState createState() => _TabuadaScreenState();
}

class _TabuadaScreenState extends State<TabuadaScreen> {
  final _controller = TextEditingController();
  
  
  late Tabuada _tabuada;  
  List<String> _resultado = [];

 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabuada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite um número'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int numero = int.tryParse(_controller.text) ?? 0;
                  _tabuada = Tabuada(numero); 
                  _resultado = _tabuada.calcularTabuada();
                });
              },
              child: Text('Calcular Tabuada'),
            ),
            SizedBox(height: 20),
            _resultado.isEmpty
                ? Text('Insira um número para ver a tabuada.')
                : Expanded(
                    child: ListView.builder(
                      itemCount: _resultado.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_resultado[index]),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
==================================================================================================================

2- Solicitar dia e mês de nascimento e mostrar o respectivo signo

import 'package:flutter/material.dart';

void main() {
  runApp(SignoApp());
}

class SignoApp extends StatelessWidget {
 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignoScreen(),
    );
  }
}

class Signo {
  int _dia;
  String _mes;

  
  int get dia => _dia;
  set dia(int d) => _dia = d;

  String get mes => _mes;
  set mes(String m) => _mes = m;

  Signo(this._dia, this._mes);

  int _mesPorExtensoParaNumero(String mes) {
    switch (mes.toLowerCase()) {
      case 'janeiro':
        return 1;
      case 'fevereiro':
        return 2;
      case 'março':
        return 3;
      case 'abril':
        return 4;
      case 'maio':
        return 5;
      case 'junho':
        return 6;
      case 'julho':
        return 7;
      case 'agosto':
        return 8;
      case 'setembro':
        return 9;
      case 'outubro':
        return 10;
      case 'novembro':
        return 11;
      case 'dezembro':
        return 12;
      default:
        return 0; 
    }
  }

  String obterSigno() {
    int mesNumero = _mesPorExtensoParaNumero(mes);

    if ((_dia >= 21 && mesNumero == 3) || (_dia <= 20 && mesNumero == 4)) {
      return 'Áries';
    } else if ((_dia >= 21 && mesNumero == 4) || (_dia <= 20 && mesNumero == 5)) {
      return 'Touro';
    } else if ((_dia >= 21 && mesNumero == 5) || (_dia <= 20 && mesNumero == 6)) {
      return 'Gêmeos';
    } else if ((_dia >= 21 && mesNumero == 6) || (_dia <= 22 && mesNumero == 7)) {
      return 'Câncer';
    } else if ((_dia >= 23 && mesNumero == 7) || (_dia <= 22 && mesNumero == 8)) {
      return 'Leão';
    } else if ((_dia >= 23 && mesNumero == 8) || (_dia <= 22 && mesNumero == 9)) {
      return 'Virgem';
    } else if ((_dia >= 23 && mesNumero == 9) || (_dia <= 22 && mesNumero == 10)) {
      return 'Libra';
    } else if ((_dia >= 23 && mesNumero == 10) || (_dia <= 21 && mesNumero == 11)) {
      return 'Escorpião';
    } else if ((_dia >= 22 && mesNumero == 11) || (_dia <= 21 && mesNumero == 12)) {
      return 'Sagitário';
    } else if ((_dia >= 22 && mesNumero == 12) || (_dia <= 20 && mesNumero == 1)) {
      return 'Capricórnio';
    } else if ((_dia >= 21 && mesNumero == 1) || (_dia <= 18 && mesNumero == 2)) {
      return 'Aquário';
    } else if ((_dia >= 19 && mesNumero == 2) || (_dia <= 20 && mesNumero == 3)) {
      return 'Peixes';
    } else {
      return 'Data inválida';
    }
  }
}

class SignoScreen extends StatefulWidget {
  
  _SignoScreenState createState() => _SignoScreenState();
}

class _SignoScreenState extends State<SignoScreen> {
  final _diaController = TextEditingController();
  final _mesController = TextEditingController();
  
  late Signo _signo;
  String _resultado = '';

 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descubra seu Signo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _diaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite o dia de nascimento'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _mesController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Digite o mês de nascimento (por extenso)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int dia = int.tryParse(_diaController.text) ?? 0;
                  String mes = _mesController.text.trim();
                  _signo = Signo(dia, mes);
                  _resultado = _signo.obterSigno();
                });
              },
              child: Text('Descobrir Signo'),
            ),
            SizedBox(height: 20),
            _resultado.isEmpty
                ? Text('Informe sua data de nascimento para descobrir seu signo.')
                : Text(
                    'Seu signo é: $_resultado',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
          ],
        ),
      ),
    );
  }
}
=============================================================================================================

3- Solicitar um ano e informar se é bissexto ou não.

import 'package:flutter/material.dart';

void main() {
  runApp(AnoBissextoApp());
}

class AnoBissextoApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ano Bissexto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnoBissextoScreen(),
    );
  }
}

class AnoBissexto {
  int anoA;

 
  int get ano => anoA;
  set ano(int a) => anoA = a;

  AnoBissexto(this.anoA);

  bool verificarAnoBissexto() {
    if ((anoA % 4 == 0 && anoA % 100 != 0) || (anoA % 400 == 0)) {
      return true;
    }
    return false;
  }
}

class AnoBissextoScreen extends StatefulWidget {
  
  _AnoBissextoScreenState createState() => _AnoBissextoScreenState();
}

class _AnoBissextoScreenState extends State<AnoBissextoScreen> {
  final anoController = TextEditingController();
  
  late AnoBissexto anoBissexto;
  String result = '';


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificar Ano Bissexto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: anoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite o ano'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int ano = int.tryParse(anoController.text) ?? 0;
                  anoBissexto = AnoBissexto(ano);
                  bool ehBissexto = anoBissexto.verificarAnoBissexto();
                  result = ehBissexto ? 'O ano $ano é bissexto.' : 'O ano $ano não é bissexto.';
                });
              },
              child: Text('Verificar'),
            ),
            SizedBox(height: 20),
            result.isEmpty
                ? Text('Informe um ano para verificar se é bissexto.')
                : Text(
                    result,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
          ],
        ),
      ),
    );
  }
}
==================================================================================================================

4- Solicitar as dimensões (largura e profundidade) de um terreno e calcular a área

import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraAreaApp());
}

class CalculadoraAreaApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Área',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AreaTerrenoScreen(),
    );
  }
}

class Terreno {
  double larg;
  double prof;

 
  double get largura => larg;
  set largura(double l) => larg = l;

  double get profundidade => prof;
  set profundidade(double p) => prof = p;

  Terreno(this.larg, this.prof);

  double calcularArea() {
    return larg * prof;
  }
}

class AreaTerrenoScreen extends StatefulWidget {
 
  _AreaTerrenoScreenState createState() => _AreaTerrenoScreenState();
}

class _AreaTerrenoScreenState extends State<AreaTerrenoScreen> {
  final largController = TextEditingController();
  final profController = TextEditingController();
  
  late Terreno terr;
  String result = '';


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Área do Terreno'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: largController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite a largura do terreno (m)'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: profController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite a profundidade do terreno (m)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double largura = double.tryParse(largController.text) ?? 0;
                  double profundidade = double.tryParse(profController.text) ?? 0;
                  terr = Terreno(largura, profundidade);
                  double area = terr.calcularArea();
                  result = 'A área do terreno é: $area m²';
                });
              },
              child: Text('Calcular Área'),
            ),
            SizedBox(height: 20),
            result.isEmpty
                ? Text('Informe as dimensões do terreno para calcular a área.')
                : Text(
                    result,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
          ],
        ),
      ),
    );
  }
}
==================================================================================================================

5- Solicitar o ano de nascimento e mostrar a idade do usuário para os próximos 50 anos
contados a partir do nascimento. 

import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraIdadeApp());
}

class CalculadoraIdadeApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Idade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IdadeScreen(),
    );
  }
}

class Idade {
  int anoNasc;

  
  int get anoNascimento => anoNasc;
  set anoNascimento(int ano) => anoNasc = ano;

  Idade(this.anoNasc);

  List<String> calcularIdadesProximosAnos() {
    List<String> idades = [];
    int anoAtual = DateTime.now().year;

    for (int i = 0; i <= 50; i++) {
      int idade = (anoAtual - anoNasc) + i;
      idades.add("Daqui a $i ano(s): $idade anos");
    }

    return idades;
  }
}

class IdadeScreen extends StatefulWidget {
  
  _IdadeScreenState createState() => _IdadeScreenState();
}

class _IdadeScreenState extends State<IdadeScreen> {
  final anoController = TextEditingController();
  
  late Idade id;
  List<String> result = [];

  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo de Idades para os Próximos 50 Anos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: anoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite o ano de nascimento'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int anoNascimento = int.tryParse(anoController.text) ?? 0;
                  id = Idade(anoNascimento);
                  result = id.calcularIdadesProximosAnos();
                });
              },
              child: Text('Calcular Idades'),
            ),
            SizedBox(height: 20),
            result.isEmpty
                ? Text('Informe o ano de nascimento para calcular as idades.')
                : Expanded(
                    child: ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(result[index]),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

