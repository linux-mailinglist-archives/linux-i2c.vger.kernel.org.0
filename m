Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D70451F916
	for <lists+linux-i2c@lfdr.de>; Mon,  9 May 2022 12:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiEIJjd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 May 2022 05:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237877AbiEIJHu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 May 2022 05:07:50 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2885B1D4A03
        for <linux-i2c@vger.kernel.org>; Mon,  9 May 2022 02:03:51 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 884971F74D;
        Mon,  9 May 2022 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1652087008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=/TFraGJypSrEDc3O8FOccsuCyHZ/JSS6YMc0RVcrITM=;
        b=hgNcR+lPLTWSgagxIQQJhZwG9l8emxmxVhdmcj1WPKRGkC9RbvCh2d/dkdVITLHaTGuhBM
        hI+4+VgdXkUGaOLpUAkSTFNd7mq77qAwA9UQEw/y86IWujf8tbCarhxwLAkjeWENyP4EjM
        vofPZTyh1Zx1QdQ5vPd8vWUvPMCX7Eo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1652087008;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=/TFraGJypSrEDc3O8FOccsuCyHZ/JSS6YMc0RVcrITM=;
        b=P1wB19GV1wYM5kxhtA4fxnCGEn2qPO265aCOhvIfKpOlMrD++V2tSMsSqWf/qBq/0jGEYb
        MCigdvgPPPUz7vCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6157713AA5;
        Mon,  9 May 2022 09:03:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 3zEnFuDYeGJoVQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 09 May 2022 09:03:28 +0000
Date:   Mon, 9 May 2022 11:03:26 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        david kerns <david.t.kerns@gmail.com>
Subject: [PATCH v2 1/2] i2c-tools: Use getopt
Message-ID: <20220509110326.53e4b669@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the standard C getopt() function instead of parsing the options
manually. The benefit of this move is that getopt() supports merged
flags (for example -fy instead of -f -y) and does not require options
to come first on the command line. As this is pretty standard by now,
not supporting such possibilities can confuse and disappoint the user.

Based on a preliminary patch from David Kerns.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Note: For i2ctransfer, I chose to keep arg_idx although it has the same
meaning as getopt's optind variable, as I'm not sure if it is considered
an acceptable practice for the caller to tinkle with it. If it is then
we could get rid of arg_idx and use optind everywhere instead.

Changes since v1:
 * Update i2ctransfer too (suggested by Wolfram Sang)
 * Update the copyright years of the tools I wrote

 tools/i2cdetect.c   |   25 +++++++++++--------------
 tools/i2cdump.c     |   51 ++++++++++++++++++++++++---------------------------
 tools/i2cget.c      |   33 +++++++++++++++------------------
 tools/i2cset.c      |   47 ++++++++++++++++++++---------------------------
 tools/i2ctransfer.c |   14 ++++++--------
 5 files changed, 76 insertions(+), 94 deletions(-)

--- i2c-tools.orig/tools/i2cdetect.c	2022-05-06 16:05:51.203591122 +0200
+++ i2c-tools/tools/i2cdetect.c	2022-05-06 16:15:11.132122653 +0200
@@ -2,7 +2,7 @@
     i2cdetect.c - a user-space program to scan for I2C devices
     Copyright (C) 1999-2004  Frodo Looijaard <frodol@dds.nl>, and
                              Mark D. Studebaker <mdsxyz123@yahoo.com>
-    Copyright (C) 2004-2012  Jean Delvare <jdelvare@suse.de>
+    Copyright (C) 2004-2022  Jean Delvare <jdelvare@suse.de>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
@@ -205,12 +205,12 @@ int main(int argc, char *argv[])
 	unsigned long funcs;
 	int mode = MODE_AUTO;
 	int first = 0x08, last = 0x77;
-	int flags = 0;
+	int opt;
 	int yes = 0, version = 0, list = 0;
 
 	/* handle (optional) flags first */
