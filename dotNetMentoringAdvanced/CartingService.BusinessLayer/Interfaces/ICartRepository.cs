using CartingService.BusinessLayer.Entities;

namespace CartingService.BusinessLayer.Interfaces
{
    public interface ICartRepository
    {
        CartAggregate GetCart(Guid cartKey);
        void UpdateCart(CartAggregate cart);
        CartAggregate CreateCart(Guid cartKey);
        void RemoveCart(CartAggregate cart);
        void RemoveCart(Guid cartKey);
        void UpdateBasketsItems(int itemId, string name, string? description, string? imageUrl, decimal price);
    }
}
