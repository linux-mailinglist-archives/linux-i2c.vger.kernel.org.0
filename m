Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1DB39FAC0
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 17:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhFHPd1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 11:33:27 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:42062 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhFHPd1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 11:33:27 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 661371FD2A;
        Tue,  8 Jun 2021 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQrVNM2IXhcChDkb8JLOaOzYBFTDSxXSS4+ytkEClj4=;
        b=h6wTwWEhwGyFcb5cb0+ceSOxGpsXlnM2UITYQSvfFtwWNmyHUtHMEwqXidYYAsulW4Y3Fv
        o0iPayXVquBErCMkXaoeM/RKIdoAENKbQB6BucvmjFnhUgg56lIW/2M2QLTtRYqfxbYzNq
        pID33V8RN9mgUHHZ2Eqa9z66CYUYWvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166293;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQrVNM2IXhcChDkb8JLOaOzYBFTDSxXSS4+ytkEClj4=;
        b=GIHe5Vmdlrl6Aei8xDLScmkpx01ShlnwNP6CUHksDXqEyJkoNs2+Vf/E3/fUujpVxYPS0d
        itdAwoJEKiEtuoBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 360D1118DD;
        Tue,  8 Jun 2021 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQrVNM2IXhcChDkb8JLOaOzYBFTDSxXSS4+ytkEClj4=;
        b=h6wTwWEhwGyFcb5cb0+ceSOxGpsXlnM2UITYQSvfFtwWNmyHUtHMEwqXidYYAsulW4Y3Fv
        o0iPayXVquBErCMkXaoeM/RKIdoAENKbQB6BucvmjFnhUgg56lIW/2M2QLTtRYqfxbYzNq
        pID33V8RN9mgUHHZ2Eqa9z66CYUYWvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166293;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQrVNM2IXhcChDkb8JLOaOzYBFTDSxXSS4+ytkEClj4=;
        b=GIHe5Vmdlrl6Aei8xDLScmkpx01ShlnwNP6CUHksDXqEyJkoNs2+Vf/E3/fUujpVxYPS0d
        itdAwoJEKiEtuoBA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id UbdSC1WNv2CyNAAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Tue, 08 Jun 2021 15:31:33 +0000
Date:   Tue, 8 Jun 2021 17:31:32 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 6/7] i2cdump: Deprecate SMBus block mode
Message-ID: <20210608173132.3bdeced2@endymion>
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

i2cget is a better fit for this mode. Having it in i2cdump requires
special-casing in various places, which makes the code harder to read
and maintain.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/i2cdump.8 |   13 ++++---------
 tools/i2cdump.c |    4 +++-
 2 files changed, 7 insertions(+), 10 deletions(-)

--- i2c-tools.orig/tools/i2cdump.8	2021-06-08 17:04:22.538979958 +0200
+++ i2c-tools/tools/i2cdump.8	2021-06-08 17:13:28.996481415 +0200
@@ -106,21 +106,16 @@ bus 1 (i2c-1), using the default read me
 # i2cdump -r 0x00-0x3f 1 0x2d
 .RE
 .fi
-.PP
-Dump the registers of the SMBus device at address 0x69 on bus 0 (i2c-0),
-using one SMBus block read transaction with error checking enabled, after
-user confirmation:
-.nf
-.RS
-# i2cdump 0 0x69 sp
-.RE
-.fi
 
 .SH BUGS
 To report bugs or send fixes, please write to the Linux I2C mailing list
 <linux-i2c@vger.kernel.org> with Cc to the current maintainer:
 Jean Delvare <jdelvare@suse.de>.
 
+SMBus block mode is deprecated and will be removed in a future version
+of this tool.
+Please use \fIi2cget\fR instead.
+
 .SH SEE ALSO
 i2cdetect(8), i2cget(8), i2cset(8), i2ctransfer(8), isadump(8)
 
--- i2c-tools.orig/tools/i2cdump.c	2021-06-08 17:04:22.538979958 +0200
+++ i2c-tools/tools/i2cdump.c	2021-06-08 17:13:21.787382423 +0200
@@ -43,7 +43,7 @@ static void help(void)
 		"    b (byte, default)\n"
 		"    w (word)\n"
 		"    W (word on even register addresses)\n"
-		"    s (SMBus block)\n"
+		"    s (SMBus block, deprecated)\n"
 		"    i (I2C block)\n"
 		"    c (consecutive byte)\n"
 		"    Append p for SMBus PEC\n");
@@ -181,6 +181,8 @@ int main(int argc, char *argv[])
 		even = 1;
 	} else if (!strncmp(argv[flags+3], "s", 1)) {
 		size = I2C_SMBUS_BLOCK_DATA;
+		fprintf(stderr,
+			"SMBus Block mode is deprecated, please use i2cget instead\n");
 		pec = argv[flags+3][1] == 'p';
 	} else if (!strncmp(argv[flags+3], "c", 1)) {
 		size = I2C_SMBUS_BYTE;

-- 
Jean Delvare
SUSE L3 Support
