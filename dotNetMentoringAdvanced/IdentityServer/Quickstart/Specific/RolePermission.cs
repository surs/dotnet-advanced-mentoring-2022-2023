using System.Collections.Generic;

namespace IdentityServer.Quickstart.Specific
{
    public static class RolePermission
    {
        private static Dictionary<Role, Permission[]> _rolePermissions = new Dictionary<Role, Permission[]>
        {
            { Role.Buyer, new Permission[] { Permission.Read } },
            { Role.Manager, new Permission[] { Permission.Read, Permission.Create, Permission.Update, Permission.Delete } },
        };

        public static Permission[] GetPermissions(Role role) => _rolePermissions[role];
    }
}
