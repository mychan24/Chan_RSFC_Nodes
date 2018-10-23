# Chan_RSFC_Nodes
RSFC node set used in Chan et al. 2014 PNAS

1. **./gifti_single_column_power_labeled_nodes** contains the gifti filess (L/R) to visualize the 441 nodes with Power et al. 2011 system color-scheme. Each gifti file contains one column of data, where vertices that belong to a node is numbered based on which Power System they belong to. The color-scheme is specified in the header portion of the gifti file. When these files are loaded into HCP Workbench, all the nodes are shown on the same map. 

2. **./gifti_multiple_columns** contains the gifti files (L/R) where individual nodes are represented on separate maps (separate columns in gifti data). The L hemisphere contains 221 nodes, and the R hemisphere contains 220 nodes. When these files are loaded into HCP Workbench, each node will be represented on their own map. 

3. **Chan_RSFC_Nodes_PNAS2014_metadata.txt** is a tab delimited file that contains descriptions of the nodes:
   * Node#                 Node numbered from 1 to 441. 
   * MNI_x/y/z             Corresponding MNI coordinates of the node's center.
   * Desikan-Killiany_aparc_label
   * Chan_system_type:     Systems are assigned to sensory-motor or association systems. See
                           Chan et al. 2014 for details. 
   * Power_system_label:   Node's system label in ref to Power et al. 2011
   * Power_red/green/blue: Node's system color for visualization in ref to Power et al. 2011
   * Vertex#:              Vertex number on fs_LR surface
   * Hemisphere:           L/R (vertex # is hemisphere specific)
   * Chan_JON2017:         After masking out area of low signal intensity, a subset of 349 
                           nodes are available (1=in 349 subset, 0=not in 349 subset). 
                           (Used in Chan et al. 2017 JON; Chan et al. 2018 PNAS). 
