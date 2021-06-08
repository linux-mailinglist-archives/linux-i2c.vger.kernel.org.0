Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3B739FAC4
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 17:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbhFHPeX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 11:34:23 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:52646 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbhFHPeW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 11:34:22 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0BE4921997;
        Tue,  8 Jun 2021 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YDufNYGZuYfdbDyWs/YJsw8RxtOSF/7gyGi+HITIuV0=;
        b=E0nXkVMxe+nSn+QdmnQIh4MgU4eceNF++AhTO6s7pcg1NJAM/W2WXTar6SHGjKBx3bWi6t
        wPOM5sA45I90FMCPngobVt1/IvpPYUAoB8wjHyK9GYW+TCWIilM+H+THG/0UM7Rc6zBjJ3
        Q1ld+Kc0VWNNs0xdrFqo/koJGPRbEMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166349;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YDufNYGZuYfdbDyWs/YJsw8RxtOSF/7gyGi+HITIuV0=;
        b=MkW+sFrwYF5MbxroYY3lVLHqIJlau+1bDKotR4Kdrl8FfH/Lkvw9huh2AODrbq+OBvgaYo
        dDMfajgVaLdSn3DA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id D0CF5118DD;
        Tue,  8 Jun 2021 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YDufNYGZuYfdbDyWs/YJsw8RxtOSF/7gyGi+HITIuV0=;
        b=E0nXkVMxe+nSn+QdmnQIh4MgU4eceNF++AhTO6s7pcg1NJAM/W2WXTar6SHGjKBx3bWi6t
        wPOM5sA45I90FMCPngobVt1/IvpPYUAoB8wjHyK9GYW+TCWIilM+H+THG/0UM7Rc6zBjJ3
        Q1ld+Kc0VWNNs0xdrFqo/koJGPRbEMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166349;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YDufNYGZuYfdbDyWs/YJsw8RxtOSF/7gyGi+HITIuV0=;
        b=MkW+sFrwYF5MbxroYY3lVLHqIJlau+1bDKotR4Kdrl8FfH/Lkvw9huh2AODrbq+OBvgaYo
        dDMfajgVaLdSn3DA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id O94eMYyNv2AuNQAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Tue, 08 Jun 2021 15:32:28 +0000
Date:   Tue, 8 Jun 2021 17:32:28 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 7/7] i2cdump: Remove support for SMBus block mode
Message-ID: <20210608173228.6cd2284c@endymion>
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

Users can turn to i2cget for this feature.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/i2cdump.8 |    7 ++--
 tools/i2cdump.c |   81 +++++++++++---------------------------------------------
 2 files changed, 20 insertions(+), 68 deletions(-)

--- i2c-tools.orig/tools/i2cdump.8	2021-06-08 17:13:32.294526703 +0200
+++ i2c-tools/tools/i2cdump.8	2021-06-08 17:13:50.600778075 +0200
@@ -51,8 +51,8 @@ of the busses listed by \fIi2cdetect -l\
 address to be scanned on that bus, and is an integer between 0x08 and 0x77.
 .PP
 The \fImode\fR parameter, if specified, is one of the letters \fBb\fP, \fBw\fP,
-\fBs\fP, or \fBi\fP, corresponding to a read size of a single byte, a 16-bit
-word, an SMBus block, an I2C block, respectively. The \fBc\fP mode is a
+or \fBi\fP, corresponding to a read size of a single byte, a 16-bit
+word, an I2C block, respectively. The \fBc\fP mode is a
 little different, it reads all bytes consecutively, and is useful for chips that
 have an address auto-increment feature, such as EEPROMs. The \fBW\fP mode is
 also special, it is similar to \fBw\fP except that a read command will only
@@ -112,8 +112,7 @@ To report bugs or send fixes, please wri
 <linux-i2c@vger.kernel.org> with Cc to the current maintainer:
 Jean Delvare <jdelvare@suse.de>.
 
-SMBus block mode is deprecated and will be removed in a future version
-of this tool.
+SMBus block mode used to be supported by this tool.
 Please use \fIi2cget\fR instead.
 
 .SH SEE ALSO
