using AutoMapper;
using BusinessLayer.Entities;
using BusinessLayer.Interfaces;
using DataLayer.Dtos;
using LiteDB;
using Microsoft.Extensions.Configuration;

namespace DataLayer.Repositories
{
    internal class CartRepository : ICartRepository
    {
        private readonly string _connectionString;
        private readonly IMapper _mapper;

        public CartRepository(IConfiguration config, IMapper mapper)
        {
            _connectionString = config.GetConnectionString("cartingDb");
            _mapper = mapper;
        }

        public CartAggregate CreateCart(int id)
        {            
            var cartDto = new CartDto { Id = id };
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartDto>("carts");
            if (cartCollection.Exists(dto => dto.Id == id))
            {
                cartDto = GetFromCollection(id, cartCollection);
            }
            else
            {
                cartCollection.Insert(cartDto);
            }

            return _mapper.Map<CartAggregate>(cartDto);
        }

        public CartAggregate GetCart(int id)
        {
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartDto>("carts");
            CartDto cart = GetFromCollection(id, cartCollection);
            return _mapper.Map<CartAggregate>(cart);
        }

        

        public void RemoveCart(CartAggregate cart)
        {
            var cartDto = _mapper.Map<CartDto>(cart);
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartDto>("carts");
            cartCollection.Delete(cartDto.Id);
        }

        public void UpdateCart(CartAggregate cart)
        {
            var cartDto = _mapper.Map<CartDto>(cart);
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartDto>("carts");
            cartCollection.Update(cartDto);
        }

        private static CartDto GetFromCollection(int id, ILiteCollection<CartDto> cartCollection)
        {
            return cartCollection.Query()
                            .Where(cart => cart.Id == id)
                            .SingleOrDefault();
        }
    }
}