Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3E75326BD
	for <lists+linux-i2c@lfdr.de>; Tue, 24 May 2022 11:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235859AbiEXJpD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 05:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235848AbiEXJpC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 05:45:02 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5933B5522C
        for <linux-i2c@vger.kernel.org>; Tue, 24 May 2022 02:45:01 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 15D441F8A8;
        Tue, 24 May 2022 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1653385500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=yUiLavxjVwyrKgG3j+xKVFA5puTzj5Xiy8cBaHWy9bQ=;
        b=oVjcLYCptC7aB5hJo5Iq0bmZEUXkOxEoTQDuav4loW1qBsQ0fJD6vRlEfNe/4AEhyEdiVm
        e1/PgAploqG2wVWonumviB65WYhFC4H63YC6ETRRZeVp7ritWCF69wSEN/xTYpuqtAAhDT
        UHQZ13KAvHLAPR5t8HXj1oy8EM5h5zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1653385500;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=yUiLavxjVwyrKgG3j+xKVFA5puTzj5Xiy8cBaHWy9bQ=;
        b=OgZLXhW1HE3JjrfWwfRyKDpzewQaXcFLMol3cUjfyNhPSfp24X7w2xGS1SbM0Dx7/NUU6R
        8us0nncdFuLD6JAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EBD0413ADF;
        Tue, 24 May 2022 09:44:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id AsrQNxupjGKmDAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 24 May 2022 09:44:59 +0000
Date:   Tue, 24 May 2022 11:44:57 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2ctransfer: Drop redundant variable arg_idx
Message-ID: <20220524114457.1c78c552@endymion.delvare>
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

arg_idx has the same meaning as getopt's optind global variable, so
drop the former and use the latter. Once getopt() is done parsing the
options, there should be no problem using it for ourselves.

Sigend-off-by: Jean Delvare <jdelvare@suse.de>
---
I can't easily test this, Wolfram can you please do it?

 tools/i2ctransfer.c |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

--- i2c-tools.orig/tools/i2ctransfer.c	2022-05-24 11:34:48.901029181 +0200
+++ i2c-tools/tools/i2ctransfer.c	2022-05-24 11:38:35.637104513 +0200
@@ -131,7 +131,7 @@ static int confirm(const char *filename,
 int main(int argc, char *argv[])
 {
 	char filename[20];
-	int i2cbus, address = -1, file, opt, arg_idx, nmsgs = 0, nmsgs_sent, i;
+	int i2cbus, address = -1, file, opt, nmsgs = 0, nmsgs_sent, i;
 	int force = 0, yes = 0, version = 0, verbose = 0, all_addrs = 0;
 	struct i2c_msg msgs[I2C_RDRW_IOCTL_MAX_MSGS];
 	enum parse_state state = PARSE_GET_DESC;
@@ -160,13 +160,12 @@ int main(int argc, char *argv[])
 		exit(0);
 	}
 
-	arg_idx = optind;
-	if (arg_idx == argc) {
+	if (optind == argc) {
 		help();
 		exit(1);
 	}
 
-	i2cbus = lookup_i2c_bus(argv[arg_idx++]);
+	i2cbus = lookup_i2c_bus(argv[optind++]);
 	if (i2cbus < 0)
 		exit(1);
 
@@ -174,8 +173,8 @@ int main(int argc, char *argv[])
 	if (file < 0 || check_funcs(file))
 		exit(1);
 
-	while (arg_idx < argc) {
-		char *arg_ptr = argv[arg_idx];
+	while (optind < argc) {
+		char *arg_ptr = argv[optind];
 		unsigned long len, raw_data;
 		__u16 flags;
 		__u8 data, *buf;
@@ -310,7 +309,7 @@ int main(int argc, char *argv[])
 			goto err_out;
 		}
 
-		arg_idx++;
+		optind++;
 	}
 
 	if (state != PARSE_GET_DESC || nmsgs == 0) {
@@ -342,7 +341,7 @@ int main(int argc, char *argv[])
 	exit(0);
 
  err_out_with_arg:
-	fprintf(stderr, "Error: faulty argument is '%s'\n", argv[arg_idx]);
+	fprintf(stderr, "Error: faulty argument is '%s'\n", argv[optind]);
  err_out:
 	close(file);
 


-- 
Jean Delvare
SUSE L3 Support
