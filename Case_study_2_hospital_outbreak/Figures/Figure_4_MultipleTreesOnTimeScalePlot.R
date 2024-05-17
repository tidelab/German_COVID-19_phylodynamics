### ggtree ###

library(ggtree)
library(ggplot2)
library(gridExtra)
library(treeio)

setwd("/Users/oeversti/SARS-CoV-2/GreenPaper/Dusseldorf_Walker_hospital-outbreak/B1221_DateChange_2020-11-02/Dusseldorf_2024-01-24_s_change_walker_supp")

treeA = read.beast("MCCMedian_XML_BDSKYlambda_Dusseldorf2024-01-24_s_change_vko-34-42_walker_supp.1706799257868.clusterward-D.tree")
treeB = read.beast("MCCMedian_XML_BDSKYlambda_Dusseldorf2024-01-24_s_change_vko-34-42_walker_supp.1706799257868.clustersurveillance.tree")


t1 = ggtree(treeA, mrsd ="2020-12-23" ) + xlim_tree(c(2020.75, 2021.0)) + annotate(geom = "text",label="Ward D", x = 2020.89, y = 19, size = 5, col="gray40")
t2 = ggtree(treeB, mrsd="2020-12-16") + xlim_tree(c(2020.75, 2021.0)) + annotate(geom = "text",label="Surveillance", x = 2020.55, y = 48.5, size = 5, col="gray40")



v = geom_vline(xintercept = c(2020.45), linetype ="dotted", color="white")
l = geom_vline(xintercept = c(2020.8377), linetype="dashed", color="deepskyblue3")
z = geom_vline(xintercept = c(2020.780), linetype="dashed", color="deeppink3")


a = scale_x_continuous(breaks = c(2020.583, 2020.750, 2020.917), labels = c("Aug 2020", "Oct 2020", "Dec 2020"))


grid.arrange(t1+v+l+z+theme(plot.margin = unit(c(0,0,0,0), "cm")), t2+v+l+z+a+theme_tree2(axis.text.x=element_text(size=12.5), plot.margin = unit(c(0,0,0,0), "cm")), ncol = 1)
