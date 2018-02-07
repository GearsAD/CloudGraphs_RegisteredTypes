using Base.Test, FactCheck
using CloudGraphs_RegisteredTypes

# Creating a connection
print("[TEST] Connecting to the local CloudGraphs instance (Neo4j and Mongo)...");
configuration = CloudGraphs.CloudGraphConfiguration("localhost", 7474, "neo4j", "neo5j", "localhost", 27017, false, "", "");
cloudGraph = connect(configuration);
println("Success!");

facts("Standard SlamInDb type registration") do
    registerGeneralVariableTypes!(cloudGraph)
end
