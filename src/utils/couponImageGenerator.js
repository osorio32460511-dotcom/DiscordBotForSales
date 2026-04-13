// Versão sem canvas - só retorna null para não quebrar o bot
module.exports = {
  generateCouponImage: async function(couponData) {
    // Retorna null - o bot vai enviar cupom como texto em vez de imagem
    console.log('Gerando cupom em texto (canvas desativado):', couponData);
    return null;
  }
};
