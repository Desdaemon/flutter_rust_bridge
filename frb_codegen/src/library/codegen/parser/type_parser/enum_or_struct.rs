use crate::codegen::ir::namespace::NamespacedName;
use crate::codegen::ir::pack::IrStructPool;
use crate::codegen::parser::type_parser::unencodable::SplayedSegment;
use std::collections::{HashMap, HashSet};
use syn::TypePath;

pub(super) trait EnumOrStructParser<Obj> {
    fn parse(
        &self,
        type_path: &TypePath,
        splayed_segments: &[SplayedSegment],
        last_segment: &SplayedSegment,
    ) {
        if let (name, _) = last_segment {
            if let Some(src_object) = self.src_objects().get(*name) {
                todo!();
            }
        }

        Ok(None)
    }

    fn src_objects(&self) -> &HashMap<String, &Obj>;
}

#[derive(Clone, Debug, Default)]
pub(super) struct EnumOrStructParserInfo<Id, Obj> {
    parsing_or_parsed_objects: HashSet<NamespacedName>,
    pub(super) object_pool: HashMap<Id, Obj>,
}
