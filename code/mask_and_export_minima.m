% Mask and export vertex number based on minima files
% myc
% Updated: 11/30/2023 
% Original: 6/12/2014

minL = gifti('Wig_NI2014_RSFCBoundaries_32k_fs_LR_extrema_onlyminima_dis8mm_fwhm0_L.func.gii');
minR = gifti('Wig_NI2014_RSFCBoundaries_32k_fs_LR_extrema_onlyminima_dis8mm_fwhm0_R.func.gii');

% Mask out medial wall
maskL= gifti('medialmask_L_fsmedial_32k_fs_LR.func.gii'); 
maskR= gifti('medialmask_R_fsmedial_32k_fs_LR.func.gii'); 

minL.cdata(maskL.cdata~=0)=0;
minR.cdata(maskR.cdata~=0)=0;

% vertex index has to be 0-based for workbench, MATLAB is 1-based.
ml_index = find(minL.cdata)-1; 
mr_index = find(minR.cdata)-1;

dlmwrite('minima_L_vertex_dis8mm_fwhm0.txt', ml_index);
dlmwrite('minima_R_vertex_dis8mm_fwhm0.txt', mr_index);