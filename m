Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF33320DBE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 19:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfEPRPp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 13:15:45 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:57658 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726578AbfEPRPp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 May 2019 13:15:45 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 16 May 2019 20:15:43 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x4GHFhYm008130;
        Thu, 16 May 2019 20:15:43 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, michaels@mellanox.com,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 i2c] i2c: mlxcpld: Fix wrong initialization order in probe
Date:   Thu, 16 May 2019 17:15:41 +0000
Message-Id: <20190516171541.7760-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix wrong order in probing routine initialization - field `base_addr'
is used before it's initialized. Move assignment of 'priv->base_addr`
to the beginning, prior the call to mlxcpld_i2c_read_comm().
Wrong order caused the first read of capability register to be executed
at wrong offset 0x0 instead of 0x2000. By chance it was a "good
garbage" at 0x0 offset.

Fixes: 313ce648b5a4 ("i2c: mlxcpld: Add support for extended transaction length for i2c-mlxcpld")
Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 745ed43a22d6..2fd717d8dd30 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -503,6 +503,7 @@ static int mlxcpld_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	priv->dev = &pdev->dev;
+	priv->base_addr = MLXPLAT_CPLD_LPC_I2C_BASE_ADDR;
 
 	/* Register with i2c layer */
 	mlxcpld_i2c_adapter.timeout = usecs_to_jiffies(MLXCPLD_I2C_XFER_TO);
@@ -518,7 +519,6 @@ static int mlxcpld_i2c_probe(struct platform_device *pdev)
 		mlxcpld_i2c_adapter.nr = pdev->id;
 	priv->adap = mlxcpld_i2c_adapter;
 	priv->adap.dev.parent = &pdev->dev;
-	priv->base_addr = MLXPLAT_CPLD_LPC_I2C_BASE_ADDR;
 	i2c_set_adapdata(&priv->adap, priv);
 
 	err = i2c_add_numbered_adapter(&priv->adap);
-- 
2.11.0

