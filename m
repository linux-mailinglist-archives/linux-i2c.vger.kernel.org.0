Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0466E39FAB5
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 17:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhFHPay (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 11:30:54 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:51784 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbhFHPax (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 11:30:53 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 86C8C219C4;
        Tue,  8 Jun 2021 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TVppNiYg3WFjPCXVq3b1HpIZqBzgMgsb2spfM92q1yQ=;
        b=NVSBMoDaGEUGtwBxLo3kgG9QEGmrEL+h61SbCfQKG5GNcIhdyAzzEOHiMPJWNFFb6OhWFC
        lzHzWowvJR4zFMbnSj/s+IYREg+yZ5cLNMuf3HOq7aK7c0YkJkdZniuQ/fgLD3SBanyiAK
        IhlHEvsrX5TqTU3arT6VaN0fQHCbbes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166139;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TVppNiYg3WFjPCXVq3b1HpIZqBzgMgsb2spfM92q1yQ=;
        b=EToG/9/svHqUNkOeuGi2PL1E0fINvGHYCojNh0lPx2ECK287ciXqeBCRtaAlYEKQxCkQG1
        nwvmIltIsV3VpvDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 506B3118DD;
        Tue,  8 Jun 2021 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TVppNiYg3WFjPCXVq3b1HpIZqBzgMgsb2spfM92q1yQ=;
        b=NVSBMoDaGEUGtwBxLo3kgG9QEGmrEL+h61SbCfQKG5GNcIhdyAzzEOHiMPJWNFFb6OhWFC
        lzHzWowvJR4zFMbnSj/s+IYREg+yZ5cLNMuf3HOq7aK7c0YkJkdZniuQ/fgLD3SBanyiAK
        IhlHEvsrX5TqTU3arT6VaN0fQHCbbes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166139;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TVppNiYg3WFjPCXVq3b1HpIZqBzgMgsb2spfM92q1yQ=;
        b=EToG/9/svHqUNkOeuGi2PL1E0fINvGHYCojNh0lPx2ECK287ciXqeBCRtaAlYEKQxCkQG1
        nwvmIltIsV3VpvDQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id 3f62EbuMv2DmMgAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Tue, 08 Jun 2021 15:28:59 +0000
Date:   Tue, 8 Jun 2021 17:28:58 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 1/7] i2cget: Add support for I2C block data
Message-ID: <20210608172858.0fbd301f@endymion>
In-Reply-To: <20210608172338.0cf520a1@endymion>
References: <20210608172338.0cf520a1@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Crestez Dan Leonard <leonard.crestez@intel.com>

This adds mode 'i' for I2C_SMBUS_I2C_BLOCK_DATA. This is the same mode
letter from i2cdump.

Length is optional and defaults to 32 (maximum).

The intended use is debugging i2c devices with shell commands.

[JD: Fix the build (wrong variable name)
     Ensure PEC isn't used in I2C block mode
     Don't print the lenth (doesn't add value and could be mistaken as
       an offset
     Various cleanups]

Signed-off-by: Crestez Dan Leonard <leonard.crestez@intel.com>
Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/i2cget.c |   65 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 10 deletions(-)

--- i2c-tools.orig/tools/i2cget.c	2021-06-08 16:49:55.025098861 +0200
+++ i2c-tools/tools/i2cget.c	2021-06-08 16:54:15.707669058 +0200
@@ -41,14 +41,16 @@ static void help(void) __attribute__ ((n
 static void help(void)
 {
 	fprintf(stderr,
-		"Usage: i2cget [-f] [-y] [-a] I2CBUS CHIP-ADDRESS [DATA-ADDRESS [MODE]]\n"
+		"Usage: i2cget [-f] [-y] [-a] I2CBUS CHIP-ADDRESS [DATA-ADDRESS [MODE [LENGTH]]]\n"
 		"  I2CBUS is an integer or an I2C bus name\n"
 		"  ADDRESS is an integer (0x08 - 0x77, or 0x00 - 0x7f if -a is given)\n"
 		"  MODE is one of:\n"
 		"    b (read byte data, default)\n"
 		"    w (read word data)\n"
 		"    c (write byte/read byte)\n"
-		"    Append p for SMBus PEC\n");
+		"    i (read I2C block data)\n"
+		"    Append p for SMBus PEC\n"
+		"  LENGTH is the I2C block data length\n");
 	exit(1);
 }
 
@@ -89,6 +91,13 @@ static int check_funcs(int file, int siz
 			return -1;
 		}
 		break;
+
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		if (!(funcs & I2C_FUNC_SMBUS_READ_I2C_BLOCK)) {
+			fprintf(stderr, MISSING_FUNC_FMT, "SMBus read I2C block data");
+			return -1;
+		}
+		break;
 	}
 
 	if (pec
@@ -101,7 +110,7 @@ static int check_funcs(int file, int siz
 }
 
 static int confirm(const char *filename, int address, int size, int daddress,
-		   int pec)
+		   int length, int pec)
 {
 	int dont = 0;
 
@@ -132,11 +141,15 @@ static int confirm(const char *filename,
 		fprintf(stderr, "current data\naddress");
 	else
 		fprintf(stderr, "data address\n0x%02x", daddress);
-	fprintf(stderr, ", using %s.\n",
-		size == I2C_SMBUS_BYTE ? (daddress < 0 ?
-		"read byte" : "write byte/read byte") :
-		size == I2C_SMBUS_BYTE_DATA ? "read byte data" :
-		"read word data");
+	if (size == I2C_SMBUS_I2C_BLOCK_DATA)
+		fprintf(stderr, ", %d %s using read I2C block data.\n",
+			length, length > 1 ? "bytes" : "byte");
+	else
+		fprintf(stderr, ", using %s.\n",
+			size == I2C_SMBUS_BYTE ? (daddress < 0 ?
+			"read byte" : "write byte/read byte") :
+			size == I2C_SMBUS_BYTE_DATA ? "read byte data" :
+			"read word data");
 	if (pec)
 		fprintf(stderr, "PEC checking enabled.\n");
 
@@ -159,6 +172,8 @@ int main(int argc, char *argv[])
 	int pec = 0;
 	int flags = 0;
 	int force = 0, yes = 0, version = 0, all_addrs = 0;
+	int length;
+	unsigned char block_data[I2C_SMBUS_BLOCK_MAX];
 
 	/* handle (optional) flags first */
 	while (1+flags < argc && argv[1+flags][0] == '-') {
@@ -209,11 +224,30 @@ int main(int argc, char *argv[])
 		case 'b': size = I2C_SMBUS_BYTE_DATA; break;
 		case 'w': size = I2C_SMBUS_WORD_DATA; break;
 		case 'c': size = I2C_SMBUS_BYTE; break;
+		case 'i': size = I2C_SMBUS_I2C_BLOCK_DATA; break;
 		default:
 			fprintf(stderr, "Error: Invalid mode!\n");
 			help();
 		}
 		pec = argv[flags+4][1] == 'p';
+		if (size == I2C_SMBUS_I2C_BLOCK_DATA && pec) {
+			fprintf(stderr, "Error: PEC not supported for I2C block data!\n");
+			help();
+		}
+	}
+
+	if (argc > flags + 5) {
+		if (size != I2C_SMBUS_I2C_BLOCK_DATA) {
+			fprintf(stderr, "Error: Length only valid for I2C block data!\n");
+			help();
+		}
+		length = strtol(argv[flags+5], &end, 0);
+		if (*end || length < 1 || length > I2C_SMBUS_BLOCK_MAX) {
+			fprintf(stderr, "Error: Length invalid!\n");
+			help();
+		}
+	} else {
+		length = I2C_SMBUS_BLOCK_MAX;
 	}
 
 	file = open_i2c_dev(i2cbus, filename, sizeof(filename), 0);
@@ -222,7 +256,7 @@ int main(int argc, char *argv[])
 	 || set_slave_addr(file, address, force))
 		exit(1);
 
-	if (!yes && !confirm(filename, address, size, daddress, pec))
+	if (!yes && !confirm(filename, address, size, daddress, length, pec))
 		exit(0);
 
 	if (pec && ioctl(file, I2C_PEC, 1) < 0) {
@@ -244,6 +278,9 @@ int main(int argc, char *argv[])
 	case I2C_SMBUS_WORD_DATA:
 		res = i2c_smbus_read_word_data(file, daddress);
 		break;
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		res = i2c_smbus_read_i2c_block_data(file, daddress, length, block_data);
+		break;
 	default: /* I2C_SMBUS_BYTE_DATA */
 		res = i2c_smbus_read_byte_data(file, daddress);
 	}
@@ -254,7 +291,15 @@ int main(int argc, char *argv[])
 		exit(2);
 	}
 
-	printf("0x%0*x\n", size == I2C_SMBUS_WORD_DATA ? 4 : 2, res);
+	if (size == I2C_SMBUS_I2C_BLOCK_DATA) {
+		int i;
+
+		for (i = 0; i < res - 1; ++i)
+			printf("0x%02hhx ", block_data[i]);
+		printf("0x%02hhx\n", block_data[res - 1]);
+	} else {
+		printf("0x%0*x\n", size == I2C_SMBUS_WORD_DATA ? 4 : 2, res);
+	}
 
 	exit(0);
 }

-- 
Jean Delvare
SUSE L3 Support
