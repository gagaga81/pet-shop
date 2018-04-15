pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // petIdの投入テスト
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(8); //adopt関数は入れた数が返ってくるはず

        uint expected = 8; // 8を入れたら8が返ってくるはず

        // 結果が想定と正しくなかったらエラーメッセージを出す
        Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
    }

    // 8番にきちんと飼い主のアドレスが記録されているかのテスト
    function testGetAdopterAddressByPetId() public {
        address expected = this;

        address adopter = adoption.adopters(8);

        Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
    }

    // 配列の8番目にきちんと入っているかのテスト
    function testGetAdopterAddressByPetIdInArray() public {
        address expected = this;

        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
    }
}