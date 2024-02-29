<?php

namespace app\Enums;


use Filament\Support\Contracts\HasLabel;

enum OrderStatus: string implements HasLabel
{
    case PENDING = 'Pending';
    case PROCESSING = 'Processing';
    case COMPLETED = 'Completed';
    case DECLINED = 'Declined';

    public function getLabel(): ?string
    {
        return $this->name;
    }
}
