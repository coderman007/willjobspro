<?php

namespace App\Models;

use App\Notifications\ResetPasswordNotification;
use Illuminate\Contracts\Auth\CanResetPassword;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable implements CanResetPassword
{
    use SoftDeletes, HasApiTokens, HasFactory, Notifiable;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'users';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'email',
        'password',
        'img_url',
        'first_name',
        'last_name',
        'date_of_birth',
        'profession',
        'short_bio',
        'google_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Send a password reset notification to the user.
     *
     * @param  string  $token
     * @return void
     */
    public function sendPasswordResetNotification($token)
    {
        $url = env('STATIC_WEB_URL').'/user/reset-password?token='.$token;
        $this->notify(new ResetPasswordNotification($url));
    }

    /**
     * List all Applied Jobs
     */
    public function applied_jobs()
    {
        return $this->hasMany(JobApplication::class);
    }

    /**
     * List all uploaded Resumes
     */
    public function resumes()
    {
        return $this->hasMany(Resume::class);
    }

    /**
     * List all skills by user
     */
    public function skills()
    {
        return $this->belongsToMany(Skill::class, 'skill_user');
    }
}
