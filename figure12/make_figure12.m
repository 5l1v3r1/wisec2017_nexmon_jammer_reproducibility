function make_figure12()
    % We saved the results of the pcap file analyses as the calculations
    % take quite some time. To recalculate the results, just delete the
    % ../data/experiment_12_precalculated_results.mat file
    if exist('../data/experiment_12_precalculated_results.mat','file')
        load('../data/experiment_12_precalculated_results.mat');
    else
        load('../data/correct_frame_67_end_minus_4.mat');

        exp_filenames = { ...
            '../data/experiment12.000/S/capture.pcap', ...
            '../data/experiment12.001/S/capture.pcap', ...
            '../data/experiment12.002/S/capture.pcap', ...
            '../data/experiment12.003/S/capture.pcap', ...
            '../data/experiment12.004/S/capture.pcap', ...
            '../data/experiment12.005/S/capture.pcap', ...
            '../data/experiment12.006/S/capture.pcap', ...
            '../data/experiment12.007/S/capture.pcap', ...
            '../data/experiment12.008/S/capture.pcap', ...
            '../data/experiment12.010/S/capture.pcap', ...
            '../data/experiment12.011/S/capture.pcap', ...
            '../data/experiment12.012/S/capture.pcap', ...
            '../data/experiment12.013/S/capture.pcap', ...
        };

        exp_desc = { ...
            '2 nodes, no jam.', ...         % 1
            '2 nodes, rea. jam.', ...       % 2
            '2 nodes, ack. jam.', ...       % 3
            '2 nodes, ada. jam.', ...       % 4
            'node 1, no jam.', ...          % 5
            'node 2, no jam.', ...          % 6
            'node 1, rea. jam.', ...        % 7
            'node 1, ack. jam.', ...        % 8
            'node 1, ada. jam.', ...        % 9
            '1 node, 2 st., no jam.', ...   % 10
            '1 node, 2 st., rea. jam.', ... % 11
            '1 node, 2 st., ack. jam.', ... % 12
            '1 node, 2 st., ada. jam.', ... % 13
        };

        max_num_frames = 120000;
        num_exp = length(exp_filenames);

        length_ok = zeros(num_exp,max_num_frames);
        length_not_ok = zeros(num_exp,max_num_frames);
        header_ok = zeros(num_exp,max_num_frames);
        header_not_ok = zeros(num_exp,max_num_frames);
        fcs3939_ok = zeros(num_exp,max_num_frames);
        fcs3939_not_ok = zeros(num_exp,max_num_frames);
        fcs4040_ok = zeros(num_exp,max_num_frames);
        fcs4040_not_ok = zeros(num_exp,max_num_frames);
        fcsxxxx_ok = zeros(num_exp,max_num_frames);
        fcsxxxx_not_ok = zeros(num_exp,max_num_frames);
        start_time_s = zeros(num_exp,max_num_frames);
        stop_time_s = zeros(num_exp,max_num_frames);
        start_time_us = zeros(num_exp,max_num_frames);
        stop_time_us = zeros(num_exp,max_num_frames);

        tic
        for iexp = 1:num_exp
            fprintf('exp: %f\n', iexp);
            p = readpcap();
            p.open(exp_filenames{iexp});
            f = p.next();
            iframe = 0;
            while(~isempty(f))
                if (mod(iframe,10000)==0)
                    fprintf('iframe: %f time: %f\n', iframe, toc);
                end
                iframe = iframe + 1;

                if (sum(header_ok(iexp,:),2) == 50000)
                    break
                end

                if ((f.header.orig_len == 1580))
                    length_ok(iexp,iframe) = 1;

                    if (isequal(f.payload(67:96), correct_frame(1:30)))
                        stop_time_s(iexp,iframe) = f.header.ts_sec;
                        stop_time_us(iexp,iframe) = f.header.ts_usec;

                        %dec2hex(f.payload(67:102))
                        %dec2hex(f.payload([97 98]))
                        header_ok(iexp,iframe) = 1;
                        % frame has correct length and correct udp header
                        if (isequal(f.payload(99:end-4), correct_frame(33:end)))
                            if (isequal(f.payload([97 98]),[15 200]'))
                                fcs4040_ok(iexp,iframe) = 1;
                            elseif (isequal(f.payload([97 98]),[15 99]'))
                                fcs3939_ok(iexp,iframe) = 1;
                            else
                                fcsxxxx_ok(iexp,iframe) = 1;
                            end
                        else
                            if (isequal(f.payload([97 98]),[15 200]'))
                                fcs4040_not_ok(iexp,iframe) = 1;
                            elseif (isequal(f.payload([97 98]),[15 99]'))
                                fcs3939_not_ok(iexp,iframe) = 1;
                            else
                                fcsxxxx_not_ok(iexp,iframe) = 1;
                            end
                        end
                    else
                        header_not_ok(iexp,iframe) = 1;
                    end
                else
                    length_not_ok(iexp,iframe) = 1;
                end
                f = p.next();
            end
        end
    end

    %%
    merged = [ sum(header_not_ok,2) sum(fcs3939_not_ok,2) sum(fcs3939_ok,2) sum(fcs4040_not_ok,2) sum(fcs4040_ok,2) ];

    %%
    for iexp = 1:num_exp
        time_selector = stop_time_s(iexp,:) > 0;
        % times when packets with correct header were received
        rx_time{iexp} = ...
            stop_time_s(iexp,time_selector) - ...
            min(stop_time_s(iexp,time_selector)) + ...
            stop_time_us(iexp,time_selector)/1e6;

        % separate if fcs was correct or incorrect at the selected times
        fcs3939_ok_struct{iexp} = fcs3939_ok(iexp,time_selector);
        fcs3939_not_ok_struct{iexp} = fcs3939_not_ok(iexp,time_selector);
        fcs4040_ok_struct{iexp} = fcs4040_ok(iexp,time_selector);
        fcs4040_not_ok_struct{iexp} = fcs4040_not_ok(iexp,time_selector);

        % split those times in intervals
        for int = 1:70
            rx_time_int{iexp,int} = (rx_time{iexp} > int) & (rx_time{iexp} <= int+1);
            fcs3939_ok_mbps(iexp,int) = sum(fcs3939_ok_struct{iexp}(rx_time_int{iexp,int}))*1480*8;
            fcs3939_not_ok_mbps(iexp,int) = sum(fcs3939_not_ok_struct{iexp}(rx_time_int{iexp,int}))*1480*8;
            fcs4040_ok_mbps(iexp,int) = sum(fcs4040_ok_struct{iexp}(rx_time_int{iexp,int}))*1480*8;
            fcs4040_not_ok_mbps(iexp,int) = sum(fcs4040_not_ok_struct{iexp}(rx_time_int{iexp,int}))*1480*8;
        end
        intlen = 30;
        rx_time_int_x{iexp} = (rx_time{iexp} > 1) & (rx_time{iexp} <= 1 + intlen);
        fcs3939_ok_mbps_x(iexp) = sum(fcs3939_ok_struct{iexp}(rx_time_int_x{iexp}))*1480*8/intlen;
        fcs3939_not_ok_mbps_x(iexp) = sum(fcs3939_not_ok_struct{iexp}(rx_time_int_x{iexp}))*1480*8/intlen;
        fcs4040_ok_mbps_x(iexp) = sum(fcs4040_ok_struct{iexp}(rx_time_int_x{iexp}))*1480*8/intlen;
        fcs4040_not_ok_mbps_x(iexp) = sum(fcs4040_not_ok_struct{iexp}(rx_time_int_x{iexp}))*1480*8/intlen;
    end

    merged_mbps_x = [ ...
        fcs3939_not_ok_mbps_x; ...
        fcs3939_ok_mbps_x; ...
        fcs4040_not_ok_mbps_x; ...
        fcs4040_ok_mbps_x; ...
    ]';

    figure(12)
    used_exp = [13 12 11 10];
    h = barh(merged_mbps_x(used_exp,:)/1e6,4,'stacked','LineWidth',0.001);
    set(gca,'YTick',[1 2 3 4])
    set(gca,'YTickLabel',{'Adaptive Power Control J.', 'Acknowledging Jammer','Reactive Jammer','no Jammer'})
    legend({'FCS 3939 incorrect', 'FCS 3939 correct', 'FCS 4040 incorrect', 'FCS 4040 correct'})
    ylim([0.5 4.5])
    xlabel('UDP throughput [Mbps]')
    grid on

    matlab2tikz('output/experiment_12b.tex',...
        'width','\figurewidth',...
        'height','\figureheight',...
        'extraAxisOptions','clip mode=individual,legend columns=2,legend style={at={(.5,1.05)},anchor=south,draw=black,fill=white,legend cell align=left}',...
        'extraTikzpictureOptions','font=\footnotesize',...
        'checkForUpdates',false,'showInfo',false);
    
    h(1).BarWidth = .5;

    sum(merged_mbps_x(used_exp,:)/1e6,2)
end