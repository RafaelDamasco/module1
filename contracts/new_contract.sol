// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {
    address immutable criador;
    uint valor;
    mapping (address => uint256) owner_nft;
    mapping (uint256 => address) nft_owner;
    uint id = 0;

    constructor() {
        criador = msg.sender;
    }

    function mint_nft() public returns (uint256) {
        nft_owner[id] = msg.sender;
        ++id;
        return id;
    }

    function setNewValue(uint novoValor) public {
        require(msg.sender == criador);
        valor = novoValor;
    }

    function getValue() public view returns (uint) {
        return valor;
    }

}