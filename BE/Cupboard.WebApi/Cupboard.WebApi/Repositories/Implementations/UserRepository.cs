using System.Transactions;
using Microsoft.AspNetCore.Identity;
using Cupboard.WebApi.Dtos;
using Cupboard.WebApi.Models;
using Cupboard.WebApi.Repositories.Contracts;

namespace Cupboard.WebApi.Repositories.Implementations;

public class UserRepository : BaseRepository<ApplicationUser>, IUserRepository
{
    private readonly CupboardDbContext _context;
    private readonly UserManager<ApplicationUser> _userManager;
    public UserRepository(CupboardDbContext context, UserManager<ApplicationUser> userManager) : base(context)
    {
        _context = context;
        _userManager = userManager;
    }

    public async Task<IdentityResult> AddUser(RegisterRequetDto request)
    {
        var response = new IdentityResult();

        var user = new ApplicationUser
        {
            UserName = request.Username.ToLower(),
            Email = request.Username,
            FirstName = request.FirstName,
            SecondName = request.SecondName,
            FirstLastName = request.FirstLastName,
            SecondLastName = request.SecondLastName
        };

        var result = await _userManager.CreateAsync(user, request.Password);
        response = result;
        return response;
    }
}
