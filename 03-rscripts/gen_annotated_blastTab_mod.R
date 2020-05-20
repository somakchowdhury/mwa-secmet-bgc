# Rscript written to parse blast outputs and create new columns
suppressMessages(library(tidyverse))
suppressMessages(library(optparse))
#Arguments and flags for the script
option_list <- list ( make_option (c("-t","--tabblast"),default="filename.txt", 
                                   help="Tab separated blast output from output format 6 (default %default)"),
                      make_option(c("-o", "--output"), default = "output_file.txt",
                                  help = "Output table with cleaned columns and headers"),
                      make_option(c("-p", "--plot"), default = "plot.pdf",
                                  help = "Output plot of aa len and percent ID")
)
parser <-OptionParser(option_list=option_list)
arguments <- parse_args (parser, positional_arguments=TRUE)
opt <- arguments$options
args <- arguments$args

#Script starts below
dat = read.delim(file = opt$tabblast,header = FALSE,check.names=F) %>%
  {colnames(.)[1] = "query"; .} %>%
  {colnames(.)[2] = "subject"; .} %>%
  {colnames(.)[3] = "PID"; .} %>%
  {colnames(.)[4] = "alignment_len"; .} %>%
  {colnames(.)[5] = "mismatches"; .} %>%
  {colnames(.)[6] = "gap"; .} %>%
  {colnames(.)[7] = "q_start"; .} %>%
  {colnames(.)[8] = "q_end"; .} %>%
  {colnames(.)[9] = "s_start"; .} %>%
  {colnames(.)[10] = "s_end"; .} %>%
  {colnames(.)[11] = "e_value"; .} %>%
  {colnames(.)[12] = "bit_score"; .} %>%
  separate(., 'query', paste("query", 1:3, sep="/t"), sep="_", extra="drop") %>%
  separate(., 'subject', paste("subject", 1:3, sep="/t"), sep="_", extra="drop") %>%
  {colnames(.)[1] = "Query_mod"; .} %>%
  {colnames(.)[2] = "Query_bgc"; .} %>%
  {colnames(.)[3] = "Query_frag"; .} %>%
  {colnames(.)[4] = "Sub_mod"; .} %>%
  {colnames(.)[5] = "Sub_bgc"; .} %>%
  {colnames(.)[6] = "Sub_frag"; .} %>%
  filter(Query_frag == Sub_frag)
write.table(dat, file=opt$output, sep = "\t",row.names = FALSE)
plot <- ggplot(data = dat,aes(x= as.numeric(Query_frag),y= PID))+
  geom_line()+
  scale_x_continuous(breaks=seq(0,1500,100))+
  #scale_y_continuous(breaks=seq(0,100,10))+
  ylab("% protein identity")+
  xlab("AA position")+
  ggtitle(paste("Plot for", dat$Query_mod, "_",dat$Query_bgc, "v", dat$Sub_mod,"_",dat$Sub_bgc))+
  theme_classic()
ggsave(opt$plot , plot = plot ,scale = 1, width = 20, height = 10, units = c("cm"), dpi=600)