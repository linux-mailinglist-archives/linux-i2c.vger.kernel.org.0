Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B4021462C
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jul 2020 15:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgGDNit (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jul 2020 09:38:49 -0400
Received: from www.zeus03.de ([194.117.254.33]:56390 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbgGDNit (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jul 2020 09:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=fEQv6Q07DavjIOOrdC81loITw77
        GxzEYU7AfCmKB2MU=; b=YDircEVxifTCxZpk6ANQv2xwxClmMtMPPhV+nwldzpO
        RldSs2PVTc6YFvO/XrwNKyh1XleawWUAoG2PhH/NPhwwVYTWzGm23+8fcnzzSEls
        8uG0QD9uTy4GpjuDq2vzcW0SwyZvZi2X6K6B9YyBxrz4AzCwN27kyyxuonv9z8nE
        =
Received: (qmail 1545784 invoked from network); 4 Jul 2020 15:38:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jul 2020 15:38:46 +0200
X-UD-Smtp-Session: l3s3148p1@kRPPwp2pto8gAwDPXx1yANRj5lEGkcGq
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: rcar: always clear ICSAR to avoid side effects
Date:   Sat,  4 Jul 2020 15:38:29 +0200
Message-Id: <20200704133829.7015-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On R-Car Gen2, we get a timeout when reading from the address set in
ICSAR, even though the slave interface is disabled. Clearing it fixes
this situation. Note that Gen3 is not affected.

To reproduce: bind and undbind an I2C slave on some bus, run
'i2cdetect' on that bus.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5b70047c6589..2c7c4afc15d4 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -874,6 +874,7 @@ static int rcar_unreg_slave(struct i2c_client *slave)
 	/* disable irqs and ensure none is running before clearing ptr */
 	rcar_i2c_write(priv, ICSIER, 0);
 	rcar_i2c_write(priv, ICSCR, 0);
+	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
 
 	synchronize_irq(priv->irq);
 	priv->slave = NULL;
@@ -982,6 +983,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_pm_put;
 
+	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
+
 	if (priv->devtype == I2C_RCAR_GEN3) {
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 		if (!IS_ERR(priv->rstc)) {
-- 
2.20.1

