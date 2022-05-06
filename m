Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E45651DA35
	for <lists+linux-i2c@lfdr.de>; Fri,  6 May 2022 16:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442090AbiEFOPa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 May 2022 10:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391428AbiEFOP3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 May 2022 10:15:29 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEAB5F68
        for <linux-i2c@vger.kernel.org>; Fri,  6 May 2022 07:11:46 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8C1961F918
        for <linux-i2c@vger.kernel.org>; Fri,  6 May 2022 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1651846305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=771+RQkoTrI5Xa3QIqKThjCAMkU1JkYTcOHEUtF/X34=;
        b=wwhHNOKpkEHTHp39nry3JneNBJSi30S+/s4lCDX6Ru78Il3NrnQ/nUqdi7ZlftH/FKbTY7
        4KOjjKVowdoPISMQoXJtexLcBIAJm5HTVTCDg+sUyuZrP3yth59oCYZdadZk0ICIKL2qG2
        AB8Hxr7A4z9f+dPzusfmOJwRu5HMdFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1651846305;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=771+RQkoTrI5Xa3QIqKThjCAMkU1JkYTcOHEUtF/X34=;
        b=O9rTYg3t3qt0qLd/QoqA9y5aPUwgiVVC3VT60FgUb4V3nwa0vurMceZmnbX0/a7pM6p5L5
        hYuQo+kqITCu3rBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7435E13A1B
        for <linux-i2c@vger.kernel.org>; Fri,  6 May 2022 14:11:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id nDP0GqEsdWKgaQAAMHmgww
        (envelope-from <jdelvare@suse.de>)
        for <linux-i2c@vger.kernel.org>; Fri, 06 May 2022 14:11:45 +0000
Date:   Fri, 6 May 2022 16:11:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 2/2] i2c-tools: Implement and document option -h
Message-ID: <20220506161144.59a20dac@endymion.delvare>
In-Reply-To: <20220506160652.61d61aa6@endymion.delvare>
References: <20220506160652.61d61aa6@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add an option -h to display the help of the tools. This is a common
practice so users may expect it to work.

Based on a preliminary patch from David Kerns.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/i2cdetect.8 |    6 ++++++
 tools/i2cdetect.c |    3 ++-
 tools/i2cdump.8   |    6 ++++++
 tools/i2cdump.c   |    3 ++-
 tools/i2cget.8    |    6 ++++++
 tools/i2cget.c    |    3 ++-
 tools/i2cset.8    |    6 ++++++
 tools/i2cset.c    |    3 ++-
 8 files changed, 32 insertions(+), 4 deletions(-)

--- i2c-tools.orig/tools/i2cdetect.8	2020-09-17 14:29:28.275299253 +0200
+++ i2c-tools/tools/i2cdetect.8	2022-05-06 16:00:21.370647957 +0200
@@ -18,6 +18,9 @@ i2cdetect \- detect I2C chips
 .I -V
 .br
 .B i2cdetect
+.I -h
+.br
+.B i2cdetect
 .I -l
 
 .SH DESCRIPTION
@@ -78,6 +81,9 @@ Display the list of functionalities impl
 .B "\-V"
 Display the version and exit.
 .TP
+.B "\-h"
+Display the help and exit.
+.TP
 .B "\-l"
 Output a list of installed busses.
 
--- i2c-tools.orig/tools/i2cdetect.c	2022-05-06 15:53:46.597938799 +0200
+++ i2c-tools/tools/i2cdetect.c	2022-05-06 16:00:48.922977347 +0200
@@ -242,9 +242,10 @@ int main(int argc, char *argv[])
 			first = 0x00;
 			last = 0x7F;
 			break;
+		case 'h':
 		case '?':
 			help();
-			exit(1);
+			exit(opt == '?');
 		}
 	}
 
