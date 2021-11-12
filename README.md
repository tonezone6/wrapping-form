# Wrapping form

Using property wrappers for validation, makes the view model layer cleaner and the code more reusable.

```swift
struct Credentials {
    @Email    var email: String?
    @Password var password: String?
}
```

![WrappingForm](simulator.gif)
