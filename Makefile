NGROK_URL := $(shell curl --silent http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')

ngrok_update_url:
	# echo ${NGROK_URL}
	sed -i 's~https://.*.ngrok.io~https://${NGROK_URL}~' choice.html
	sed -i 's~https://.*.ngrok.io~https://${NGROK_URL}~' rasci.html
	git add choice.html
	git commit -m "New ngrok url."
	git push -u origin master