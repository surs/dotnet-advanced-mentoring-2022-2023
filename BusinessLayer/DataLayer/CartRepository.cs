using BusinessLayer.Entities;
using BusinessLayer.Interfaces;
using LiteDB;
using Microsoft.Extensions.Configuration;

namespace DataLayer
{
    internal class CartRepository : ICartRepository
    {
        private readonly string _connectionString;

        public CartRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("cartingDb");
        }

        public void CreateCart(int id)
        {
            var cart = new CartAggregate(id);
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartAggregate>("carts");
            cartCollection.Insert(cart);
        }

        public CartAggregate GetCart(int id)
        {
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartAggregate>("carts");
            return cartCollection.Query()
                .Where(cart => cart.Id == id)
                .SingleOrDefault();
        }

        public void UpdateCart(CartAggregate cart)
        {
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartAggregate>("carts");
            cartCollection.Update(cart);
        }
    }
}