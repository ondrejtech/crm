<?php

namespace App\Filament\Resources\AttendanceTypeResource\Pages;

use App\Filament\Resources\AttendanceTypeResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateAttendanceType extends CreateRecord
{
    protected static string $resource = AttendanceTypeResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function getCreatedNotificationTitle(): ?string
    {
        return 'Attendance type has been successfully created';
    }
}
