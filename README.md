# Wrapping form

### A SwiftUI example of using reactive code with property wrappers.

Using property wrappers for validation, makes the view model layer cleaner and the code more reusable.

```swift
struct LoginForm {
    @Email    var email: String?
    @Password var password: String?
}
```

![WrappingForm](rec.gif)
