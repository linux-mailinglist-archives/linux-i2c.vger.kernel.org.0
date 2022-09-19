Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7940A5BD66C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 23:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiISVeu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 17:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiISVep (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 17:34:45 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2710B65C7
        for <linux-i2c@vger.kernel.org>; Mon, 19 Sep 2022 14:34:41 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 20 Sep 2022 00:34:38 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 28JLYc74023073;
        Mon, 19 Sep 2022 17:34:38 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 28JLYcGJ008197;
        Mon, 19 Sep 2022 17:34:38 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: [PATCH v4 5/8] i2c: i2c-mlxbf.c: support lock mechanism
Date:   Mon, 19 Sep 2022 17:34:28 -0400
Message-Id: <20220919213431.8045-6-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220919213431.8045-1-asmaa@nvidia.com>
References: <20220919213431.8045-1-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Linux is not the only entity using the BlueField I2C busses so
support a lock mechanism provided by hardware to avoid issues
when multiple entities are trying to access the same bus.

The lock is acquired whenever written explicitely or the lock
register is read. So make sure it is always released at the end
of a successful or failed transaction.

Fixes: b5b5b32081cd206b (i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC)
Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 44 ++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 1a0fc9640c23..78b2bc9b0a34 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -306,6 +306,7 @@ static u64 mlxbf_i2c_corepll_frequency;
  * exact.
  */
 #define MLXBF_I2C_SMBUS_TIMEOUT   (300 * 1000) /* 300ms */
+#define MLXBF_I2C_SMBUS_LOCK_POLL_TIMEOUT (300 * 1000) /* 300ms */
 
 /* Encapsulates timing parameters. */
 struct mlxbf_i2c_timings {
@@ -514,6 +515,25 @@ static bool mlxbf_smbus_master_wait_for_idle(struct mlxbf_i2c_priv *priv)
 	return false;
 }
 
+/*
+ * wait for the lock to be released before acquiring it.
+ */
+static bool mlxbf_i2c_smbus_master_lock(struct mlxbf_i2c_priv *priv)
+{
+	if (mlxbf_smbus_poll(priv->smbus->io, MLXBF_I2C_SMBUS_MASTER_GW,
+			   MLXBF_I2C_MASTER_LOCK_BIT, true,
+			   MLXBF_I2C_SMBUS_LOCK_POLL_TIMEOUT))
+		return true;
+
+	return false;
+}
+
+static void mlxbf_i2c_smbus_master_unlock(struct mlxbf_i2c_priv *priv)
+{
+	/* Clear the gw to clear the lock */
+	writel(0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_GW);
+}
+
 static bool mlxbf_i2c_smbus_transaction_success(u32 master_status,
 						u32 cause_status)
 {
@@ -705,10 +725,19 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 	slave = request->slave & GENMASK(6, 0);
 	addr = slave << 1;
 
-	/* First of all, check whether the HW is idle. */
-	if (WARN_ON(!mlxbf_smbus_master_wait_for_idle(priv)))
+	/*
+	 * Try to acquire the smbus gw lock before any reads of the GW register since
+	 * a read sets the lock.
+	 */
+	if (WARN_ON(!mlxbf_i2c_smbus_master_lock(priv)))
 		return -EBUSY;
 
+	/* Check whether the HW is idle */
+	if (WARN_ON(!mlxbf_smbus_master_wait_for_idle(priv))) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
 	/* Set first byte. */
 	data_desc[data_idx++] = addr;
 
@@ -732,8 +761,10 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 			write_en = 1;
 			write_len += operation->length;
 			if (data_idx + operation->length >
-					MLXBF_I2C_MASTER_DATA_DESC_SIZE)
-				return -ENOBUFS;
+					MLXBF_I2C_MASTER_DATA_DESC_SIZE) {
+				ret = -ENOBUFS;
+				goto out_unlock;
+			}
 			memcpy(data_desc + data_idx,
 			       operation->buffer, operation->length);
 			data_idx += operation->length;
@@ -765,7 +796,7 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 		ret = mlxbf_i2c_smbus_enable(priv, slave, write_len, block_en,
 					 pec_en, 0);
 		if (ret)
-			return ret;
+			goto out_unlock;
 	}
 
 	if (read_en) {
@@ -792,6 +823,9 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 			priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_FSM);
 	}
 
+out_unlock:
+	mlxbf_i2c_smbus_master_unlock(priv);
+
 	return ret;
 }
 
-- 
2.30.1

