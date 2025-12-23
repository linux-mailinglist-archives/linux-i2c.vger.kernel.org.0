Return-Path: <linux-i2c+bounces-14733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB1CD96CC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 14:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B35AA300DB8D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 13:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9904E2F616C;
	Tue, 23 Dec 2025 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rptBqTIm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2FE334C20
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496178; cv=none; b=V0CnDOoKb9jSe4ZCjb9P15k263QPI7ORnnnR+gbQWB2x4I4f5SfIVe16Ci7t+c9xRElUrZGy/v7eyZo8seYqr5w+kCZfsxY8vxCnqmdC/6WL2v5szNoMiETNVTszdKFOKL3m1XoxkQAWDs7EuO4aOHdxwqnVE2ayLPKyiQcHukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496178; c=relaxed/simple;
	bh=kuY4fCQ5H1fzznT7laMzOen2TAmIsB4nh4zgpnY49NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rqtCCK61ICyxA8KGAt7YuPz95Xt6oLk+DycaFfEKmBKkT2D/kloWJkNkz78jaFFcwY67ceiSB2aFA0noYnZyVFbwypZPJgdDa4du6IDFMfWzWIzG6prLaRweb8mbwlVa0zw23QjBKKPVDP4oMc69mfYHBBEh/Kw2r89svnOnPcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rptBqTIm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 599761A23A7
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 13:22:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A24860716;
	Tue, 23 Dec 2025 13:22:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EFD610AB0AA5;
	Tue, 23 Dec 2025 14:22:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766496173; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w3XeT/PkJBG/FENqfsCItJm1/AdbkiY+2zNAbxPoxSs=;
	b=rptBqTImm+m7orLF54+k9tH1813r98S/MZ5jhVDIvdV2pB6KG39neOQa1ES2YbiOUP068I
	mYIibOqUzIVhS8xKr92zcnBTQT5hdQcUU4Y9P4hawvsL3p1idGhkFfyE3tQDdY3+rVyHqu
	pSNRmrUyNNvlXIF65DGBkKL2ioYyjB68XWq2iQZXcc6Khwz+lysxAbzlQvYqFSBN3wcpWd
	T5PMGCqohsBNCt/8yKScaUZhCpG7NbNMwntLEQYus/XWZ1bhZIuSnbxmUyGIvDOz1IVH7x
	rePsw1D6VqrSIU02Wc2CkFn7/oC3C3UK/tmEzzIHCmkgA1v/GMJjDEkZSdlKoQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 14:22:43 +0100
Subject: [PATCH i2c-tools v2 2/2] i2ctransfer: Add optional message
 modifier flags
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-msg-flags-v2-2-8d934a4366e2@bootlin.com>
References: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
In-Reply-To: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Allow setting protocol mangling and repeated start elision flags of an i2c
message with a set of optional command-line flags. These optional flags
are parsed at the beginning of the DESC field up to a read or write flag.

For example, to read one byte from address 0x50 followed by a stop, then
write two bytes at 0x54 on bus 0, one would call i2ctransfer as follow:

    i2ctransfer 0 pr1@0x50 w2@0x54 0x10 0x20

Since the new flags are optional, this patch preserves the compatibility
of the i2ctransfer syntax.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 tools/i2ctransfer.8 | 26 +++++++++++++++++++++++++-
 tools/i2ctransfer.c | 34 +++++++++++++++++++++++++---------
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/tools/i2ctransfer.8 b/tools/i2ctransfer.8
index 4bdf436..45c744d 100644
--- a/tools/i2ctransfer.8
+++ b/tools/i2ctransfer.8
@@ -96,8 +96,11 @@ The number of blocks is limited by the Linux Kernel and defined by I2C_RDWR_IOCT
 .I desc
 blocks are composed like this:
 
-.I {r|w}<length_of_message>[@address]
+.I [inpst]{r|w}<length_of_message>[@address]
 
+.TP
+.B [inpst]
+specifies optional MESSAGE MODIFIER FLAGS. See the section below for details.
 .TP
 .B {r|w}
 specifies if the message is read or write
@@ -141,6 +144,27 @@ decrease value by 1 until end of message (i.e. 0xff- means 0xff, 0xfe, 0xfd, ...
 p
 use value as seed for an 8 bit pseudo random sequence (i.e. 0p means 0x00, 0x50, 0xb0, ...)
 
+.SH "MESSAGE MODIFIER FLAGS"
+.PP
+These optional flags can be used to change the handling of a message when it is sent on the bus.
+Note that not all flags (or any) may be supported by your particular hardware.
+
+.TP
+.B i
+ignore NACK from client, treat them as ACK.
+.TP
+.B n
+in a read message, master ACK/NACK bit is skipped.
+.TP
+.B p
+emit a STOP after the message.
+.TP
+.B s
+skip repeated start.
+.TP
+.B t
+toggle read/write bit.
+
 .SH EXAMPLES
 .PP
 On bus 0, from an EEPROM at address 0x50, read 8 byte from offset 0x64
diff --git a/tools/i2ctransfer.c b/tools/i2ctransfer.c
index 4db98e3..921ffaa 100644
--- a/tools/i2ctransfer.c
+++ b/tools/i2ctransfer.c
@@ -52,9 +52,16 @@ static void help(void)
 		"           -V version info\n"
 		"           -y yes to all confirmations\n"
 		"  I2CBUS is an integer or an I2C bus name\n"
-		"  DESC describes the transfer in the form: {r|w}LENGTH[@address]\n"
-		"    1) read/write-flag 2) LENGTH (range 0-65535, or '?')\n"
-		"    3) I2C address (use last one if omitted)\n"
+		"  DESC describes the transfer in the form: [inpst]{r|w}LENGTH[@address]\n"
+		"    1) optional message modifier flags\n"
+		"       i: ignore NACK from client\n"
+		"       n: no master ACK/NACK bit in a read message\n"
+		"       p: emit a STOP after the message\n"
+		"       s: skip repeated start\n"
+		"       t: toggle read/write bit\n"
+		"    2) mandatory read/write flag\n"
+		"    3) LENGTH (range 0-65535, or '?')\n"
+		"    4) I2C address (use last one if omitted)\n"
 		"  DATA are LENGTH bytes for a write message. They can be shortened by a suffix:\n"
 		"    = (keep value constant until LENGTH)\n"
 		"    + (increase value by 1 until LENGTH)\n"
@@ -202,12 +209,21 @@ int main(int argc, char *argv[])
 		case PARSE_GET_DESC:
 			flags = 0;
 
-			switch (*arg_ptr++) {
-			case 'r': flags |= I2C_M_RD; break;
-			case 'w': break;
-			default:
-				fprintf(stderr, "Error: Invalid direction\n");
-				goto err_out_with_arg;
+			for (int done = 0; !done; ) {
+				switch (*arg_ptr++) {
+				/* optional flags */
+				case 'i': flags |= I2C_M_IGNORE_NAK; break;
+				case 'n': flags |= I2C_M_NO_RD_ACK; break;
+				case 'p': flags |= I2C_M_STOP; break;
+				case 's': flags |= I2C_M_NOSTART; break;
+				case 't': flags |= I2C_M_REV_DIR_ADDR; break;
+				/* mandatory flags */
+				case 'r': flags |= I2C_M_RD; done = 1; break;
+				case 'w': done = 1; break;
+				default:
+					fprintf(stderr, "Error: Invalid flag\n");
+					goto err_out_with_arg;
+				}
 			}
 
 			if (*arg_ptr == '?') {

-- 
2.52.0


