Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFCF17DEB04
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 03:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348035AbjKBCyL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 22:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347248AbjKBCyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 22:54:10 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBC911D
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 19:54:06 -0700 (PDT)
X-ASG-Debug-ID: 1698893643-1eb14e538b03ad0002-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id kqxDGmCxhBpZXNkK (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 02 Nov 2023 10:54:03 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 2 Nov
 2023 10:54:03 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 2 Nov 2023 10:54:02 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>
Subject: [PATCH v3 01/12] i2c: wmt: Reduce redundant: bus busy check
Date:   Thu, 2 Nov 2023 10:53:51 +0800
X-ASG-Orig-Subj: [PATCH v3 01/12] i2c: wmt: Reduce redundant: bus busy check
Message-ID: <740a0a0cff29b236eff4fce9225ee256ceedd8d1.1698889581.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1698893643
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1716
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

Put wmt_i2c_wait_bus_not_busy() in a more appropriate place
to reduce code redundancy

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-wmt.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index 76118abc6e10..d554c6377533 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -128,12 +128,6 @@ static int wmt_i2c_write(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 	unsigned long wait_result;
 	int xfer_len = 0;
 
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		ret = wmt_i2c_wait_bus_not_busy(i2c_dev);
-		if (ret < 0)
-			return ret;
-	}
-
 	if (pmsg->len == 0) {
 		/*
 		 * We still need to run through the while (..) once, so
@@ -219,12 +213,6 @@ static int wmt_i2c_read(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 	unsigned long wait_result;
 	u32 xfer_len = 0;
 
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		ret = wmt_i2c_wait_bus_not_busy(i2c_dev);
-		if (ret < 0)
-			return ret;
-	}
-
 	val = readw(i2c_dev->base + REG_CR);
 	val &= ~CR_TX_END;
 	writew(val, i2c_dev->base + REG_CR);
@@ -297,11 +285,18 @@ static int wmt_i2c_xfer(struct i2c_adapter *adap,
 	struct i2c_msg *pmsg;
 	int i, is_last;
 	int ret = 0;
+	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 
 	for (i = 0; ret >= 0 && i < num; i++) {
 		is_last = ((i + 1) == num);
 
 		pmsg = &msgs[i];
+		if (!(pmsg->flags & I2C_M_NOSTART)) {
+			ret = wmt_i2c_wait_bus_not_busy(i2c_dev);
+			if (ret < 0)
+				return ret;
+		}
+
 		if (pmsg->flags & I2C_M_RD)
 			ret = wmt_i2c_read(adap, pmsg, is_last);
 		else
-- 
2.34.1

