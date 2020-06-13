Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3895A1F83CD
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 17:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgFMPID (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 11:08:03 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:53343 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbgFMPID (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Jun 2020 11:08:03 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49kgvP0syBz1qrML;
        Sat, 13 Jun 2020 17:08:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49kgvP0V2Bz1qql0;
        Sat, 13 Jun 2020 17:08:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id ml3hhOyA2tM9; Sat, 13 Jun 2020 17:07:59 +0200 (CEST)
X-Auth-Info: rxqyfX+/lTFji4lwtLgYiwKHyM+3Fo+XkQRtspltXuU=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 13 Jun 2020 17:07:59 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 1/5] i2c: xiic: Fix broken locking on tx_msg
Date:   Sat, 13 Jun 2020 17:07:47 +0200
Message-Id: <20200613150751.114595-1-marex@denx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tx_msg is set from multiple places, sometimes without locking,
which fall apart on any SMP system. Only ever access tx_msg inside
the driver mutex.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-xiic.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 90c1c362394d0..0777e577720db 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -168,7 +168,7 @@ struct xiic_i2c {
 #define xiic_tx_space(i2c) ((i2c)->tx_msg->len - (i2c)->tx_pos)
 #define xiic_rx_space(i2c) ((i2c)->rx_msg->len - (i2c)->rx_pos)
 
-static int xiic_start_xfer(struct xiic_i2c *i2c);
+static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num);
 static void __xiic_start_xfer(struct xiic_i2c *i2c);
 
 /*
@@ -673,15 +673,24 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 
 }
 
-static int xiic_start_xfer(struct xiic_i2c *i2c)
+static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 {
 	int ret;
+
 	mutex_lock(&i2c->lock);
 
+	ret = xiic_busy(i2c);
+	if (ret)
+		goto out;
+
+	i2c->tx_msg = msgs;
+	i2c->nmsgs = num;
+
 	ret = xiic_reinit(i2c);
 	if (!ret)
 		__xiic_start_xfer(i2c);
 
+out:
 	mutex_unlock(&i2c->lock);
 
 	return ret;
@@ -699,14 +708,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	if (err < 0)
 		return err;
 
-	err = xiic_busy(i2c);
-	if (err)
-		goto out;
-
-	i2c->tx_msg = msgs;
-	i2c->nmsgs = num;
-
-	err = xiic_start_xfer(i2c);
+	err = xiic_start_xfer(i2c, msgs, num);
 	if (err < 0) {
 		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
 		goto out;
@@ -714,9 +716,11 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 	if (wait_event_timeout(i2c->wait, (i2c->state == STATE_ERROR) ||
 		(i2c->state == STATE_DONE), HZ)) {
+		mutex_lock(&i2c->lock);
 		err = (i2c->state == STATE_DONE) ? num : -EIO;
 		goto out;
 	} else {
+		mutex_lock(&i2c->lock);
 		i2c->tx_msg = NULL;
 		i2c->rx_msg = NULL;
 		i2c->nmsgs = 0;
@@ -724,6 +728,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		goto out;
 	}
 out:
+	mutex_unlock(&i2c->lock);
 	pm_runtime_mark_last_busy(i2c->dev);
 	pm_runtime_put_autosuspend(i2c->dev);
 	return err;
-- 
2.26.2

