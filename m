Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488FE23DFEA
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 19:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgHFRzY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 13:55:24 -0400
Received: from www.zeus03.de ([194.117.254.33]:44158 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbgHFQ2v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Aug 2020 12:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=V2N72dtY+8LknuG3pDFYg/vHLR7
        MTxv0sMU5kQWRRUI=; b=gqTFSC0X1fsqf/f0Y4sKYdkzF8XFQ/YPhEj4YRWRNrM
        DRNTQvLlE+KClWe+eIeBLYtxJIPlrN3bzGg7fMgw1vj9fryIw0zRWQHo65Ta3+NF
        mp55GbGtBK7cGEMuie8Uk8Abv9oJsjJYpaFcX3xX0toOLh+JG0wbLuAFQFMiTNRw
        =
Received: (qmail 3392926 invoked from network); 6 Aug 2020 16:57:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Aug 2020 16:57:04 +0200
X-UD-Smtp-Session: l3s3148p1@raCNszasSQout2cI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Daniel Stodden <daniel.stodden@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH i2c-tools] tools: i2ctransfer: add check for returned length from driver
Date:   Thu,  6 Aug 2020 16:56:58 +0200
Message-Id: <20200806145658.1476-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Emit a warning if the bus master driver in the kernel did not set the
message length correctly with I2C_M_RECV_LEN. This can be determined
from the returned value in the buffer.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I think it is useful, but maybe not the scope of a tool like
i2ctransfer. Thoughts?

 tools/i2ctransfer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/i2ctransfer.c b/tools/i2ctransfer.c
index b0e8d43..f2a4df8 100644
--- a/tools/i2ctransfer.c
+++ b/tools/i2ctransfer.c
@@ -88,7 +88,12 @@ static void print_msgs(struct i2c_msg *msgs, __u32 nmsgs, unsigned flags)
 		int recv_len = msgs[i].flags & I2C_M_RECV_LEN;
 		int print_buf = (read && (flags & PRINT_READ_BUF)) ||
 				(!read && (flags & PRINT_WRITE_BUF));
-		__u16 len = recv_len ? msgs[i].buf[0] + 1 : msgs[i].len;
+		__u16 len = msgs[i].len;
+
+		if (recv_len && print_buf && len != msgs[i].buf[0] + 1) {
+			fprintf(stderr, "Correcting wrong msg length after recv_len! Please fix the I2C driver and/or report.\n");
+			len = msgs[i].buf[0] + 1;
+		}
 
 		if (flags & PRINT_HEADER) {
 			fprintf(output, "msg %u: addr 0x%02x, %s, len ",
-- 
2.27.0

