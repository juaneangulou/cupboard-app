namespace Cupboard.WebApi.Dtos;

public class AuthResponseDto 
{
    public string Token { get; set; }
    public DateTime Expiration { get; set; }
    public bool IsSuccess { get; set; }
    public string FirstName { get; set; }
    public string SecondName { get; set; } 
    public string FirstLastName { get; set; }
    public string SecondLastName { get; set; }
    public string Email { get; set; }
    public string[] Roles { get; set; }
    public bool IsAdmin { get { return Roles?.Contains("Admin") ?? false; }}
    public string[] Errors { get; set; }
}
