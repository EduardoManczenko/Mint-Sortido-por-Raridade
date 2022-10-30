// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mintSortido{
    mapping(address => NFT[]) nftList;
    mapping(address => uint[]) userNftIdList;
    uint idCount = 0;

    struct NFT{
        uint id;
        string name;
        uint str;
        string raridade;
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, uint(10000))));
    }

    function mint() public{
        uint result = random() % 10000;
        
        if(result <= 8287){
            nftList[msg.sender].push(NFT(idCount, "Ninja Amador", 10, "Comum"));
        }else if(result <= 9323 && result > 8287){
            nftList[msg.sender].push(NFT(idCount, "Ninja Junior", 25, "Raro"));
        }else if(result <= 9841 && result > 9323){
            nftList[msg.sender].push(NFT(idCount, "Ninja Pleno", 50, "Super-Raro"));
        }else if(result <= 9945 && result > 9841){
            nftList[msg.sender].push(NFT(idCount, "Ninja Senior", 75, "Epico"));
        }else if(result <= 9997 && result > 9945){
            nftList[msg.sender].push(NFT(idCount, "Ninja Chefe de projeto", 100, "Lendario"));
        }else if(result <= 10000 && result > 9997){
            nftList[msg.sender].push(NFT(idCount, "Hokage da Empresa", 200, "Super-Lendario"));
        }
        userNftIdList[msg.sender].push(idCount);
        idCount++;
    }

    function nftUserList()external view returns(NFT[] memory){
        return nftList[msg.sender];
    }

    function nftUserIdList()external view returns(uint[] memory){
        return userNftIdList[msg.sender];
    }
}