Return-Path: <linux-i2c+bounces-14337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A09AC91B24
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 11:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFD943A87FC
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 10:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0536A2F28E2;
	Fri, 28 Nov 2025 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LaEGJYOm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472893054D0
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326555; cv=none; b=IQbJg3DU0S52kwsOf6ApCw1l90TdZ1oRlWBnig467J4SO22/qNJu2a8gZBnBWJiU3Yg00iGLjmgvLP9ShVHs98G9wyDwz8RDkwDLMzK5siBiXjGy/8rWZxXbPHXTJYsewE2GksNad1cTyu8oHL4qmsNTOq+LMJTEhBg6WOY70EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326555; c=relaxed/simple;
	bh=NhQrR0foFhn1D711AhPwnlARZ7bmyIub/tVD7Ce0e5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=huIXVsWVQPQ2D6pqolgUphHy9VV09VAzhwz4MhvP+N9VTtGTobe6V5UozP1cMFuLjU7AYK/42zMkNBrJNvKD13uCXMenNDhFY2ZxvWde0WJ46GK3H8XE6LVWMpxJVjItMSy6bUENvNoxCA3zO2qpIJOTZ/aZNJFE1Ru93dFK25E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LaEGJYOm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DFD9AC16A3F
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 10:42:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA64160706;
	Fri, 28 Nov 2025 10:42:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13E5A103C8F8C;
	Fri, 28 Nov 2025 11:42:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764326551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5IjsXDx1P/fCwIZ0OfJ0sbEfYZwZWy84wgJtdcw07VI=;
	b=LaEGJYOmqsF4uk5D3fn85HMFP1aVFbbv2qldSyUIWIBXGfryw2OkZs/UwUCb6jrH2epmV3
	JDBMZOHR+614hlSjSBXXVsEzbJ1THrBe9JhQvAuxEAY9MGzzskUow5xca8T/bjyXARt6tp
	xsohJJb8Y05nxo6MSI/BkZsv0m4Ph9HcBy0vEkmlRB1LcZmscQoDNzpNRo99nqp6uUFUQh
	sAAyThL1K40mHtKp1Mn/EbN0pb0yKtEvBihZsWcKzCvtRnX6tLrDC8R0FHBxAGKxzYG+Ny
	p+TBVm249mzgWQshwNya6f+Dqi2H1bEKBpdNEdtTQmrHMv5CQdp86VYMNycxsg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 28 Nov 2025 11:40:10 +0100
Subject: [PATCH i2c-tools 2/2] i2ctransfer: Add optional message modifier
 flags
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251128-msg-flags-v1-2-6353f26fa6bc@bootlin.com>
References: <20251128-msg-flags-v1-0-6353f26fa6bc@bootlin.com>
In-Reply-To: <20251128-msg-flags-v1-0-6353f26fa6bc@bootlin.com>
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
 tools/i2ctransfer.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

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


