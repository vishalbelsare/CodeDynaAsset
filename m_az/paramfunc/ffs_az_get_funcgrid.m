%% Get Functions, and Asset and Shock Grids
function [armt_map, func_map] = ffs_az_get_funcgrid(varargin)
%% Parse Parameter INputs if they exist
params_len = length(varargin);
if params_len > 3
    error('ffs_az_get_funcgrid:Can only have 3 container map parameters');
end

bl_input_override = 0;
if (params_len == 3)
    bl_input_override = varargin{3};
end

%% Defaults
if (bl_input_override)
    % override when called from outside
    [param_map, support_map, ~] = varargin{:};
else
    % default internal run
    [param_map, support_map] = ffs_az_set_default_param();
    support_map('bl_graph_funcgrids') = true;
    support_map('bl_display_funcgrids') = true;
    default_maps = {param_map, support_map};

    % numvarargs is the number of varagin inputted
    [default_maps{1:params_len}] = varargin{:};
    param_map = [param_map; default_maps{1}];
    support_map = [support_map; default_maps{2}];
end
%% Parse Parameters
params_group = values(param_map, {'it_z_n', 'fl_z_mu', 'fl_z_rho', 'fl_z_sig'});
[it_z_n, fl_z_mu, fl_z_rho, fl_z_sig] = params_group{:};

params_group = values(param_map, {'fl_b_bd', 'fl_a_min', 'fl_a_max', 'bl_loglin', 'fl_loglin_threshold', 'it_a_n'});
[fl_b_bd, fl_a_min, fl_a_max, bl_loglin, fl_loglin_threshold, it_a_n] = params_group{:};

params_group = values(param_map, {'fl_crra', 'fl_c_min'});
[fl_crra, fl_c_min] = params_group{:};

params_group = values(param_map, {'fl_r_save', 'fl_r_borr', 'fl_w'});
[fl_r_save, fl_r_borr, fl_w] = params_group{:};

params_group = values(support_map, {'bl_graph_funcgrids', 'bl_display_funcgrids'});
[bl_graph_funcgrids, bl_display_funcgrids] = params_group{:};

%% Asset and Choice Grid
if (bl_loglin)
    % C:\Users\fan\M4Econ\asset\grid\ff_grid_loglin.m
    ar_a = fft_gen_grid_loglin(it_a_n, fl_a_max, fl_a_min, fl_loglin_threshold);
else
    ar_a = linspace(fl_b_bd, fl_a_max, it_a_n);
    ar_a = [0 ar_a];
    ar_a = sort(unique(ar_a));
end

%% Get Shock Grids
[~, mt_z_trans, ar_stationary, ar_z] = ffto_gen_tauchen_jhl(fl_z_mu,fl_z_rho,fl_z_sig,it_z_n);

%% Get Equations
[f_util_log, f_util_crra, f_util_standin, f_inc, f_coh, f_cons] = ffs_az_set_functions(fl_crra, fl_r_save, fl_r_borr, fl_w, fl_c_min);

%% Store
armt_map = containers.Map('KeyType','char', 'ValueType','any');
armt_map('ar_a') = ar_a;
armt_map('mt_z_trans') = mt_z_trans;
armt_map('ar_stationary') = ar_stationary;
armt_map('ar_z') = ar_z;

func_map = containers.Map('KeyType','char', 'ValueType','any');
func_map('f_util_log') = f_util_log;
func_map('f_util_crra') = f_util_crra;
func_map('f_util_standin') = f_util_standin;
func_map('f_inc') = f_inc;
func_map('f_coh') = f_coh;
func_map('f_cons') = f_cons;

%% Display
if (bl_display_funcgrids)

    disp('ar_z');
    disp(size(ar_z));
    disp(ar_z);

    disp('mt_z_trans');
    disp(size(mt_z_trans));
    disp(mt_z_trans);

    param_map_keys = keys(func_map);
    param_map_vals = values(func_map);
    for i = 1:length(func_map)
        st_display = strjoin(['pos =' num2str(i) '; key =' string(param_map_keys{i}) '; val =' func2str(param_map_vals{i})]);
        disp(st_display);
    end
end

end
