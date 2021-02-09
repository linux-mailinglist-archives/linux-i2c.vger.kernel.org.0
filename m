Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EDD314DF0
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 12:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbhBILIy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 06:08:54 -0500
Received: from www.zeus03.de ([194.117.254.33]:45228 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232183AbhBILGu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Feb 2021 06:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=SUzzrI9D5D4c73ehhqDsMPIhTAu
        krH5yiKWc0AE6DE4=; b=m0rSdnYqGSAl65b580ZsB9GwLiYA4Urc8L7daE6wZbc
        NG9PtLFtuaycqmFO81vbzqJOz+8+YaVDpdJ/utd+a6tLl5tVurkm5VbsOoYkqfXW
        dtlDjQQ8LWHdW4/NwpUpvvLgFckwz7bOw4QALukoOSOSrucOLqHaNx7x2/II2Ql4
        =
Received: (qmail 177983 invoked from network); 9 Feb 2021 12:06:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Feb 2021 12:06:05 +0100
X-UD-Smtp-Session: l3s3148p1@rufXReW6Fo0gAwDPXxOiANNsDO+kmtby
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for returned length from driver"
Date:   Tue,  9 Feb 2021 12:05:56 +0100
Message-Id: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This reverts commit 34806fc4e7090b34e32fa1110d546ab5ce01a6a0. It was
developed against an experimental kernel. The regular kernel does not
update the new message length to userspace, so the check is always false
positive. We can't change the kernel behaviour because it would break
the ABI. So revert this commit.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Very embarrasing :( I am sorry for this. Jean, maybe this is worth a
4.2.1. release?

 tools/i2ctransfer.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/i2ctransfer.c b/tools/i2ctransfer.c
index f2a4df8..b0e8d43 100644
--- a/tools/i2ctransfer.c
+++ b/tools/i2ctransfer.c
@@ -88,12 +88,7 @@ static void print_msgs(struct i2c_msg *msgs, __u32 nmsgs, unsigned flags)
 		int recv_len = msgs[i].flags & I2C_M_RECV_LEN;
 		int print_buf = (read && (flags & PRINT_READ_BUF)) ||
 				(!read && (flags & PRINT_WRITE_BUF));
-		__u16 len = msgs[i].len;
-
-		if (recv_len && print_buf && len != msgs[i].buf[0] + 1) {
-			fprintf(stderr, "Correcting wrong msg length after recv_len! Please fix the I2C driver and/or report.\n");
-			len = msgs[i].buf[0] + 1;
-		}
+		__u16 len = recv_len ? msgs[i].buf[0] + 1 : msgs[i].len;
 
 		if (flags & PRINT_HEADER) {
 			fprintf(output, "msg %u: addr 0x%02x, %s, len ",
-- 
2.28.0

