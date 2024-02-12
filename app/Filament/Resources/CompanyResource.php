<?php

namespace App\Filament\Resources;

use App\Filament\Exports\CompanyExporter;
use App\Filament\Resources\ComapanyResource\RelationManagers\ContactsRelationManager;
use App\Filament\Resources\CompanyResource\Pages;
use App\Filament\Resources\CompanyResource\RelationManagers;
use App\Filament\Resources\CompanyResource\RelationManagers\ProjectRelationManager;
use App\Filament\Resources\CompanyResource\RelationManagers\ProjectsRelationManager;
use App\Models\Company;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Actions\ExportAction;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use function Laravel\Prompts\search;

class CompanyResource extends Resource
{
    protected static ?string $model = Company::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Founding information ')
                    ->schema([
                        TextInput::make('name')
                            ->required()
                            ->maxLength(255),
                        TextInput::make('phone')
                            ->required()
                            ->prefix('420'),
                        TextInput::make('email')
                            ->email()
                            ->required()
                            ->maxLength(255),
                        Select::make('projects_id')
                            ->label('project')
                            ->relationship('project', 'name')
                            ->preload(),
                        Select::make('contact_id')
                            ->label('Contact Name')
                            ->relationship('contact','full_name')
                            ->createOptionForm([
                                Section::make('Founding information')
                                    ->schema([
                                        TextInput::make('full_name')
                                            ->required()
                                            ->maxLength(255),
                                        TextInput::make('email')
                                            ->email()
                                            ->required()
                                            ->maxLength(255),
                                    ])->columns(2),
                                Section::make('Newsletter')
                                    ->schema([
                                        Toggle::make('newsletter')
                                            ->required(),
                                    ])->columnSpanFull(),
                                Section::make('Contact info')
                                    ->schema([
                                        TextInput::make('landline')
                                            ->numeric(),
                                        TextInput::make('mobile')
                                            ->required()
                                            ->numeric(),
                                        TextInput::make('next_phone')
                                            ->tel()
                                            ->numeric(),
                                    ])->columns(3),
                                Section::make('Contact address')
                                    ->schema([
                                        TextInput::make('address')
                                            ->required()
                                            ->maxLength(255),
                                        TextInput::make('city')
                                            ->required()
                                            ->maxLength(255),
                                        TextInput::make('zip_code')
                                            ->required()
                                            ->maxLength(255),
                                        TextInput::make('state')
                                            ->required()
                                            ->maxLength(255),
                                        Select::make('country')
                                            ->options([
                                                'Czech republic' => 'Czech republic',
                                                'Slovakia' => 'Slovakia'
                                            ])
                                            ->required()
                                            ->columnSpan(2),
                                    ])->columns(3),
                                Section::make('User note')
                                    ->schema([
                                        Textarea::make('note')
                                            ->maxLength(16777215)
                                            ->columnSpanFull(),
                                    ])
                            ])
                            ->columnSpan(2)
                            ->multiple()
                            ->preload()
                            ->searchable(),
                        TextInput::make('www')
                            ->label('www')
                            ->prefix('https://www.')
                            ->maxLength(255),
                        TextInput::make('IC')
                            ->required()
                            ->numeric(),
                        TextInput::make('DIC')
                            ->maxLength(255),
                    ])->columns(3),
                Section::make('Address')
                    ->schema([
                        TextInput::make('address')
                            ->required()
                            ->maxLength(255),
                        TextInput::make('city')
                            ->required()
                            ->maxLength(255),
                        TextInput::make('zip_code')
                            ->required()
                            ->maxLength(255),
                        TextInput::make('state')
                            ->required()
                            ->maxLength(255),
                        Select::make('country')
                            ->required()
                            ->options([
                                'Czech Republic' => 'Czech republic',
                                'Slovakia' => 'Slovakia'
                            ])->columnSpan(2),
                    ])->columns(3),
                Section::make('User note')
                    ->schema([
                        Textarea::make('note')
                            ->maxLength(16777215)
                    ])
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                TextColumn::make('phone')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                TextColumn::make('email')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                TextColumn::make('www')
                    ->searchable()
                    ->prefix('www.')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                TextColumn::make('IC')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                TextColumn::make('DIC')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                IconColumn::make('subscriber')
                    ->boolean()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                IconColumn::make('supplier')
                    ->boolean()
                    ->toggleable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                IconColumn::make('competition')
                    ->boolean()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                TextColumn::make('address')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                TextColumn::make('city')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                TextColumn::make('zip_code')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                TextColumn::make('state')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                TextColumn::make('country')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                TextColumn::make('updated_at')
                    ->dateTime()
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
            ])
            ->filters([
                Filter::make('created_at')
                    ->form([
                        DatePicker::make('created_from'),
                        DatePicker::make('created_until'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['created_from'],
                                fn (Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                            )
                            ->when(
                                $data['created_until'],
                                fn (Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                            );
                    })->columnSpan(2)->columns(2)
            ])
            ->headerActions([
                ExportAction::make('Export')
                    ->exporter(CompanyExporter::class)
                    ->maxRows(10000)
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
                    Tables\Actions\ExportBulkAction::make('Export')->exporter(CompanyExporter::class)->maxRows(10000)
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            RelationManagers\ContactRelationManager::class,
            ProjectRelationManager::class,
            RelationManagers\TasksRelationManager::class,
            RelationManagers\FilesRelationManager::class,
            RelationManagers\AttendancesRelationManager::class,
            RelationManagers\CategoriesRelationManager::class,
            RelationManagers\UsersRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListCompanies::route('/'),
//            'create' => Pages\CreateCompany::route('/create'),
            'edit' => Pages\EditCompany::route('/{record}/edit'),
        ];
    }
}
