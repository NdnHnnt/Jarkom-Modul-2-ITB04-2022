# Jarkom-Modul-1-ITB04-2022

Pengerjaan Soal Shift Komunikasi Data dan Jaringan Komputer Modul 1 oleh ITB04

# Anggota

| Nama                           | NRP          | 
| -------------------------------| -------------| 
| Nadine Haninta                 | `5027201014` | 
| Maulanal Fatihil A. M          | `5027201031` | 
| Dzaki Indra Cahya              | `5027201053` |

# Konten
* [Sumber Soal dan Resource Praktikum Komunikasi Data dan Jaringan Komputer Modul 2 Tahun 2022](#sumber-soal-dan-resource-praktikum-komunikasi-data-dan-jaringan-komputer-modul-2-tahun-2022)
    * [Sumber Soal](#symber-soal)
    * [Resource Soal Praktikum]()
* [Soal 1](#soal-1)
    * [Jawaban Soal 1](#jawaban-soal-1)
    * [Penyelesaian dan Dokumentasi Soal 1](#penyelesaian-dan-dokumentasi-soal-1)
    * [Kendala Soal 1](#kendala-soal-1)
* [Soal 2](#soal-1)
    * [Jawaban Soal 2](#jawaban-soal-2)
    * [Penyelesaian dan Dokumentasi Soal 2](#penyelesaian-dan-dokumentasi-soal-2)
    * [Kendala Soal 2](#kendala-soal-2)
* [Soal 3](#soal-3)
    * [Jawaban Soal 3](#jawaban-soal-3)
    * [Penyelesaian dan Dokumentasi Soal 3](#penyelesaian-dan-dokumentasi-soal-3)
    * [Kendala Soal 3](#kendala-soal-3)
* [Soal 4](#soal-4)
    * [Jawaban Soal 4](#jawaban-soal-4)
    * [Penyelesaian dan Dokumentasi Soal 4](#penyelesaian-dan-dokumentasi-soal-4)
    * [Kendala Soal 4](#kendala-soal-4)
* [Soal 5](#soal-5)
    * [Jawaban Soal 5](#jawaban-soal-5)
    * [Penyelesaian dan Dokumentasi Soal 5](#penyelesaian-dan-dokumentasi-soal-5)
    * [Kendala Soal 5](#kendala-soal-5)
* [Soal 6](#soal-6)
    * [Jawaban Soal 6](#jawaban-soal-6)
    * [Penyelesaian dan Dokumentasi Soal 6](#penyelesaian-dan-dokumentasi-soal-6)
    * [Kendala Soal 6](#kendala-soal-6)
* [Soal 7](#soal-7)
    * [Jawaban Soal 7](#jawaban-soal-7)
    * [Penyelesaian dan Dokumentasi Soal 7](#penyelesaian-dan-dokumentasi-soal-7)
    * [Kendala Soal 7](#kendala-soal-7)
* [Soal 8](#soal-8)
    * [Jawaban Soal 8](#jawaban-soal-8)
    * [Penyelesaian dan Dokumentasi Soal 8](#penyelesaian-dan-dokumentasi-soal-8)
    * [Kendala Soal 8](#kendala-soal-8)
* [Soal 9](#soal-9)
    * [Jawaban Soal 9](#jawaban-soal-9)
    * [Penyelesaian dan Dokumentasi Soal 9](#penyelesaian-dan-dokumentasi-soal-9)
    * [Kendala Soal 9](#kendala-soal-9)
* [Soal 10](#soal-10)
    * [Jawaban Soal 10](#jawaban-soal-10)
    * [Penyelesaian dan Dokumentasi Soal 10](#penyelesaian-dan-dokumentasi-soal-10)
    * [Kendala Soal 10](#kendala-soal-10)

## Sumber Soal dan Resource Praktikum Komunikasi Data dan Jaringan Komputer Modul 2 Tahun 2022
Adapun untuk soal dan _resource_ yang digunakan dalam praktikum 2
### Symber Soal
Sebagai berikut adalah soal yang digunakan dalam praktikum,
[Sumber Soal](https://docs.google.com/document/d/11Mz2Fd3DKtGkCknHee9VZRdJYvZ3YAMIaifObHEpBFo/edit?usp=sharing)

## Soal 1
WISE akan dijadikan sebagai DNS Master, Berlint akan dijadikan DNS Slave, dan Eden akan digunakan sebagai Web Server. Terdapat 2 Client yaitu SSS, dan Garden. Semua node terhubung pada router Ostania, sehingga dapat mengakses internet 

### Jawaban Soal 1
Bentuk topologi yang digunakan adalah sebagai berikut, <br>
![Topologi](/image/1-1.png)<br>
Lalu dilakukan test untuk mengecek apakah sudah tersambung atau belum
```
ping -c 3 google.com
```

### Penyelesaian dan Dokumentasi Soal 1
1) Dengan setelan _network configuration_ sebagai berikut, <br>
    A.  Ostania<BR>
    ```
    auto eth0
    iface eth0 inet dhcp

    auto eth1
    iface eth1 inet static
	    address 192.216.1.1
	    netmask 255.255.255.0

    auto eth2
    iface eth2 inet static
	    address 192.216.2.1
	    netmask 255.255.255.0

    auto eth3
    iface eth3 inet static
	    address 192.216.3.1
	    netmask 255.255.255.0
    ```
    B.  SSS
    ```
    auto eth0
    iface eth0 inet static
	    address 192.216.1.2
	    netmask 255.255.255.0
	    gateway 192.216.1.1

    ```
    C. Garden
    ```
    auto eth0
    iface eth0 inet static
	    address 192.216.1.3
	    netmask 255.255.255.0
	    gateway 192.216.1.1
    ```
    D. WISE
    ```
    auto eth0
    iface eth0 inet static
	    address 192.216.2.2
	    netmask 255.255.255.0
	    gateway 192.216.2.1
    ```
    E. Berlint
    ```
    auto eth0
    iface eth0 inet static
	    address 192.216.3.2
	    netmask 255.255.255.0
	    gateway 192.216.3.1

    ```
    F. Eden
    ```
    auto eth0
    iface eth0 inet static
	    address 192.216.3.3
	    netmask 255.255.255.0
	    gateway 192.216.3.1

    ```
2) Melakukan perintah IPTABLES berikut pada node Ostania<br>
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.216.0.0/16 
```
3) Mengecek IP DNS dari Ostania melalui perintah sebagai berikut,
```
cat /etc/resolv.conf
```
4) Pada setiap client node selain Ostania, dilakukan perintah untuk mendeklarasikan IP DNS<br>
```
echo "nameserver 192.168.122.1" > /etc/resolv.conf
```
5) Untuk melakukan tes terhadap sambungan jaringan, pada setiap node dapat dicoba dengan perintah
```
ping -c 3 google.com
```
![Uji Coba](/image/1-2.png)<br>

### Kendala Soal 1
Tidak ada

## Soal 2
Untuk mempermudah mendapatkan informasi mengenai misi dari Handler, bantulah Loid membuat website utama dengan akses wise.itb04.com dengan alias www.wise.itbo4y.com pada folder wise.?

### Jawaban Soal 2
Berupa langkah penyelesaian soal

### Penyelesaian dan Dokumentasi Soal 2
1) Memasang paket bind9 pada WISE
```
apt-get install bind9 -y
```
2) Mengubah konten node WISE dari `/etc/bind/named.conf.local` melalui perintah,
```
nano /etc/bind/named.conf.local
```
Lalu dilanjutkan dengan merubah konten menjadi
```
zone "wise.itb04.com" {
	type master;
	file "etc/bind/wise/wise.itb04.com";
};
```
3) Membuat folder `wise` di bind pada node tersebut dengan perintah sebagai berikut,
```
mkdir -p /etc/bind/wise
```
4) Menyalin dokumen db.local ke folder WISE yang telah dibuat,
```
cp /etc/bind/db.local /etc/bind/wise/wise.itb04.com
```
5) Melakukan konfigurasi pada dokumen dengan perintah sebagai berikut,
```
nano /etc/bind/wise/wise.itb04.com
```
Dengan rincian sebagai berikut,
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.itb04.com. root.wise.itb04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      wise.itb04.com.
@       IN      A       192.216.2.2
www     IN      CNAME   wise.itb04.com.
@       IN      AAAA    ::1
```
6) Melakukan penjalanan ulang dari bind9 dengan perintah
```
service bind9 restart
```
7) Menguji pada client apakah sudah terpasang dengan benar
```
echo nameserver 192.216.2.2 > /etc/resolv.conf
```
Lalu dilanjutkan dengan
```
ping wise.itb04.com
```
![Uji Coba](/image/2-21.png)<br>

### Kendala Soal 2
Tidak ada

## Soal 3
Setelah itu ia juga ingin membuat subdomain eden.wise.yyy.com dengan alias www.eden.wise.yyy.com yang diatur DNS-nya di WISE dan mengarah ke Eden di

### Jawaban Soal 3
Berupa langkah penyelesaian soal

### Penyelesaian dan Dokumentasi Soal 3

1) Memasukkan perintah berikut pada _node_ WISE
```
nano /etc/bind/wise/wise.itb04.com
```
dengan setelah sebagai berikut,
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.itb04.com. root.wise.itb04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      wise.itb04.com.
@               IN      A       192.216.2.2
www             IN      CNAME   wise.itb04.com.
@               IN      AAAA    ::1
eden            IN      A       192.216.3.3
www.eden        IN      CNAME   eden.wise.itb04.com.
```
2) Uji coba alamat pada node <br>
```
ping -c 3 eden.wise.itb04.com
```
atau
```
ping -c 3 www.eden.wise.itb04.com
```
![image](/image/3-1.png)<br>

### Kendala Soal 3
Tidak ada

## Soal 4
Buat juga reverse domain untuk domain utama 

### Jawaban Soal 4
Berupa langkah penyelesaian soal

### Penyelesaian dan Dokumentasi Soal 4
1) Mengubah named.conf.local dengan perintah sebagai berikut,
```
nano /etc/bind/named.conf.local
```
Dengan rincian
```
zone "wise.itb04.com" {
        type master;
        file "/etc/bind/wise/wise.itb04.com";
};
zone "2.216.192.in-addr.arpa" {
    type master;
    file "/etc/bind/wise/2.216.192.in-addr.arpa";
};
```
2) Melakukan penyalinan di node WISE dengan perintah sebagai berikut,
```
cp /etc/bind/db.local /etc/bind/wise/2.216.192.in-addr.arpa
```
3) Melakukan perubahan dengan perintah
```
nano /etc/bind/wise/2.216.192.in-addr.arpa
```
dengan rincian
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.itb04.com. root.wise.itb04.com. (
                        	   2 	       ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.216.192.in-addr.arpa. IN      NS      wise.itb04.com.
2                       IN      PTR     wise.itb04.com.
```
4) Melakukan perulangan dari layanan bind9 di WISE
```
service bind9 restart
```
5) Melakukan pemasangan dsnutils di node klien (SSS atau Garden)
```
apt-get install dnsutils -y
```
6) Di node klien, dideklarasikan, 
```
echo nameserver 192.216.2.2 > /etc/resolv.conf
```
7) Di node klien, dilakukan perintah sebagai berikut untuk mengetahui tujuan dari reverse domain
```
host -t PTR 192.216.2.2
```
![image](/image/4-1.png)<br>

### Kendala Soal 4
Tidak ada

## Soal 5
Agar dapat tetap dihubungi jika server WISE bermasalah, buatlah juga Berlint sebagai DNS Slave untuk domain utama.


### Jawaban Soal 5
Berupa langkah penyelesaian soal


### Penyelesaian dan Dokumentasi Soal 5
1) Mengubah named.conf.local di WISE dengan perintah sebagai berikut,
```
nano /etc/bind/named.conf.local
```
Dengan rincian
```
zone "wise.itb04.com" {
	type master;
       notify yes;
       also-notify { 192.216.3.2; };
       allow-transfer { 192.216.3.2; };
	file "/etc/bind/wise/wise.itb04.com";
};

zone "3.216.192.in-addr.arpa"{
       type master;
       file "/etc/bind/wise/3.216.192.in-addr.arpa";
};
```
2) Melakukan perulangan layanan bind9 di WISE
```
service bind9 restart
```
3) Dengan asumsi sudah melakukan pemasangan di node Berlint, dilakukan pengeditan dengan,
```
nano /etc/bind/named.conf.local
```
dengan rincian
```
zone "wise.itb04.com" {
    type slave;
    masters { 192.216.2.2; };
    file "/var/lib/bind/wise.itb04.com";
};
```
4) Melakukan perulangan pada layanan bind9 di Berlint
```
service bind9 restart
```
5) Melakukan penghentian layanan bind9 di WISE
```
service bind9 stop
```
6) Menguji melalui SSS dan Garden
```
echo 'nameserver 192.216.2.2
nameserver 192.216.3.2' > /etc/resolv.conf
```
lalu dilanjutkan dengan,
```
ping -c 3 wise.itb04.com
```

### Kendala Soal 5
Tidak ada

## Soal 6
Filter sehingga wireshark hanya menampilkan paket yang menuju ke lipi.go.id !

### Jawaban Soal 6
Wireshark filter expression ( http.host==lipi.go.id )


### Penyelesaian dan Dokumentasi Soal 6
![image](/image/soal6.jpg)<br>
Penjelasan : <br>
Pada soal nomor 6 ini kita diminta untuk mem-filter wireshark agar menampilkan paket yang menuju ke lipi.go.id . Maka sesuai modul 1 kita bisa menggunakan perintah host untuk menampilkan paket yang menuju ke alamat yang diinginkan. Disini karena alamat yang diperintahkan adalah lipi.go.id, <br>
maka perintah yang digunakan adalah host==lipi.go.id . Kemudian pada bagian depan perintah http untuk mem-filter paket yang berasal/menuju yang menggunakan protokol HTTP. Hasil perintah lengkapnya adalah http.host==lipi.go.id


### Kendala Soal 6
Tidak ada

## Soal 7
Filter sehingga wireshark hanya mengambil paket yang berasal dari ip kalian!

### Jawaban Soal 7
Wireshark filter expression ( ip.src == 192.168.100.32 )


### Penyelesaian dan Dokumentasi Soal 7
![image](/image/soal7.png)<br>
Penjelasan : <br>
Disini kita disuruh memfilter while shark sehingga hanya mengambil paket yang berasal dari ip kita sendiri, disini kami menggunakan wireshark filter expression(ip.src == 192.168.100.32), yang mana disini  ada alamat ip  192.168.100.32 yang berasal dari saya yang dimana di tunjuk dari perintah soal di atas.


### Kendala Soal 7
Tidak ada

## Soal 8
Telusuri aliran paket dalam file .pcap yang diberikan, cari informasi berguna berupa percakapan antara dua mahasiswa terkait tindakan kecurangan pada kegiatan praktikum. Percakapan tersebut dilaporkan menggunakan protokol jaringan dengan tingkat keandalan yang tinggi dalam pertukaran datanya sehingga kalian perlu menerapkan filter dengan protokol yang tersebut.

### Jawaban Soal 8
Wireshark filter expression ( tcp.stream eq 12 || tcp.stream eq 41 || tcp.stream eq 90 )

### Penyelesaian dan Dokumentasi Soal 8
1) Mengunduh _file_ `soal8-10.pcapng` dari tautan resource <br>
2) Membuka program Wireshark untuk menganalisis _file_ yang didapatkan <br>
3) Menelusuri paket yang didapatkan dengan melakukan klik kanan pada salah satu dan memilih "Follow TCP" <br>
![FollowTCP](/image/soal8-a.png) <br>
5) Melakukan pelacakan terhadap hasil terhadap paket yang didapatkan, di sini didapatkan bahwa ada percakapan pada stream 12, 41, dan 90 yang bersifat dua arah<br>
![Stream 12](/image/soal8-b.png)<br>
![Stream 41](/image/soal8-c.png)<br>
![Stream 90](/image/soal8-d.png)<br>

### Kendala Soal 8
Tidak ada

## Soal 9
Terdapat laporan adanya pertukaran file yang dilakukan oleh kedua mahasiswa dalam percakapan yang diperoleh, carilah file yang dimaksud! Untuk memudahkan laporan kepada atasan, beri nama file yang ditemukan dengan format `[nama_kelompok].des3` dan simpan output file dengan nama `flag.txt`.

### Jawaban Soal 9
Wireshark filter expression ( tcp.port == 9002) atau (tcp.stream eq 29)

### Penyelesaian dan Dokumentasi Soal 9
> Clue yang didapatkan dari soal sebelumnya <br>
Sumber dan Clue:
- tcp.stream eq 12: Digunakan tools openssl dengan metode des3 untuk mendecrypt file menggunakan file salt
- tcp.stream eq 12: Password mengunakan karakter dari anime kembar lima menggunakan huruf kecil
- tcp.stream eq 12: File salt akan dikirimkan melalui port 9002
- tcp.stream eq 41: Password tidak selamanya dari hal yang berbeda, merujuk pada karakter kembar lima
- tcp.stream eq 90: Password merupakan yang terlihat sama dengan orang lain, merujuk kembali pada nama karakter kembar lima<br>

1) Dari soal sebelumnya, didapatkan clue-clue sebagaimana yang dipaparkan di atas.
2) Lalu, melacak _file_ salt yang dikirimkan melalui port 9002 dengan mengimplementasikan filter `tcp.port == 9002`<br>
![Filter Port](/image/soal8-e.png)<br>
3) Melanjutkan dengan mengeklik kanan lalu melakukan Follow TCP pada baris pertama dari hasil filter - yang kebetulan juga merupakan `tcp.stream eq 29` <br>
![File Salt](/image/soal8-f.png)<br>
4) Atas arahan soal, _file_ disimpan dalam format des3. Di mana karena akan didecrypt, format ASCII pada isi salt diubah dahulu menjadi raw.<br>
![File DES3](/image/soal8-g.png)<br>
5) Selanjutnya mencari tahu kata sandi atau _password_ dari DES3. Didapatkan bahwa kata sandi merupakan kesamaan karakter dari anime kembar lima. Di sini, kami mencari tahu dahulu apa judul dari anime tersebut dan mendapatkan bahwa judulnya ialah `5-toubun no Hanayome` atau `The Quintessential Quintuplets`. Di sini dicari tahu apa kesamaan dari karakter-karakter yang ada di anime ini. Kami mendapatkan bahwa nama keluarga dari kembar lima ini sama dan menggunakannya sebagai password<br>
Sehingga, kata sandinya adalah `nakano`<br>
![Gotoubun](/image/soal8-h.png)<br>
6) Karena telah mengetahui kata sandinya, kami melakukan decrypt melalui openssl dengan perintah
```
openssl des3 -d -in ITB04.des3 -out flag.txt
```
7) Dengan demikian, _file_ `flag.txt` telah ada dan berisi hasil dari _decrypt_ DES3 sebelumnya<br>
![Gotoubun](/image/soal8-i.jpg)<br>

### Kendala Soal 9
Pada mekanismenya, kami menggunakan Wireshark di Windows lalu mengunggah laporan tersebut ke Google Drive pribadi agar dapat di-decrypt. Sayangnya, anggota kami yang bertugas dalam soal ini terkendala karena Kali Linux yang digunakannya secara tiba-tiba error dan tidak bisa mengakses internet meskipun sudah di-_restart_ berulang kali. Akan tetapi, kendala ini dapat diatasi karena untuk proses _decrypt_ sendiri dapat dilakukan menggunakan Ubuntu dari anggota kami yang lain dengan _file_ DES3 yang sebelumnya sudah diunggah melalui Google Drive pribadi kami.
![Error](/image/error.jpg)<br>

## Soal 10
Temukan password rahasia (flag) dari organisasi bawah tanah yang disebutkan di atas!

### Jawaban Soal 10
JaRkOm2022{8uk4N_CtF_k0k_h3h3h3}

### Penyelesaian dan Dokumentasi Soal 10
1) Melanjutkan langkah dari nomor sebelumnya, dilakukan perintah sebagai berikut untuk menampilkan Flag yang diminta pada soal ini.
```
cat flag.txt
```
![Decrypt](/image/soal8-i.jpg)<br>
### Kendala Soal 10
Tidak ada