Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92552E1FD9
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Dec 2020 18:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgLWRWo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Dec 2020 12:22:44 -0500
Received: from www.zeus03.de ([194.117.254.33]:41310 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726396AbgLWRWo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Dec 2020 12:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=4q17jxIBF0hacu
        KxfGWJhOAjHtYyErJhLvfidIqMPb4=; b=BLP7vDXysgI5Otmny0MUYiyQMnQsuj
        NrL7+4wm5pbex4jjaxMGW+I8NiFV9wZBgyWGwreQwLBjlGyFKuwwuf2eIVPDytA+
        sG3LC49NbC9N/yXcCQPUAq6meFkYFvjiJxi7mZjFR7j+ZOG0LYQJOMihi874LYFx
        VU/GRlX/d00P0=
Received: (qmail 543646 invoked from network); 23 Dec 2020 18:22:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Dec 2020 18:22:02 +0100
X-UD-Smtp-Session: l3s3148p1@PEfw7SS3uudUhszw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/4] i2c: rcar: make sure irq is not threaded on Gen2 and earlier
Date:   Wed, 23 Dec 2020 18:21:53 +0100
Message-Id: <20201223172154.34462-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ensure this irq runs as fast as possible.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index ad6630e3cc77..3c9c3a6f7ac8 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -928,6 +928,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	struct rcar_i2c_priv *priv;
 	struct i2c_adapter *adap;
 	struct device *dev = &pdev->dev;
+	unsigned long irqflags = 0;
 	int ret;
 
 	/* Otherwise logic will break because some bytes must always use PIO */
@@ -976,6 +977,9 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 
 	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
 
+	if (priv->devtype < I2C_RCAR_GEN3)
+		irqflags |= IRQF_NO_THREAD;
+
 	if (priv->devtype == I2C_RCAR_GEN3) {
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 		if (!IS_ERR(priv->rstc)) {
@@ -995,7 +999,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 		priv->flags |= ID_P_HOST_NOTIFY;
 
 	priv->irq = platform_get_irq(pdev, 0);
-	ret = devm_request_irq(dev, priv->irq, rcar_i2c_irq, 0, dev_name(dev), priv);
+	ret = devm_request_irq(dev, priv->irq, rcar_i2c_irq, irqflags, dev_name(dev), priv);
 	if (ret < 0) {
 		dev_err(dev, "cannot get irq %d\n", priv->irq);
 		goto out_pm_disable;
-- 
2.28.0

