import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BiodataPage extends StatefulWidget {
  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final _nameCtrl = TextEditingController();
  String _gender = 'Laki-laki';
  String _prodi = 'Informatika';
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime(2000,1,1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (d != null) setState(() => _selectedDate = d);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(radius: 60, backgroundImage: AssetImage('assets/images/profile.jpeg')),
          SizedBox(height: 12),
          TextField(
            controller: _nameCtrl,
            decoration: InputDecoration(labelText: 'Nama', border: OutlineInputBorder()),
          ),
          SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _prodi,
            items: ['Informatika','Sistem Informasi','Teknik Komputer']
                .map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
            onChanged: (v) => setState(() => _prodi = v!),
            decoration: InputDecoration(labelText: 'Program Studi', border: OutlineInputBorder()),
          ),
          SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jenis Kelamin'),
              Row(
                children: [
                  Radio<String>(
                    value: 'Laki-laki',
                    groupValue: _gender,
                    onChanged: (v) => setState(() => _gender = v!),
                  ),
                  Text('Laki-laki'),
                  Radio<String>(
                    value: 'Perempuan',
                    groupValue: _gender,
                    onChanged: (v) => setState(() => _gender = v!),
                  ),
                  Text('Perempuan'),
                ],
              )
            ],
          ),
          ListTile(
            title: Text('Tanggal Lahir'),
            subtitle: Text(_selectedDate == null
                ? 'Belum dipilih'
                : DateFormat('dd MMMM yyyy').format(_selectedDate!)),
            trailing: Icon(Icons.calendar_today),
            onTap: _pickDate,
          ),
          ElevatedButton(
            onPressed: () {
              final msg = 'Nama: ${_nameCtrl.text}\nProdi: $_prodi\nGender: $_gender\nDOB: ${_selectedDate == null ? "-" : DateFormat('dd MMM yyyy').format(_selectedDate!)}';
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
            },
            child: Text('Tampilkan Info'),
          )
        ],
      ),
    );
  }
}
