# compresspdf
# A bash wrapper around GS to compress PDFs!

compresspdf() {
  case "$1" in

  "/screen" | "/ebook" | "/printer" | "/prepress")
    ps2pdf -dPDFSETTINGS="$1" "$2" "compressed_$2"
    ;;

  /magic)
    pdf2ps "$2" "tmp.ps" && ps2pdf14 "tmp.ps" "compressed_$2" && rm "tmp.ps"
    ;;

  *)
    echo "Unknown option: '$1'"
    cat <<EOT
Command to compress a pdf.
Usage: compresspdf <option> <input.pdf>
Options:
  /screen selects low-resolution output similar to the Acrobat Distiller "Screen Optimized" setting.
  /ebook selects medium-resolution output similar to the Acrobat Distiller "eBook" setting.
  /printer selects output similar to the Acrobat Distiller "Print Optimized" setting.
  /prepress selects output similar to Acrobat Distiller "Prepress Optimized" setting.
  /magic something brilliant or not..., try it!
EOT
    ;;
  esac
}
