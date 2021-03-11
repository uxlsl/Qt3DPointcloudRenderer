import QtQuick 2.15

import Qt3D.Core 2.15
import Qt3D.Render 2.15
import Qt3D.Extras 2.15

import pcl 1.0

REInputEntity {
    id: pointCloudEntity

    property alias pointCloudGeometry : pointCloudGeometry

    property string pointCloudFilePath

    property GeometryRenderer pointcloudMesh: GeometryRenderer {
        geometry: PointcloudGeometry { id: pointCloudGeometry; pointcloud: pointCloudReader.pointcloud }
        primitiveType: GeometryRenderer.Points
    }

    property Material pointCloudMaterial: Material {
        effect: Effect {
            techniques: Technique {
                renderPasses: RenderPass {
                    shaderProgram: ShaderProgram {
                        vertexShaderCode: loadSource("qrc:/shader/pointcloud.vert")
                        fragmentShaderCode: loadSource("qrc:/shader/pointcloud.frag")
                    }
                }
            }
        }
        parameters: Parameter { name: "pointSize"; value: 0.7 }
    }

    Entity {
        PointcloudReader {
            id: pointCloudReader
            filename: pointCloudFilePath
        }

        components: [pointcloudMesh, pointCloudMaterial, pointLayer]
    }
}
