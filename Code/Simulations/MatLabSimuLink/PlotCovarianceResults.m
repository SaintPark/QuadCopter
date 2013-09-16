


figure('Name','State Covariance Matrix - Black=Propagated, Red=Updated')
for iState=1:length(out_UpdatedStateCovarianceMatrix(:,1,1))
    for jState=1:length(out_UpdatedStateCovarianceMatrix(1,:,1));
        for iTime=1:length(out_Time);
            y1(iTime)=out_PropagatedStateCovarianceMatrix(iState,jState,iTime);
            y2(iTime)=out_UpdatedStateCovarianceMatrix(iState,jState,iTime);
        end
        subplot(length(out_UpdatedStateCovarianceMatrix(:,1,1)),length(out_UpdatedStateCovarianceMatrix(1,:,1)),(iState-1)*length(out_UpdatedStateCovarianceMatrix(1,:,1))+jState);
        hold on;
        plot(out_Time,y1,'k');
        plot(out_Time,y2,'r');
        if(jState==1)
            ylabel(['State ' num2str(iState)]);
        end
        if(iState==length(out_UpdatedStateCovarianceMatrix(:,1,1)))
            xlabel(['State ' num2str(jState)]);
        end
    end
end

figure('Name','Gain Matrix - dx/d(res)')
for iGain=1:length(out_GainMatrix(:,1,1))
    for jGain=1:length(out_GainMatrix(1,:,1));
        for iTime=1:length(out_Time);
            y1(iTime)=out_GainMatrix(iGain,jGain,iTime);
        end
        subplot(length(out_GainMatrix(:,1,1)),length(out_GainMatrix(1,:,1)),(iGain-1)*length(out_GainMatrix(1,:,1))+jGain);
        hold on;
        plot(out_Time,y1,'k');
        if(jGain==1)
            ylabel(['State ' num2str(iGain)]);
        end
        if(iGain==length(out_GainMatrix(:,1,1)))
            xlabel(['Meas. Res. ' num2str(jGain)]);
        end
    end
end

figure('Name','Lin. C Matrix - dy/dx')
for iLinCelement=1:length(out_LinearizedCmatrix(:,1,1))
    for jLinCelement=1:length(out_LinearizedCmatrix(1,:,1));
        for iTime=1:length(out_Time);
            y1(iTime)=out_LinearizedCmatrix(iLinCelement,jLinCelement,iTime);
        end
        subplot(length(out_LinearizedCmatrix(:,1,1)),length(out_LinearizedCmatrix(1,:,1)),(iLinCelement-1)*length(out_LinearizedCmatrix(1,:,1))+jLinCelement);
        hold on;
        plot(out_Time,y1,'k');
        if(jLinCelement==1)
            ylabel(['Output ' num2str(iLinCelement)]);
        end
        if(iLinCelement==length(out_LinearizedCmatrix(:,1,1)))
            xlabel(['State ' num2str(jLinCelement)]);
        end
    end
end

