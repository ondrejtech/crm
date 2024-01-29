<?php

namespace App\Filament\Resources\FileResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CompaniesRelationManager extends RelationManager
{
    protected static string $relationship = 'companies';

    public function form(Form $form): Form
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

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('name')
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
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
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
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
}
