Return-Path: <linux-i2c+bounces-1173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D1E825F8B
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 13:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 519E41F22798
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 12:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0606179F0;
	Sat,  6 Jan 2024 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="X/ZovKK4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C257475
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id M66OrfxTUx8edM66SrYd73; Sat, 06 Jan 2024 13:48:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1704545322;
	bh=5WCU2WxftK4MgUCqjvT44D3T0b8CqtpjpLooTBQtBWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X/ZovKK4B5kCsbaGN/VkvDOM79iMk/4lfy2Wgp19k3Tox+ZhyGypNcSxEwlbjL3a0
	 a2x4JoG7TBcQZcBq7uA1Y9wiF9Ut7BQCWdHLP+qMeMKM1rL0SIqU3AsfW+pMhHtsM0
	 7z3K6T5320xwn5uEe03nPl6SAKVI9aL051ttmRR45ErrBHqx5JusWzzrFJ1YyfET3E
	 zQRaVn8055NbT/oqfuiLCAins+y7llv3FWDtxT5fsU36buSonpQ8xAbH2MxlP+iUAj
	 AiAFQ3Bq4rQDsRutOtZEyrRErDTfqiUEYe7oKBIpoeFCs1yL2czsNXqw5Sik5fRI96
	 qYyAbVTlnW6Tg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 06 Jan 2024 13:48:42 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ard Biesheuvel <ardb@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] i2c: synquacer: Remove a clk reference from struct synquacer_i2c
Date: Sat,  6 Jan 2024 13:48:25 +0100
Message-Id: <01e5b93d75eaeb071c6864f8b43355a7c24e0c91.1704545258.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
References: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'pclk' is only used locally in the probe. Remove it from the
'synquacer_i2c' structure.

Also remove a useless debug message.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-synquacer.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index a73f5bb9a164..e774b9f499b6 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -138,7 +138,6 @@ struct synquacer_i2c {
 	int			irq;
 	struct device		*dev;
 	void __iomem		*base;
-	struct clk		*pclk;
 	u32			pclkrate;
 	u32			speed_khz;
 	u32			timeout_ms;
@@ -535,6 +534,7 @@ static const struct i2c_adapter synquacer_i2c_ops = {
 static int synquacer_i2c_probe(struct platform_device *pdev)
 {
 	struct synquacer_i2c *i2c;
+	struct clk *pclk;
 	u32 bus_speed;
 	int ret;
 
@@ -550,13 +550,12 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 	device_property_read_u32(&pdev->dev, "socionext,pclk-rate",
 				 &i2c->pclkrate);
 
-	i2c->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
-	if (IS_ERR(i2c->pclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->pclk),
+	pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pclk),
 				     "failed to get and enable clock\n");
 
-	dev_dbg(&pdev->dev, "clock source %p\n", i2c->pclk);
-	i2c->pclkrate = clk_get_rate(i2c->pclk);
+	i2c->pclkrate = clk_get_rate(pclk);
 
 	if (i2c->pclkrate < SYNQUACER_I2C_MIN_CLK_RATE ||
 	    i2c->pclkrate > SYNQUACER_I2C_MAX_CLK_RATE)
-- 
2.34.1


