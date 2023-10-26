using FluentValidation;
using Cupboard.WebApi.Dtos.Dependent;

namespace Cupboard.WebApi.Configurations.Validators;

public class DependentsDtoValidator : AbstractValidator<DependentRequestDto>
{
    public DependentsDtoValidator()
    {
        RuleFor(dto => dto.Name).NotEmpty().MaximumLength(255);
        RuleFor(dto => dto.DateOfBirth).NotEmpty();
        RuleFor(dto => dto.UserId).NotEmpty().GreaterThan(0);
    }
}
