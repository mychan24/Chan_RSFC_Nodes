# Chan 2014 RSFC Nodes
This package contains functional brain area (nodes) of the cerebral cortex generated from functional boundary map of younger adults (Wig et al. 2014; N nodes=441). Functional boundary maps identify locations where resting-state functional correlation (RSFC) patterns exhibit abrupt transitions across the cortical surface. These areal nodes were created by locating the local minima of RSFC transition as putative functional areal centers, and creating disks around the centers as areal nodes (3mm raidus). Details of this node set is fully described in Chan et al. 2014 PNAS. Please cite Chan et al. 2014 when using this node set.

[Chan et al. 2014](http://www.pnas.org/content/111/46/E4997)

<img src="https://github.com/mychan24/Chan_RSFC_Nodes/blob/master/png/Chan2014_RSFC_441Nodes_PowerLabel_wh.png" alt="RSFC 441 nodes" width="509" height="331">

**Files:**
1. **./gifti_single_column_power_labeled_nodes** contains the gifti filess (L/R) to visualize the 441 nodes with Power et al. 2011 system color-scheme. Each gifti file contains one column of data, where vertices that belong to a node is numbered based on which Power System they belong to. The color-scheme is specified in the header portion of the gifti file. When these files are loaded into HCP Workbench, all the nodes are shown on the same map. 

2. **./gifti_multiple_columns** contains the gifti files (L/R) where individual nodes are represented on separate maps (separate columns in gifti data). The L hemisphere contains 221 nodes, and the R hemisphere contains 220 nodes. When these files are loaded into HCP Workbench, each node will be represented on their own map. 

3. **./gifti_single_column_numbered_nodes** contains the gifti files (L/R) where nodes are represented on a single column, labeled by node number. The L hemisphere file contains node 1-221; the R hemisphere file contains node 222-441.

4. **Chan_RSFC_Nodes_PNAS2014_metadata.txt** is a tab delimited file that contains descriptions of the nodes:
   * **NodeID:**                 Node numbered from 1 to 441. 
   * **MNI_x/y/z:**             Corresponding MNI coordinates of the node's center.
   * **Desikan-Killiany_aparc_label**
   * **Chan_system_type:**     Systems are assigned to sensory-motor or association systems. See
                           Chan et al. 2014 for details. 
   * **Power_system_label:**   Node's system label in ref to Power et al. 2011
   * **Power_red/green/blue:** Node's system color for visualization in ref to Power et al. 2011
   * **Vertex:**              Vertex number on fs_LR surface
   * **Hemisphere:**           L/R (vertex # is hemisphere specific)
   * **Chan_JON2017:**         After masking out area of low signal intensity, a subset of 349 
                           nodes are available (1=in 349 subset, 0=not in 349 subset). 
                           (Used in Chan et al. 2017 JON; Chan et al. 2018 PNAS). 

5. **Code:**
   * **./code/Chan2014_NodeGeneration.sh** is a bash wrapper to generate nodset from Wig 2014 boudnary map. 
   * **./code/mask_and_export_minima.m** is a matlab script sourced by `Chan2014_NodeGeneration.sh` to export the minima to a text file. 
   * **./code/medialmask_${hemisphere}_fsmedial.fsLR.func.gii** are FreeSurfer medial walls in GIFTI files provided here for convenience. These can also be extracted from Yeo et al. 2011 17 network parcellation. 

**References:**
* Chan, M. Y., Park, D. C., Savalia, N. K., Petersen, S. E., & Wig, G. S. (2014). Decreased segregation of brain systems across the healthy adult lifespan. PNAS, 111(46). doi: 10.1073/pnas.1415122111
* Wig, G.S., Laumann, T.O., Petersen, S.E. (2014). An approach for parcellating human cortical areas using resting-state correlations. Neuroimage. 93: 276-291. doi: 10.1016/j.neuroimage.2013.07.035.
* Chan, M. Y., Alhazmi, F. H., Park, D. C., Savalia, N. K., & Wig, G. S. (2017). Resting-state network topology differentiates task signals across the adult life span. Journal of Neuroscience 37 (10), 2734-2745. doi: 10.1523/JNEUROSCI.2406-16.2017
