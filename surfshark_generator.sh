  DIR="$HOME/conf_files"

echo "Enter your surfshark's private key"
read pk

download_conf_files(){

if [ -d "$DIR" ]; then
  echo "$DIR exists"
else
echo "Crating $DIR"
  mkdir $DIR
fi
wget -i $PWD/url/urls -P $DIR
}

insert_private_key() {
  cd $DIR
  for i in *; do

  sed -i '/PrivateKey/d' $i

  ex $i <<eof
6 insert
PrivateKey = $pk
.
xit
eof

done
}

rename_files(){
    cd $DIR

for i in *; do

  final_name=$(find "$i"| grep -h -o -P '.{0,7}prod.{0,10}')
    mv $i $final_name.conf
    done
}

echo "Select an option"

select option in generate_wg_config_files update_config_files; do


    case $option in
    "generate_wg_config_files")
        download_conf_files
        insert_private_key
        rename_files
        ;;

    "update_config_files")
        insert_private_key
        ;;

    esac
done