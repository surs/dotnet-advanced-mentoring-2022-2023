using System.Collections.Generic;

namespace CartingService.DataLayer.Dtos
{
    internal sealed class CartDto
    {
        public int Id { get; set; }

        public List<CartItemDto> CartItems { get; set; }

        public CartDto()
        {
            CartItems = new List<CartItemDto>();
        }


    }
}
