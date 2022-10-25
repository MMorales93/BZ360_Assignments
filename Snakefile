rule all: 
	input:
		expand("trimmed/{sample}_trimmed.fastq", sample=config["samples"])
		
rule fastp:
	input:
		sample="samples/{sample}.fastq"
	output:
		trimmed="trimmed/{sample}_trimmed.fastq",
		html="trimmed/{sample}.html"
	shell:
		"fastp -i {input.sample} -o {output.trimmed} -h {output.html}"