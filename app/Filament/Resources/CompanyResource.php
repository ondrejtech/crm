<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ComapanyResource\RelationManagers\ContactsRelationManager;
use App\Filament\Resources\CompanyResource\Pages;
use App\Filament\Resources\CompanyResource\RelationManagers;
use App\Filament\Resources\CompanyResource\RelationManagers\ProjectRelationManager;
use App\Filament\Resources\CompanyResource\RelationManagers\ProjectsRelationManager;
use App\Models\Company;
use Filament\Forms;
use Filament\Forms\Components\Actions\Action;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Filament\Forms\Components\TextInput;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use pxlrbt\FilamentExcel\Actions\Tables\ExportAction;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;
use pxlrbt\FilamentExcel\Exports\ExcelExport;
use function Laravel\Prompts\search;
use pxlrbt\FilamentExcel\Columns\Column;

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
                        Forms\Components\Select::make('projects_id')
                            ->label('project')
                            ->relationship('project', 'name')
                            ->preload(),
                        Forms\Components\Select::make('contact_id')
                            ->label('Contact Name')
                            ->relationship('contact','full_name')
                            ->createOptionForm([
                                Forms\Components\Section::make('Founding information')
                                    ->schema([
                                        Forms\Components\TextInput::make('full_name')
                                            ->required()
                                            ->maxLength(255),
                                        Forms\Components\TextInput::make('email')
                                            ->email()
                                            ->required()
                                            ->maxLength(255),
                                    ])->columns(2),
                                Forms\Components\Section::make('Newsletter')
                                    ->schema([
                                        Forms\Components\Toggle::make('newsletter')
                                            ->required(),
                                    ])->columnSpanFull(),
                                Forms\Components\Section::make('Contact info')
                                    ->schema([
                                        Forms\Components\TextInput::make('landline')
                                            ->numeric(),
                                        Forms\Components\TextInput::make('mobile')
                                            ->required()
                                            ->numeric(),
                                        Forms\Components\TextInput::make('next_phone')
                                            ->tel()
                                            ->numeric(),
                                    ])->columns(3),
                                Forms\Components\Section::make('Contact address')
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
                                            ->options([
                                                'Czech republic' => 'Czech republic',
                                                'Slovakia' => 'Slovakia'
                                            ])
                                            ->required()
                                            ->columnSpan(2),
                                    ])->columns(3),
                                Forms\Components\Section::make('User note')
                                    ->schema([
                                        Forms\Components\Textarea::make('note')
                                            ->maxLength(16777215)
                                            ->columnSpanFull(),
                                    ])
                            ])
                            ->columnSpan(2)
                            ->multiple()
                            ->preload()
                            ->searchable(),
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
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('phone')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('email')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('www')
                    ->searchable()
                    ->prefix('www.')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                Tables\Columns\TextColumn::make('IC')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('DIC')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                Tables\Columns\IconColumn::make('subscriber')
                    ->boolean()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                Tables\Columns\IconColumn::make('supplier')
                    ->boolean()
                    ->toggleable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                Tables\Columns\IconColumn::make('competition')
                    ->boolean()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                Tables\Columns\TextColumn::make('address')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                Tables\Columns\TextColumn::make('city')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('zip_code')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                Tables\Columns\TextColumn::make('state')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                Tables\Columns\TextColumn::make('country')
                    ->searchable()
                    ->toggleable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable(),
                Tables\Columns\TextColumn::make('updated_at')
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
                ExportAction::make()
                    ->exports([
                        ExcelExport::make()
                            ->askForFilename()
                            ->askForWriterType()
                            ->fromModel()
                    ])
            ])
            ->actions([
//                Tables\Actions\EditAction::make(),
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    ExportBulkAction::make()
                        ->exports([
                            ExcelExport::make()
                                ->askForFilename()
                                ->askForWriterType()
                                ->fromModel()
                    ])
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
