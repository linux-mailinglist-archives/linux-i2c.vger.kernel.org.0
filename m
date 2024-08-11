Return-Path: <linux-i2c+bounces-5284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B194E0B4
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 11:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B690B2130E
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 09:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D75B2AE7C;
	Sun, 11 Aug 2024 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KgayrXM2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4338DCC
	for <linux-i2c@vger.kernel.org>; Sun, 11 Aug 2024 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723368863; cv=none; b=JrQGKLwGyQi36p2amS/eAjc/K8NijsXgkz3p06+TRvTIe1unPczR7ph6CozMipiEcheIszOgNSq6EnPbsBxUih78UTekh3kxUwZi6oy15qS5Co/ims1jeBDaWCLPrbEbSw+2f70OBysg6DLPzRLtd710FUsGpm2Zf0h5I4r9BFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723368863; c=relaxed/simple;
	bh=RDuB4dXmqqaeSKOMqyW3t15SDsSeAaEDgl/nUP6Iudw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HNqngyJP1fWcT6+LdpVejt3xd+w3rk11Gmg+196TaoHUsMFMb3xpqhdwIm6C6udA2+wtJ20R9r97LcXhxv33t5I4L+GwrxOZL4Cd7hd4NpRMfRVyHQ1jPWLGIW0z2QfqMFRD/7kR+ne/j+b/pLGuHe26Lq9P/HPWDJsKDvvufA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KgayrXM2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Dc4xm7NCpCxCxI
	3EkPd67guzmM5JZuO7F9CsXvrb1+w=; b=KgayrXM2ntrDnd3gZMjN+qYc4Md4Bp
	YCLzTOCq5VDeKOgVZJR78Wj7yzFFw945nLbsedTY4hlJlEy7dPjF3xCrVPjxGG0g
	291YyEuUhQCibMYPrBuIMgr1cQkL2gBfpyfEBLRnKUWLDLclrVIFXvI9rR+Fs+Hh
	l9PkwC58whUkUhItyWtP+AxoLXAIgBDY3rp83vWK41RoGYVMvmuXcJ67i1+2JerF
	FXAYgm75OpdnR7DxmDmDOvdyOhmoMral+gaadRBBVdEFhjkCMUNVLq17WV5en4VO
	A5jBbIZzpj1307pT/Uwkz4WBsU8+eN0sxZtzNUY0occIBkwrkpBQwjVw==
Received: (qmail 1059940 invoked from network); 11 Aug 2024 11:34:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2024 11:34:15 +0200
X-UD-Smtp-Session: l3s3148p1@WQRyFGUfNKEujnvj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools 1/2] i2cget: printing help is not an error
Date: Sun, 11 Aug 2024 11:34:10 +0200
Message-ID: <20240811093411.5694-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check distinguishing the 'h' and '?' parameters is dead code. Found
by cppcheck:

i2cget.c:193:4: warning: Statements following noreturn function 'help()' will never be executed. [unreachableCode]

Add a parameter to help saying how it should exit. Remove a forward
declaration while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 tools/i2cget.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tools/i2cget.c b/tools/i2cget.c
index b28ab38..17d78bf 100644
--- a/tools/i2cget.c
+++ b/tools/i2cget.c
@@ -31,9 +31,7 @@
 #include "util.h"
 #include "../version.h"
 
-static void help(void) __attribute__ ((noreturn));
-
-static void help(void)
+static void __attribute__ ((noreturn)) help(int status)
 {
 	fprintf(stderr,
 		"Usage: i2cget [-f] [-y] [-a] I2CBUS CHIP-ADDRESS [DATA-ADDRESS [MODE [LENGTH]]]\n"
@@ -48,7 +46,7 @@ static void help(void)
 		"    Append p for SMBus PEC\n"
 		"  LENGTH is the I2C block data length (between 1 and %d, default %d)\n",
 		I2C_SMBUS_BLOCK_MAX, I2C_SMBUS_BLOCK_MAX);
-	exit(1);
+	exit(status);
 }
 
 static int check_funcs(int file, int size, int daddress, int pec)
@@ -189,8 +187,7 @@ int main(int argc, char *argv[])
 		case 'a': all_addrs = 1; break;
 		case 'h':
 		case '?':
-			help();
-			exit(opt == '?');
+			help(opt == '?');
 		}
 	}
 
@@ -200,22 +197,22 @@ int main(int argc, char *argv[])
 	}
 
 	if (argc < optind + 2)
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
 
 	if (argc > optind + 2) {
 		size = I2C_SMBUS_BYTE_DATA;
 		daddress = strtol(argv[optind+2], &end, 0);
 		if (*end || daddress < 0 || daddress > 0xff) {
 			fprintf(stderr, "Error: Data address invalid!\n");
-			help();
+			help(1);
 		}
 	} else {
 		size = I2C_SMBUS_BYTE;
@@ -231,24 +228,24 @@ int main(int argc, char *argv[])
 		case 'i': size = I2C_SMBUS_I2C_BLOCK_DATA; break;
 		default:
 			fprintf(stderr, "Error: Invalid mode!\n");
-			help();
+			help(1);
 		}
 		pec = argv[optind+3][1] == 'p';
 		if (size == I2C_SMBUS_I2C_BLOCK_DATA && pec) {
 			fprintf(stderr, "Error: PEC not supported for I2C block data!\n");
-			help();
+			help(1);
 		}
 	}
 
 	if (argc > optind + 4) {
 		if (size != I2C_SMBUS_I2C_BLOCK_DATA) {
 			fprintf(stderr, "Error: Length only valid for I2C block data!\n");
-			help();
+			help(1);
 		}
 		length = strtol(argv[optind+4], &end, 0);
 		if (*end || length < 1 || length > I2C_SMBUS_BLOCK_MAX) {
 			fprintf(stderr, "Error: Length invalid!\n");
-			help();
+			help(1);
 		}
 	} else {
 		length = I2C_SMBUS_BLOCK_MAX;
-- 
2.43.0