--- i2c-tools.orig/tools/i2cdump.c	2021-06-08 17:13:21.787382423 +0200
+++ i2c-tools/tools/i2cdump.c	2021-06-08 17:13:33.613544815 +0200
@@ -43,7 +43,6 @@ static void help(void)
 		"    b (byte, default)\n"
 		"    w (word)\n"
 		"    W (word on even register addresses)\n"
-		"    s (SMBus block, deprecated)\n"
 		"    i (I2C block)\n"
 		"    c (consecutive byte)\n"
 		"    Append p for SMBus PEC\n");
@@ -86,13 +85,6 @@ static int check_funcs(int file, int siz
 		}
 		break;
 
-	case I2C_SMBUS_BLOCK_DATA:
-		if (!(funcs & I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
-			fprintf(stderr, MISSING_FUNC_FMT, "SMBus block read");
-			return -1;
-		}
-		break;
-
 	case I2C_SMBUS_I2C_BLOCK_DATA:
 		if (!(funcs & I2C_FUNC_SMBUS_READ_I2C_BLOCK)) {
 			fprintf(stderr, MISSING_FUNC_FMT, "I2C block read");
@@ -116,7 +108,7 @@ int main(int argc, char *argv[])
 	int i, j, res, i2cbus, address, size, file;
 	int bank = 0, bankreg = 0x4E, old_bank = 0;
 	char filename[20];
-	int block[256], s_length = 0;
+	int block[256];
 	int pec = 0, even = 0;
 	int flags = 0;
 	int force = 0, yes = 0, version = 0, all_addrs = 0;
@@ -180,10 +172,9 @@ int main(int argc, char *argv[])
 		size = I2C_SMBUS_WORD_DATA;
 		even = 1;
 	} else if (!strncmp(argv[flags+3], "s", 1)) {
-		size = I2C_SMBUS_BLOCK_DATA;
 		fprintf(stderr,
-			"SMBus Block mode is deprecated, please use i2cget instead\n");
-		pec = argv[flags+3][1] == 'p';
+			"SMBus Block mode is no longer supported, please use i2cget instead\n");
+		exit(1);
 	} else if (!strncmp(argv[flags+3], "c", 1)) {
 		size = I2C_SMBUS_BYTE;
 		pec = argv[flags+3][1] == 'p';
@@ -208,16 +199,10 @@ int main(int argc, char *argv[])
 			help();
 			exit(1);
 		}
