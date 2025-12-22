<?php

declare(strict_types=1);

namespace Sunnysideup\BrandedLoginScreen\Authenticators;

use SilverStripe\Control\HTTPRequest;
use SilverStripe\Security\Authenticator;
use SilverStripe\Security\MemberAuthenticator\MemberAuthenticator;

class PincodeAuthenticator extends MemberAuthenticator
{
    public function supportedServices(): int
    {
        return Authenticator::LOGIN;
    }

    public function authenticate(array $data, HTTPRequest $request, &$result = null)
    {
        // Pincode authentication logic would go here
        return null;
    }

    public function getLoginHandler($link)
    {
        return PincodeLoginHandler::create($link, $this);
    }
}