Return-Path: <linux-i2c+bounces-6166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E996BC7F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C436F1F213AA
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2921D88DF;
	Wed,  4 Sep 2024 12:36:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526171CF5F5
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453367; cv=none; b=QCcfqepTikhhE35ftueVv2j1Gp0hHrjjSty1ObzaGrdXyALMhMIRSZOLWMqbHMFitpunHpqNw7Ektqa0b2J/ytae+zUIP+PBiiuxy5itut/fDF0yfuqb8qgeRhUMT7OdTTh32EdsmqdMl031vxWaT0SWH9KyewBLeTYML3FxcQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453367; c=relaxed/simple;
	bh=wTEVfCsLZjBzirXYueN8+5dXPnCIH9/DiCdWU5V9gHc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FQ8K2i45NdG7ZP47Eo9hFYBuiVUpjoS4WQJpahh5QcZQ9p8Y2BbM3PgMzbFBaQZM5yLQbHKaZz8dkDCKemZvSE1v1z/1uvfjbF1c4nWRyNI3/pooT0smKImDMQmEYBP+R0MtmjcYx6GxcWc12AvuL++Sf593w0Ut8s+xDTBab3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WzMR00gKJz2Dbjf;
	Wed,  4 Sep 2024 20:35:40 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 827AA1400DB;
	Wed,  4 Sep 2024 20:36:00 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Sep
 2024 20:35:59 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <chris.packham@alliedtelesis.co.nz>, <andi.shyti@kernel.org>,
	<linux-i2c@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH v2] i2c: mpc: Use devm_clk_get_optional_enabled() to simplify code
Date: Wed, 4 Sep 2024 20:22:26 +0800
Message-ID: <20240904122226.85377-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

devm_clk_get_optional() and clk_prepare_enable() can be replaced by helper
function devm_clk_get_optional_enabled(). Let's simplify code with use of
devm_clk_get_optional_enabled() and avoid calling clk_disable_unprepare().

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
v2: Fix mistakes in commit message.

 drivers/i2c/busses/i2c-mpc.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 41d6c8ed163a..236d6b8ba867 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -88,7 +88,6 @@ struct mpc_i2c {
 	int irq;
 	u32 real_clk;
 	u8 fdr, dfsrr;
-	struct clk *clk_per;
 	u32 cntl_bits;
 	enum mpc_i2c_action action;
 	struct i2c_msg *msgs;
@@ -779,7 +778,6 @@ static int fsl_i2c_probe(struct platform_device *op)
 	struct clk *clk;
 	int result;
 	u32 clock;
-	int err;
 
 	i2c = devm_kzalloc(&op->dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -809,18 +807,12 @@ static int fsl_i2c_probe(struct platform_device *op)
 	 * enable clock for the I2C peripheral (non fatal),
 	 * keep a reference upon successful allocation
 	 */
-	clk = devm_clk_get_optional(&op->dev, NULL);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	err = clk_prepare_enable(clk);
-	if (err) {
+	clk = devm_clk_get_optional_enabled(&op->dev, NULL);
+	if (IS_ERR(clk)) {
 		dev_err(&op->dev, "failed to enable clock\n");
-		return err;
+		return PTR_ERR(clk);
 	}
 
-	i2c->clk_per = clk;
-
 	if (of_property_read_bool(op->dev.of_node, "fsl,preserve-clocking")) {
 		clock = MPC_I2C_CLOCK_PRESERVE;
 	} else {
@@ -876,14 +868,9 @@ static int fsl_i2c_probe(struct platform_device *op)
 
 	result = i2c_add_numbered_adapter(&i2c->adap);
 	if (result)
-		goto fail_add;
+		return result;
 
 	return 0;
-
- fail_add:
-	clk_disable_unprepare(i2c->clk_per);
-
-	return result;
 };
 
 static void fsl_i2c_remove(struct platform_device *op)
@@ -891,8 +878,6 @@ static void fsl_i2c_remove(struct platform_device *op)
 	struct mpc_i2c *i2c = platform_get_drvdata(op);
 
 	i2c_del_adapter(&i2c->adap);
-
-	clk_disable_unprepare(i2c->clk_per);
 };
 
 static int __maybe_unused mpc_i2c_suspend(struct device *dev)
-- 
2.17.1


