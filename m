Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23DEA7DEB05
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 03:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348182AbjKBCyM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 22:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347897AbjKBCyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 22:54:10 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E21E83
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 19:54:07 -0700 (PDT)
X-ASG-Debug-ID: 1698893644-1eb14e538e03af0003-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id a4NVjYMoRkg8vkpq (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 02 Nov 2023 10:54:05 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 2 Nov
 2023 10:54:04 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 2 Nov 2023 10:54:03 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>
Subject: [PATCH v3 04/12] i2c: wmt: Reduce redundant: REG_CR setting
Date:   Thu, 2 Nov 2023 10:53:54 +0800
X-ASG-Orig-Subj: [PATCH v3 04/12] i2c: wmt: Reduce redundant: REG_CR setting
Message-ID: <0fce410bbf7c3d5e01cf679fd435fa0065e55e53.1698889581.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1698893644
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 2314
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.116192
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

These Settings for the same register, REG_CR, 
can be put together to reduce code redundancy.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-wmt.c | 35 +++++++++--------------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index a44ce5fdde8a..d503e85752ea 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -144,9 +144,6 @@ static int wmt_i2c_write(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 	if (!(pmsg->flags & I2C_M_NOSTART)) {
 		val = readw(i2c_dev->base + REG_CR);
 		val &= ~CR_TX_END;
-		writew(val, i2c_dev->base + REG_CR);
-
-		val = readw(i2c_dev->base + REG_CR);
 		val |= CR_CPU_RDY;
 		writew(val, i2c_dev->base + REG_CR);
 	}
@@ -204,24 +201,15 @@ static int wmt_i2c_read(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 	u32 xfer_len = 0;
 
 	val = readw(i2c_dev->base + REG_CR);
-	val &= ~CR_TX_END;
-	writew(val, i2c_dev->base + REG_CR);
+	val &= ~(CR_TX_END | CR_TX_NEXT_NO_ACK);
 
-	val = readw(i2c_dev->base + REG_CR);
-	val &= ~CR_TX_NEXT_NO_ACK;
-	writew(val, i2c_dev->base + REG_CR);
-
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		val = readw(i2c_dev->base + REG_CR);
+	if (!(pmsg->flags & I2C_M_NOSTART))
 		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
-	}
 
-	if (pmsg->len == 1) {
-		val = readw(i2c_dev->base + REG_CR);
+	if (pmsg->len == 1)
 		val |= CR_TX_NEXT_NO_ACK;
-		writew(val, i2c_dev->base + REG_CR);
-	}
+
+	writew(val, i2c_dev->base + REG_CR);
 
 	reinit_completion(&i2c_dev->complete);
 
@@ -243,15 +231,10 @@ static int wmt_i2c_read(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 		pmsg->buf[xfer_len] = readw(i2c_dev->base + REG_CDR) >> 8;
 		xfer_len++;
 
-		if (xfer_len == pmsg->len - 1) {
-			val = readw(i2c_dev->base + REG_CR);
-			val |= (CR_TX_NEXT_NO_ACK | CR_CPU_RDY);
-			writew(val, i2c_dev->base + REG_CR);
-		} else {
-			val = readw(i2c_dev->base + REG_CR);
-			val |= CR_CPU_RDY;
-			writew(val, i2c_dev->base + REG_CR);
-		}
+		val = readw(i2c_dev->base + REG_CR) | CR_CPU_RDY;
+		if (xfer_len == pmsg->len - 1)
+			val |= CR_TX_NEXT_NO_ACK;
+		writew(val, i2c_dev->base + REG_CR);
 	}
 
 	return 0;
-- 
2.34.1

