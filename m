Return-Path: <linux-i2c+bounces-5193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05394A6E0
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 13:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B58D1C215D0
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 11:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4161D1E4EE5;
	Wed,  7 Aug 2024 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="atlznK3e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F341E3CA9
	for <linux-i2c@vger.kernel.org>; Wed,  7 Aug 2024 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723029734; cv=none; b=i9u1qxbkLU5kfqlc0olOLYQEbU4nLvMmmHX56VbAogBh4Y0dDuSGaGYsoEgzstY8Z7RtCP0cfUifvSctnPEMWHBCFElRBUcmyBlP5/6Z18SpN0ZZ0S3ucCizp7t/Hp+7DlN7hZeWcPYntBvpmabOtmh+/wSBTn5xlQGMNbJF0q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723029734; c=relaxed/simple;
	bh=RL2Kdpjxh/6tm8mA7lCbMT3LlrbbJpNEflhEsjatbMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ea54a2g0tupRHfVJYN8V0eH0wQGMcZgoPQBen8k7XvEjCaoysZVelDi3a7UM+2/AxyyqBNyfvbuQvfOLlOMKua4KlfWA5e40auO36AOLxgosR4u2MYKsoW00UrZ1TgRpd6TI0W5zxIqvO0VbPeqXueTxut/hN/vwBhTk4GfbTcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=atlznK3e; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ius/u1ssY9is3wNke9UO81KNtegVaYpnlYlTvxwlqsc=; b=atlznK
	3e93otrzhU+hpTSW2wXvqPcnQjk8Umc7PvvTaCqyxmVSxueBH/Bmptn5OBBGKHMe
	FR1nbv9VEivJUh4b6i5Go654SSt3s29WVKaxB5n1/b1fZxQztqh8nuqLLHfjpBhw
	JxW5CLYMsoQ7wfPaUhfDgAPd292PO3jDsoe+UYc3HQdKIYtZR1Wtd0RGi17sHvpm
	HnmhJVvC2GHHyNPpL5PX8NnqM30YM+YSjETFMnGaUGA9doAPjpnJuVE1VYBWjUG+
	6+XatYVqx9KJ72xWf769j9gC1812m4iuuMqD7NARiz+d7niCp2wnp1ckTAHdlPkA
	BZ4MzcIcaDIF2ZtQ==
Received: (qmail 534536 invoked from network); 7 Aug 2024 13:22:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2024 13:22:02 +0200
X-UD-Smtp-Session: l3s3148p1@wXmBHhYfrswgAwDPXxLGAIH3oZkcU6AS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools 2/3] i2ctransfer: add option to print binary data
Date: Wed,  7 Aug 2024 13:21:58 +0200
Message-ID: <20240807112159.14220-3-wsa+renesas@sang-engineering.com>
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

Useful to pipe data to other commands for further inspection. Or to just
print out ASCII responses.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 tools/i2ctransfer.8 |  8 ++++++++
 tools/i2ctransfer.c | 31 ++++++++++++++++++++++---------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/tools/i2ctransfer.8 b/tools/i2ctransfer.8
index 88d5eb3..4bdf436 100644
--- a/tools/i2ctransfer.8
+++ b/tools/i2ctransfer.8
@@ -5,6 +5,7 @@ i2ctransfer \- send user-defined I2C messages in one transfer
 .SH SYNOPSIS
 .B i2ctransfer
 .RB [ -a ]
+.RB [ -b ]
 .RB [ -f ]
 .RB [ -v ]
 .RB [ -y ]
@@ -43,6 +44,13 @@ This program helps you to create proper transfers for your needs.
 .B -a
 Allow using addresses between 0x00 - 0x07 and 0x78 - 0x7f. Not recommended.
 .TP
+.B -b
+Print data from read messages as binary data. Disables
+.I -v
+(verbose). Useful for piping into a pretty printing tool like
+.B hexdump
+or for redirecting into a file to be analyzed later.
+.TP
 .B -f
 Force access to the device even if it is already busy.
 By default,
