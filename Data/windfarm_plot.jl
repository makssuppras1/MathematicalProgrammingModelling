dy = diff([extrema(yc)...])[1]/30  # adjust offset if needed
scatter(xc, yc, color=:black, xlabel="longitude", ylabel="latitude", legend=false)

for i=1:n+1
    annotate!(xc[i], yc[i]+dy, text(string(i),8))
end

for i=1:n+1
    for j=1:n+1
        for t=1:T
            if value(x[i,j,t]) > 1e-6
                if t==1
                    plot!([xc[i],xc[j]],[yc[i],yc[j]],legend=false, linecolor=:black)
                elseif t==2
                    plot!([xc[i],xc[j]],[yc[i],yc[j]],legend=false, linecolor=:blue)
                else     
                    plot!([xc[i],xc[j]],[yc[i],yc[j]],legend=false, linecolor=:green)
                end
            end
        end
    end
end

display(plot!())