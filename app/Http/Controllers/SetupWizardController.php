<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\AppSetting;
use App\Models\Feature;
use App\Models\Package;
use App\Models\PostDuration;
use App\Models\WebPage;
use App\Utils\Response;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class SetupWizardController extends Controller
{
    use Response;

    /**
     * Handle Image upload
     *
     * @param  Image  $img
     */
    public function upload_image($img)
    {
        $path = public_path('img/uploads');
        $file = $img;
        $fileName = time().'-'.uniqid().'_'.trim($file->getClientOriginalName());
        $img->move($path, $fileName);

        return $fileName;
    }

    /**
     * Handle Step One form submission
     *
     * @param  Request  $request
     * @return $next
     */
    public function handleStepOne(Request $request)
    {
        try {
            if ($request->app_logo) {
                $request->app_logo = $this->upload_image($request->app_logo);
            }

            AppSetting::upsert(
                [
                    ['config_name' => 'app_logo', 'display_name' => __('App Logo'), 'setting_tab' => 'general', 'value' => $request->app_logo],
                    ['app_minimum_ios' => 'app_minimum_android', 'display_name' => __('App. Minimum Version (iOS)'), 'setting_tab' => 'general', 'value' => $request->minIOS],
                    ['app_minimum_android' => 'app_minimum_ios', 'display_name' => __('App. Minimum Version (Android)'), 'setting_tab' => 'general', 'value' => $request->minAndroid],
                ],
                ['config_name'],
                ['display_name', 'value']
            );

            return redirect()->route('wizard.step2');
        } catch (\Throwable $th) {
            return $this->responseError(['msg' => __('There was a problem with saving your app setting, please check and try again.'), 'exception' => $th], 500);
        }
    }

    /**
     * Handle Step Two form submission
     *
     * @param  Request  $request
     * @return $next
     */
    public function handleStepTwo(Request $request)
    {
        try {
            AppSetting::upsert(
                [
                    ['config_name' => 'address', 'display_name' => __('Address'), 'setting_tab' => 'general', 'value' => $request->address],
                    ['config_name' => 'phone', 'display_name' => __('Phone'), 'setting_tab' => 'general', 'value' => $request->phone],
                    ['config_name' => 'email', 'display_name' => __('Email'), 'setting_tab' => 'general', 'value' => $request->contactEmail],
                    ['config_name' => 'footer_title', 'display_name' => __('Footer Text'), 'setting_tab' => 'general', 'value' => ''],
                    ['config_name' => 'app_url_android', 'display_name' => __('App Url (Google Play Store)'), 'setting_tab' => 'general', 'value' => ''],
                    ['config_name' => 'app_url_ios', 'display_name' => __('App Url (Apple App Store)'), 'setting_tab' => 'general', 'value' => ''],
                ],
                ['config_name'],
                ['display_name', 'value'],
            );

            return redirect()->route('wizard.step3');
        } catch (\Throwable $th) {
            return $this->responseError(['msg' => __('There was a problem with saving your app setting, please check and try again.'), 'exception' => $th], 500);
        }
    }

    /**
     * Handle Step Three form submission
     *
     * @param  Request  $request
     * @return $next
     */
    public function handleStepThree(Request $request)
    {
        // try {
            if ($request->profilePic) {
                $request->profilePic = $this->upload_image($request->profilePic);
            }

            $request->password = Hash::make($request->password);

            Admin::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => $request->password,
                'img_url' => $request->profilePic,
            ]);

            return redirect()->route('wizard.step4');
        // } catch (\Throwable $th) {
        //     return $this->responseError(['msg' => __('There was a problem with saving your app setting, please check and try again.'), 'exception' => $th], 500);
        // }
    }

    /**
     * Handle Step Four form submission
     *
     * @param  Request  $request
     * @return $next
     */
    public function handleStepFour(Request $request)
    {
        try {
            $recaptchaActive = ($request->recaptcha == 'on') ? true : false;

            AppSetting::upsert(
                [
                    ['config_name' => 'app_name', 'display_name' => __('Application Name'), 'setting_tab' => 'application', 'value' => $request->appName],
                    ['config_name' => 'recaptcha_active', 'display_name' => __('Active'), 'setting_tab' => 'application', 'value' => $recaptchaActive],
                    ['config_name' => 'recaptcha_site_key', 'display_name' => __('Site Key'), 'setting_tab' => 'application', 'value' => ($request->recaptchaSiteKey) ? $request->recaptchaSiteKey : ''],
                    ['config_name' => 'recaptcha_secret_key', 'display_name' => __('Secret Key'), 'setting_tab' => 'application', 'value' => ($request->recaptchaSecretKey) ? $request->recaptchaSecretKey : ''],
                    ['config_name' => 'website_webhook_url', 'display_name' => __('Website Build Webhook Url'), 'setting_tab' => 'general', 'value' => ($request->webhookUrl) ? $request->webhookUrl : ''],
                ],
                ['config_name'],
                ['display_name', 'value'],
            );

            Feature::updateOrCreate(
                [
                    'config_name' => 'long-post-duration',
                ],
                [
                    'name' => __('Extended Job Post Duration'),
                    'display_only' => false,
                ]
            );

            Package::updateOrCreate(
                [
                    'id' => 1,
                ],
                [
                    'name' => __('Free'),
                    'price' => 0,
                    'subscription_type' => 'annual',
                    'is_active' => true,
                ]
            );

            $currTime = Carbon::now();

            $postDurations = [
                ['name' => __('1 Week'), 'duration' => 10080, 'is_paid' => false, 'created_at' => $currTime, 'updated_at' => $currTime],
                ['name' => __('2 Weeks'), 'duration' => 20160, 'is_paid' => false, 'created_at' => $currTime, 'updated_at' => $currTime],
                ['name' => __('1 Month'), 'duration' => 43800, 'is_paid' => false, 'created_at' => $currTime, 'updated_at' => $currTime],
                ['name' => __('3 Months'), 'duration' => 131400, 'is_paid' => false, 'created_at' => $currTime, 'updated_at' => $currTime],
                ['name' => __('6 Months'), 'duration' => 262800, 'is_paid' => true, 'created_at' => $currTime, 'updated_at' => $currTime],
                ['name' => __('1 Year'), 'duration' => 525600, 'is_paid' => true, 'created_at' => $currTime, 'updated_at' => $currTime],
            ];

            PostDuration::insert($postDurations);

            WebPage::upsert(
                [
                    ['title' => __('Contact us'), 'slug' => 'contact-us', 'body' => 'Here is where your contact page content will go.', 'is_published' => true, 'status' => 'active'],
                    ['title' => __('About us'), 'slug' => 'about-us', 'body' => 'Here is where your about page content will go.', 'is_published' => true, 'status' => 'active'],
                    ['title' => __('Privacy Policy'), 'slug' => 'privacy-policy', 'body' => 'Here is where your privacy policy page content will go.', 'is_published' => true, 'status' => 'active'],
                    ['title' => __('Terms of Conditions'), 'slug' => 'terms-conditions', 'body' => 'Here is where your terms of services page content will go.', 'is_published' => true, 'status' => 'active'],
                ],
                ['slug'],
                ['title', 'body', 'is_published', 'status']
            );

            return redirect('/admin/login');
        } catch (\Throwable $th) {
            return $this->responseError(['msg' => __('There was a problem with saving your app setting, please check and try again.'.$th), 'exception' => $th], 500);
        }
    }
}
