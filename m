Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6DE5BD66E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 23:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiISVev (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 17:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiISVep (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 17:34:45 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1625A6476
        for <linux-i2c@vger.kernel.org>; Mon, 19 Sep 2022 14:34:41 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 20 Sep 2022 00:34:37 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 28JLYaWq023067;
        Mon, 19 Sep 2022 17:34:36 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 28JLYac2008175;
        Mon, 19 Sep 2022 17:34:36 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: [PATCH v4 3/8] i2c: i2c-mlxbf.c: incorrect base address passed during io write
Date:   Mon, 19 Sep 2022 17:34:26 -0400
Message-Id: <20220919213431.8045-4-asmaa@nvidia.com>
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

Correct the base address used during io write.
This bug had no impact over the overall functionality of the read and write
transactions. MLXBF_I2C_CAUSE_OR_CLEAR=0x18 so writing to (smbus->io + 0x18)
corresponds to sc_low_timeout register which just sets the timeout value
before a read/write aborts.

Fixes: b5b5b32081cd206b (i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC)
Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 8b8b7c8f7b19..8a6a0ccc1c39 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -662,7 +662,7 @@ static int mlxbf_i2c_smbus_enable(struct mlxbf_i2c_priv *priv, u8 slave,
 	/* Clear status bits. */
 	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_STATUS);
 	/* Set the cause data. */
-	writel(~0x0, priv->smbus->io + MLXBF_I2C_CAUSE_OR_CLEAR);
+	writel(~0x0, priv->mst_cause->io + MLXBF_I2C_CAUSE_OR_CLEAR);
 	/* Zero PEC byte. */
 	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_PEC);
 	/* Zero byte count. */
-- 
2.30.1

