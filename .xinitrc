export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE="scim"
#export XIM_PROGRAM = "scim -d"
export QT_IM_MODULE="scim"
scim -d &

urxvtd -o -q -f &

exec openbox-session
