use std::borrow::Cow;

use anyhow::bail;
use convert_case::{Case, Casing};

/// If the given string is a Dart keyword, then
/// convert it to PascalCase to avoid issues.
/// If the string is not a keyword, then the original
/// is returned.
pub(crate) fn escape_dart_keywords(input: &str) -> Cow<str> {
    if check_for_keywords(&[&input]).is_err() {
        input.to_case(Case::Pascal).into()
    } else {
        input.into()
    }
}

// the function signature is not covered while the whole body is covered - looks like a bug in coverage tool
// frb-coverage:ignore-start
fn check_for_keywords(v: &[&str]) -> anyhow::Result<()> {
    // frb-coverage:ignore-end
    if let Some(s) = v.iter().find(|s| DART_KEYWORDS.contains(s)) {
        bail!("Api name cannot be a dart keyword: {}", s);
    };
    Ok(())
}

// https://dart.dev/guides/language/language-tour#keywords
static DART_KEYWORDS: phf::Set<&str> = phf::phf_set![
    "abstract",
    "else",
    "import",
    "show",
    "as",
    "enum",
    "in",
    "static",
    "assert",
    "export",
    "interface",
    "super",
    "async",
    "extends",
    "is",
    "switch",
    "await",
    "extension",
    "late",
    "sync",
    "break",
    "external",
    "library",
    "this",
    "case",
    "factory",
    "mixin",
    "throw",
    "catch",
    "false",
    "new",
    "true",
    "class",
    "final",
    "null",
    "try",
    "const",
    "finally",
    "on",
    "typedef",
    "continue",
    "for",
    "operator",
    "var",
    "covariant",
    "Function",
    "part",
    "void",
    "default",
    "get",
    "required",
    "while",
    "deferred",
    "hide",
    "rethrow",
    "with",
    "do",
    "if",
    "return",
    "yield",
    "dynamic",
    "implements",
    "set",
];
