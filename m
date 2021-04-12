Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534B035C542
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 13:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240007AbhDLLfc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 07:35:32 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:22854 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237565AbhDLLfb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:31 -0400
Received: from Exchange2016-1.sch.bme.hu (152.66.249.140) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Mon, 12 Apr 2021 13:35:11 +0200
Received: from Cognitio.sch.bme.hu (152.66.211.220) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 12 Apr 2021 13:35:11 +0200
From:   =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
To:     <linux-i2c@vger.kernel.org>
CC:     =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] Fix 'assignment to __be16' warning
Date:   Mon, 12 Apr 2021 11:53:02 +0000
Message-ID: <20210412115302.95686-1-bence98@sch.bme.hu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While the preamble field _is_ technically big-endian, its value is always 0x2A2A,
which is the same in either endianness, therefore it should be u16 instead.

Signed-off-by: Bence Csókás <bence98@sch.bme.hu>

---
 drivers/i2c/busses/i2c-cp2615.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
index 78cfecd1ea76..2824f4ba7131 100644
--- a/drivers/i2c/busses/i2c-cp2615.c
+++ b/drivers/i2c/busses/i2c-cp2615.c
@@ -38,7 +38,9 @@ enum cp2615_iop_msg_type {
 };
 
 struct __packed cp2615_iop_msg {
-	__be16 preamble, length, msg;
+	/* always 0x2A2A, which is the same in either endianness */
+	u16 preamble;
+	__be16 length, msg;
 	u8 data[MAX_IOP_PAYLOAD_SIZE];
 };
 
-- 
2.31.0

