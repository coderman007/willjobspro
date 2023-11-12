<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('blog_posts', function (Blueprint $table) {
            $table->id();
            $table->string('post_title');
            $table->string('slug')->unique();
            $table->string('featured_image');
            $table->unsignedBigInteger('author_id')->nullable();
            $table->boolean('is_featured');
            $table->boolean('is_published');
            $table->string('excerpt', 200);
            $table->text('body');
            $table->timestamps();

            $table->foreign('author_id')->references('id')->on('admins')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('blog_posts');
    }
};
