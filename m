Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 419F97DEB08
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 03:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348186AbjKBCyO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 22:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348183AbjKBCyN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 22:54:13 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745C1110
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 19:54:09 -0700 (PDT)
X-ASG-Debug-ID: 1698893644-1eb14e538e03af0004-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id H5BB3rbabDyTXfVr (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 02 Nov 2023 10:54:05 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 2 Nov
 2023 10:54:05 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 2 Nov 2023 10:54:04 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>
Subject: [PATCH v3 05/12] i2c: wmt: Reduce redundant: function parameter
Date:   Thu, 2 Nov 2023 10:53:55 +0800
X-ASG-Orig-Subj: [PATCH v3 05/12] i2c: wmt: Reduce redundant: function parameter
Message-ID: <a37db0cdf8d5a43cd90430361aac24cb4362847b.1698889581.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Start-Time: 1698893645
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 2001
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

Use more appropriate parameter passing to reduce the amount of code

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-wmt.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index d503e85752ea..ec2a8da134e5 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -122,10 +122,9 @@ static int wmt_check_status(struct wmt_i2c_dev *i2c_dev)
 	return ret;
 }
 
-static int wmt_i2c_write(struct i2c_adapter *adap, struct i2c_msg *pmsg,
+static int wmt_i2c_write(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg,
 			 int last)
 {
-	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	u16 val, tcr_val = i2c_dev->tcr;
 	int ret;
 	int xfer_len = 0;
@@ -192,10 +191,8 @@ static int wmt_i2c_write(struct i2c_adapter *adap, struct i2c_msg *pmsg,
 	return 0;
 }
 
-static int wmt_i2c_read(struct i2c_adapter *adap, struct i2c_msg *pmsg,
-			int last)
+static int wmt_i2c_read(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg)
 {
-	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	u16 val, tcr_val = i2c_dev->tcr;
 	int ret;
 	u32 xfer_len = 0;
@@ -245,13 +242,11 @@ static int wmt_i2c_xfer(struct i2c_adapter *adap,
 			int num)
 {
 	struct i2c_msg *pmsg;
-	int i, is_last;
+	int i;
 	int ret = 0;
 	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 
 	for (i = 0; ret >= 0 && i < num; i++) {
-		is_last = ((i + 1) == num);
-
 		pmsg = &msgs[i];
 		if (!(pmsg->flags & I2C_M_NOSTART)) {
 			ret = wmt_i2c_wait_bus_not_busy(i2c_dev);
@@ -260,9 +255,9 @@ static int wmt_i2c_xfer(struct i2c_adapter *adap,
 		}
 
 		if (pmsg->flags & I2C_M_RD)
-			ret = wmt_i2c_read(adap, pmsg, is_last);
+			ret = wmt_i2c_read(i2c_dev, pmsg);
 		else
-			ret = wmt_i2c_write(adap, pmsg, is_last);
+			ret = wmt_i2c_write(i2c_dev, pmsg, (i + 1) == num);
 	}
 
 	return (ret < 0) ? ret : i;
-- 
2.34.1

