using CartingService.BusinessLayer.Entities;

namespace CartingService.BusinessLayer.Interfaces
{
    public interface ICartRepository
    {
        CartAggregate GetCart(int id);
        void UpdateCart(CartAggregate cart);
        CartAggregate CreateCart(int id);
        void RemoveCart(CartAggregate cart);
    }
}