diff --git a/tools/i2ctransfer.c b/tools/i2ctransfer.c
index 15e774b..a7bbbaa 100644
--- a/tools/i2ctransfer.c
+++ b/tools/i2ctransfer.c
@@ -38,12 +38,14 @@ enum parse_state {
 #define PRINT_READ_BUF	(1 << 1)
 #define PRINT_WRITE_BUF	(1 << 2)
 #define PRINT_HEADER	(1 << 3)
+#define PRINT_BINARY	(1 << 4)
 
 static void help(void)
 {
 	fprintf(stderr,
 		"Usage: i2ctransfer [OPTIONS] I2CBUS DESC [DATA] [DESC [DATA]]...\n"
 		"  OPTIONS: -a allow even reserved addresses\n"
+		"           -b print read data as binary, disables -v\n"
 		"           -f force access even if address is marked used\n"
 		"           -h this help text\n"
 		"           -v verbose mode\n"
@@ -106,12 +108,16 @@ static void print_msgs(struct i2c_msg *msgs, __u32 nmsgs, unsigned flags)
 		}
 
 		if (len && print_buf) {
-			if (flags & PRINT_HEADER)
-				fprintf(output, ", buf ");
-			for (j = 0; j < len - 1; j++)
-				fprintf(output, "0x%02x ", msgs[i].buf[j]);
-			/* Print final byte with newline */
-			fprintf(output, "0x%02x\n", msgs[i].buf[j]);
+			if (flags & PRINT_BINARY) {
+				fwrite(msgs[i].buf, 1, len, output);
+			} else {
+				if (flags & PRINT_HEADER)
+					fprintf(output, ", buf ");
+				for (j = 0; j < len - 1; j++)
+					fprintf(output, "0x%02x ", msgs[i].buf[j]);
+				/* Print final byte with newline */
+				fprintf(output, "0x%02x\n", msgs[i].buf[j]);
+			}
 		} else if (flags & PRINT_HEADER) {
 			fprintf(output, "\n");
 		}
@@ -138,7 +144,7 @@ int main(int argc, char *argv[])
 {
 	char filename[20];
 	int i2cbus, address = -1, file, opt, arg_idx, nmsgs = 0, nmsgs_sent, i;
-	int force = 0, yes = 0, version = 0, verbose = 0, all_addrs = 0;
+	int force = 0, yes = 0, version = 0, verbose = 0, all_addrs = 0, binary = 0;
 	struct i2c_msg msgs[I2C_RDRW_IOCTL_MAX_MSGS];
 	enum parse_state state = PARSE_GET_DESC;
 	unsigned buf_idx = 0;
@@ -147,9 +153,10 @@ int main(int argc, char *argv[])
 		msgs[i].buf = NULL;
 
 	/* handle (optional) flags first */
-	while ((opt = getopt(argc, argv, "afhvVy")) != -1) {
+	while ((opt = getopt(argc, argv, "abfhvVy")) != -1) {
 		switch (opt) {
 		case 'a': all_addrs = 1; break;
+		case 'b': binary = 1; break;
 		case 'f': force = 1; break;
 		case 'v': verbose = 1; break;
 		case 'V': version = 1; break;
@@ -326,6 +333,7 @@ int main(int argc, char *argv[])
 
 	if (yes || confirm(filename, msgs, nmsgs)) {
 		struct i2c_rdwr_ioctl_data rdwr;
+		unsigned print_flags = PRINT_READ_BUF;
 
 		rdwr.msgs = msgs;
 		rdwr.nmsgs = nmsgs;
@@ -337,7 +345,12 @@ int main(int argc, char *argv[])
 			fprintf(stderr, "Warning: only %d/%d messages were sent\n", nmsgs_sent, nmsgs);
 		}
 
-		print_msgs(msgs, nmsgs_sent, PRINT_READ_BUF | (verbose ? PRINT_HEADER | PRINT_WRITE_BUF : 0));
+		if (binary)
+			print_flags |= PRINT_BINARY;
+		else if (verbose)
+			print_flags |= PRINT_HEADER | PRINT_WRITE_BUF;
+
+		print_msgs(msgs, nmsgs_sent, print_flags);
 	}
 
 	close(file);
-- 
2.43.0


