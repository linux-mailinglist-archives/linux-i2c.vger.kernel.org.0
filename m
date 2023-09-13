Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12DE279E002
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 08:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238360AbjIMGaD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 02:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238319AbjIMGaC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 02:30:02 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB1C1734
        for <linux-i2c@vger.kernel.org>; Tue, 12 Sep 2023 23:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=wLrtGigwnWYRorUxMB9W5jEAxAni9AJCBP3owuD+mI8=; b=FqnMbi
        3o/3bQO3nMGNDFOzsNPfdQy3mdrilI4AdD9QDc8y4CWe4CoRqplUlksd7M6Hi3eT
        ixunPkA6N1AJ+cEYrqmDKkUw0mv/Tn8rytRDk719NHdgu9b3Ub3hhVMxJn9vB1Jw
        HWD9TaopfSiGAbDWDZKheU+kspzJbHIYkUP/3lmIuVi7uD+KNGmPmOqULTN/WV9F
        btjakU6hIe7P/FvVwg14OB/r+/WwzGF4inxxuivG+OR1E9SRvRHTtDK5ogfPBGVD
        CX/pqcgox8Stwqf2f+jkWoOHsx3G/CUwdfzMKW+XzB0u5YqkjhXt7+/UFawRx0pw
        xoJgDQH7rLtdRG4Q==
Received: (qmail 489546 invoked from network); 13 Sep 2023 08:29:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2023 08:29:56 +0200
X-UD-Smtp-Session: l3s3148p1@eQccsDcFiqMujnuS
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFT 1/2] i2c: rcar: reset controller is mandatory for Gen3+
Date:   Wed, 13 Sep 2023 08:29:48 +0200
Message-Id: <20230913062950.4968-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Initially, we only needed a reset controller to make sure RXDMA works at
least once per transfer. Meanwhile, documentation has been updated. It
now says that a reset has to be performed prior every transaction, also
if it is non-DMA. So, make the reset controller a requirement instead of
being optional.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5e97635faf78..342c3747f415 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -838,12 +838,10 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 
 	/* Gen3 needs a reset before allowing RXDMA once */
 	if (priv->devtype == I2C_RCAR_GEN3) {
-		priv->flags |= ID_P_NO_RXDMA;
-		if (!IS_ERR(priv->rstc)) {
-			ret = rcar_i2c_do_reset(priv);
-			if (ret == 0)
-				priv->flags &= ~ID_P_NO_RXDMA;
-		}
+		priv->flags &= ~ID_P_NO_RXDMA;
+		ret = rcar_i2c_do_reset(priv);
+		if (ret)
+			priv->flags |= ID_P_NO_RXDMA;
 	}
 
 	rcar_i2c_init(priv);
@@ -1096,11 +1094,13 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 
 	if (priv->devtype == I2C_RCAR_GEN3) {
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-		if (!IS_ERR(priv->rstc)) {
-			ret = reset_control_status(priv->rstc);
-			if (ret < 0)
-				priv->rstc = ERR_PTR(-ENOTSUPP);
-		}
+		if (IS_ERR(priv->rstc))
+			return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
+					     "couldn't get reset");
+
+		ret = reset_control_status(priv->rstc);
+		if (ret < 0)
+			return ret;
 	}
 
 	/* Stay always active when multi-master to keep arbitration working */
-- 
2.35.1

