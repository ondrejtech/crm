<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ComingWorkResource\Pages;
use App\Filament\Resources\ComingWorkResource\RelationManagers;
use App\Models\ComingWork;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ComingWorkResource extends Resource
{
    protected static ?string $model = ComingWork::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('subject')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Select::make('project.id')
                    ->label('Parent project')
                    ->relationship('companies', 'name')
                    ->required(),
                Forms\Components\Select::make('task.id')
                    ->label('Parent task')
                    ->relationship('tasks', 'subject'),
                Forms\Components\DatePicker::make('date')
                    ->required(),
                Forms\Components\TextInput::make('from')
                    ->required(),
                Forms\Components\TextInput::make('to')
                    ->required(),
                Forms\Components\Textarea::make('note')
                    ->maxLength(16777215)
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('subject')
                    ->searchable(),
                Tables\Columns\TextColumn::make('date')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('from'),
                Tables\Columns\TextColumn::make('to'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
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
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListComingWorks::route('/'),
            'create' => Pages\CreateComingWork::route('/create'),
            'edit' => Pages\EditComingWork::route('/{record}/edit'),
        ];
    }
}
