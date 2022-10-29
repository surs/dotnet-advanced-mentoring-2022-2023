using CartingService.BusinessLayer.Entities;
using CartingService.BusinessLayer.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace CartingService.API.Controllers.V2
{
    [Route("v2/[controller]")]
    public class CartController : Controller
    {
        private readonly ICartingService _cartingService;
        private readonly V1.CartController _cartControllerV1;

        public CartController(ICartingService cartingService, V1.CartController cartControllerV1)
        {
            _cartingService = cartingService;
            _cartControllerV1 = cartControllerV1;
        }

        [HttpGet]
        public IActionResult GetCart(Guid cartKey)
        {
            var result = _cartingService.GetCartItems(cartKey);
            return Ok(result);
        }

        [HttpPost]
        public IActionResult AddItem(Guid cartKey, [FromBody] CartItem item)
        {
            return _cartControllerV1.AddItem(cartKey, item);
        }

        [HttpDelete]
        public IActionResult RemoveItem(Guid cartKey, int itemId)
        {
            return _cartControllerV1.RemoveItem(cartKey, itemId);
        }
    }
}
