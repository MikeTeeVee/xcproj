import Foundation

/// This is the element for the resources copy build phase.
final public class PBXResourcesBuildPhase: PBXBuildPhase {

    public override var buildPhase: BuildPhase {
        return .resources
    }

}

// MARK: - PBXResourcesBuildPhase Extension (PlistSerializable)

extension PBXResourcesBuildPhase: PlistSerializable {

    func plistKeyAndValue(proj: PBXProj, reference: String) -> (key: CommentedString, value: PlistValue) {
        var dictionary: [CommentedString: PlistValue] = plistValues(proj: proj, reference: reference)        
        dictionary["isa"] = .string(CommentedString(PBXResourcesBuildPhase.isa))
        return (key: CommentedString(reference, comment: "Resources"), value: .dictionary(dictionary))
    }
}