--- i2c-tools.orig/tools/i2cdump.8	2021-07-22 16:39:29.619547310 +0200
+++ i2c-tools/tools/i2cdump.8	2022-05-06 15:59:58.930379681 +0200
@@ -14,6 +14,9 @@ i2cdump \- examine I2C registers
 .br
 .B i2cdump
 .B -V
+.br
+.B i2cdump
+.B -h
 
 .SH DESCRIPTION
 i2cdump is a small helper program to examine registers
@@ -24,6 +27,9 @@ visible through the I2C bus.
 .B -V
 Display the version and exit.
 .TP
+.B -h
+Display the help and exit.
+.TP
 .B -f
 Force access to the device even if it is already busy. By default, i2cdump
 will refuse to access a device which is already under the control of a
--- i2c-tools.orig/tools/i2cdump.c	2022-05-06 15:53:46.599938823 +0200
+++ i2c-tools/tools/i2cdump.c	2022-05-06 16:00:53.196028432 +0200
@@ -123,9 +123,10 @@ int main(int argc, char *argv[])
 		case 'r': range = optarg; break;
 		case 'y': yes = 1; break;
 		case 'a': all_addrs = 1; break;
+		case 'h':
 		case '?':
 			help();
-			exit(1);
+			exit(opt == '?');
 		}
 	}
 
--- i2c-tools.orig/tools/i2cget.8	2022-05-03 08:04:39.334978310 +0200
+++ i2c-tools/tools/i2cget.8	2022-05-06 15:58:15.488144365 +0200
@@ -13,6 +13,9 @@ i2cget \- read from I2C/SMBus chip regis
 .br
 .B i2cget
 .B -V
+.br
+.B i2cget
+.B -h
 
 .SH DESCRIPTION
 i2cget is a small helper program to read registers visible through the I2C
@@ -23,6 +26,9 @@ bus (or SMBus).
 .B -V
 Display the version and exit.
 .TP
+.B -h
+Display the help and exit.
+.TP
 .B -f
 Force access to the device even if it is already busy. By default, i2cget
 will refuse to access a device which is already under the control of a
--- i2c-tools.orig/tools/i2cget.c	2022-05-06 15:53:46.600938834 +0200
+++ i2c-tools/tools/i2cget.c	2022-05-06 16:00:55.894060687 +0200
@@ -192,9 +192,10 @@ int main(int argc, char *argv[])
 		case 'f': force = 1; break;
 		case 'y': yes = 1; break;
 		case 'a': all_addrs = 1; break;
+		case 'h':
 		case '?':
 			help();
-			exit(1);
+			exit(opt == '?');
 		}
 	}
 
--- i2c-tools.orig/tools/i2cset.8	2020-09-17 14:29:28.278299294 +0200
+++ i2c-tools/tools/i2cset.8	2022-05-06 15:58:41.228451225 +0200
@@ -18,6 +18,9 @@ i2cset \- set I2C registers
 .br
 .B i2cset
 .B -V
+.br
+.B i2cset
+.B -h
 
 .SH DESCRIPTION
 i2cset is a small helper program to set registers visible through the I2C
@@ -28,6 +31,9 @@ bus.
 .B -V
 Display the version and exit.
 .TP
+.B -h
+Display the help and exit.
+.TP
 .B -f
 Force access to the device even if it is already busy. By default, i2cset
 will refuse to access a device which is already under the control of a
--- i2c-tools.orig/tools/i2cset.c	2022-05-06 15:53:46.600938834 +0200
+++ i2c-tools/tools/i2cset.c	2022-05-06 16:00:43.398911306 +0200
@@ -176,9 +176,10 @@ int main(int argc, char *argv[])
 		case 'm': maskp = optarg; break;
 		case 'r': readback = 1; break;
 		case 'a': all_addrs = 1; break;
+		case 'h':
 		case '?':
 			help();
-			exit(1);
+			exit(opt == '?');
 		}
 	}
 

-- 
Jean Delvare
SUSE L3 Support
