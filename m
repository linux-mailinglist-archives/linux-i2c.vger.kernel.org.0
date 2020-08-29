Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD398256A2C
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Aug 2020 22:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgH2UiW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Aug 2020 16:38:22 -0400
Received: from www.zeus03.de ([194.117.254.33]:58342 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728464AbgH2UiV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Aug 2020 16:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ZISBw5X6h972iR
        hYfVGYqIqdP+soo9pkzAcTYJMtSyk=; b=WNmfcLuA+jEZ26kv53NqD/PLKC0OHA
        raHokiVMB3/o9E52gAW9rM+0bQIRx8KCGu7aTMTAVg1SI532ESbPyaH8ov1dQP5w
        PZSJyGDjdjlGoRmiLktjpW4YKfwAvieVUrr6JLCfw1QP17WYagRS8IDAqES99ZTt
        xJyXeHtAi1QwI=
Received: (qmail 1629950 invoked from network); 29 Aug 2020 22:38:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2020 22:38:20 +0200
X-UD-Smtp-Session: l3s3148p1@O4dbJgqu/NAgAwDPXyCvAAFyN1rCWI+G
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] i2c: rcar: improve bus busy detection
Date:   Sat, 29 Aug 2020 22:38:09 +0200
Message-Id: <20200829203810.1467-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200829203810.1467-1-wsa+renesas@sang-engineering.com>
References: <20200829203810.1467-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C doesn't define a timeout for bus busy, so an arbitrary value like
LOOP_TIMEOUT is not a good idea. Let's use the timeout value in struct
adapter which is meant for such cases and is user-configurable (via
IOCTL). To reduce the load, wait 10us instead of 1us which is good
enough for the slow frequencies used by I2C. Finally, use the
poll_timeout helper instead of open coding it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 0f73f0681a6e..ef10514f6215 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -19,6 +19,7 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/i2c.h>
 #include <linux/i2c-smbus.h>
 #include <linux/kernel.h>
@@ -225,18 +226,18 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 
 static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
 {
-	int i;
+	int ret;
+	u32 val;
 
-	for (i = 0; i < LOOP_TIMEOUT; i++) {
-		/* make sure that bus is not busy */
-		if (!(rcar_i2c_read(priv, ICMCR) & FSDA))
-			return 0;
-		udelay(1);
+	ret = readl_poll_timeout(priv->io + ICMCR, val, !(val & FSDA), 10,
+				 priv->adap.timeout);
+	if (ret) {
+		/* Waiting did not help, try to recover */
+		priv->recovery_icmcr = MDBS | OBPC | FSDA | FSCL;
+		ret = i2c_recover_bus(&priv->adap);
 	}
 
-	/* Waiting did not help, try to recover */
-	priv->recovery_icmcr = MDBS | OBPC | FSDA | FSCL;
-	return i2c_recover_bus(&priv->adap);
+	return ret;
 }
 
 static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
-- 
2.20.1

