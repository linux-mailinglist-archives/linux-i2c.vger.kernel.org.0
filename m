Return-Path: <linux-i2c+bounces-5195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E5B94A6E3
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 13:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9001D2839E9
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 11:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7A31E2129;
	Wed,  7 Aug 2024 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SdzsUKqv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4AB1E4879
	for <linux-i2c@vger.kernel.org>; Wed,  7 Aug 2024 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723029735; cv=none; b=IoUTXU6SG3pMSpBs/UISEhwSoT5ywGXokHJivU2cU+0b7HAUJb/PHEG6LacLQ2FvXfbJqHg4nMmjQ5sMq3XzJ6K3WdP+z/U/qJGYVD80gTy0rO+EkaL/nwslRudWCp9PSCDoshBK1kA3ZLVBufnm+ydhqz4+mXUyRlJvUa0WbEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723029735; c=relaxed/simple;
	bh=TXUpAnOUjJqwoQnKw43vFt+zJY3mO5kwUL85GZBscCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SeTvW1x2vHUgEGAB2Jqbg7xD5dF1XSS3v4Cj/e2X1HgXQ6DH3+8bFJjGVA7dY1jeE66U4lpzF7+VtXwtvCczJhaA+aGQlDdVMsy47I6qTHXP6n88dFQIEL3W4RMJGm2GYo6dBue9Go87VNZxWvT1j/CXrHwneOhIWwngKJSf6h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SdzsUKqv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0RPzulUTc2mAMZlPz7mATiAg2I0fTQbWjUgdu6QFAJM=; b=SdzsUK
	qvilUGuAXnXUBBv6qsZdzGbwvsgD0SjUvza4zh8jO/pp+Cfx5+bQraSbJojzzkLe
	UK9UnnH1+it/k0aMiAoTLKtwmElF0dpf1q+rvJWiL+LLeu3wtxsvcw6Gs09x5jWI
	0i+ZY4LnW2gJBnVG7Efiax6DSguFHeHg1ji7sGCo3meSG5rj+CqW+0tTi7Z7ESyN
	vX9VWY+HKMzyQEamkQ4f05xjIdgfEQ4knP3BYjPkqevYhMbO12KkU8VWoStcowyF
	EB8QE6rnF05R9aqhRbe1GvR3RXmw6ebZKm6xgWavg0EmG+CdWB1yy91ukXNcDkaG
	L0zDT8MrixcS1k0Q==
Received: (qmail 534516 invoked from network); 7 Aug 2024 13:22:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2024 13:22:01 +0200
X-UD-Smtp-Session: l3s3148p1@Q7J6HhYfqswgAwDPXxLGAIH3oZkcU6AS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools 1/3] i2ctransfer: sort command line options and add to help text
Date: Wed,  7 Aug 2024 13:21:57 +0200
Message-ID: <20240807112159.14220-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807112159.14220-1-wsa+renesas@sang-engineering.com>
References: <20240807112159.14220-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the options in docs and code. Describe them in the help text.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 tools/i2ctransfer.8 | 32 ++++++++++++++++----------------
 tools/i2ctransfer.c | 18 ++++++++++++------
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/tools/i2ctransfer.8 b/tools/i2ctransfer.8
index c88ef64..88d5eb3 100644
--- a/tools/i2ctransfer.8
+++ b/tools/i2ctransfer.8
@@ -4,10 +4,10 @@ i2ctransfer \- send user-defined I2C messages in one transfer
 
 .SH SYNOPSIS
 .B i2ctransfer
+.RB [ -a ]
 .RB [ -f ]
-.RB [ -y ]
 .RB [ -v ]
-.RB [ -a ]
+.RB [ -y ]
 .I i2cbus desc
 .RI [ data ]
 .RI [ desc
@@ -15,10 +15,10 @@ i2ctransfer \- send user-defined I2C messages in one transfer
 .RI ...
 .br
 .B i2ctransfer
-.B -V
+.B -h
 .br
 .B i2ctransfer
-.B -h
+.B -V
 
 .SH DESCRIPTION
 .B i2ctransfer
@@ -40,6 +40,9 @@ This program helps you to create proper transfers for your needs.
 
 .SH OPTIONS
 .TP
+.B -a
+Allow using addresses between 0x00 - 0x07 and 0x78 - 0x7f. Not recommended.
+.TP
 .B -f
 Force access to the device even if it is already busy.
 By default,
@@ -51,13 +54,8 @@ It can also cause
 to silently write to the wrong register.
 So use at your own risk and only if you know what you're doing.
 .TP
-.B -y
-Disable interactive mode.
-By default,
-.B i2ctransfer
-will wait for a confirmation from the user before messing with the I2C bus.
-When this flag is used, it will perform the operation directly.
-This is mainly meant to be used in scripts.
+.B -h
+Display the help and exit.
 .TP
 .B -v
 Enable verbose output.
@@ -66,11 +64,13 @@ It will print infos about all messages sent, i.e. not only for read messages but
 .B -V
 Display the version and exit.
 .TP
-.B -h
-Display the help and exit.
-.TP
-.B -a
-Allow using addresses between 0x00 - 0x07 and 0x78 - 0x7f. Not recommended.
+.B -y
+Disable interactive mode.
+By default,
+.B i2ctransfer
+will wait for a confirmation from the user before messing with the I2C bus.
+When this flag is used, it will perform the operation directly.
+This is mainly meant to be used in scripts.
 
 .SH ARGUMENTS
 .PP
diff --git a/tools/i2ctransfer.c b/tools/i2ctransfer.c
index 85b70c3..15e774b 100644
--- a/tools/i2ctransfer.c
+++ b/tools/i2ctransfer.c
@@ -42,7 +42,13 @@ enum parse_state {
 static void help(void)
 {
 	fprintf(stderr,
-		"Usage: i2ctransfer [-f] [-y] [-v] [-V] [-a] I2CBUS DESC [DATA] [DESC [DATA]]...\n"
+		"Usage: i2ctransfer [OPTIONS] I2CBUS DESC [DATA] [DESC [DATA]]...\n"
+		"  OPTIONS: -a allow even reserved addresses\n"
+		"           -f force access even if address is marked used\n"
+		"           -h this help text\n"
+		"           -v verbose mode\n"
+		"           -V version info\n"
+		"           -y yes to all confirmations\n"
 		"  I2CBUS is an integer or an I2C bus name\n"
 		"  DESC describes the transfer in the form: {r|w}LENGTH[@address]\n"
 		"    1) read/write-flag 2) LENGTH (range 0-65535, or '?')\n"
@@ -141,15 +147,15 @@ int main(int argc, char *argv[])
 		msgs[i].buf = NULL;
 
 	/* handle (optional) flags first */
-	while ((opt = getopt(argc, argv, "Vafhvy")) != -1) {
+	while ((opt = getopt(argc, argv, "afhvVy")) != -1) {
 		switch (opt) {
-		case 'V': version = 1; break;
-		case 'v': verbose = 1; break;
+		case 'a': all_addrs = 1; break;
 		case 'f': force = 1; break;
+		case 'v': verbose = 1; break;
+		case 'V': version = 1; break;
 		case 'y': yes = 1; break;
-		case 'a': all_addrs = 1; break;
-		case 'h':
 		case '?':
+		case 'h':
 			help();
 			exit(opt == '?');
 		}
-- 
2.43.0