-	while (1+flags < argc && argv[1+flags][0] == '-') {
-		switch (argv[1+flags][1]) {
+	while ((opt = getopt(argc, argv, "FValqry")) != -1) {
+		switch (opt) {
 		case 'V': version = 1; break;
 		case 'y': yes = 1; break;
 		case 'l': list = 1; break;
@@ -242,13 +242,10 @@ int main(int argc, char *argv[])
 			first = 0x00;
 			last = 0x7F;
 			break;
-		default:
-			fprintf(stderr, "Error: Unsupported option "
-				"\"%s\"!\n", argv[1+flags]);
+		case '?':
 			help();
 			exit(1);
 		}
-		flags++;
 	}
 
 	if (version) {
@@ -261,22 +258,22 @@ int main(int argc, char *argv[])
 		exit(0);
 	}
 
-	if (argc < flags + 2) {
+	if (argc < optind + 1) {
 		fprintf(stderr, "Error: No i2c-bus specified!\n");
 		help();
 		exit(1);
 	}
-	i2cbus = lookup_i2c_bus(argv[flags+1]);
+	i2cbus = lookup_i2c_bus(argv[optind]);
 	if (i2cbus < 0) {
 		help();
 		exit(1);
 	}
 
 	/* read address range if present */
-	if (argc == flags + 4 && mode != MODE_FUNC) {
+	if (argc == optind + 3 && mode != MODE_FUNC) {
 		int tmp;
 
-		tmp = strtol(argv[flags+2], &end, 0);
+		tmp = strtol(argv[optind+1], &end, 0);
 		if (*end) {
 			fprintf(stderr, "Error: FIRST argument not a "
 				"number!\n");
@@ -291,7 +288,7 @@ int main(int argc, char *argv[])
 		}
 		first = tmp;
 
-		tmp = strtol(argv[flags+3], &end, 0);
+		tmp = strtol(argv[optind+2], &end, 0);
 		if (*end) {
 			fprintf(stderr, "Error: LAST argument not a "
 				"number!\n");
@@ -305,7 +302,7 @@ int main(int argc, char *argv[])
 			exit(1);
 		}
 		last = tmp;
-	} else if (argc != flags + 2) {
+	} else if (argc != optind + 1) {
 		help();
 		exit(1);
 	}
--- i2c-tools.orig/tools/i2cdump.c	2022-05-06 16:05:51.203591122 +0200
+++ i2c-tools/tools/i2cdump.c	2022-05-06 16:15:17.051191339 +0200
@@ -2,7 +2,7 @@
     i2cdump.c - a user-space program to dump I2C registers
     Copyright (C) 2002-2003  Frodo Looijaard <frodol@dds.nl>, and
                              Mark D. Studebaker <mdsxyz123@yahoo.com>
-    Copyright (C) 2004-2021  Jean Delvare <jdelvare@suse.de>
+    Copyright (C) 2004-2022  Jean Delvare <jdelvare@suse.de>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
@@ -110,26 +110,23 @@ int main(int argc, char *argv[])
 	char filename[20];
 	int block[256];
 	int pec = 0, even = 0;
-	int flags = 0;
+	int opt;
 	int force = 0, yes = 0, version = 0, all_addrs = 0;
 	const char *range = NULL;
 	int first = 0x00, last = 0xff;
 
 	/* handle (optional) flags first */
-	while (1+flags < argc && argv[1+flags][0] == '-') {
-		switch (argv[1+flags][1]) {
+	while ((opt = getopt(argc, argv, "Vafr:y")) != -1) {
+		switch (opt) {
 		case 'V': version = 1; break;
 		case 'f': force = 1; break;
-		case 'r': range = argv[1+(++flags)]; break;
+		case 'r': range = optarg; break;
 		case 'y': yes = 1; break;
 		case 'a': all_addrs = 1; break;
-		default:
-			fprintf(stderr, "Error: Unsupported option "
-				"\"%s\"!\n", argv[1+flags]);
+		case '?':
 			help();
 			exit(1);
 		}
-		flags++;
 	}
 
 	if (version) {
@@ -137,48 +134,48 @@ int main(int argc, char *argv[])
 		exit(0);
 	}
 
-	if (argc < flags + 2) {
+	if (argc < optind + 1) {
 		fprintf(stderr, "Error: No i2c-bus specified!\n");
 		help();
 		exit(1);
 	}
-	i2cbus = lookup_i2c_bus(argv[flags+1]);
+	i2cbus = lookup_i2c_bus(argv[optind]);
 	if (i2cbus < 0) {
 		help();
 		exit(1);
 	}
 
-	if (argc < flags + 3) {
+	if (argc < optind + 2) {
 		fprintf(stderr, "Error: No address specified!\n");
 		help();
 		exit(1);
 	}
-	address = parse_i2c_address(argv[flags+2], all_addrs);
+	address = parse_i2c_address(argv[optind+1], all_addrs);
 	if (address < 0) {
 		help();
 		exit(1);
 	}
 
-	if (argc < flags + 4) {
+	if (argc < optind + 3) {
 		fprintf(stderr, "No size specified (using byte-data access)\n");
 		size = I2C_SMBUS_BYTE_DATA;
-	} else if (!strncmp(argv[flags+3], "b", 1)) {
+	} else if (!strncmp(argv[optind+2], "b", 1)) {
 		size = I2C_SMBUS_BYTE_DATA;
-		pec = argv[flags+3][1] == 'p';
-	} else if (!strncmp(argv[flags+3], "w", 1)) {
+		pec = argv[optind+2][1] == 'p';
+	} else if (!strncmp(argv[optind+2], "w", 1)) {
 		size = I2C_SMBUS_WORD_DATA;
-		pec = argv[flags+3][1] == 'p';
-	} else if (!strncmp(argv[flags+3], "W", 1)) {
+		pec = argv[optind+2][1] == 'p';
+	} else if (!strncmp(argv[optind+2], "W", 1)) {
 		size = I2C_SMBUS_WORD_DATA;
 		even = 1;
-	} else if (!strncmp(argv[flags+3], "s", 1)) {
+	} else if (!strncmp(argv[optind+2], "s", 1)) {
 		fprintf(stderr,
 			"SMBus block mode is no longer supported, please use i2cget instead\n");
 		exit(1);
-	} else if (!strncmp(argv[flags+3], "c", 1)) {
+	} else if (!strncmp(argv[optind+2], "c", 1)) {
 		size = I2C_SMBUS_BYTE;
-		pec = argv[flags+3][1] == 'p';
-	} else if (!strcmp(argv[flags+3], "i"))
+		pec = argv[optind+2][1] == 'p';
+	} else if (!strcmp(argv[optind+2], "i"))
 		size = I2C_SMBUS_I2C_BLOCK_DATA;
 	else {
 		fprintf(stderr, "Error: Invalid mode!\n");
@@ -186,8 +183,8 @@ int main(int argc, char *argv[])
 		exit(1);
 	}
 
-	if (argc > flags + 4) {
-		bank = strtol(argv[flags+4], &end, 0);
+	if (argc > optind + 3) {
+		bank = strtol(argv[optind+3], &end, 0);
 		if (*end || size == I2C_SMBUS_I2C_BLOCK_DATA) {
 			fprintf(stderr, "Error: Invalid bank number!\n");
 			help();
@@ -200,8 +197,8 @@ int main(int argc, char *argv[])
 			exit(1);
 		}
 
-		if (argc > flags + 5) {
-			bankreg = strtol(argv[flags+5], &end, 0);
+		if (argc > optind + 4) {
+			bankreg = strtol(argv[optind+4], &end, 0);
 			if (*end) {
 				fprintf(stderr, "Error: Invalid bank register "
 					"number!\n");
--- i2c-tools.orig/tools/i2cget.c	2022-05-06 16:05:51.203591122 +0200
+++ i2c-tools/tools/i2cget.c	2022-05-06 16:14:58.335974165 +0200
@@ -1,6 +1,6 @@
 /*
     i2cget.c - A user-space program to read an I2C register.
-    Copyright (C) 2005-2021  Jean Delvare <jdelvare@suse.de>
+    Copyright (C) 2005-2022  Jean Delvare <jdelvare@suse.de>
 
     Based on i2cset.c:
     Copyright (C) 2001-2003  Frodo Looijaard <frodol@dds.nl>, and
@@ -180,25 +180,22 @@ int main(int argc, char *argv[])
 	int daddress;
 	char filename[20];
 	int pec = 0;
-	int flags = 0;
+	int opt;
 	int force = 0, yes = 0, version = 0, all_addrs = 0;
 	int length;
 	unsigned char block_data[I2C_SMBUS_BLOCK_MAX];
 
 	/* handle (optional) flags first */
-	while (1+flags < argc && argv[1+flags][0] == '-') {
-		switch (argv[1+flags][1]) {
+	while ((opt = getopt(argc, argv, "Vafy")) != -1) {
+		switch (opt) {
 		case 'V': version = 1; break;
 		case 'f': force = 1; break;
 		case 'y': yes = 1; break;
 		case 'a': all_addrs = 1; break;
-		default:
-			fprintf(stderr, "Error: Unsupported option "
-				"\"%s\"!\n", argv[1+flags]);
+		case '?':
 			help();
 			exit(1);
 		}
-		flags++;
 	}
 
 	if (version) {
@@ -206,20 +203,20 @@ int main(int argc, char *argv[])
 		exit(0);
 	}
 
-	if (argc < flags + 3)
+	if (argc < optind + 2)
 		help();
 
-	i2cbus = lookup_i2c_bus(argv[flags+1]);
+	i2cbus = lookup_i2c_bus(argv[optind]);
 	if (i2cbus < 0)
 		help();
 
-	address = parse_i2c_address(argv[flags+2], all_addrs);
+	address = parse_i2c_address(argv[optind+1], all_addrs);
 	if (address < 0)
 		help();
 
-	if (argc > flags + 3) {
+	if (argc > optind + 2) {
 		size = I2C_SMBUS_BYTE_DATA;
-		daddress = strtol(argv[flags+3], &end, 0);
+		daddress = strtol(argv[optind+2], &end, 0);
 		if (*end || daddress < 0 || daddress > 0xff) {
 			fprintf(stderr, "Error: Data address invalid!\n");
 			help();
@@ -229,8 +226,8 @@ int main(int argc, char *argv[])
 		daddress = -1;
 	}
 
-	if (argc > flags + 4) {
-		switch (argv[flags+4][0]) {
+	if (argc > optind + 3) {
+		switch (argv[optind+3][0]) {
 		case 'b': size = I2C_SMBUS_BYTE_DATA; break;
 		case 'w': size = I2C_SMBUS_WORD_DATA; break;
 		case 'c': size = I2C_SMBUS_BYTE; break;
@@ -240,19 +237,19 @@ int main(int argc, char *argv[])
 			fprintf(stderr, "Error: Invalid mode!\n");
 			help();
 		}
-		pec = argv[flags+4][1] == 'p';
+		pec = argv[optind+3][1] == 'p';
 		if (size == I2C_SMBUS_I2C_BLOCK_DATA && pec) {
 			fprintf(stderr, "Error: PEC not supported for I2C block data!\n");
 			help();
 		}
 	}
 
-	if (argc > flags + 5) {
+	if (argc > optind + 4) {
 		if (size != I2C_SMBUS_I2C_BLOCK_DATA) {
 			fprintf(stderr, "Error: Length only valid for I2C block data!\n");
 			help();
 		}
-		length = strtol(argv[flags+5], &end, 0);
+		length = strtol(argv[optind+4], &end, 0);
 		if (*end || length < 1 || length > I2C_SMBUS_BLOCK_MAX) {
 			fprintf(stderr, "Error: Length invalid!\n");
 			help();
--- i2c-tools.orig/tools/i2cset.c	2022-05-06 16:05:51.203591122 +0200
+++ i2c-tools/tools/i2cset.c	2022-05-06 16:15:05.005051554 +0200
@@ -2,7 +2,7 @@
     i2cset.c - A user-space program to write an I2C register.
     Copyright (C) 2001-2003  Frodo Looijaard <frodol@dds.nl>, and
                              Mark D. Studebaker <mdsxyz123@yahoo.com>
-    Copyright (C) 2004-2012  Jean Delvare <jdelvare@suse.de>
+    Copyright (C) 2004-2022  Jean Delvare <jdelvare@suse.de>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
@@ -162,31 +162,24 @@ int main(int argc, char *argv[])
 	int value, daddress, vmask = 0;
 	char filename[20];
 	int pec = 0;
-	int flags = 0;
+	int opt;
 	int force = 0, yes = 0, version = 0, readback = 0, all_addrs = 0;
 	unsigned char block[I2C_SMBUS_BLOCK_MAX];
 	int len;
 
 	/* handle (optional) flags first */
-	while (1+flags < argc && argv[1+flags][0] == '-') {
-		switch (argv[1+flags][1]) {
+	while ((opt = getopt(argc, argv, "Vafm:ry")) != -1) {
+		switch (opt) {
 		case 'V': version = 1; break;
 		case 'f': force = 1; break;
 		case 'y': yes = 1; break;
-		case 'm':
-			if (2+flags < argc)
-				maskp = argv[2+flags];
-			flags++;
-			break;
+		case 'm': maskp = optarg; break;
 		case 'r': readback = 1; break;
 		case 'a': all_addrs = 1; break;
-		default:
-			fprintf(stderr, "Error: Unsupported option "
-				"\"%s\"!\n", argv[1+flags]);
+		case '?':
 			help();
 			exit(1);
 		}
-		flags++;
 	}
 
 	if (version) {
@@ -194,33 +187,33 @@ int main(int argc, char *argv[])
 		exit(0);
 	}
 
-	if (argc < flags + 4)
+	if (argc < optind + 3)
 		help();
 
-	i2cbus = lookup_i2c_bus(argv[flags+1]);
+	i2cbus = lookup_i2c_bus(argv[optind]);
 	if (i2cbus < 0)
 		help();
 
-	address = parse_i2c_address(argv[flags+2], all_addrs);
+	address = parse_i2c_address(argv[optind+1], all_addrs);
 	if (address < 0)
 		help();
 
-	daddress = strtol(argv[flags+3], &end, 0);
+	daddress = strtol(argv[optind+2], &end, 0);
 	if (*end || daddress < 0 || daddress > 0xff) {
 		fprintf(stderr, "Error: Data address invalid!\n");
 		help();
 	}
 
 	/* check for command/mode */
-	if (argc == flags + 4) {
+	if (argc == optind + 3) {
 		/* Implicit "c" */
 		size = I2C_SMBUS_BYTE;
-	} else if (argc == flags + 5) {
+	} else if (argc == optind + 4) {
 		/* "c", "cp",  or implicit "b" */
-		if (!strcmp(argv[flags+4], "c")
-		 || !strcmp(argv[flags+4], "cp")) {
+		if (!strcmp(argv[optind+3], "c")
+		 || !strcmp(argv[optind+3], "cp")) {
 			size = I2C_SMBUS_BYTE;
-			pec = argv[flags+4][1] == 'p';
+			pec = argv[optind+3][1] == 'p';
 		} else {
 			size = I2C_SMBUS_BYTE_DATA;
 		}
@@ -250,11 +243,11 @@ int main(int argc, char *argv[])
 				fprintf(stderr, "Error: Mask not supported for block writes!\n");
 				help();
 			}
-			if (argc > (int)sizeof(block) + flags + 5) {
+			if (argc > (int)sizeof(block) + optind + 4) {
 				fprintf(stderr, "Error: Too many arguments!\n");
 				help();
 			}
-		} else if (argc != flags + 6) {
+		} else if (argc != optind + 5) {
 			fprintf(stderr, "Error: Too many arguments!\n");
 			help();
 		}
@@ -270,7 +263,7 @@ int main(int argc, char *argv[])
 		break;
 	case I2C_SMBUS_BYTE_DATA:
 	case I2C_SMBUS_WORD_DATA:
-		value = strtol(argv[flags+4], &end, 0);
+		value = strtol(argv[optind+3], &end, 0);
 		if (*end || value < 0) {
 			fprintf(stderr, "Error: Data value invalid!\n");
 			help();
@@ -283,8 +276,8 @@ int main(int argc, char *argv[])
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
 	case I2C_SMBUS_I2C_BLOCK_DATA:
-		for (len = 0; len + flags + 5 < argc; len++) {
-			value = strtol(argv[flags + len + 4], &end, 0);
+		for (len = 0; len + optind + 4 < argc; len++) {
+			value = strtol(argv[optind + len + 3], &end, 0);
 			if (*end || value < 0) {
 				fprintf(stderr, "Error: Data value invalid!\n");
 				help();
--- i2c-tools.orig/tools/i2ctransfer.c	2021-05-21 13:12:37.911513943 +0200
+++ i2c-tools/tools/i2ctransfer.c	2022-05-09 10:51:59.890334698 +0200
@@ -131,7 +131,7 @@ static int confirm(const char *filename,
 int main(int argc, char *argv[])
 {
 	char filename[20];
-	int i2cbus, address = -1, file, arg_idx = 1, nmsgs = 0, nmsgs_sent, i;
+	int i2cbus, address = -1, file, opt, arg_idx, nmsgs = 0, nmsgs_sent, i;
 	int force = 0, yes = 0, version = 0, verbose = 0, all_addrs = 0;
 	struct i2c_msg msgs[I2C_RDRW_IOCTL_MAX_MSGS];
 	enum parse_state state = PARSE_GET_DESC;
@@ -140,21 +140,18 @@ int main(int argc, char *argv[])
 	for (i = 0; i < I2C_RDRW_IOCTL_MAX_MSGS; i++)
 		msgs[i].buf = NULL;
 
-	/* handle (optional) arg_idx first */
-	while (arg_idx < argc && argv[arg_idx][0] == '-') {
-		switch (argv[arg_idx][1]) {
+	/* handle (optional) flags first */
+	while ((opt = getopt(argc, argv, "Vafvy")) != -1) {
+		switch (opt) {
 		case 'V': version = 1; break;
 		case 'v': verbose = 1; break;
 		case 'f': force = 1; break;
 		case 'y': yes = 1; break;
 		case 'a': all_addrs = 1; break;
-		default:
-			fprintf(stderr, "Error: Unsupported option \"%s\"!\n",
-				argv[arg_idx]);
+		case '?':
 			help();
 			exit(1);
 		}
-		arg_idx++;
 	}
 
 	if (version) {
@@ -162,6 +159,7 @@ int main(int argc, char *argv[])
 		exit(0);
 	}
 
+	arg_idx = optind;
 	if (arg_idx == argc) {
 		help();
 		exit(1);


-- 
Jean Delvare
SUSE L3 Support
