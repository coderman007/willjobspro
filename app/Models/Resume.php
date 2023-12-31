<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Resume extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'resumes';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'user_id',
        'file_name',
        'doc_type',
        'download_url',
        'is_shared', // Ability to control downloadability (Coming soon)
    ];

    /**
     * Retrieve user information
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
