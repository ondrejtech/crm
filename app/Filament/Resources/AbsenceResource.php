<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AbsenceResource\Pages;
use App\Filament\Resources\AbsenceResource\RelationManagers;
use App\Models\Absence;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class AbsenceResource extends Resource
{
    protected static ?string $model = Absence::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?int $navigationSort = 7;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Founding information')
                    ->schema([
                        Forms\Components\Select::make('employee.id')
                            ->label('Employee')
                            ->relationship('employees', 'full_name')
                            ->required(),
                        Forms\Components\Select::make('project_type.id')
                            ->label('Type')
                            ->relationship('absence_types', 'name')
                            ->searchable()
                            ->preload()
                            ->required(),
                    ])->columns(2),
                Forms\Components\Section::make('Start absence')
                    ->schema([
                        Forms\Components\DatePicker::make('start_date')
                            ->required(),
                        Forms\Components\TimePicker::make('start_time')
                            ->seconds(false)
                            ->required(),
                    ])->columns(2),
                Forms\Components\Section::make('Finish absence')
                    ->schema([
                        Forms\Components\DatePicker::make('finish_date')
                            ->required(),
                        Forms\Components\TimePicker::make('finish_time')
                            ->seconds(false)
                            ->required(),
                        Forms\Components\TextInput::make('description')
                            ->maxLength(255)->columnSpanFull(),
                    ])->columns(2),
                Forms\Components\Section::make('User note')
                    ->schema([
                        Forms\Components\Textarea::make('note')
                            ->columnSpanFull(),
                    ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('employees.full_name')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('start_date')
                    ->date()
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('start_time'),
                Tables\Columns\TextColumn::make('finish_date')
                    ->date()
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('finish_time')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\IconColumn::make('all_day')
                    ->boolean()
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('absence_types.name')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('description')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make(),
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            RelationManagers\EmployeesRelationManager::class
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAbsences::route('/'),
//            'create' => Pages\CreateAbsence::route('/create'),
            'edit' => Pages\EditAbsence::route('/{record}/edit'),
        ];
    }
}
