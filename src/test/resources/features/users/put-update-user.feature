@actualizar
Feature: Actualizar usuario

  Background:
    * url baseUrl
    * def gen = read('classpath:utils/data-generator.js')
    * def novo = gen.newUsuarioPayload()
    * def novo2 = gen.newUsuarioPayload()
    Given path 'usuarios'
    And request novo
    When method post
    Then status 201
    * def userId = response._id
    * print 'Nuevo usuario creado con _id:', userId

  @positivo
  Scenario: Actualizar nombre de usuario existente
    * def upd = gen.updateUsuarioPayload({ nome: novo.nome, email: novo.email, password: novo.password, administrador: novo.administrador})
    Given path 'usuarios', userId
    And request upd
    When method put
    Then status 200
    And match response.message contains 'Registro alterado com sucesso'

  @negativo
  Scenario: No permitir la actualización
    # 1) Crear Usuario
    Given path 'usuarios'
    And request novo2
    When method post
    Then status 201
    * def userId = response._id
    * print 'Nuevo usuario creado con _id:', userId

    # 2) Actualizar Usuario
    * def upd = gen.updateUsuarioPayload({ nome: novo2.nome, email: novo.email, password: novo2.password, administrador: novo2.administrador})
    Given path 'usuarios', userId
    And request upd
    When method put
    Then status 400
    And match response.message contains 'Este email já está sendo usado'

