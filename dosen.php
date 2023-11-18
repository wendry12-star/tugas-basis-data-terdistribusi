<?php
$servername = "localhost"; // Ganti dengan nama server database Anda
$username = "root"; // Ganti dengan nama pengguna database Anda
$password = ""; // Ganti dengan kata sandi database Anda
$dbname = "dehasen"; // Ganti dengan nama database Anda

// Buat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Periksa koneksi
if ($conn->connect_error) {
    die("Koneksi Gagal: " . $conn->connect_error);
}

$sql = "SELECT * FROM dosen"; // Tabel mahasiswa

$result = $conn->query($sql);

// Periksa 
if ($result) {
    if ($result->num_rows > 0) {
        echo "<table border='2'>";
        echo 
        "<tr>
        <th> ID DOSEN </th>
        <th> USER ID </th>
        <th> NAMA </th>
        <th> NIDN </th>
        <th> TEMPAT LAHIR </th>
        <th> TANGGAL LAHIR </th>
        <th> EMAIL </th>
        <th> NO HP </th>
        <th> MATA KULIAH </th>
        </tr>";

        // Tampilkan data
        while ($row = $result->fetch_assoc()) {
            echo
             "<tr>
             <td>" . $row["id_dosen"] . "</td>
             <td>" . $row["user_id"] . "</td>
             <td>" . $row["nama"] . "</td>
             <td>" . $row["nidn"] . "</td>
             <td>" . $row["tmpt_lahir"] . "</td>
             <td>" . $row["tgl_lahir"] . "</td>
             <td>" . $row["email"] . "</td>
             <td>" . $row["no_hp"] . "</td>
             <td>" . $row["matkul"] . "</td>
             </tr>";
        }

        echo "</table>";
    } else {
        echo "Tidak ada data dosen.";
    }
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Tutup koneksi
$conn->close();
?>