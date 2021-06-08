Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC3F39FABC
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 17:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhFHPbz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 11:31:55 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:52274 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhFHPby (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 11:31:54 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D40C0219D0;
        Tue,  8 Jun 2021 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i/afHxPhQV20efhzBDcuW0F0S+e6lx5Qx3SwkNzz57s=;
        b=cZQjWdQzXOewiPRDU9dutZQNMVkaiTkNb8qnzR6J5U4C9M0VT/Z26TiKfEH7Ph2V2NPAxr
        pB/DKIPtYU4A/OUGhBeyyUJ8V9ATXhmCwCW24K25jGRRAqA6BgSDiDWwK8jlDwhJLXUeIE
        kyd4LZMzg22naCIW706F0UveJqY+z5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166200;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i/afHxPhQV20efhzBDcuW0F0S+e6lx5Qx3SwkNzz57s=;
        b=zYUpy8yjQ/NAlmt6Xme7zxHDO3HA0bbIjzcMpAE8o+FG2RdDepfW9ehqtp32BR2ztAZuHk
        XhJePqLvvF4X9TBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id A00EF118DD;
        Tue,  8 Jun 2021 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i/afHxPhQV20efhzBDcuW0F0S+e6lx5Qx3SwkNzz57s=;
        b=cZQjWdQzXOewiPRDU9dutZQNMVkaiTkNb8qnzR6J5U4C9M0VT/Z26TiKfEH7Ph2V2NPAxr
        pB/DKIPtYU4A/OUGhBeyyUJ8V9ATXhmCwCW24K25jGRRAqA6BgSDiDWwK8jlDwhJLXUeIE
        kyd4LZMzg22naCIW706F0UveJqY+z5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166200;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i/afHxPhQV20efhzBDcuW0F0S+e6lx5Qx3SwkNzz57s=;
        b=zYUpy8yjQ/NAlmt6Xme7zxHDO3HA0bbIjzcMpAE8o+FG2RdDepfW9ehqtp32BR2ztAZuHk
        XhJePqLvvF4X9TBA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id SgcmJfiMv2CGMwAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Tue, 08 Jun 2021 15:30:00 +0000
Date:   Tue, 8 Jun 2021 17:29:59 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 3/7] i2cget: Add support for SMBus block read
Message-ID: <20210608172959.6d773000@endymion>
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

Now that i2cget supports I2C block read, adding support for SMBus
block read is trivial. This restores the symmetry between i2cset and
i2cget, and paves the road for the removal of SMBus block read
support from i2cdump.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/i2cget.8 |    6 +++---
 tools/i2cget.c |   18 ++++++++++++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

--- i2c-tools.orig/tools/i2cget.c	2021-06-08 16:47:56.290473081 +0200
+++ i2c-tools/tools/i2cget.c	2021-06-08 16:47:58.553503929 +0200
@@ -1,6 +1,6 @@
 /*
     i2cget.c - A user-space program to read an I2C register.
-    Copyright (C) 2005-2012  Jean Delvare <jdelvare@suse.de>
+    Copyright (C) 2005-2021  Jean Delvare <jdelvare@suse.de>
 
     Based on i2cset.c:
     Copyright (C) 2001-2003  Frodo Looijaard <frodol@dds.nl>, and
@@ -48,6 +48,7 @@ static void help(void)
 		"    b (read byte data, default)\n"
 		"    w (read word data)\n"
 		"    c (write byte/read byte)\n"
+		"    s (read SMBus block data)\n"
 		"    i (read I2C block data)\n"
 		"    Append p for SMBus PEC\n"
 		"  LENGTH is the I2C block data length\n");
@@ -92,6 +93,13 @@ static int check_funcs(int file, int siz
 		}
 		break;
 
+	case I2C_SMBUS_BLOCK_DATA:
+		if (!(funcs & I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
+			fprintf(stderr, MISSING_FUNC_FMT, "SMBus read block data");
+			return -1;
+		}
+		break;
+
 	case I2C_SMBUS_I2C_BLOCK_DATA:
 		if (!(funcs & I2C_FUNC_SMBUS_READ_I2C_BLOCK)) {
 			fprintf(stderr, MISSING_FUNC_FMT, "SMBus read I2C block data");
@@ -149,6 +157,7 @@ static int confirm(const char *filename,
 			size == I2C_SMBUS_BYTE ? (daddress < 0 ?
 			"read byte" : "write byte/read byte") :
 			size == I2C_SMBUS_BYTE_DATA ? "read byte data" :
+			size == I2C_SMBUS_BLOCK_DATA ? "read SMBus block data" :
 			"read word data");
 	if (pec)
 		fprintf(stderr, "PEC checking enabled.\n");
@@ -224,6 +233,7 @@ int main(int argc, char *argv[])
 		case 'b': size = I2C_SMBUS_BYTE_DATA; break;
 		case 'w': size = I2C_SMBUS_WORD_DATA; break;
 		case 'c': size = I2C_SMBUS_BYTE; break;
+		case 's': size = I2C_SMBUS_BLOCK_DATA; break;
 		case 'i': size = I2C_SMBUS_I2C_BLOCK_DATA; break;
 		default:
 			fprintf(stderr, "Error: Invalid mode!\n");
@@ -278,6 +288,9 @@ int main(int argc, char *argv[])
 	case I2C_SMBUS_WORD_DATA:
 		res = i2c_smbus_read_word_data(file, daddress);
 		break;
+	case I2C_SMBUS_BLOCK_DATA:
+		res = i2c_smbus_read_block_data(file, daddress, block_data);
+		break;
 	case I2C_SMBUS_I2C_BLOCK_DATA:
 		res = i2c_smbus_read_i2c_block_data(file, daddress, length, block_data);
 		break;
@@ -291,7 +304,8 @@ int main(int argc, char *argv[])
 		exit(2);
 	}
 
-	if (size == I2C_SMBUS_I2C_BLOCK_DATA) {
+	if (size == I2C_SMBUS_BLOCK_DATA ||
+	    size == I2C_SMBUS_I2C_BLOCK_DATA) {
 		int i;
 
 		for (i = 0; i < res - 1; ++i)
--- i2c-tools.orig/tools/i2cget.8	2021-06-08 16:47:58.553503929 +0200
+++ i2c-tools/tools/i2cget.8	2021-06-08 16:48:35.473009351 +0200
@@ -50,9 +50,9 @@ will be read (if that makes sense for th
 .PP
 The \fImode\fR parameter, if specified, is one of the letters \fBb\fP,
 \fBw\fP, \fBc\fP, or \fBi\fP, corresponding to a read byte data, a read
-word data, a write byte/read byte, or a read I2C block transaction,
-respectively. A \fBp\fP can also be appended to the \fImode\fR parameter to
-enable PEC, except for I2C block transactions. If the \fImode\fR
+word data, a write byte/read byte, a read SMBus block, or a read I2C block
+transaction, respectively. A \fBp\fP can also be appended to the \fImode\fR
+parameter to enable PEC, except for I2C block transactions. If the \fImode\fR
 parameter is omitted,
 i2cget defaults to a read byte data transaction, unless \fIdata-address\fR is
 also omitted, in which case the default (and only valid) transaction is a

-- 
Jean Delvare
SUSE L3 Support
