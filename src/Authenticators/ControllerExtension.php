<?php

declare(strict_types=1);

namespace Sunnysideup\BrandedLoginScreen\Authenticators;

use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Core\Extension;
use SilverStripe\Core\Injector\Injector;
use SilverStripe\Security\Security;

/**
 * Class \Sunnysideup\BrandedLoginScreen\Extensions\ControllerExtension
 *
 * @property ContentController|ControllerExtension $owner
 */
class ControllerExtension extends Extension
{
    private static $allowed_actions = [
        'PincodeLoginForm'
    ];

    public function PincodeLoginForm()
    {
        $controller = Injector::inst()->get(Security::class);
        return Injector::inst()->get(PincodeAuthenticator::class)
            ->getLoginHandler($controller->Link('login/pincode'))
            ->loginForm();
    }
}
