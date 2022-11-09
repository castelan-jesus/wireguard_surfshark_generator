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

sed -i "s|PrivateKey =.*|PrivateKey = $pk|g" $i

done
}

rename_files(){
    cd $DIR

for i in *; do

  final_name=$(find "$i"| grep -h -o -P '.{0,7}prod.{0,0}')
    mv $i $final_name.conf
    done
}

compress_conf_files(){
cd $DIR
tar -cvf conf_files.tar -C $PWD *.conf
tar -czf conf_files.tar.gz -C $PWD *.conf
zip conf_files.zip *.conf
}

echo "Select an option"

select option in generate_wg_config_files update_config_files compress_conf_files_tar_zip; do


    case $option in
    "generate_wg_config_files")
        download_conf_files
        insert_private_key
        rename_files
        compress_conf_files
        ;;

    "update_config_files")
        insert_private_key
        ;;

        "compress_conf_files_tar_zip")
        compress_conf_files
        ;;


    esac
done