using BusinessLayer.Entities;

namespace BusinessLayer.Interfaces
{
    public interface ICartRepository
    {
        CartAggregate GetCart(int id);
        void UpdateCart(CartAggregate cart);
    }
}
