<?php

namespace App\Filament\Resources\AbsenceResource\Pages;

use App\Filament\Resources\AbsenceResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateAbsence extends CreateRecord
{
    protected static string $resource = AbsenceResource::class;
    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
    protected function getCreatedNotificationTitle(): string
    {
        return 'Absence has been created';
    }
}
