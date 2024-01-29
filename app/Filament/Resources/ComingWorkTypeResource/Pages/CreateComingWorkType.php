<?php

namespace App\Filament\Resources\ComingWorkTypeResource\Pages;

use App\Filament\Resources\ComingWorkTypeResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateComingWorkType extends CreateRecord
{
    protected static string $resource = ComingWorkTypeResource::class;
    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
    protected function getCreatedNotificationTitle(): string
    {
        return 'Attendance has been created';
    }
}
