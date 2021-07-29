mapname="bagfile_sick"
while getopts "n:" flag
do
    case "${flag}" in
        n ) mapname=${OPTARG} ;
    esac
done
#cp ${HOME}/maps/bagfile_sick.bag.pbstream ${HOME}/maps/bagfile_sick.bag.pbstream.bak
echo "mapname: ${mapname}"
rosservice call /finish_trajectory 0
rosservice call /write_state "{filename: '${HOME}/maps/${mapname}.bag.pbstream', include_unfinished_submaps: "true"}"
#roslaunch cartographer_ros assets_writer_ros_map.launch bag_filenames:=/home/luna/ws/bagfile.bag pose_graph_filename:=/home/luna/bagfile.bag.pbstream


