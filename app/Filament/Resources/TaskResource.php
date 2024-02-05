<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TaskResource\Pages;
use App\Filament\Resources\TaskResource\RelationManagers;
use App\Models\Task;
use Filament\Actions\ActionGroup;
use Filament\Actions\ViewAction;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class TaskResource extends Resource
{
    protected static ?string $model = Task::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?int $navigationSort = 4;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('subject')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Select::make('solver')
                    ->label('Solver')
                    ->required()
                    ->relationship('employees','full_name')
                    ->required(),
                Forms\Components\DatePicker::make('start_task')
                    ->required(),
                Forms\Components\DatePicker::make('end_task')
                    ->required(),
                Forms\Components\Select::make('project.id')
                    ->label('Parent project')
                    ->relationship('projects','name')
                    ->searchable()
                    ->preload(),
                Forms\Components\Select::make('company.id')
                    ->label('Company')
                    ->relationship('companies','name')
                    ->searchable()
                    ->preload(),Forms\Components\Select::make('contact.id')
                    ->label('Contact')
                    ->relationship('contacts','full_name')
                    ->searchable()
                    ->preload()
                    ->required()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('subject')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('employees.full_name')
                    ->label('Solver')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('projects.name')
                    ->label('Parent project')
                    ->searchable()
                    ->sortable()
                    ->limit(20)
                    ->toggleable(),
                Tables\Columns\TextColumn::make('start_task')
                    ->date()
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('end_task')
                    ->date()
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
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
//                Tables\Actions\EditAction::make(),
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make(),
                    Tables\Actions\EditAction::make(),
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
            RelationManagers\CompaniesRelationManager::class,
            RelationManagers\ContactsRelationManager::class,
            RelationManagers\ProjectsRelationManager::class,
            RelationManagers\EmployeesRelationManager::class,
            RelationManagers\FilesRelationManager::class,
            RelationManagers\CategoriesRelationManager::class,
            RelationManagers\UsersRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListTasks::route('/'),
//            'create' => Pages\CreateTask::route('/create'),
            'edit' => Pages\EditTask::route('/{record}/edit'),
        ];
    }
}
