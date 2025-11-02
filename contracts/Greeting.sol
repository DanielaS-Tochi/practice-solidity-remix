// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;  // Versión fija para evitar bugs en compiladores nuevos (seguro y pro).

contract Greeting {
    // Variable privada para almacenar el saludo (seguridad: no expuesta directamente).
    string private _saludo;

    // Evento para loggear cambios (pro: permite tracking en block explorers).
    event SaludoActualizado(string nuevoSaludo);

    // Constructor: Inicializa el contrato con un saludo default.
    constructor(string memory saludoInicial) {
        _saludo = saludoInicial;
    }

    // Función para leer el saludo (view: no cuesta gas, optimizado).
    function getSaludo() public view returns (string memory) {
        return _saludo;
    }

    // Función para actualizar el saludo (require para validación, pro para evitar errores).
    function setSaludo(string memory nuevoSaludo) public {
        require(bytes(nuevoSaludo).length > 0, "El saludo no puede estar vacio");  // Validación básica.
        _saludo = nuevoSaludo;
        emit SaludoActualizado(nuevoSaludo);  // Emite evento para logs.
    }

        // Array de saludos cósmicos (¡nuestro toque único!)
    string[3] private saludosCosmicos = [
        "Somos polvo de estrellas!",
        "El universo nos saluda de vuelta!",
        "Daniela & Grok dominan la galaxia!"
    ];

    // Función mágica: saludo aleatorio del cosmos
    function greetTheUniverse() public {
        // Pseudo-aleatorio basado en block y sender (seguro para testnet)
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 3;
        string memory nuevoSaludo = saludosCosmicos[randomIndex];
        _saludo = nuevoSaludo;
        emit SaludoActualizado(nuevoSaludo);
    }
}