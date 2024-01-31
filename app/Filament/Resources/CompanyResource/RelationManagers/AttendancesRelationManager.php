<?php

namespace App\Filament\Resources\CompanyResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class AttendancesRelationManager extends RelationManager
{
    protected static string $relationship = 'attendances';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Founding information')
                    ->schema([
                        Forms\Components\TextInput::make('subject')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\Select::make('project.id')
                            ->label('Parent project')
                            ->relationship('projects', 'name')
                            ->required(),
                        Forms\Components\Select::make('task.id')
                            ->label('Parent task')
                            ->relationship('tasks', 'subject'),
                        Forms\Components\DatePicker::make('date')
                            ->required(),
                        Forms\Components\TimePicker::make('from')
                            ->seconds(false)
                            ->required(),
                        Forms\Components\TimePicker::make('to')
                            ->seconds(false)
                            ->required(),
                    ])->columns(3),
                Forms\Components\Section::make('Solver')
                    ->schema([
                        Forms\Components\Select::make('employee.id')
                            ->label('Solver')
                            ->relationship('employees', 'full_name')
                            ->required(),
                    ]),
                Forms\Components\Section::make('User note')
                    ->schema([
                        Forms\Components\Textarea::make('note')
                            ->maxLength(16777215)
                            ->columnSpanFull(),
                    ])
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('id')
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('subject')
                    ->limit(20)
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('projects.name')
                    ->limit(20)
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('date')
                    ->date()
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('from')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('to')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('employees.full_name')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
