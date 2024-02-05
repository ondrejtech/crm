<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CompanyResource\RelationManagers\ProjectsRelationManager;
use App\Filament\Resources\ProjectResource\Pages;
use App\Filament\Resources\ProjectResource\RelationManagers;
use App\Filament\Resources\ProjectResource\RelationManagers\CompanyRelationManager;
use App\Models\Project;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProjectResource extends Resource
{
    protected static ?string $model = Project::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?int $navigationSort = 3;
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Founding information')
                    ->schema([
                        Forms\Components\TextInput::make('name')
                            ->required()
                            ->maxLength(255)
                            ->columnSpanFull(),
                        Forms\Components\Select::make('company_id')
                            ->relationship('company', 'name')
                            ->required()
                            ->createOptionForm([
                                Forms\Components\Section::make('Founding information ')
                                    ->schema([
                                        Forms\Components\TextInput::make('name')
                                            ->required()
                                            ->maxLength(255),
                                        Forms\Components\TextInput::make('phone')
                                            ->required()
                                            ->prefix('420'),
                                        Forms\Components\TextInput::make('email')
                                            ->email()
                                            ->required()
                                            ->maxLength(255),
                                        Forms\Components\TextInput::make('www')
                                            ->label('www')
                                            ->prefix('https://www.')
                                            ->maxLength(255),
                                        Forms\Components\TextInput::make('IC')
                                            ->required()
                                            ->numeric(),
                                        Forms\Components\TextInput::make('DIC')
                                            ->maxLength(255),
                                    ])->columns(3),
                                Forms\Components\Section::make('Address')
                                    ->schema([
                                        Forms\Components\TextInput::make('address')
                                            ->required()
                                            ->maxLength(255),
                                        Forms\Components\TextInput::make('city')
                                            ->required()
                                            ->maxLength(255),
                                        Forms\Components\TextInput::make('zip_code')
                                            ->required()
                                            ->maxLength(255),
                                        Forms\Components\TextInput::make('state')
                                            ->required()
                                            ->maxLength(255),
                                        Forms\Components\Select::make('country')
                                            ->required()
                                            ->options([
                                                'Czech Republic' => 'Czech republic',
                                                'Slovakia' => 'Slovakia'
                                            ])->columnSpan(2),
                                    ])->columns(3),
                                Forms\Components\Section::make('User note')
                                    ->schema([
                                        Forms\Components\Textarea::make('note')
                                            ->maxLength(16777215)
                                    ])
                                    ->columnSpanFull(),
                            ]),
                        Forms\Components\Select::make('contact_id')
                            ->relationship('contact', 'full_name')
                            ->required(),
                        Forms\Components\Select::make('employee_id')
                            ->relationship('employee', 'full_name')
                            ->required(),
                    ])->columns(3),
                Forms\Components\Section::make('Project information')
                    ->schema([
                        Forms\Components\DatePicker::make('start_project')
                            ->required(),
                        Forms\Components\DatePicker::make('planned_project_end')
                            ->required(),
                        Forms\Components\DatePicker::make('end_project'),
                        Forms\Components\Select::make('project_types_id')
                            ->required()
                            ->relationship('project_types','name')
                            ->createOptionForm([
                                Forms\Components\Section::make('Department information')
                                    ->schema([
                                        Forms\Components\TextInput::make('name')
                                            ->maxLength(255)
                                            ->required()
                                            ->columnSpanFull(),
                                    ])
                            ]),
                        Forms\Components\TextInput::make('finish_price')
                            ->maxLength(255),
                        Forms\Components\Select::make('user.id')
                            ->label('User name')
                            ->searchable()
                            ->preload()
                            ->multiple()
                            ->relationship('users','name')
                    ])->columns(3),
                Forms\Components\Section::make('User note')
                    ->schema([
                        Forms\Components\TextInput::make('note')
                            ->maxLength(255),
                    ])->columnSpanFull()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->limit(20)
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('company.name')
                    ->numeric()
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('contact.full_name')
                    ->numeric()
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('project_types.name')
                    ->numeric()
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('start_project')
                    ->date()
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('planned_project_end')
                    ->date()
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('end_project')
                    ->date()
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('finish_price')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('note')
                    ->searchable()
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
            CompanyRelationManager::class,
            RelationManagers\ContactRelationManager::class,
            RelationManagers\TasksRelationManager::class,
            RelationManagers\FilesRelationManager::class,
            RelationManagers\CategoriesRelationManager::class,
            RelationManagers\UsersRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProjects::route('/'),
//            'create' => Pages\CreateProject::route('/create'),
            'edit' => Pages\EditProject::route('/{record}/edit')    ,
        ];
    }
}
