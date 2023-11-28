Return-Path: <linux-i2c+bounces-507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 545DF7FB6F5
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 11:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D810BB21ACC
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 10:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EF34E1CA;
	Tue, 28 Nov 2023 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernkonzept.com header.i=@kernkonzept.com header.b="bRvo0HuL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570AA12C
	for <linux-i2c@vger.kernel.org>; Tue, 28 Nov 2023 02:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kernkonzept.com; s=mx1; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description;
	bh=DTg3r4s2dq7irVOmMsd/CGuliapoNYe5wHImtDJ9WS0=; b=bRvo0HuLxOYk643Rru5OD62uMA
	wLoJqM+cxZ9oFqxb6Ikj1xcFGAHwFEOSKrv0afkPCyKsOkOnD2smw+XOStqx2pAU0BPLuSOwYwBz9
	Bj5wgtYp+DUF853pZKX2e3kEr2CEIgo5B2l4IK8lHYiEIs7f3Voa3friROnt7ysehS3YYZO1p6D1b
	tzIA7d38j3Yke2uMff0RZDNjuTrU7DOlf2wAU6rfx8fui06ySGaaOZH88sSQqK5rq8ucqEOKQ3s2W
	4MgvNDxMOC08yqBgMdW0rLa1PrxiOJwTzgocFUkFtJMvYkMGI+McEshHi2pYs/OeIhgrDYlVgz93z
	oJMn64Ag==;
Received: from [10.22.3.24] (helo=serv1.dd1.int.kernkonzept.com)
	by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.96)
	id 1r7uhw-008Pi6-07;
	Tue, 28 Nov 2023 10:48:44 +0100
From: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Date: Tue, 28 Nov 2023 10:48:37 +0100
Subject: [PATCH 3/3] i2c: qup: Vote for interconnect bandwidth to DRAM
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
In-Reply-To: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stephan Gerhold <stephan.gerhold@kernkonzept.com>
X-Mailer: b4 0.12.4

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
---
The bandwidth calculation is taken over from Qualcomm's
downstream/vendor driver [1]. Due to lack of documentation about the
interconnect setup/behavior I cannot say exactly if this is right.
Unfortunately, this is not implemented very consistently downstream...

[1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/commit/67174e2624ea64814231e7e1e4af83fd882302c6
---
 drivers/i2c/busses/i2c-qup.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 598102d16677..ee92a315f074 100644
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
2.39.2


