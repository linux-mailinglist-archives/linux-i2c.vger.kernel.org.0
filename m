Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544E47DEB0B
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 03:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347177AbjKBCyM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 22:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344988AbjKBCyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 22:54:10 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119DA8E
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 19:54:07 -0700 (PDT)
X-ASG-Debug-ID: 1698893644-1eb14e538e03af0001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id zIZWUBaNEHZEgsD9 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 02 Nov 2023 10:54:04 +0800 (CST)
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
Subject: [PATCH v3 02/12] i2c: wmt: Reduce redundant: wait event complete
Date:   Thu, 2 Nov 2023 10:53:52 +0800
X-ASG-Orig-Subj: [PATCH v3 02/12] i2c: wmt: Reduce redundant: wait event complete
Message-ID: <5931f8affc8992a229a4bae5bf9a8ad04a564107.1698889581.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Scan-Msg-Size: 2110
X-Barracuda-BRTS-Status: 0
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

Put the handling of interrupt events in a function class
to reduce code redundancy.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-wmt.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index d554c6377533..1b31330ba4eb 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -109,6 +109,12 @@ static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev)
 static int wmt_check_status(struct wmt_i2c_dev *i2c_dev)
 {
 	int ret = 0;
+	unsigned long wait_result;
+
+	wait_result = wait_for_completion_timeout(&i2c_dev->complete,
+						msecs_to_jiffies(500));
+	if (!wait_result)
+		return -ETIMEDOUT;
 
 	if (i2c_dev->cmd_status & ISR_NACK_ADDR)
 		ret = -EIO;
@@ -125,7 +131,6 @@ static int wmt_i2c_write(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	u16 val, tcr_val;
 	int ret;
-	unsigned long wait_result;
 	int xfer_len = 0;
 
 	if (pmsg->len == 0) {
@@ -167,12 +172,6 @@ static int wmt_i2c_write(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 	}
 
 	while (xfer_len < pmsg->len) {
-		wait_result = wait_for_completion_timeout(&i2c_dev->complete,
-							msecs_to_jiffies(500));
-
-		if (wait_result == 0)
-			return -ETIMEDOUT;
-
 		ret = wmt_check_status(i2c_dev);
 		if (ret)
 			return ret;
@@ -210,7 +209,6 @@ static int wmt_i2c_read(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	u16 val, tcr_val;
 	int ret;
-	unsigned long wait_result;
 	u32 xfer_len = 0;
 
 	val = readw(i2c_dev->base + REG_CR);
@@ -251,12 +249,6 @@ static int wmt_i2c_read(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 	}
 
 	while (xfer_len < pmsg->len) {
-		wait_result = wait_for_completion_timeout(&i2c_dev->complete,
-							msecs_to_jiffies(500));
-
-		if (!wait_result)
-			return -ETIMEDOUT;
-
 		ret = wmt_check_status(i2c_dev);
 		if (ret)
 			return ret;
-- 
2.34.1

