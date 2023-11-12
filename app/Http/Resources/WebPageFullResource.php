<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class WebPageFullResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'body' => $this->body,
            'published' => $this->is_published,
            'published_date' => Carbon::parse($this->created_at)->format('d-m-Y'),
            'modified_date' => Carbon::parse($this->updated_at)->format('d-m-Y'),
            'status' => $this->status,
        ];
    }
}
