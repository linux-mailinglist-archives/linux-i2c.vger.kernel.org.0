Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 242364F3B19
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 17:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245079AbiDELu0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 07:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356233AbiDEKXa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 06:23:30 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AAEBBABA4
        for <linux-i2c@vger.kernel.org>; Tue,  5 Apr 2022 03:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=OrW2E1pcDjKZoQF/AXmdHvsNIYk
        ywXHAVyE1xLW/o1A=; b=Jd7y+V0D9OVOj3rQdTMqpfyI1b6FVWXR9HqjoujfePm
        niD5dfwl4f9v3h7mRVWjuoFq3RAgfh6EulSZTxitNAhSN3oKTavu3NwwJzo+46lI
        5Abt9rQiPi0Jdg4T8sVzeuL+E+57m5dJDdCxpa/azIkWxSLYVs+K2ZkLVLXM1KrY
        =
Received: (qmail 2245954 invoked from network); 5 Apr 2022 12:08:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2022 12:08:00 +0200
X-UD-Smtp-Session: l3s3148p1@FKp1a+XbRrggAQnoAHlrADXnfPIF6sP/
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>
Subject: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
Date:   Tue,  5 Apr 2022 12:07:56 +0200
Message-Id: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

With this feature added, SMBus Block reads and Proc calls are now
supported. This patch is the best of two independent developments by
Wolfram and Bhuvanesh + Andrew, refactored again by Wolfram.

Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

For testing, I wired a Lager board (R-Car H2) and a Salvator-XS (R-Car
H3 ES2.0) together. The Lager board ran the testunit and provided SMBus
Proc Calls. The Salvator-XS board was requesting the data.

Compared to my previous version: sending 1 byte works now, sending with
DMA as well. Invalid sizes are detected, too. This is as much as I can
test, I'd think.

Compared to Bhuvanesh + Andrew's last version: less intrusive and more
self contained (no goto), Proc Calls are covered as well

I tried some other refactoring as well (like one single place where
rcar_i2c_dma() is called) but IMHO this is the most readable solution.

Thank you everyone for working on this. I am very interested in your
comments and test results!

 drivers/i2c/busses/i2c-rcar.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index f71c730f9838..f45991252993 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -105,6 +105,7 @@
 #define ID_DONE		(1 << 2)
 #define ID_ARBLOST	(1 << 3)
 #define ID_NACK		(1 << 4)
+#define ID_EPROTO	(1 << 5)
 /* persistent flags */
 #define ID_P_HOST_NOTIFY	BIT(28)
 #define ID_P_REP_AFTER_RD	BIT(29)
@@ -522,6 +523,7 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 {
 	struct i2c_msg *msg = priv->msg;
+	bool recv_len_init = priv->pos == 0 && msg->flags & I2C_M_RECV_LEN;
 
 	/* FIXME: sometimes, unknown interrupt happened. Do nothing */
 	if (!(msr & MDR))
@@ -535,12 +537,29 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 		rcar_i2c_dma(priv);
 	} else if (priv->pos < msg->len) {
 		/* get received data */
-		msg->buf[priv->pos] = rcar_i2c_read(priv, ICRXTX);
+		u8 data = rcar_i2c_read(priv, ICRXTX);
+
+		msg->buf[priv->pos] = data;
+		if (recv_len_init) {
+			if (data == 0 || data > I2C_SMBUS_BLOCK_MAX) {
+				priv->flags |= ID_DONE | ID_EPROTO;
+				return;
+			}
+			msg->len += msg->buf[0];
+			/* Enough data for DMA? */
+			if (rcar_i2c_dma(priv))
+				return;
+			/* new length after RECV_LEN now properly initialized */
+			recv_len_init = false;
+		}
 		priv->pos++;
 	}
 
-	/* If next received data is the _LAST_, go to new phase. */
-	if (priv->pos + 1 == msg->len) {
+	/*
+	 * If next received data is the _LAST_ and we are not waiting for a new
+	 * length because of RECV_LEN, then go to a new phase.
+	 */
+	if (priv->pos + 1 == msg->len && !recv_len_init) {
 		if (priv->flags & ID_LAST_MSG) {
 			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
 		} else {
@@ -847,6 +866,8 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 		ret = -ENXIO;
 	} else if (priv->flags & ID_ARBLOST) {
 		ret = -EAGAIN;
+	} else if (priv->flags & ID_EPROTO) {
+		ret = -EPROTO;
 	} else {
 		ret = num - priv->msgs_left; /* The number of transfer */
 	}
@@ -909,6 +930,8 @@ static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
 		ret = -ENXIO;
 	} else if (priv->flags & ID_ARBLOST) {
 		ret = -EAGAIN;
+	} else if (priv->flags & ID_EPROTO) {
+		ret = -EPROTO;
 	} else {
 		ret = num - priv->msgs_left; /* The number of transfer */
 	}
@@ -975,7 +998,7 @@ static u32 rcar_i2c_func(struct i2c_adapter *adap)
 	 * I2C_M_IGNORE_NAK (automatically sends STOP after NAK)
 	 */
 	u32 func = I2C_FUNC_I2C | I2C_FUNC_SLAVE |
-		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+		   (I2C_FUNC_SMBUS_EMUL_ALL & ~I2C_FUNC_SMBUS_QUICK);
 
 	if (priv->flags & ID_P_HOST_NOTIFY)
 		func |= I2C_FUNC_SMBUS_HOST_NOTIFY;
-- 
2.30.2

