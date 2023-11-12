<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'email' => ['email', 'unique:users', 'nullable'],
            'password' => ['string', 'confirmed', 'nullable'],
            'img_url' => ['string', 'nullable', 'required'],
            'first_name' => ['string', 'required'],
            'last_name' => ['string', 'required'],
            'date_of_birth' => ['date', 'nullable'],
            'profession' => ['string', 'required'],
            'short_bio' => ['string', 'max:500', 'required'],
        ];
    }
}
