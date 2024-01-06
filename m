Return-Path: <linux-i2c+bounces-1172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD1825F88
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 13:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 094B8B22914
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 12:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215F76FCB;
	Sat,  6 Jan 2024 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FSJLArIM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5778A6FC9
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id M66OrfxTUx8edM66OrYd6Z; Sat, 06 Jan 2024 13:48:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1704545317;
	bh=wMo3OL1UV9ggs46JbwA/uXhDsmPRILP1vW1vh9k8l3Y=;
	h=From:To:Cc:Subject:Date;
	b=FSJLArIMjWvmTKEo9wcC5fNVOSpcPdnq6T4CdnN/LQpV9xQ6rGRHCLfSWyob0lRTP
	 uLwyVHoVsJlm0T8zPZTFwWjrUYh0pbIJrelo1xD7fnY92y5oI3PcPKYmOGYOeTtUxS
	 j3NFrZchazAoZIjrXYpf3TdILkwJU/pDtFwKnqLGO9utncm1TRm8Zfp2gMuHDrFoIH
	 7nFyM1GSkhRGxZU9FG4XV9veJ8FfXE+AukCtEZXS9gw2HoiVY5UzLDIqGBVSnZGD+z
	 Fy5VbmQm9pZGaIhr8bQ1v7j/e6a00Aw2Aa33TC5Y+nnGK7t/KAQcMbuu6KSMBEG8dj
	 bp6GCUlGN2xbg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 06 Jan 2024 13:48:37 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ard Biesheuvel <ardb@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 1/2] i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()
Date: Sat,  6 Jan 2024 13:48:24 +0100
Message-Id: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after the clk_prepare_enable() call, it should be undone
by a corresponding clk_disable_unprepare() call, as already done in the
remove() function.

As devm_clk_get() is used, we can switch to devm_clk_get_enabled() to
handle it automatically and fix the probe.

Update the remove() function accordingly and remove the now useless
clk_disable_unprepare() call.

Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-synquacer.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index bbea521b05dd..a73f5bb9a164 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -550,17 +550,13 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 	device_property_read_u32(&pdev->dev, "socionext,pclk-rate",
 				 &i2c->pclkrate);
 
-	i2c->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (PTR_ERR(i2c->pclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (!IS_ERR_OR_NULL(i2c->pclk)) {
-		dev_dbg(&pdev->dev, "clock source %p\n", i2c->pclk);
-
-		ret = clk_prepare_enable(i2c->pclk);
-		if (ret)
-			return dev_err_probe(&pdev->dev, ret, "failed to enable clock\n");
-		i2c->pclkrate = clk_get_rate(i2c->pclk);
-	}
+	i2c->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(i2c->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->pclk),
+				     "failed to get and enable clock\n");
+
+	dev_dbg(&pdev->dev, "clock source %p\n", i2c->pclk);
+	i2c->pclkrate = clk_get_rate(i2c->pclk);
 
 	if (i2c->pclkrate < SYNQUACER_I2C_MIN_CLK_RATE ||
 	    i2c->pclkrate > SYNQUACER_I2C_MAX_CLK_RATE)
@@ -615,8 +611,6 @@ static void synquacer_i2c_remove(struct platform_device *pdev)
 	struct synquacer_i2c *i2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c->adapter);
-	if (!IS_ERR(i2c->pclk))
-		clk_disable_unprepare(i2c->pclk);
 };
 
 static const struct of_device_id synquacer_i2c_dt_ids[] __maybe_unused = {
-- 
2.34.1


