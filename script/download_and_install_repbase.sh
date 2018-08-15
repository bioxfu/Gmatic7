username=fengkuang
password=a1lovt
wget -c --user=$username --password=$password https://www.girinst.org/server/RepBase/protected/RepBase23.07.fasta.tar.gz
tar zxf RepBase23.07.fasta.tar.gz 
wget -c --user=$username --password=$password https://www.girinst.org/server/RepBase/protected/repeatmaskerlibraries/RepBaseRepeatMaskerEdition-20170127.tar.gz
tar zxf RepBaseRepeatMaskerEdition-20170127.tar.gz

cp Libraries/RMRBSeqs.embl $HOME/miniconda2/envs/maker/share/RepeatMasker/Libraries
cd $HOME/miniconda2/envs/maker/share/RepeatMasker/
./configure
cd $HOME/miniconda2/envs/maker/bin
ln -s $HOME/miniconda2/envs/maker/share/RepeatMasker/Libraries/ Libraries
