Return-Path: <linux-i2c+bounces-13180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62047BA1747
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 23:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AD82620676
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 21:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A2627467B;
	Thu, 25 Sep 2025 21:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b1imPhxM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8852741A0
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 21:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758834333; cv=none; b=aZ6ihvtmOsYvSV6W+UtbMHuTS0BlXiwjSj2On3IspVe0l66V+ljPkbNQeS/ZKTN/Qri9mo7qrcj2uVdlIHcNjQUSQYjfxxJeCxg0barEBCtM7e4rfmjPoza6sQMI67a+D21y8gu01NMbdBd1yPQ4cvODh+jy1uyUzKrf3ufJri4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758834333; c=relaxed/simple;
	bh=w/I2sz6bghoUCBMCdJtGP+Q/78YvLhr16FPZQ1KYVnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f/gEiwi2hYrZp1ndsmLPyIZjUWXovAML1vydzL92rQbndFAYfdWSbEvovE3NICy5b1y8W44MJVX+XbgxWD0DT13e5ma8UbB0ioc8zhglI45E1WRQ4pWRkr0dUws1eu9He7iNPVDSfSkMLLXxPmdMD8sXyQBS3A3VxTD35vXVqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b1imPhxM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=0WX9a65FT7I3Ym
	uYFU3o9W3IqBTUvZx06xTfPHk6hRA=; b=b1imPhxMcicLMtlDKRo9wRxh29b79J
	oPgdT+pC67JuAh1tPplNjRzFhyp9NXS4xf8G5Dt/DBnhy24leAJGvygiwk/BiCXx
	RmtCqfBnlKvIlSOs8utlbBFY8J+iQeluzICK+Egb6TodaqrZhOyKhS6jvKj/OF37
	83sUaPJnTniMnEByvBNQYzbieIfq2Oh9/kULuxhkJ27Q213GcuBpB+g216I5kJXQ
	9ocSTU1T+DppHWCwp4zcTRur+7TmIOWml2nNK0zytyiZ++SRG/A5pD8XMxSUVkDk
	1utiatuM5bxdX0obi2lswGIQ9RysFGnp25F6Ew27Zhx+nG47o3CmShFg==
Received: (qmail 2015295 invoked from network); 25 Sep 2025 23:05:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 23:05:27 +0200
X-UD-Smtp-Session: l3s3148p1@IdZNh6Y/1qQujntx
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qii Wang <qii.wang@mediatek.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] i2c: mt65xx: convert set_speed function to void
Date: Thu, 25 Sep 2025 23:05:18 +0200
Message-ID: <20250925210517.9873-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cppcheck rightfully reports:
drivers/i2c/busses/i2c-mt65xx.c:1464:6: warning: Condition 'ret' is always false [knownConditionTrueFalse]

Make the function void and simplify the code.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index dee40704825c..aefdbee1f03c 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -868,7 +868,7 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	return 0;
 }
 
-static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
+static void mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 {
 	unsigned int clk_src;
 	unsigned int step_cnt;
@@ -938,9 +938,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 
 		break;
 	}
-
-
-	return 0;
 }
 
 static void i2c_dump_register(struct mtk_i2c *i2c)
@@ -1460,11 +1457,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	strscpy(i2c->adap.name, I2C_DRV_NAME, sizeof(i2c->adap.name));
 
-	ret = mtk_i2c_set_speed(i2c, clk_get_rate(i2c->clocks[speed_clk].clk));
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to set the speed.\n");
-		return -EINVAL;
-	}
+	mtk_i2c_set_speed(i2c, clk_get_rate(i2c->clocks[speed_clk].clk));
 
 	if (i2c->dev_comp->max_dma_support > 32) {
 		ret = dma_set_mask(&pdev->dev,
-- 
2.47.2


