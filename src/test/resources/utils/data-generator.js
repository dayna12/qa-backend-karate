// utils/data-generator.js  (IIFE que retorna un objeto)
(function () {

  var uuid = function () { return java.util.UUID.randomUUID() + ''; };
  var hex = function (n) { var raw = uuid().replace(/-/g, ''); return raw.substring(0, n); };

  var randomEmail = function () { return 'qa_' + hex(8).toLowerCase() + '@tester.com'; };
  var randomName = function () { return 'QA User ' + hex(6); };
  var randomPassword = function () { return hex(12); };

  var newUsuarioPayload = function (overrides) {
    var base = {
      nome: randomName(),
      email: randomEmail(),
      password: randomPassword(),
      administrador: 'true'
    };
    if (overrides) { Object.assign(base, overrides); }
    return base;
  };

  var updateUsuarioPayload = function (usuario) {
    var copy = Object.assign({}, usuario);
    copy.nome = copy.nome + ' Updated';
    return copy;
  };

  return {
    uuid: uuid,
    randomEmail: randomEmail,
    randomName: randomName,
    randomPassword: randomPassword,
    newUsuarioPayload: newUsuarioPayload,
    updateUsuarioPayload: updateUsuarioPayload
  };

})()
