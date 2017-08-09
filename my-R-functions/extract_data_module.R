#' extract data module from fastqc_data.txt
#' 
#' @param fastqc_data fastqc summary results. Usually it is a text file named 'fastqc_data.txt'
#' @param module_name the module title from the fastqc_data.txt. Example module titles 
#' include 'Basic Statistics', 'Per base sequence quality', 'Per sequence GC content' and so on. Module names
#' are case-sensitive.
#' @export
#' @examples 
#' extract_data_module('fastqc_data.txt', 'Per sequence GC content')
#' 

extract_data_module = function(fastqc_data, module_name) {
  f = readLines(fastqc_data)
  start_line = grep(module_name, f)
  end_module_lines = grep('END_MODULE', f)
  end_line = end_module_lines[which(end_module_lines > start_line)[1]]
  module_data = f[(start_line+1):(end_line-1)]
  writeLines(module_data, 'temp.txt')
  read.csv('temp.txt', sep = '\t')
}