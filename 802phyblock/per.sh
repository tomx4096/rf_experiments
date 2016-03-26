
SENT=10000
RECVD="$(tshark -r $1 | wc -l)"
MALFORMED="$(tshark -r $1 | grep -c "Malformed")"
BADFCS="$(tshark -r $1 | grep -c "Bad")"

#echo $RECVD
#echo $SENT
#echo $MALFORMED
#echo $BADFCS

DROPPED=$((SENT-RECVD))
ERROR=$((BADFCS+MALFORMED+DROPPED))
#echo $ERROR
#echo $SENT

echo "Packet Error Rate:"
echo "($ERROR / $SENT)*100" | bc -l

