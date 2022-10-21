nextflow.enable.dsl=2

include { test_python_1 } from './modules/test_python_1/module.nf'
include { test_python_2 } from './modules/test_python_2/module.nf'
include { twas_vcf_1 } from './modules/twas_vcf_1/module.nf'

workflow {
input1 = Channel.fromPath(params.test_python_1.accessions).splitCsv()
input2 = Channel.fromPath(params.test_python_2.accessions).splitCsv()
input3 = Channel.fromPath(params.twas_vcf_1.ch_gene_annotations)
input4 = Channel.fromPath(params.twas_vcf_1.ch_codon_file)
input5 = Channel.fromPath(params.twas_vcf_1.ch_priority_file)
input6 = Channel.fromPath(params.twas_vcf_1.ch_ref_fasta)
input7 = Channel.fromPath(params.twas_vcf_1.ch_ref_fasta_index)
input8 = Channel.fromPath(params.twas_vcf_1.ch_ld_reference)
input9 = Channel.fromPath(params.twas_vcf_1.ch_eqtl_weights)
input10 = Channel.fromPath(params.twas_vcf_1.ch_gwas_sumstats)
test_python_1(input1)
test_python_2(input2)
twas_vcf_1(input3, input4, input5, input6, input7, input8, input9, input10)
}
