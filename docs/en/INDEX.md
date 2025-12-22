Customization is done in the Login Screen Settings tab of the Site Config settings.

Pincode login can be enabled by adding the following config:
```
SilverStripe\Core\Injector\Injector:
  SilverStripe\Security\Security:
    properties:
      Authenticators:
        pincode: '%$Sunnysideup\BrandedLoginScreen\Authenticators\PincodeAuthenticator'
```