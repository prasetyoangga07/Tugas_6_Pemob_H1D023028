# TUGAS 6
PRASETYO ANGGA PERMANA<br>
H1D023028<br>
SHIFT KRS A<br>
SHIFT BARU A<br>
<br>

## DOKUMENTASI


https://github.com/user-attachments/assets/a0066854-d133-43cb-8578-900cc4387b4e
<img width="495" height="912" alt="Screenshot 2025-11-09 222430" src="https://github.com/user-attachments/assets/26cb614e-5324-4419-8c59-c3a9e6cf2671" />
<img width="498" height="909" alt="Screenshot 2025-11-09 222405" src="https://github.com/user-attachments/assets/152c001e-924b-4b73-8859-5fb615193861" />

---


## 🧩 Deskripsi
Aplikasi Flutter ini berfungsi untuk **menginput data mahasiswa** berupa **Nama**, **NIM**, dan **Tahun Lahir** pada halaman form,  
lalu menampilkan hasil input tersebut di halaman kedua dalam bentuk **kalimat perkenalan** beserta **umur yang dihitung otomatis**.  

---

## 🗂️ Struktur Folder
lib/ <br>
├─ main.dart <br>
└─ ui/ <br>
├─ form_data.dart // Halaman input data <br>
└─ tampil_data.dart // Halaman hasil perkenalan <br>


---

## 🚀 Proses Passing Data

Passing data adalah proses **mengirimkan nilai dari satu halaman (widget) ke halaman lain**.  
Pada aplikasi ini, data dari form dikirim ke halaman perkenalan menggunakan **Navigator.push()** dan **parameter konstruktor**.

### 🔹 Langkah-langkah:
1. Pengguna mengisi data di **form_data.dart** :
   - Nama  
   - NIM  
   - Tahun Lahir  

2. Nilai input disimpan di variabel melalui **TextEditingController**.

3. Ketika tombol **Simpan** ditekan, data dikirim ke halaman lain dengan:
   ```dart
   Navigator.push(
     context,
     MaterialPageRoute(
       builder: (_) => TampilData(
         nama: nama,
         nim: nim,
         tahunLahir: tahun,
       ),
     ),
   );

Di file tampil_data.dart, data diterima melalui konstruktor widget:
```
class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahunLahir;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  }) : super(key: key);

  int _hitungUmur() => DateTime.now().year - tahunLahir;
}




