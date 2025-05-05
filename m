Return-Path: <linux-i2c+bounces-10799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7078AAAD59
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 04:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1D883ACB7B
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 02:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE8430224B;
	Mon,  5 May 2025 23:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0IpJ3gg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1143ABD0F;
	Mon,  5 May 2025 23:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487135; cv=none; b=B0s0NL51bCWT9O7jQO1PF9Vu+1IKD1STSrl2cUIefFh/dGy8bNXrZK2iPWuZmOhgrNif1XZoEZ7saR4+AjXVg4nmTaQb5vOJRkMIVVL97RttffmnyVIfpQscQKUwE2IZKL13evtm/4yEkO4rDNW/EH3nHVs3QIuJrCq2DgQTGEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487135; c=relaxed/simple;
	bh=qTxNbjl/ouTA/+MUTHrtF8u0WvO8DbjsyhUi7AL2Iq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HSkRxQu3cCE0I0Ct5T7ZahOP4heKfwsgZLIaAB9ojUiNPZmUSlchhGJ7aaB5aqRQdPZ2iMZ/N81xBIZtLWHC4pKi4Kt1tHlAJt2iGkWZjGcAgqk+yvNRfKl2jYwAhgh5E666mo7q2fs5nWPFYkBFdOu7ER0N7XytUpiR7Eprkno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0IpJ3gg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2DFC4CEE4;
	Mon,  5 May 2025 23:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487134;
	bh=qTxNbjl/ouTA/+MUTHrtF8u0WvO8DbjsyhUi7AL2Iq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X0IpJ3ggwPmuTh/PwQpjUbnmVSagX2cq96aap1kHyt6e9QbWwLSR6VVK5IDmGtUha
	 W6LXGX7f72OpxvGW3uM5HZsdoxZZ9QcDlV4cM0f4AWK2N+ua18zHVvFSnvakawp0LI
	 PL44KxLFsnzd9Df53IY6VhiD1VsOhgqvZjSMfJhn7x/Gq6sG4+qqxDRji6fNS3Z3HY
	 9Jpz08/aIVI4HnySZyr9fNDKCWwyRHxg+t9OcYA2K42TWdo5CIjo7Op0/UrQuOYyg+
	 G36YrzgVKXT/XD3V8xQSToxslTobtD1Tr1CKss4TgVVRFa26U6G12Si6xj4Ij+UEZs
	 i/cIHfHGwGtZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 017/114] i2c: qup: Vote for interconnect bandwidth to DRAM
Date: Mon,  5 May 2025 19:16:40 -0400
Message-Id: <20250505231817.2697367-17-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Transfer-Encoding: 8bit

From: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

[ Upstream commit d4f35233a6345f62637463ef6e0708f44ffaa583 ]

When the I2C QUP controller is used together with a DMA engine it needs
to vote for the interconnect path to the DRAM. Otherwise it may be
unable to access the memory quickly enough.

The requested peak bandwidth is dependent on the I2C core clock.

To avoid sending votes too often the bandwidth is always requested when
a DMA transfer starts, but dropped only on runtime suspend. Runtime
suspend should only happen if no transfer is active. After resumption we
can defer the next vote until the first DMA transfer actually happens.

The implementation is largely identical to the one introduced for
spi-qup in commit ecdaa9473019 ("spi: qup: Vote for interconnect
bandwidth to DRAM") since both drivers represent the same hardware
block.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Link: https://lore.kernel.org/r/20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-qup.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 576c12670bd88..8fd51de64d96b 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -14,6 +14,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -150,6 +151,8 @@
 /* TAG length for DATA READ in RX FIFO  */
 #define READ_RX_TAGS_LEN		2
 
+#define QUP_BUS_WIDTH			8
+
 static unsigned int scl_freq;
 module_param_named(scl_freq, scl_freq, uint, 0444);
 MODULE_PARM_DESC(scl_freq, "SCL frequency override");
@@ -227,6 +230,7 @@ struct qup_i2c_dev {
 	int			irq;
 	struct clk		*clk;
 	struct clk		*pclk;
+	struct icc_path		*icc_path;
 	struct i2c_adapter	adap;
 
 	int			clk_ctl;
@@ -255,6 +259,10 @@ struct qup_i2c_dev {
 	/* To configure when bus is in run state */
 	u32			config_run;
 
+	/* bandwidth votes */
+	u32			src_clk_freq;
+	u32			cur_bw_clk_freq;
+
 	/* dma parameters */
 	bool			is_dma;
 	/* To check if the current transfer is using DMA */
@@ -453,6 +461,23 @@ static int qup_i2c_bus_active(struct qup_i2c_dev *qup, int len)
 	return ret;
 }
 
+static int qup_i2c_vote_bw(struct qup_i2c_dev *qup, u32 clk_freq)
+{
+	u32 needed_peak_bw;
+	int ret;
+
+	if (qup->cur_bw_clk_freq == clk_freq)
+		return 0;
+
+	needed_peak_bw = Bps_to_icc(clk_freq * QUP_BUS_WIDTH);
+	ret = icc_set_bw(qup->icc_path, 0, needed_peak_bw);
+	if (ret)
+		return ret;
+
+	qup->cur_bw_clk_freq = clk_freq;
+	return 0;
+}
+
 static void qup_i2c_write_tx_fifo_v1(struct qup_i2c_dev *qup)
 {
 	struct qup_i2c_block *blk = &qup->blk;
@@ -840,6 +865,10 @@ static int qup_i2c_bam_xfer(struct i2c_adapter *adap, struct i2c_msg *msg,
 	int ret = 0;
 	int idx = 0;
 
+	ret = qup_i2c_vote_bw(qup, qup->src_clk_freq);
+	if (ret)
+		return ret;
+
 	enable_irq(qup->irq);
 	ret = qup_i2c_req_dma(qup);
 
@@ -1645,6 +1674,7 @@ static void qup_i2c_disable_clocks(struct qup_i2c_dev *qup)
 	config = readl(qup->base + QUP_CONFIG);
 	config |= QUP_CLOCK_AUTO_GATE;
 	writel(config, qup->base + QUP_CONFIG);
+	qup_i2c_vote_bw(qup, 0);
 	clk_disable_unprepare(qup->pclk);
 }
 
@@ -1745,6 +1775,11 @@ static int qup_i2c_probe(struct platform_device *pdev)
 			goto fail_dma;
 		}
 		qup->is_dma = true;
+
+		qup->icc_path = devm_of_icc_get(&pdev->dev, NULL);
+		if (IS_ERR(qup->icc_path))
+			return dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
+					     "failed to get interconnect path\n");
 	}
 
 nodma:
@@ -1793,6 +1828,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		qup_i2c_enable_clocks(qup);
 		src_clk_freq = clk_get_rate(qup->clk);
 	}
+	qup->src_clk_freq = src_clk_freq;
 
 	/*
 	 * Bootloaders might leave a pending interrupt on certain QUP's,
-- 
2.39.5


