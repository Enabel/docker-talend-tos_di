TOS_DI_VERS=7.3.1
TOS_DI_FULLVERS=20200219_1130-V${TOS_DI_VERS}

build: depend
	docker build \
		--tag=enabelit/talend-tos_di:${TOS_DI_VERS} \
		--build-arg TOS_DI_CMD="true" \
		--build-arg TOS_DI_LOCALFILE="TOS_DI-${TOS_DI_FULLVERS}.zip" \
		--build-arg XULRUNNER_CMD="true" \
		--build-arg XULRUNNER_LOCALFILE="xulrunner-1.9.2.28pre.en-US.linux-x86_64.tar.bz2" \
		.

run: build
	./runit.sh

TOS_DI-${TOS_DI_FULLVERS}.zip:
	wget https://downloads.sourceforge.net/project/talend-studio/Talend%20Open%20Studio/${TOS_DI_VERS}/TOS_DI-${TOS_DI_FULLVERS}.zip

xulrunner-1.9.2.28pre.en-US.linux-x86_64.tar.bz2:
	wget http://ftp.mozilla.org/pub/mozilla.org/xulrunner/nightly/2012/03/2012-03-02-03-32-11-mozilla-1.9.2/xulrunner-1.9.2.28pre.en-US.linux-x86_64.tar.bz2

depend: TOS_DI-${TOS_DI_FULLVERS}.zip xulrunner-1.9.2.28pre.en-US.linux-x86_64.tar.bz2
