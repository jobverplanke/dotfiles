<?php

declare(strict_types=1);

$excludeDirs = [
    'bootstrap/cache',
    'public',
    'resources',
    'storage',
    'tests',
    'vendor',
];

$rules = [
    '@PSR2' => true,
    '@PSR12' => true,
    'array_syntax' => ['syntax' => 'short'],
    'class_attributes_separation' => true,
    'declare_strict_types' => true,
    'no_unused_imports' => true,
    'not_operator_with_successor_space' => true,
    'ordered_imports' => ['sort_algorithm' => 'alpha'],
];

$finder = PhpCsFixer\Finder::create()
    ->in(__DIR__)
    ->exclude($excludeDirs)
    ->name('*.php')
    ->notName('*.blade.php')
    ->ignoreDotFiles(true)
    ->ignoreVCS(true);

return (new PhpCsFixer\Config())
    ->setRiskyAllowed(true)
    ->setRules($rules)
    ->setFinder($finder)
    ->setUsingCache(false);
