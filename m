Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD4FA59C956
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 21:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbiHVT5m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 15:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbiHVT5l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 15:57:41 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4596840575
        for <linux-i2c@vger.kernel.org>; Mon, 22 Aug 2022 12:57:39 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 22 Aug 2022 22:57:34 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 27MJvXA0027437;
        Mon, 22 Aug 2022 15:57:33 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 27MJvXVL012757;
        Mon, 22 Aug 2022 15:57:33 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v2 5/9] i2c-mlxbf.c: support lock mechanism
Date:   Mon, 22 Aug 2022 15:57:21 -0400
Message-Id: <20220822195725.12656-6-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220822195725.12656-1-asmaa@nvidia.com>
References: <20220822195725.12656-1-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
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
Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 42 ++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index a8c5fef3f1cd..b54019b4b01b 100644
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
@@ -705,10 +725,18 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 	slave = request->slave & GENMASK(6, 0);
 	addr = slave << 1;
 
-	/* First of all, check whether the HW is idle. */
-	if (WARN_ON(!mlxbf_smbus_master_wait_for_idle(priv)))
+	/* Try to acquire the smbus gw lock before any reads of the GW register since
+	 * a read sets the lock.
+	 */
+	if (WARN_ON(!mlxbf_i2c_smbus_master_lock(priv)))
 		return -EBUSY;
 
+	/* Check whether the HW is idle */
+	if (WARN_ON(!mlxbf_smbus_master_wait_for_idle(priv))) {
+		mlxbf_i2c_smbus_master_unlock(priv);
+		return -EBUSY;
+	}
+
 	/* Set first byte. */
 	data_desc[data_idx++] = addr;
 
@@ -732,8 +760,10 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 			write_en = 1;
 			write_len += operation->length;
 			if (data_idx + operation->length >
-					MLXBF_I2C_MASTER_DATA_DESC_SIZE)
+					MLXBF_I2C_MASTER_DATA_DESC_SIZE) {
+				mlxbf_i2c_smbus_master_unlock(priv);
 				return -ENOBUFS;
+			}
 			memcpy(data_desc + data_idx,
 			       operation->buffer, operation->length);
 			data_idx += operation->length;
@@ -764,8 +794,10 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 	if (write_en) {
 		ret = mlxbf_i2c_smbus_enable(priv, slave, write_len, block_en,
 					 pec_en, 0);
-		if (ret)
+		if (ret) {
+			mlxbf_i2c_smbus_master_unlock(priv);
 			return ret;
+		}
 	}
 
 	if (read_en) {
@@ -792,6 +824,8 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 			priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_FSM);
 	}
 
+	mlxbf_i2c_smbus_master_unlock(priv);
+
 	return ret;
 }
 
-- 
2.30.1

