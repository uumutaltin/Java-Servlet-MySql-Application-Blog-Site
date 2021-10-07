-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 12 Ağu 2021, 23:05:33
-- Sunucu sürümü: 10.4.20-MariaDB
-- PHP Sürümü: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blog_project`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`aid`, `name`, `email`, `password`) VALUES
(1, 'Umut Altın', 'umut@mail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'Admin', 'admin@mail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blog`
--

CREATE TABLE `blog` (
  `bid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `date` datetime NOT NULL,
  `aid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `blog`
--

INSERT INTO `blog` (`bid`, `title`, `description`, `detail`, `date`, `aid`) VALUES
(38, '10.08.2021 - Homework', 'Tasarim Guncellendi', '<p>Baslik, icerik, ve detay kisimleri eklendi. Tasarim guncellendi</p>', '2021-08-10 21:19:37', 1),
(40, 'Filtre Yazıldı', 'Türkçe Harfler (utf-8)', '<p>şşşşşıııığğğğüüüüüü</p>', '2021-08-10 21:24:20', 1),
(41, 'Eclipse Nedir?', 'Java için entegre geliştirme ortamı (IDE)', '<p>Eclipse projeleri Eclipse Vakfı tarafından yönetilmektedir. Eclipse Vakfı kar amacı gütmeyen, üyeleri tarafından desteklenen, Eclipse açık kaynak kodlarını sağlayan ve hem açık kaynak topluluğunu ilerleten hem de tamamlayıcı ürünler ve servislerini içinde barındıran bir kuruluştur. Eclipse IDE ek yazılım bileşenleriyle genişletilebilir. Eclipse bu yazılım bileşenlerine plug-in adını verir. Bazı açık kaynaklı projeler ve şirketler Elipse\'i genişletmiştir. Eclipse ayrıca genel amaçlar için oluşturulacak uygulamalar için taban olarak da kullanılablir. Bu uygulamalar Eclipse Zengin İstemci Platformu(Eclipse Rich Client Platform( Eclipse RCP)) uygulamaları olarak da bilinir.</p>', '2021-08-10 21:25:27', 1),
(44, 'JAVA ile Programlama', 'Nedir Bu Java?', '<p>Java nesne yönelimli bir dildir Java nesne yönelimli bir programlama dilidir. Bir programlama dilinin nesne yönelimli olması, dilin kendi özelliği itibariyle aynı amaca yönelik görevlerin sınıf (class) denilen yapılar içerisinde toplanmasına ve bu prensibe göre kullanımına izin vermesidir. Nesne yönelimli programcılığın bir çok avantajı vardır. Bunlardan en önemlisi, bir projede birbirinden bağımsız olarak tasarlanan sınıf nesneleri kullanılmasıdır. Böylece projeye belli görevlerin eklenmesi veya çıkarılması projenin bütününe dokunmadan mümkün hale gelebilmektedir. 3 Bunu bir örnekle daha kolay kavrayabiliriz: Mesela icq benzeri bir program yazdığımızı düşünelim. Böyle bir projede kullanıcının karşısına gelecek uygulamanın görüntüsü ayrı bir mödül, sisteme kaydolan kullanıcıların kayıt işlerinin yürütülmesi ve veri tabanında saklanması işi ayrı bir mödül, ağ bağlantıları ve ağa giriş çıkış kontrollerinin yürütülmesi de ayrı bir mödül olarak tasarlanmakta ve daha sonra birleştirilmektedir. Bu tasarım sırasında herhangi bir modülde meydana gelen aksama diğer mödülleri etkilemeyecektir. Bundan başka, belli bir görevi üstlenen bir sınıf nesnesi temel alınarak bu göreve yeni eklemeler yapmak (türetme) Java gibi bir nesne yönelimli programlama dili ile oldukça kolaydır.</p>', '2021-08-10 22:52:32', 1),
(56, 'Java 8 Güncelleme 301 (8u301)', 'Sürümde Öne Çıkanlar', '<ul><li><strong>IANA TZ Verisi 2021a</strong>.<br>JDK 8u301 , IANA saat dilimi verilerini içerir 2021a. Daha fazla bilgi için, JRE Yazılımında Saat Dilimi Veri Sürümleri sayfasına bakın.</li><li><strong>Yeni Özellik:</strong> PKCS12 anahtar deposu Oluşturmayı özelleştirme<br>Kullanıcıların PKCS #12 anahtar depolarının oluşturulmasını özelleştirmelerini sağlamak üzere yeni sistem ve güvenlik nitelikleri eklendi. Buna anahtar koruma, sertifika koruma ve MacData algoritmaları ve parametreleri dahildir. Bu niteliklere ilişkin detaylı açıklama ve olası değerler, java.security dosyasının \"PKCS12 Anahtar Deposu Nitelikleri\" bölümünde bulunabilir.<br>Bkz. JDK-8076190</li><li><strong>Kaldırılan Özellikler ve Seçenekler:</strong> 1024-bit Anahtarları Olan Kök Sertifikalar Kaldırıldı<br>Zayıf 1024-bit RSA genel anahtarları olan kök sertifikalar cacerts anahtar deposundan kaldırıldı.<br>Bkz. JDK-8243559</li><li><strong>Kaldırılan Özellikler ve Seçenekler:</strong> Telia Company\'nin Sonera Class2 CA sertifikası kaldırıldı<br>Şu kök sertifika, cacerts güvenilen öğe deposundan kaldırıldı:<br>+ Telia Company<br>+ soneraclass2ca<br>DN: CN=Sonera Class2 CA, O=Sonera, C=FI<br>Bkz. JDK-8225081</li><li><strong>Diğer notlar:</strong> PKCS12 Şifreleme Algoritması Öndeğerleri Yükseltildi<br>PKCS #12 anahtar deposunda kullanılan şifreleme algoritması öndeğerleri güncellendi. Yeni algoritmalar AES-256 ve SHA-256 esaslıdır ve RC2, DESede ve SHA-1 esaslı eski algoritmalardan daha güçlüdür. Detaylı bilgi için java.security dosyasındaki keystore.pkcs12 ile başlayan güvenlik niteliklerine bakın.<br>Uyumluluk için algoritmaları daha eski ve güçsüz algoritmalara döndürecek keystore.pkcs12.legacy adında yeni bir sistem niteliği tanımlanmıştır. Bu nitelik için tanımlı değer yok.</li></ul>', '2021-08-11 13:37:34', 2),
(57, 'Blog Projesi', 'Güncelleme-ckeditör', '<ol><li>CkEditör 5 eklendi</li><li>Düzenle kontrolüne bakılacak</li></ol>', '2021-08-12 21:45:06', 1),
(58, 'Ckeditor', 'Kontrol', '<h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><ul><li>Güzel gözüküyor</li></ul>', '2021-08-12 21:49:19', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact_us`
--

CREATE TABLE `contact_us` (
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`bid`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Tablo için indeksler `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`cid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `blog`
--
ALTER TABLE `blog`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Tablo için AUTO_INCREMENT değeri `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
