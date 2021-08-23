Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6D33F52F1
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 23:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbhHWVnB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 17:43:01 -0400
Received: from phobos.denx.de ([85.214.62.61]:40760 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232503AbhHWVnA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Aug 2021 17:43:00 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E7ACA81FC6;
        Mon, 23 Aug 2021 23:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1629754936;
        bh=GU37FIeuFBtxTf9ROaPkhRsxalMDB2svF77w7psfyL0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gvSel/JXZ4i/xqWEGggRxEpIsi/JneAt85N0q8suAfg54805QaOb8pJsiNPK/aKcr
         YlnMbxBcsvB/axzygX6hWzs0N1Sq/CmUrZO7z/NVYKMOowoBhT5SmLGiwy/DfQXvpp
         gB9UZfgrSm+KpKdzKoUfBg2DPiSkyO7HQLbRaD3+Ye0om7SAgReI+9ID2OWQT6nWfo
         Rwjvk7tAvfEoVlNZICSD35WG5dLCwFUlBI4/FCsONvdtL9MCY9A3ZrC53URKLELQvA
         RW3/eznDUyjJK5LMiAdb4RLKlaSuP5iYpusicM1Z62g2nj4ITdt07HdcrMlBz3Gwpo
         O2RPqD/UVV60w==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 1/6] i2c: xiic: Fix broken locking on tx_msg
Date:   Mon, 23 Aug 2021 23:41:40 +0200
Message-Id: <20210823214145.295104-2-marex@denx.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823214145.295104-1-marex@denx.de>
References: <20210823214145.295104-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
V2: Initialize RX message pointer in xiic_start_xfer() too
---
 drivers/i2c/busses/i2c-xiic.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index bb93db98404ef..50320dd32eea9 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -170,7 +170,7 @@ struct xiic_i2c {
 #define xiic_tx_space(i2c) ((i2c)->tx_msg->len - (i2c)->tx_pos)
 #define xiic_rx_space(i2c) ((i2c)->rx_msg->len - (i2c)->rx_pos)
 
-static int xiic_start_xfer(struct xiic_i2c *i2c);
+static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num);
 static void __xiic_start_xfer(struct xiic_i2c *i2c);
 
 /*
@@ -684,15 +684,25 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 
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
+	i2c->rx_msg = NULL;
+	i2c->nmsgs = num;
+
 	ret = xiic_reinit(i2c);
 	if (!ret)
 		__xiic_start_xfer(i2c);
 
+out:
 	mutex_unlock(&i2c->lock);
 
 	return ret;
@@ -710,14 +720,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
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
@@ -725,9 +728,11 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
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
@@ -735,6 +740,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		goto out;
 	}
 out:
+	mutex_unlock(&i2c->lock);
 	pm_runtime_mark_last_busy(i2c->dev);
 	pm_runtime_put_autosuspend(i2c->dev);
 	return err;
-- 
2.32.0

