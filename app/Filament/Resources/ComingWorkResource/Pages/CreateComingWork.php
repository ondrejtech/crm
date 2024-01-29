<?php

namespace App\Filament\Resources\ComingWorkResource\Pages;

use App\Filament\Resources\ComingWorkResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateComingWork extends CreateRecord
{
    protected static string $resource = ComingWorkResource::class;
    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
    protected function getCreatedNotificationTitle(): string
    {
        return 'Attendance has been created';
    }
}
