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
        Schema::create('jobs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('partner_id');
            $table->string('job_title', 200);
            $table->boolean('is_remote');
            $table->unsignedBigInteger('category_id')->nullable();
            $table->string('city')->nullable();
            $table->string('country')->nullable();
            $table->boolean('no_pay_range');
            $table->integer('min_salary_range')->nullable();
            $table->integer('max_salary_range')->nullable();
            $table->unsignedBigInteger('job_type_id')->nullable();
            $table->text('desc', 500);
            $table->unsignedBigInteger('job_active_duration')->nullable();
            $table->boolean('is_published');
            $table->dateTime('expiration_date')->nullable();
            $table->string('status');
            $table->timestamps();

            $table->foreign('partner_id')->references('id')->on('partners')->onDelete('cascade');
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('set null');
            $table->foreign('job_type_id')->references('id')->on('job_types')->onDelete('set null');
            $table->foreign('job_active_duration')->references('id')->on('posts_durations')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jobs');
    }
};
