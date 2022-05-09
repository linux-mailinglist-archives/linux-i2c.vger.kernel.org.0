Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398F751F8A3
	for <lists+linux-i2c@lfdr.de>; Mon,  9 May 2022 11:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbiEIJmX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 May 2022 05:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237514AbiEIJMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 May 2022 05:12:50 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D611F0DCE
        for <linux-i2c@vger.kernel.org>; Mon,  9 May 2022 02:08:46 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3BC0E1FA07;
        Mon,  9 May 2022 09:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1652087325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qem5J1sQQK5QRnnmlM67PITn8y6eEOqC4dcpPn6vP2o=;
        b=weT2OfwS2XetduKqvbZcDq9E0NhYpojUsnEb+3miXwuGFLG6P4wQoU5fERejXnZg5FVCDC
        sC7jk/E15tR3mg2a4B2rdjgXyKQ2kzq06PqIlzT/wec5YzW3WV9+EimhFRSg3MfooeJEsv
        pcg9qYeCZIXGwT3w9OX6cbzfu6uMvNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1652087325;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qem5J1sQQK5QRnnmlM67PITn8y6eEOqC4dcpPn6vP2o=;
        b=SxfD351LUmZfSKO3QIsrD7DcwxA+QYGG5pE8Cpy3KXJ9jS8pkmyTzdJ57T5rf7D8mfAMQ4
        j+zgO1jTjowqUyCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 15E1413AA5;
        Mon,  9 May 2022 09:08:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id vRKzAx3aeGKzVwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 09 May 2022 09:08:45 +0000
Date:   Mon, 9 May 2022 11:08:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        david kerns <david.t.kerns@gmail.com>
Subject: [PATCH v2 2/2] i2c-tools: Implement and document option -h
Message-ID: <20220509110844.7a8078cb@endymion.delvare>
In-Reply-To: <20220509110326.53e4b669@endymion.delvare>
References: <20220509110326.53e4b669@endymion.delvare>
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

Add an option -h to display the help of the tools. This is a common
practice so users may expect it to work.

Based on a preliminary patch from David Kerns.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Changes since v1:
 * Update the getopt strings so that option -h is actually accepted
 * Update i2ctransfer too
 * Update the date of all modified man pages

 tools/i2cdetect.8   |    8 +++++++-
 tools/i2cdetect.c   |    5 +++--
 tools/i2cdump.8     |    8 +++++++-
 tools/i2cdump.c     |    5 +++--
 tools/i2cget.8      |    8 +++++++-
 tools/i2cget.c      |    5 +++--
 tools/i2cset.8      |    8 +++++++-
 tools/i2cset.c      |    5 +++--
 tools/i2ctransfer.8 |    8 +++++++-
 tools/i2ctransfer.c |    5 +++--
 10 files changed, 50 insertions(+), 15 deletions(-)

--- i2c-tools.orig/tools/i2cdetect.8	2022-05-09 10:57:59.426739954 +0200
+++ i2c-tools/tools/i2cdetect.8	2022-05-09 11:05:28.840435141 +0200
@@ -1,4 +1,4 @@
-.TH I2CDETECT 8 "October 2017"
+.TH I2CDETECT 8 "May 2022"
 .SH NAME
 i2cdetect \- detect I2C chips
 
@@ -18,6 +18,9 @@ i2cdetect \- detect I2C chips
 .I -V
 .br
 .B i2cdetect
+.I -h
+.br
+.B i2cdetect
 .I -l
 
 .SH DESCRIPTION
@@ -78,6 +81,9 @@ Display the list of functionalities impl
 .B "\-V"
 Display the version and exit.
 .TP
+.B "\-h"
+Display the help and exit.
+.TP
 .B "\-l"
 Output a list of installed busses.
 
--- i2c-tools.orig/tools/i2cdetect.c	2022-05-09 11:05:28.832435039 +0200
+++ i2c-tools/tools/i2cdetect.c	2022-05-09 11:06:15.086024749 +0200
@@ -209,7 +209,7 @@ int main(int argc, char *argv[])
 	int yes = 0, version = 0, list = 0;
 
 	/* handle (optional) flags first */
