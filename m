Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF794D2C13
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Mar 2022 10:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbiCIJdK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Mar 2022 04:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbiCIJcx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Mar 2022 04:32:53 -0500
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648C416EAB6;
        Wed,  9 Mar 2022 01:31:55 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2297bamd017891;
        Wed, 9 Mar 2022 03:31:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=LU6ra/x8Comd366qKb7HlBcqW7QO6rSI98+zATfJXSI=;
 b=oaYry1US0Yjcv2FRHy5u272eWoElD/VRJmzhk605WNms/9KrLil9n1fA/hX3h8OAMWMY
 Ye5e33Jv9YoYrFZjSYIiN32Y7EyfshN/TZ07MgvQnD40WhmuxVu/n7YUCdSuJdN1msD3
 s39IXEnpLYzRtxYHS8P1fkDEa5CVovOoEoNiAgpEGMHVFhUtnVm9LZwbZAYCvnedoZ7X
 +tALIWg+HuYe9yXqjnyWkZMTirSGjLXVB/bCcNIQI5xDQDy1C2jAOg0FUSbjB2Lj6MvC
 1HEqlTdM9NR9lyjcXvCGj6fL4QqOdgJ41jHMhtPkDTjMWkBm5Ok5Zw1VjAvhKZmj+iFP yQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3em656nec2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 09 Mar 2022 03:31:51 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Mar
 2022 09:31:49 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Wed, 9 Mar 2022 09:31:49 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.38])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C870E46C;
        Wed,  9 Mar 2022 09:31:48 +0000 (UTC)
From:   Lucas Tanure <tanureal@opensource.cirrus.com>
To:     Michal Simek <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: [PATCH] i2c: cadence: Increase timeout per message if necessary
Date:   Wed, 9 Mar 2022 09:31:47 +0000
Message-ID: <20220309093147.102385-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pqeXHhEFS0n-R2cFZj4_o1cNQf7Xnrr6
X-Proofpoint-GUID: pqeXHhEFS0n-R2cFZj4_o1cNQf7Xnrr6
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Timeout as 1 second sets a upper limit on the length of
the transfer executed, but there is no maximum length of
a write or read message set in i2c_adapter_quirks for this
controller.

To remove that limitation calculate the minimal time
necessary, plus some wiggle room, for every message
and use it instead of the default one second, if
more than one second.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 drivers/i2c/busses/i2c-cadence.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 805c77143a0f..b4c1ad19cdae 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -760,7 +760,7 @@ static void cdns_i2c_master_reset(struct i2c_adapter *adap)
 static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 		struct i2c_adapter *adap)
 {
-	unsigned long time_left;
+	unsigned long time_left, msg_timeout;
 	u32 reg;
 
 	id->p_msg = msg;
@@ -785,8 +785,16 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	else
 		cdns_i2c_msend(id);
 
+	/* Minimal time to execute this message */
+	msg_timeout = msecs_to_jiffies((1000 * msg->len * BITS_PER_BYTE) / id->i2c_clk);
+	/* Plus some wiggle room */
+	msg_timeout += msecs_to_jiffies(500);
+
+	if (msg_timeout < adap->timeout)
+		msg_timeout = adap->timeout;
+
 	/* Wait for the signal of completion */
-	time_left = wait_for_completion_timeout(&id->xfer_done, adap->timeout);
+	time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
 	if (time_left == 0) {
 		cdns_i2c_master_reset(adap);
 		dev_err(id->adap.dev.parent,
-- 
2.35.1

