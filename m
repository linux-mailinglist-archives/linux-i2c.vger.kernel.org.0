Return-Path: <linux-i2c+bounces-5285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B9A94E0B3
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 11:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EFE1281A4A
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 09:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AC4383AB;
	Sun, 11 Aug 2024 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lzP3AHsc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D2038DDB
	for <linux-i2c@vger.kernel.org>; Sun, 11 Aug 2024 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723368863; cv=none; b=psBfKnsQJx9T8Vt9ElpQUJoV3/SHZvaahFAn+Lj4pVa9o2SkaLbo214ViRAvnVG8pKNH/4Hs7aZJOgFLLiIvMrbLlJwWdeGGcWbQ2WkaM42Vi8C/0Uv/pg2+Ogl6uI3uYbInbPOOwON8T+TBs/BkfXcrwWoQtBY4bz7rhHQLvy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723368863; c=relaxed/simple;
	bh=OcWYjyydcaukSic+5wAY9aVUnMeR7YkxmIXgaV/Cz5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TkaOBqli8WFI/BGcwMfYYM4a4AtiqIGxZgl1Ee1qgfCXoGsxMVNngRaz4qBWL0LJy8IKVDK9vLYNwEB011cwOAT2yXX1XmFD4kJ74eaFUjpabImnYPMQdQW9vUj1G2g1lygL1ncqZvwuSLLL4okM7/FbTQn0XCaRR6dOafjSg3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lzP3AHsc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=6Q7oz2LEBWcUqEA9+04R40fqXOxnh1ud7T8qewq+mfM=; b=lzP3AH
	scz0rAsA/Y6XabrkRDFtcBO9tHkgZQS6uBVrqZVHysmi3iF75i9yT6pA9l7OuYpn
	E7lSos2u5bv1KgUOLl1836vrK9Z74X/KWSSd0vHQkZLyBcbxKPffheP4BeVlvWQH
	GT924Bpw8KsDL3ItiECapP1oXMT/HXQIEBoYdQ8nQC/5oK45bHdxbqOve8zj7Xs5
	b3Y3NJOseKotFeJJMNdFQ9iqm+s82MhplnGk85wfqKaQEv/0SVjUQO3lO0FPyVAt
	9/XBi8tVjPpQe+pUUrsKfRGEH0gPku+rj7QU+KJXlNryAAu+qSerQucNGTNmDL4D
	7YSL/sZMfX16D5EQ==
Received: (qmail 1059959 invoked from network); 11 Aug 2024 11:34:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2024 11:34:16 +0200
X-UD-Smtp-Session: l3s3148p1@Cjt7FGUfRKEujnvj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools 2/2] i2cset: printing help is not an error
Date: Sun, 11 Aug 2024 11:34:11 +0200
Message-ID: <20240811093411.5694-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240811093411.5694-1-wsa+renesas@sang-engineering.com>
References: <20240811093411.5694-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check distinguishing the 'h' and '?' parameters is dead code. Found
by cppcheck:

i2cset.c:177:4: warning: Statements following noreturn function 'help()' will never be executed. [unreachableCode]

Add a parameter to help saying how it should exit. Remove a forward
declaration while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 tools/i2cset.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/tools/i2cset.c b/tools/i2cset.c
index dd4fdc2..aaf7faf 100644
--- a/tools/i2cset.c
+++ b/tools/i2cset.c
@@ -28,9 +28,7 @@
 #include "util.h"
 #include "../version.h"
 
-static void help(void) __attribute__ ((noreturn));
-
-static void help(void)
+static void __attribute__ ((noreturn)) help(int status)
 {
 	fprintf(stderr,
 		"Usage: i2cset [-f] [-y] [-m MASK] [-r] [-a] I2CBUS CHIP-ADDRESS DATA-ADDRESS [VALUE] ... [MODE]\n"
@@ -43,7 +41,7 @@ static void help(void)
 		"    i (I2C block data)\n"
 		"    s (SMBus block data)\n"
 		"    Append p for SMBus PEC\n");
-	exit(1);
+	exit(status);
 }
 
 static int check_funcs(int file, int size, int pec)
