// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract PemungutanSuara {

    struct Pemilih {
        uint bobot; // bobot yang terakumulasi oleh delegasi
        bool sudahMemilih;  // jika true, orang tersebut sudah memilih
        address delegasi; // orang yang didelegasikan
        uint suara;   // indeks proposal yang dipilih
    }

    struct Proposal {
        // Jika bisa membatasi panjangnya menjadi sejumlah byte tertentu,
        // selalu gunakan salah satu dari bytes1 hingga bytes32 karena lebih murah
        bytes32 nama;   // nama singkat (hingga 32 byte)
        uint jumlahSuara; // jumlah suara yang terakumulasi
    }

    address public ketua;

    mapping(address => Pemilih) public pemilih;

    Proposal[] public proposal;

    /** 
     * @dev Membuat pemungutan suara baru untuk memilih salah satu dari 'namaProposal'.
     * @param namaProposal nama dari proposal-proposal
     */
    constructor(bytes32[] memory namaProposal) {
        ketua = msg.sender;
        pemilih[ketua].bobot = 1;

        for (uint i = 0; i < namaProposal.length; i++) {
            // 'Proposal({...})' membuat objek Proposal sementara
            // dan 'proposal.push(...)' menambahkannya ke akhir dari 'proposal'.
            proposal.push(Proposal({
                nama: namaProposal[i],
                jumlahSuara: 0
            }));
        }
    }

    /** 
     * @dev Memberikan 'pemilih' hak untuk memilih pada pemungutan suara ini. Hanya dapat dipanggil oleh 'ketua'.
     * @param pemilih_ alamat dari pemilih
     */
    function beriHakMemilih(address pemilih_) public {
        require(
            msg.sender == ketua,
            "Hanya ketua yang bisa memberikan hak untuk memilih."
        );
        require(
            !pemilih[pemilih_].sudahMemilih,
            "Pemilih ini sudah memilih."
        );
        require(pemilih[pemilih_].bobot == 0);
        pemilih[pemilih_].bobot = 1;
    }

    /**
     * @dev Delegasikan suara Anda kepada pemilih 'kepada'.
     * @param kepada alamat pemilih yang didelegasikan suaranya
     */
    function delegasiSuara(address kepada) public {
        Pemilih storage pengirim = pemilih[msg.sender];
        require(!pengirim.sudahMemilih, "Anda sudah memilih.");
        require(kepada != msg.sender, "Delegasi diri sendiri tidak diizinkan.");

        while (pemilih[kepada].delegasi != address(0)) {
            kepada = pemilih[kepada].delegasi;

            // Jika ditemukan loop dalam delegasi, itu tidak diperbolehkan.
            require(kepada != msg.sender, "Ditemukan loop dalam delegasi.");
        }
        pengirim.sudahMemilih = true;
        pengirim.delegasi = kepada;
        Pemilih storage delegasi_ = pemilih[kepada];
        if (delegasi_.sudahMemilih) {
            // Jika delegasi sudah memilih,
            // tambahkan langsung ke jumlah suara
            proposal[delegasi_.suara].jumlahSuara += pengirim.bobot;
        } else {
            // Jika delegasi belum memilih,
            // tambahkan ke bobotnya.
            delegasi_.bobot += pengirim.bobot;
        }
    }

    /**
     * @dev Berikan suara Anda (termasuk suara yang didelegasikan kepada Anda) kepada proposal 'proposal[proposal].nama'.
     * @param proposal_ indeks proposal dalam array proposal
     */
    function pilih(uint proposal_) public {
        Pemilih storage pengirim = pemilih[msg.sender];
        require(pengirim.bobot != 0, "Tidak memiliki hak untuk memilih");
        require(!pengirim.sudahMemilih, "Sudah memilih.");
        pengirim.sudahMemilih = true;
        pengirim.suara = proposal_;

        // Jika 'proposal_' di luar jangkauan array,
        // ini akan otomatis melempar error dan membatalkan semua perubahan.
        proposal[proposal_].jumlahSuara += pengirim.bobot;
    }

    /** 
     * @dev Menghitung proposal yang menang dengan memperhitungkan semua suara sebelumnya.
     * @return proposalMenang_ indeks proposal yang menang dalam array proposal
     */
    function proposalMenang() public view
            returns (uint proposalMenang_)
    {
        uint jumlahSuaraMenang = 0;
        for (uint p = 0; p < proposal.length; p++) {
            if (proposal[p].jumlahSuara > jumlahSuaraMenang) {
                jumlahSuaraMenang = proposal[p].jumlahSuara;
                proposalMenang_ = p;
            }
        }
    }

    /** 
     * @dev Memanggil fungsi proposalMenang() untuk mendapatkan indeks pemenang yang terdapat dalam array proposal dan kemudian
     * @return namaPemenang_ nama dari pemenang
     */
    function namaPemenang() public view
            returns (bytes32 namaPemenang_)
    {
        namaPemenang_ = proposal[proposalMenang()].nama;
    }
}
