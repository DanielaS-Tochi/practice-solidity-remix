# TESTS MANUALES - Greeting Contract

## PASO A PASO (Remix VM)

### 1. Deploy
- Environment: **Remix VM (Cancun)**
- Constructor: `"¡Hola Daniela & Grok!"`
- Deploy → Copia address

### 2. Test 1: Saludo inicial
- Llama `getSaludo()`
- Resultado esperado: `"¡Hola Daniela & Grok!"`

### 3. Test 2: Cambiar saludo
- Llama `setSaludo("¡Equipo invencible!")`
- Llama `getSaludo()`
- Resultado: `"¡Equipo invencible!"`

### 4. Test 3: Evento
- En "Transaction" → ver logs
- Debe haber `SaludoActualizado("¡Equipo invencible!")`

### 5. Test 4: Revert
- Llama `setSaludo("")`
- Debe fallar con: `"El saludo no puede estar vacio"`

### 6. Test 5: Magia cósmica
- Llama `greetTheUniverse()`
- Llama `getSaludo()`
- Resultado: uno de los 3 mensajes cósmicos

**TODOS PASAN**