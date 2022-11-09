source $PWD/path

if [ -d "$DIR" ]; then
  echo "$DIR exists"
else
  echo "$DIR now created"
  mkdir -p $DIR
fi


	if [ "$(ls -A "$DIR")" ]; then
     echo "$DIR is populated with the following files:"
     ls $DIR
	else
    echo "$DIR is empty. Your .conf files will be downloaded here or if you already have your .conf files, you can place them here to change your private key."
    fi
	

download_conf_files() {
  rm $DIR/*.conf 
  wget -i $PWD/url/urls -P $DIR
}

insert_private_key() {
  echo "Enter your surfshark's private key"
  read pk
  cd $DIR
  for i in *; do
    sed -i "s|PrivateKey =.*|PrivateKey = $pk|g" $i
  done
}

rename_files() {
  cd $DIR
  for i in *; do
    final_name=$(find "$i" | grep -h -o -P '.{0,7}prod.{0,0}')
    mv $i $final_name.conf
  done
}

compress_conf_files() {
  cd $DIR
  tar -cvf $(dirname "$DIR")/conf_files.tar -C $DIR *.conf
  tar -czf $(dirname "$DIR")/conf_files.tar.gz -C $DIR *.conf
  zip $(dirname "$DIR")/conf_files.zip *.conf
}

echo -e "
1) Download blank .conf files from SurfShark servers, insert your private key and then generate .tar, .tar.gz and .zip (compatible with most routers and official WireGuard apps). Will be saved in $DIR 
2) Update existing .conf files located in $DIR to change existing private key
3) Only generate .tar, .tar.gz and .zip from files in $DIR. (Will be saved in $(dirname "$DIR"))"

echo -e "\e[1;31mSelect an option:"
read opt
  case $opt in
  1)
    download_conf_files
    insert_private_key
    rename_files
    compress_conf_files
    ;;

  2)
    insert_private_key
    ;;

  3)
    compress_conf_files
    ;;

    *)
    echo "Not a valid option"
    ;;

  esac