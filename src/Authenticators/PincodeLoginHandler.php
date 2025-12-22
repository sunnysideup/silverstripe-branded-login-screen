<?php

declare(strict_types=1);

namespace Sunnysideup\BrandedLoginScreen\Authenticators;

use SilverStripe\Control\Email\Email;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Control\HTTPResponse;
use SilverStripe\Core\Injector\Injector;
use SilverStripe\MFA\Authenticator\LoginHandler;
use SilverStripe\ORM\ValidationResult;
use SilverStripe\Security\Member;
use SilverStripe\Security\MemberAuthenticator\MemberAuthenticator;

class PincodeLoginHandler extends LoginHandler
{
    public const SECURITY_TOKEN = 'security_token';

    private static $allowed_actions = [
        'LoginForm',
        'pincode'
    ];

    public function pincode(HTTPRequest $request): HTTPResponse
    {
        // Handle pincode submission logic here
        return new HTTPResponse('Pincode submitted');
    }
    
    public function doSendPincode($data, PincodeLoginForm $form, HTTPRequest $request): HTTPResponse
    {
        $identifierField = Member::config()->get('unique_identifier_field') ?? 'Email';
        $member = Member::get()
            ->filter([$identifierField => $data['Email'] ?? false])
            ->first();

        if (!$member) {
            // use a dummy member - don't reveal which emails are registered by failing
            $member = Member::create(['Email' => 'dummy@example.com']);
        }

        $member->generatePincode();

        $email = Email::create()
            ->setHTMLTemplate('Sunnysideup\\BrandedLoginScreen\\Email\\PincodeLoginEmail')
            ->setData($member)
            ->setSubject('Your login pincode')
            ->setTo($member->Email);
        if ($member->isInDB()) {
            $email->send();
        }

        $form->sessionMessage('A pincode has been sent to your email address.', ValidationResult::TYPE_GOOD);

        // Duplication to show the message on the default handler as well.
        $copy = Injector::inst()->create(MemberAuthenticator::class)->getLoginHandler('')->loginForm();
        $copy->sessionMessage('A pincode has been sent to your email address.', ValidationResult::TYPE_GOOD);

        return $form->getRequestHandler()->redirectBackToForm();
    }

    public function loginForm(): PincodeLoginForm
    {
        return PincodeLoginForm::create($this, get_class($this->authenticator), 'LoginForm');
    }
}