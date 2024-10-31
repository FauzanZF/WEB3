// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//mapping string menjadi boolean
//mengirim string blockchain
//mengecek string apakah ada di blockchain ETH

//fungsi notarize utk menginput dokumen lalu mengecek dokumen
//proofFor utk menjadikan return dalam hash 256

contract ProofOfExistence{

    mapping (bytes32 => bool) private proofs;
    //store a prooof of existence in the contract state
    function storeProof(bytes32 proof) private{
        proofs[proof] = true;
    }
    //calculate and store the proof for a document
    function notarize(string memory document) public {
        storeProof(proofFor(document));
    }
    //helper function to get a document's sha256
    function proofFor(string memory document) private pure returns (bytes32){
        return sha256(bytes(document));
    }
    //check if a document has been notarize
    function checkDocument(string memory document) public view returns(bool){
        return proofs[proofFor(document)];
    }
}

//compile
//deploy
//sambungkan ke ganache