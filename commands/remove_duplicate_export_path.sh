#! /bin/bash

function remove_duplicate_export_path () {
  _path=""
  for _p in $(echo $PATH | tr ':' ' '); do
    case ":${_path}:" in
      *:"${_p}":* )
        ;;
      * )
        if [ "$_path" ]; then
          _path="$_path:$_p"
        else
          _path=$_p
        fi
        ;;
    esac
  done
  PATH=$_path

  unset _p
  unset _path
}
