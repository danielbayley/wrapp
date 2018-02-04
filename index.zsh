#! /bin/zsh --no-rcs --glob-assign
zparseopts -D -E -A opts -- h -help v -version \
-name:=name n:=name -output:=output o:=output -icon:=icon i:=icon -trash=trash t=trash

case ${(k)opts:-$#} in
  -h|--help|0)  exec cat $0:A:h/help.*;;
  -v|--version) exec grep -om1 '\d\.\d\.\d' $0:A:h/package.json
esac

script=$1:A
Name=${name[2]:-${(C)script:t:r}}
name=${Name:l:gs/ /-}
bundle=${output[2]:-.}/$Name.app/Contents
id=io.github.max-os.wrapp.$script:e.$name
icon=${icon[2]:-$script:h/*.icns(N)}

pushd $script:h
mkdir -p $bundle/{Resources,MacOS}
cp $script:t $_/$name
chmod +x $_

typeset -A info
info[Executable]=$name
info[Identifier]=$id
info[DisplayName]=$Name
info[ShortVersionString]=1.0.0

if ((#icon)) then
  info[IconFile]=$icon:A:t
  cp $icon:A $bundle/Resources
fi

for key value in ${(kv)info}
do /usr/libexec/plistbuddy -c "add :CFBundle$key string $value" "$bundle/info.plist"
done

if (($+trash[1])) mv $script ~/.Trash