@@ -173,8 +171,7 @@ int main(int argc, char *argv[])
 		case 'a': all_addrs = 1; break;
 		case 'h':
 		case '?':
-			help();
-			exit(opt == '?');
+			help(opt == '?');
 		}
 	}
 
@@ -184,20 +181,20 @@ int main(int argc, char *argv[])
 	}
 
 	if (argc < optind + 3)
-		help();
+		help(1);
 
 	i2cbus = lookup_i2c_bus(argv[optind]);
 	if (i2cbus < 0)
-		help();
+		help(1);
 
 	address = parse_i2c_address(argv[optind+1], all_addrs);
 	if (address < 0)
-		help();
+		help(1);
 
 	daddress = strtol(argv[optind+2], &end, 0);
 	if (*end || daddress < 0 || daddress > 0xff) {
 		fprintf(stderr, "Error: Data address invalid!\n");
-		help();
+		help(1);
 	}
 
 	/* check for command/mode */
@@ -218,7 +215,7 @@ int main(int argc, char *argv[])
 		if (strlen(argv[argc-1]) > 2
 		    || (strlen(argv[argc-1]) == 2 && argv[argc-1][1] != 'p')) {
 			fprintf(stderr, "Error: Invalid mode '%s'!\n", argv[argc-1]);
-			help();
+			help(1);
 		}
 		switch (argv[argc-1][0]) {
 		case 'b': size = I2C_SMBUS_BYTE_DATA; break;
@@ -227,25 +224,25 @@ int main(int argc, char *argv[])
 		case 'i': size = I2C_SMBUS_I2C_BLOCK_DATA; break;
 		default:
 			fprintf(stderr, "Error: Invalid mode '%s'!\n", argv[argc-1]);
-			help();
+			help(1);
 		}
 		pec = argv[argc-1][1] == 'p';
 		if (size == I2C_SMBUS_BLOCK_DATA || size == I2C_SMBUS_I2C_BLOCK_DATA) {
 			if (pec && size == I2C_SMBUS_I2C_BLOCK_DATA) {
 				fprintf(stderr, "Error: PEC not supported for I2C block writes!\n");
-				help();
+				help(1);
 			}
 			if (maskp) {
 				fprintf(stderr, "Error: Mask not supported for block writes!\n");
-				help();
+				help(1);
 			}
 			if (argc > (int)sizeof(block) + optind + 4) {
 				fprintf(stderr, "Error: Too many arguments!\n");
-				help();
+				help(1);
 			}
 		} else if (argc != optind + 5) {
 			fprintf(stderr, "Error: Too many arguments!\n");
-			help();
+			help(1);
 		}
 	}
 
@@ -262,12 +259,12 @@ int main(int argc, char *argv[])
 		value = strtol(argv[optind+3], &end, 0);
 		if (*end || value < 0) {
 			fprintf(stderr, "Error: Data value invalid!\n");
-			help();
+			help(1);
 		}
 		if ((size == I2C_SMBUS_BYTE_DATA && value > 0xff)
 		    || (size == I2C_SMBUS_WORD_DATA && value > 0xffff)) {
 			fprintf(stderr, "Error: Data value out of range!\n");
-			help();
+			help(1);
 		}
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
@@ -276,11 +273,11 @@ int main(int argc, char *argv[])
 			value = strtol(argv[optind + len + 3], &end, 0);
 			if (*end || value < 0) {
 				fprintf(stderr, "Error: Data value invalid!\n");
-				help();
+				help(1);
 			}
 			if (value > 0xff) {
 				fprintf(stderr, "Error: Data value out of range!\n");
-				help();
+				help(1);
 			}
 			block[len] = value;
 		}
@@ -295,12 +292,12 @@ int main(int argc, char *argv[])
 		vmask = strtol(maskp, &end, 0);
 		if (*end || vmask == 0) {
 			fprintf(stderr, "Error: Data value mask invalid!\n");
-			help();
+			help(1);
 		}
 		if (((size == I2C_SMBUS_BYTE || size == I2C_SMBUS_BYTE_DATA)
 		     && vmask > 0xff) || vmask > 0xffff) {
 			fprintf(stderr, "Error: Data value mask out of range!\n");
-			help();
+			help(1);
 		}
 	}
 
-- 
2.43.0


