###### Date 2013 November 15
#### GATK VCF format conversion 

[GATK produces VCF](http://www.broadinstitute.org/gatk/guide/article?id=1268) format version 4.0 and up.

[BWA seem to produce BCF/VCF](http://samtools.sourceforge.net/mpileup.shtml) format that has DP4 value under FILTERINFO column

while VCF v4.0 up has those values under INFO column

DP4 from BWA provides following info [samtools webiste](http://samtools.sourceforge.net/mpileup.shtml))

`Number of 1) forward ref alleles; 2) reverse ref; 3) forward non-ref; 4) reverse non-ref alleles, used in variant calling. Sum can be smaller than DP because low-quality bases are not counted.`

VCF v4.0 up has this represented as [AD under INFO column](http://www.broadinstitute.org/gatk/gatkdocs/org_broadinstitute_sting_gatk_walkers_annotator_DepthPerAlleleBySample.html)

`the AD values (one for each of REF and ALT fields) is the unfiltered count of all reads that carried with them the REF and ALT alleles.`

So i have written a simple ruby script to convert AD value in to DP4, by addting 0 values for other strnd of REF and ALT alleles.



Resulting files are processed using Dan's scring for filtering
That uses bio-gngm and bio-samtools ruby gems.

As they are in line with BWA BCF/VCF format.

