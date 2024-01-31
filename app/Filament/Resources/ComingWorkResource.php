<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ComingWorkResource\Pages;
use App\Filament\Resources\ComingWorkResource\RelationManagers;
use App\Filament\Resources\ComingWorkResoureResource\RelationManagers\UsersRelationManager;
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
    protected static ?string $navigationLabel = 'Attendance';
    protected static ?int $navigationSort = 6;
    protected static ?string $modelLabel = 'Attendance';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Founding information')
                    ->schema([
                        Forms\Components\TextInput::make('subject')
                            ->required()
                            ->maxLength(255)
                            ->columnSpan(2),
                        Forms\Components\Select::make('coming_work_type.name')
                            ->label('Type')
                            ->relationship('types','name')
                            ->searchable()
                            ->preload()
                            ->required(),
                        Forms\Components\Select::make('project.id')
                            ->label('Parent project')
                            ->relationship('projects', 'name')
                            ->required(),
                        Forms\Components\Select::make('company.id')
                            ->label('Parent Company')
                            ->relationship('companies','name')
                            ->searchable()
                            ->preload(),
                        Forms\Components\Select::make('task.id')
                            ->label('Parent task')
                            ->relationship('tasks', 'subject')
                            ->searchable()
                            ->preload(),
                        Forms\Components\DatePicker::make('date')
                            ->required(),
                        Forms\Components\TimePicker::make('from')
                            ->seconds(false)
                            ->required(),
                        Forms\Components\TimePicker::make('to')
                            ->seconds(false)
                            ->required(),
                    ])->columns(3),
                Forms\Components\Section::make('Employee')
                    ->schema([
                        Forms\Components\Select::make('employee.id')
                            ->label('Employee')
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

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
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
            RelationManagers\CompaniesRelationManager::class,
            RelationManagers\EmployeesRelationManager::class,
            RelationManagers\ProjectsRelationManager::class,
            RelationManagers\FilesRelationManager::class,
            RelationManagers\CategoriesRelationManager::class,
            UsersRelationManager::class
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListComingWorks::route('/'),
//            'create' => Pages\CreateComingWork::route('/create'),
            'edit' => Pages\EditComingWork::route('/{record}/edit'),
        ];
    }
}
