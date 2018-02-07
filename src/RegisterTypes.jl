using RoME, IncrementalInference, KernelDensityEstimate, Distributions
using CloudGraphs

export registerGeneralVariableTypes!

# register types of interest (Pose2, etc) in CloudGraphs
# you can register new types at any time (Julia is dynamic)
function registerGeneralVariableTypes!(cloudGraph::CloudGraph)
  # Variable node
  CloudGraphs.registerPackedType!(cloudGraph, VariableNodeData, PackedVariableNodeData, encodingConverter=VNDencoder, decodingConverter=VNDdecoder);
  # factor nodes
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{Obsv2}}, PackedFunctionNodeData{PackedObsv2}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{Odo}}, PackedFunctionNodeData{PackedOdo}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{GenericMarginal}}, PackedFunctionNodeData{PackedGenericMarginal}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{Ranged}}, PackedFunctionNodeData{PackedRanged}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  # Pose2
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{PriorPose2}}, PackedFunctionNodeData{PackedPriorPose2}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{Pose2Pose2}}, PackedFunctionNodeData{PackedPose2Pose2}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{Pose2DPoint2DBearingRange{Distributions.Normal,Distributions.Normal}}}, PackedFunctionNodeData{PackedPose2DPoint2DBearingRange}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{Pose2DPoint2DRange}}, FunctionNodeData{Pose2DPoint2DRange}, encodingConverter=passTypeThrough, decodingConverter=passTypeThrough)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{PriorPoint2D}}, PackedFunctionNodeData{PackedPriorPoint2D}, encodingConverter=FNDencode, decodingConverter=FNDdecode)

  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{PriorPoint2DensityNH}}, PackedFunctionNodeData{PackedPriorPoint2DensityNH}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  #acoustic types
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{Pose2DPoint2DRangeDensity}}, PackedFunctionNodeData{PackedPose2DPoint2DRangeDensity}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{Pose2DPoint2DBearingRangeDensity}}, PackedFunctionNodeData{PackedPose2DPoint2DBearingRangeDensity}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  # Pose3 stuff
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{PriorPose3}}, PackedFunctionNodeData{PackedPriorPose3}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{Pose3Pose3}}, PackedFunctionNodeData{PackedPose3Pose3}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{Pose3Pose3NH}}, PackedFunctionNodeData{PackedPose3Pose3NH}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  # partial constraints
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{PartialPriorRollPitchZ}}, PackedFunctionNodeData{PackedPartialPriorRollPitchZ}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{PartialPose3XYYaw}}, PackedFunctionNodeData{PackedPartialPose3XYYaw}, encodingConverter=FNDencode, decodingConverter=FNDdecode)
  CloudGraphs.registerPackedType!(cloudGraph, FunctionNodeData{GenericWrapParam{PartialPose3XYYawNH}}, PackedFunctionNodeData{PackedPartialPose3XYYawNH}, encodingConverter=FNDencode, decodingConverter=FNDdecode)

  nothing
end
