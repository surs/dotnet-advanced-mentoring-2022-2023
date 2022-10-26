using AutoMapper;
using CartingService.BusinessLayer.Entities;
using CartingService.BusinessLayer.Interfaces;
using CartingService.DataLayer.Dtos;
using LiteDB;
using Microsoft.Extensions.Configuration;
using System;

namespace CartingService.DataLayer.Repositories
{
    internal sealed class CartRepository : ICartRepository
    {
        private readonly string _connectionString;
        private readonly IMapper _mapper;

        public CartRepository(IConfiguration config, IMapper mapper)
        {
            _connectionString = config.GetConnectionString("cartingDb");
            _mapper = mapper;
        }

        public CartAggregate CreateCart(Guid cartKey)
        {
            var cartDto = new CartDto { CartKey = cartKey };
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartDto>("carts");
            if (cartCollection.Exists(dto => dto.CartKey == cartKey))
            {
                cartDto = GetFromCollection(cartKey, cartCollection);
            }
            else
            {
                cartCollection.Insert(cartDto);
            }

            return _mapper.Map<CartAggregate>(cartDto);
        }

        public CartAggregate GetCart(Guid cartKey)
        {
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartDto>("carts");
            CartDto cart = GetFromCollection(cartKey, cartCollection);
            return _mapper.Map<CartAggregate>(cart);
        }

        public void RemoveCart(CartAggregate cart)
        {
            RemoveCart(cart.CartKey);
        }

        public void RemoveCart(Guid cartKey)
        {
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartDto>("carts");
            cartCollection.DeleteMany(x => x.CartKey == cartKey);
        }

        public void UpdateCart(CartAggregate cart)
        {
            var cartDto = _mapper.Map<CartDto>(cart);
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartDto>("carts");
            cartCollection.Update(cartDto);
        }

        private static CartDto GetFromCollection(Guid cartKey, ILiteCollection<CartDto> cartCollection)
        {
            return cartCollection.Query()
                            .Where(cart => cart.CartKey == cartKey)
                            .SingleOrDefault();
        }
    }
}