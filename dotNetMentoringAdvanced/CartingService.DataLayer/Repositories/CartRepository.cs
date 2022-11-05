using AutoMapper;
using CartingService.BusinessLayer.Entities;
using CartingService.BusinessLayer.Interfaces;
using CartingService.DataLayer.Dtos;
using LiteDB;
using Microsoft.Extensions.Configuration;
using System;
using System.Linq;

namespace CartingService.DataLayer.Repositories
{
    internal sealed class CartRepository : ICartRepository
    {
        private readonly string _connectionString;
        private readonly IMapper _mapper;

        public CartRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("cartingDb");
            _mapper = EntitiesMapping.ConfigureAndCreateMapper();
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
            var cartInDb = GetFromCollection(cart.CartKey, cartCollection);
            cartDto.Id = cartInDb.Id;
            cartCollection.Update(cartDto);
        }

        private static CartDto GetFromCollection(Guid cartKey, ILiteCollection<CartDto> cartCollection)
        {
            return cartCollection.Query()
                            .Where(cart => cart.CartKey == cartKey)
                            .SingleOrDefault();
        }

        public void UpdateBasketsItems(int itemId, string name, string description, string imageUrl, decimal price)
        {
            using var db = new LiteDatabase(_connectionString);
            var cartCollection = db.GetCollection<CartDto>("carts");
            var cartsToUpdate = cartCollection.Query().Where(c => c.CartItems.Select(i => i.Item.Id).Any(id => id == itemId)).ToList();
            foreach (var cart in cartsToUpdate)
            {
                foreach(var item in cart.CartItems)
                {
                    if(item.Item.Id == itemId)
                    {
                        item.Item.Name = name;
                        item.Item.Price = price;
                        item.Item.Image.Url = imageUrl;
                    }
                }
            }

            cartCollection.Update(cartsToUpdate);
        }
    }
}