-	while ((opt = getopt(argc, argv, "FValqry")) != -1) {
+	while ((opt = getopt(argc, argv, "FVahlqry")) != -1) {
 		switch (opt) {
 		case 'V': version = 1; break;
 		case 'y': yes = 1; break;
@@ -242,9 +242,10 @@ int main(int argc, char *argv[])
 			first = 0x00;
 			last = 0x7F;
 			break;
+		case 'h':
 		case '?':
 			help();
-			exit(1);
+			exit(opt == '?');
 		}
 	}
 
--- i2c-tools.orig/tools/i2cdump.8	2022-05-09 10:57:59.426739954 +0200
+++ i2c-tools/tools/i2cdump.8	2022-05-09 11:05:28.840435141 +0200
@@ -1,4 +1,4 @@
-.TH I2CDUMP 8 "June 2021"
+.TH I2CDUMP 8 "May 2022"
 .SH NAME
 i2cdump \- examine I2C registers
 
@@ -14,6 +14,9 @@ i2cdump \- examine I2C registers
 .br
 .B i2cdump
 .B -V
+.br
+.B i2cdump
+.B -h
 
 .SH DESCRIPTION
 i2cdump is a small helper program to examine registers
@@ -24,6 +27,9 @@ visible through the I2C bus.
 .B -V
 Display the version and exit.
 .TP
+.B -h
+Display the help and exit.
+.TP
 .B -f
 Force access to the device even if it is already busy. By default, i2cdump
 will refuse to access a device which is already under the control of a
--- i2c-tools.orig/tools/i2cdump.c	2022-05-09 11:05:28.832435039 +0200
+++ i2c-tools/tools/i2cdump.c	2022-05-09 11:06:22.017113117 +0200
@@ -116,16 +116,17 @@ int main(int argc, char *argv[])
 	int first = 0x00, last = 0xff;
 
 	/* handle (optional) flags first */
-	while ((opt = getopt(argc, argv, "Vafr:y")) != -1) {
+	while ((opt = getopt(argc, argv, "Vafhr:y")) != -1) {
 		switch (opt) {
 		case 'V': version = 1; break;
 		case 'f': force = 1; break;
 		case 'r': range = optarg; break;
 		case 'y': yes = 1; break;
 		case 'a': all_addrs = 1; break;
+		case 'h':
 		case '?':
 			help();
-			exit(1);
+			exit(opt == '?');
 		}
 	}
 
--- i2c-tools.orig/tools/i2cget.8	2022-05-09 10:57:59.426739954 +0200
+++ i2c-tools/tools/i2cget.8	2022-05-09 11:05:28.840435141 +0200
@@ -1,4 +1,4 @@
-.TH I2CGET 8 "July 2021"
+.TH I2CGET 8 "May 2022"
 .SH "NAME"
 i2cget \- read from I2C/SMBus chip registers
 
@@ -13,6 +13,9 @@ i2cget \- read from I2C/SMBus chip regis
 .br
 .B i2cget
 .B -V
+.br
+.B i2cget
+.B -h
 
 .SH DESCRIPTION
 i2cget is a small helper program to read registers visible through the I2C
@@ -23,6 +26,9 @@ bus (or SMBus).
 .B -V
 Display the version and exit.
 .TP
+.B -h
+Display the help and exit.
+.TP
 .B -f
 Force access to the device even if it is already busy. By default, i2cget
 will refuse to access a device which is already under the control of a
--- i2c-tools.orig/tools/i2cget.c	2022-05-09 11:05:28.832435039 +0200
+++ i2c-tools/tools/i2cget.c	2022-05-09 11:06:33.221255964 +0200
@@ -186,15 +186,16 @@ int main(int argc, char *argv[])
 	unsigned char block_data[I2C_SMBUS_BLOCK_MAX];
 
 	/* handle (optional) flags first */
-	while ((opt = getopt(argc, argv, "Vafy")) != -1) {
+	while ((opt = getopt(argc, argv, "Vafhy")) != -1) {
 		switch (opt) {
 		case 'V': version = 1; break;
 		case 'f': force = 1; break;
 		case 'y': yes = 1; break;
 		case 'a': all_addrs = 1; break;
+		case 'h':
 		case '?':
 			help();
-			exit(1);
+			exit(opt == '?');
 		}
 	}
 
--- i2c-tools.orig/tools/i2cset.8	2022-05-09 10:57:59.426739954 +0200
+++ i2c-tools/tools/i2cset.8	2022-05-09 11:05:28.840435141 +0200
@@ -1,4 +1,4 @@
-.TH I2CSET 8 "October 2017"
+.TH I2CSET 8 "May 2022"
 .SH "NAME"
 i2cset \- set I2C registers
 
@@ -18,6 +18,9 @@ i2cset \- set I2C registers
 .br
 .B i2cset
 .B -V
+.br
+.B i2cset
+.B -h
 
 .SH DESCRIPTION
 i2cset is a small helper program to set registers visible through the I2C
@@ -28,6 +31,9 @@ bus.
 .B -V
 Display the version and exit.
 .TP
+.B -h
+Display the help and exit.
+.TP
 .B -f
 Force access to the device even if it is already busy. By default, i2cset
 will refuse to access a device which is already under the control of a
--- i2c-tools.orig/tools/i2cset.c	2022-05-09 11:05:28.832435039 +0200
+++ i2c-tools/tools/i2cset.c	2022-05-09 11:06:40.280345962 +0200
@@ -168,7 +168,7 @@ int main(int argc, char *argv[])
 	int len;
 
 	/* handle (optional) flags first */
-	while ((opt = getopt(argc, argv, "Vafm:ry")) != -1) {
+	while ((opt = getopt(argc, argv, "Vafhm:ry")) != -1) {
 		switch (opt) {
 		case 'V': version = 1; break;
 		case 'f': force = 1; break;
@@ -176,9 +176,10 @@ int main(int argc, char *argv[])
 		case 'm': maskp = optarg; break;
 		case 'r': readback = 1; break;
 		case 'a': all_addrs = 1; break;
+		case 'h':
 		case '?':
 			help();
-			exit(1);
+			exit(opt == '?');
 		}
 	}
 
--- i2c-tools.orig/tools/i2ctransfer.8	2022-05-09 10:57:59.426739954 +0200
+++ i2c-tools/tools/i2ctransfer.8	2022-05-09 11:05:28.841435154 +0200
@@ -1,4 +1,4 @@
-.TH i2ctransfer 8 "February 2017"
+.TH i2ctransfer 8 "May 2022"
 .SH "NAME"
 i2ctransfer \- send user-defined I2C messages in one transfer
 
@@ -16,6 +16,9 @@ i2ctransfer \- send user-defined I2C mes
 .br
 .B i2ctransfer
 .B -V
+.br
+.B i2ctransfer
+.B -h
 
 .SH DESCRIPTION
 .B i2ctransfer
@@ -63,6 +66,9 @@ It will print infos about all messages s
 .B -V
 Display the version and exit.
 .TP
+.B -h
+Display the help and exit.
+.TP
 .B -a
 Allow using addresses between 0x00 - 0x07 and 0x78 - 0x7f. Not recommended.
 
--- i2c-tools.orig/tools/i2ctransfer.c	2022-05-09 11:05:28.832435039 +0200
+++ i2c-tools/tools/i2ctransfer.c	2022-05-09 11:06:47.812441993 +0200
@@ -141,16 +141,17 @@ int main(int argc, char *argv[])
 		msgs[i].buf = NULL;
 
 	/* handle (optional) flags first */
-	while ((opt = getopt(argc, argv, "Vafvy")) != -1) {
+	while ((opt = getopt(argc, argv, "Vafhvy")) != -1) {
 		switch (opt) {
 		case 'V': version = 1; break;
 		case 'v': verbose = 1; break;
 		case 'f': force = 1; break;
 		case 'y': yes = 1; break;
 		case 'a': all_addrs = 1; break;
+		case 'h':
 		case '?':
 			help();
-			exit(1);
+			exit(opt == '?');
 		}
 	}
 

-- 
Jean Delvare
SUSE L3 Support
