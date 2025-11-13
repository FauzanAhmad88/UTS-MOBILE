import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '';
  double? _first;
  String? _op;

  void _numPress(String s) => setState(() => _display += s);
  void _clear() => setState(() { _display = ''; _first = null; _op = null; });

  void _setOp(String op) {
    if (_display.isEmpty) return;
    _first = double.tryParse(_display);
    _op = op;
    setState(() => _display = '');
  }

  void _equal() {
    if (_op == null || _first == null || _display.isEmpty) return;
    double second = double.tryParse(_display) ?? 0;
    double res = 0;
    switch (_op) {
      case '+': res = _first! + second; break;
      case '-': res = _first! - second; break;
      case '×': res = _first! * second; break;
      case '÷': res = second != 0 ? _first! / second : double.nan; break;
    }
    setState(() {
      _display = res.toString();
      _first = null;
      _op = null;
    });
  }

  void _square() {
    if (_display.isEmpty) return;
    double v = double.tryParse(_display) ?? 0;
    setState(() => _display = (v * v).toString());
  }

  void _sqrt() {
    if (_display.isEmpty) return;
    double v = double.tryParse(_display) ?? 0;
    setState(() => _display = (v >= 0 ? sqrt(v) : double.nan).toString());
  }

  Widget _btn(String t, {VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onPressed ?? () => _numPress(t),
          child: Text(t, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(24),
        child: Text(_display.isEmpty ? '0' : _display, style: TextStyle(fontSize: 36))
      )),
      Row(children: [_btn('7'),_btn('8'),_btn('9'),_btn('÷', onPressed: () => _setOp('÷'))]),
      Row(children: [_btn('4'),_btn('5'),_btn('6'),_btn('×', onPressed: () => _setOp('×'))]),
      Row(children: [_btn('1'),_btn('2'),_btn('3'),_btn('-', onPressed: () => _setOp('-'))]),
      Row(children: [_btn('0'),_btn('.'),_btn('=', onPressed: _equal),_btn('+', onPressed: () => _setOp('+'))]),
      Row(children: [_btn('C', onPressed: _clear), _btn('x²', onPressed: _square), _btn('√', onPressed: _sqrt)]),
      SizedBox(height: 8),
    ]);
  }
}
