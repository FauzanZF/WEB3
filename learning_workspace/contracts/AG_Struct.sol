// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;


contract Structure{
     struct Buku{
        string judul;
        string author;
        uint id;
        bool isReady;
     }

     Buku buku1;
    //menambah buku
     function tambahBuku() public {
        buku1 = Buku('pemrograman Blockchain', "FauzanZF", 1, true);
     }
    //melihat buku
     function lihatBuku() public view returns(string memory, string memory, uint, bool){
        return (buku1.judul , buku1.author , buku1.id , buku1.isReady);
     }


    //langsung isi buku tanpa function tambah buku
     Buku buku2 = Buku("Membuat Dapps" , "Udin" , 2 , false);
    //hanya mereturn judul dan author
     function lihatBukuDua() public view returns(string memory , string memory){
        return (buku2.judul , buku2.author);
     }

}


//menambah dan menampilkan buku menggunakan struct array
contract bukuArray{
    struct Buku{
        string judul;
        string author;
        uint id;
        bool isReady;
    }

    //parameter & array
     Buku[] public buku3;
     //fungsi menambah buku baru dengan 'push'
    //uint tidak perlu memakai memory
     function newBook(string memory judul, string memory author, uint id, bool isReady) public {
        buku3.push(Buku(judul,author,id,isReady));
     }
     //fungsi melihat info buku dengan index
     //kasus ini hanya menampilkan judul dan author
     function infoBuku(uint _index) public view returns (string memory judul , string memory author){
        Buku storage book = buku3[_index];
        return(book.judul , book.author);
     } 
}