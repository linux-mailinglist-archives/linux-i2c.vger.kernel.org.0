Return-Path: <linux-i2c+bounces-767-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 383D88129AF
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 08:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C52B1282223
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 07:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FF113AE9;
	Thu, 14 Dec 2023 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="V2GxAr04"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DDBE10C
	for <linux-i2c@vger.kernel.org>; Wed, 13 Dec 2023 23:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=VVjT4+Cf8UWpO5evrM+cr4MAL3lYVdc9S4k3S2b2RlM=; b=V2GxAr
	04gWg0Pm3WkCF8taGYt0SD+yl7ohG17it02O5kv50LdcVrON7dIXgELHWRLtwQh0
	aSZ4LywLPmb4SG9irpXFNuRHqFsq00X730cCscQmxk8QepO9cPTJ3QMmFuwEAzMt
	2ymgESdec6/fbpJ6M+jHxVIBjsOnD9SWSEX4uGMW4/XNEFjocHk+rhRus2/opoY7
	ndurazDmIi9g5LmqBI+1TpH6BrKbsTMRM8Vl+FqcL1T8jWjHPSF+XUTxTgXylsmo
	TxAapWApsgANHpvnMdaKu3rck/7fSfj5fST5WCziGG78vdmPIvX4vtSECLgi2sMx
	FXOflEF5zOuIToCg==
Received: (qmail 826984 invoked from network); 14 Dec 2023 08:44:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2023 08:44:13 +0100
X-UD-Smtp-Session: l3s3148p1@1CUsc3MMvK8ujnuR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] i2c: rcar: introduce Gen4 devices
Date: Thu, 14 Dec 2023 08:43:57 +0100
Message-Id: <20231214074358.8711-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231214074358.8711-1-wsa+renesas@sang-engineering.com>
References: <20231214074358.8711-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, we treated Gen4 as Gen3. But we are soon adding FM+ as a Gen4
specific feature, so prepare the code for the new devtype.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:

* rebased to 6.7-rc4
* moved S4 specific handling to patch 2

 drivers/i2c/busses/i2c-rcar.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 829ac053bbb7..973811a6c27b 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -132,6 +132,7 @@ enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
 	I2C_RCAR_GEN2,
 	I2C_RCAR_GEN3,
+	I2C_RCAR_GEN4,
 };
 
 struct rcar_i2c_priv {
@@ -431,8 +432,8 @@ static void rcar_i2c_cleanup_dma(struct rcar_i2c_priv *priv, bool terminate)
 	dma_unmap_single(chan->device->dev, sg_dma_address(&priv->sg),
 			 sg_dma_len(&priv->sg), priv->dma_direction);
 
-	/* Gen3 can only do one RXDMA per transfer and we just completed it */
-	if (priv->devtype == I2C_RCAR_GEN3 &&
+	/* Gen3+ can only do one RXDMA per transfer and we just completed it */
+	if (priv->devtype >= I2C_RCAR_GEN3 &&
 	    priv->dma_direction == DMA_FROM_DEVICE)
 		priv->flags |= ID_P_NO_RXDMA;
 
@@ -886,8 +887,8 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 	if (ret < 0)
 		goto out;
 
-	/* Gen3 needs a reset before allowing RXDMA once */
-	if (priv->devtype == I2C_RCAR_GEN3) {
+	/* Gen3+ needs a reset. That also allows RXDMA once */
+	if (priv->devtype >= I2C_RCAR_GEN3) {
 		priv->flags &= ~ID_P_NO_RXDMA;
 		ret = rcar_i2c_do_reset(priv);
 		if (ret)
@@ -1075,7 +1076,7 @@ static const struct of_device_id rcar_i2c_dt_ids[] = {
 	{ .compatible = "renesas,rcar-gen1-i2c", .data = (void *)I2C_RCAR_GEN1 },
 	{ .compatible = "renesas,rcar-gen2-i2c", .data = (void *)I2C_RCAR_GEN2 },
 	{ .compatible = "renesas,rcar-gen3-i2c", .data = (void *)I2C_RCAR_GEN3 },
-	{ .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN3 },
+	{ .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN4 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rcar_i2c_dt_ids);
@@ -1151,7 +1152,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_bool(dev->of_node, "smbus"))
 		priv->flags |= ID_P_HOST_NOTIFY;
 
-	if (priv->devtype == I2C_RCAR_GEN3) {
+	if (priv->devtype >= I2C_RCAR_GEN3) {
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 		if (IS_ERR(priv->rstc)) {
 			ret = PTR_ERR(priv->rstc);
-- 
2.35.1


