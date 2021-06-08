Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F36F39FABE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 17:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhFHPcv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 11:32:51 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:41870 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhFHPcu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 11:32:50 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1F9D31FD3D;
        Tue,  8 Jun 2021 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lOjvViznXR+j69RGfr2oV/poiSMmP/Z89fPcILbXoMo=;
        b=Gt2aegCrskgmoRF723rkqBs+t1UAM4RKw7LdxzYXXmslE0SCm1meLOB6nI1G9NsLA7vd8k
        jvc1dxcVGl7rZDh50ei2JYqoQDpFcZSAwxIXcyZDgwAXWpI2YnsdmEo7SXlLJbMMTyOaJ+
        9syYAzljCVOQdFdQNpX2Bbr2wEZlkSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166257;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lOjvViznXR+j69RGfr2oV/poiSMmP/Z89fPcILbXoMo=;
        b=HQlT45pzlCBqHA9brPxxT03QMbBvjJ8WO8XR5A42u4NfhfXAgh+CU8wryRW/0Frk5nEyj4
        ZzzPYteu2RIEDYAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id EAA80118DD;
        Tue,  8 Jun 2021 15:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lOjvViznXR+j69RGfr2oV/poiSMmP/Z89fPcILbXoMo=;
        b=Gt2aegCrskgmoRF723rkqBs+t1UAM4RKw7LdxzYXXmslE0SCm1meLOB6nI1G9NsLA7vd8k
        jvc1dxcVGl7rZDh50ei2JYqoQDpFcZSAwxIXcyZDgwAXWpI2YnsdmEo7SXlLJbMMTyOaJ+
        9syYAzljCVOQdFdQNpX2Bbr2wEZlkSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166257;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lOjvViznXR+j69RGfr2oV/poiSMmP/Z89fPcILbXoMo=;
        b=HQlT45pzlCBqHA9brPxxT03QMbBvjJ8WO8XR5A42u4NfhfXAgh+CU8wryRW/0Frk5nEyj4
        ZzzPYteu2RIEDYAQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id QexnNzCNv2BHNAAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Tue, 08 Jun 2021 15:30:56 +0000
Date:   Tue, 8 Jun 2021 17:30:56 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 5/7] i2cdump: Add range support with mode i (I2C block)
Message-ID: <20210608173056.1c35beab@endymion>
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

Implementing range support for I2C block reads (mode i) isn't
particularly difficult so let's just do that.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/i2cdump.8 |    6 +++---
 tools/i2cdump.c |   10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

--- i2c-tools.orig/tools/i2cdump.c	2021-06-08 14:56:02.047402610 +0200
+++ i2c-tools/tools/i2cdump.c	2021-06-08 15:02:52.697979744 +0200
@@ -2,7 +2,7 @@
     i2cdump.c - a user-space program to dump I2C registers
     Copyright (C) 2002-2003  Frodo Looijaard <frodol@dds.nl>, and
                              Mark D. Studebaker <mdsxyz123@yahoo.com>
-    Copyright (C) 2004-2012  Jean Delvare <jdelvare@suse.de>
+    Copyright (C) 2004-2021  Jean Delvare <jdelvare@suse.de>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
@@ -251,6 +251,7 @@ int main(int argc, char *argv[])
 		switch (size) {
 		case I2C_SMBUS_BYTE:
 		case I2C_SMBUS_BYTE_DATA:
+		case I2C_SMBUS_I2C_BLOCK_DATA:
 			break;
 		case I2C_SMBUS_WORD_DATA:
 			if (!even || (!(first%2) && last%2))
@@ -341,8 +342,9 @@ int main(int argc, char *argv[])
 				/* Remember returned block length for a nicer
 				   display later */
 				s_length = res;
+				last = res - 1;
 			} else {
-				for (res = 0; res < 256; res += i) {
+				for (res = first; res <= last; res += i) {
 					i = i2c_smbus_read_i2c_block_data(file,
 						res, 32, cblock + res);
 					if (i <= 0) {
@@ -356,9 +358,7 @@ int main(int argc, char *argv[])
 					"return code %d\n", res);
 				exit(1);
 			}
-			if (res >= 256)
-				res = 256;
-			for (i = 0; i < res; i++)
+			for (i = first; i <= last; i++)
 				block[i] = cblock[i];
 		}
 
--- i2c-tools.orig/tools/i2cdump.8	2021-06-08 14:56:02.047402610 +0200
+++ i2c-tools/tools/i2cdump.8	2021-06-08 15:02:46.451894913 +0200
@@ -1,4 +1,4 @@
-.TH I2CDUMP 8 "October 2017"
+.TH I2CDUMP 8 "June 2021"
 .SH NAME
 i2cdump \- examine I2C registers
 
@@ -32,8 +32,8 @@ kernel driver in question. It can also c
 results. So use at your own risk and only if you know what you're doing.
 .TP
 .B -r first-last
-Limit the range of registers being accessed. This option is only available
-with modes \fBb\fP, \fBw\fP, \fBc\fP and \fBW\fP. For mode \fBW\fP,
+Limit the range of registers being accessed. This option is not available
+with mode \fBs\fP. For mode \fBW\fP,
 \fBfirst\fR must be even and \fBlast\fR must be odd.
 .TP
 .B -y

-- 
Jean Delvare
SUSE L3 Support