-		if (size == I2C_SMBUS_BLOCK_DATA
-		 && (bank < 0 || bank > 0xff)) {
-			fprintf(stderr, "Error: block command out of range!\n");
-			help();
-			exit(1);
-		}
 
 		if (argc > flags + 5) {
 			bankreg = strtol(argv[flags+5], &end, 0);
-			if (*end || size == I2C_SMBUS_BLOCK_DATA) {
+			if (*end) {
 				fprintf(stderr, "Error: Invalid bank register "
 					"number!\n");
 				help();
@@ -250,16 +235,7 @@ int main(int argc, char *argv[])
 		}
 
 		/* Check mode constraints */
-		switch (size) {
-		case I2C_SMBUS_BYTE:
-		case I2C_SMBUS_BYTE_DATA:
-		case I2C_SMBUS_I2C_BLOCK_DATA:
-			break;
-		case I2C_SMBUS_WORD_DATA:
-			if (!even || (!(first%2) && last%2))
-				break;
-			/* Fall through */
-		default:
+		if (size == I2C_SMBUS_WORD_DATA && even && (first%2 || !(last%2))) {
 			fprintf(stderr,
 				"Error: Range parameter not compatible with selected mode!\n");
 			exit(1);
@@ -286,7 +262,6 @@ int main(int argc, char *argv[])
 
 		fprintf(stderr, "I will probe file %s, address 0x%x, mode "
 			"%s\n", filename, address,
-			size == I2C_SMBUS_BLOCK_DATA ? "smbus block" :
 			size == I2C_SMBUS_I2C_BLOCK_DATA ? "i2c block" :
 			size == I2C_SMBUS_BYTE ? "byte consecutive read" :
 			size == I2C_SMBUS_BYTE_DATA ? "byte" : "word");
@@ -296,12 +271,8 @@ int main(int argc, char *argv[])
 			fprintf(stderr, "Only probing even register "
 				"addresses.\n");
 		if (bank) {
-			if (size == I2C_SMBUS_BLOCK_DATA)
-				fprintf(stderr, "Using command 0x%02x.\n",
-					bank);
-			else
-				fprintf(stderr, "Probing bank %d using bank "
-					"register 0x%02x.\n", bank, bankreg);
+			fprintf(stderr, "Probing bank %d using bank "
+				"register 0x%02x.\n", bank, bankreg);
 		}
 		if (range) {
 			fprintf(stderr,
@@ -318,7 +289,7 @@ int main(int argc, char *argv[])
 	}
 
 	/* See Winbond w83781d data sheet for bank details */
-	if (bank && size != I2C_SMBUS_BLOCK_DATA) {
+	if (bank) {
 		res = i2c_smbus_read_byte_data(file, bankreg);
 		if (res >= 0) {
 			old_bank = res;
@@ -334,25 +305,15 @@ int main(int argc, char *argv[])
 	/* handle all but word data */
 	if (size != I2C_SMBUS_WORD_DATA || even) {
 		/* do the block transaction */
-		if (size == I2C_SMBUS_BLOCK_DATA
-		 || size == I2C_SMBUS_I2C_BLOCK_DATA) {
+		if (size == I2C_SMBUS_I2C_BLOCK_DATA) {
 			unsigned char cblock[288];
 
-			if (size == I2C_SMBUS_BLOCK_DATA) {
-				res = i2c_smbus_read_block_data(file, bank,
-				      cblock);
-				/* Remember returned block length for a nicer
-				   display later */
-				s_length = res;
-				last = res - 1;
-			} else {
-				for (res = first; res <= last; res += i) {
-					i = i2c_smbus_read_i2c_block_data(file,
-						res, 32, cblock + res);
-					if (i <= 0) {
-						res = i;
-						break;
-					}
+			for (res = first; res <= last; res += i) {
+				i = i2c_smbus_read_i2c_block_data(file,
+					res, 32, cblock + res);
+				if (i <= 0) {
+					res = i;
+					break;
 				}
 			}
 			if (res <= 0) {
@@ -376,8 +337,6 @@ int main(int argc, char *argv[])
 		printf("     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f"
 		       "    0123456789abcdef\n");
 		for (i = 0; i < 256; i+=16) {
-			if (size == I2C_SMBUS_BLOCK_DATA && i >= s_length)
-				break;
 			if (i/16 < first/16)
 				continue;
 			if (i/16 > last/16)
@@ -415,10 +374,7 @@ int main(int argc, char *argv[])
 				} else
 					res = block[i+j];
 
-				if (size == I2C_SMBUS_BLOCK_DATA
-				 && i+j >= s_length) {
-					printf("   ");
-				} else if (res < 0) {
+				if (res < 0) {
 					printf("XX ");
 					if (size == I2C_SMBUS_WORD_DATA)
 						printf("XX ");
@@ -433,9 +389,6 @@ int main(int argc, char *argv[])
 			printf("   ");
 
 			for (j = 0; j < 16; j++) {
-				if (size == I2C_SMBUS_BLOCK_DATA
-				 && i+j >= s_length)
-					break;
 				/* Skip unwanted registers */
 				if (i+j < first || i+j > last) {
 					printf(" ");
@@ -483,7 +436,7 @@ int main(int argc, char *argv[])
 			printf("\n");
 		}
 	}
-	if (bank && size != I2C_SMBUS_BLOCK_DATA) {
+	if (bank) {
 		i2c_smbus_write_byte_data(file, bankreg, old_bank);
 	}
 	exit(0);

-- 
Jean Delvare
SUSE L3 Support
