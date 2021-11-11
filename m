Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E584C44D35E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 09:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhKKIuz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 03:50:55 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:25038 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbhKKIuw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 03:50:52 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211111084800epoutp03dd0cc5f0bd6a9deb0b0aee58ac9c72e5~2caf7oBsT0337203372epoutp03h
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 08:48:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211111084800epoutp03dd0cc5f0bd6a9deb0b0aee58ac9c72e5~2caf7oBsT0337203372epoutp03h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636620480;
        bh=vNRGDQawKCmuc0G3dkgEOTB1j1MIh4N0R+01yzMG9gU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N7bCIt5qBIGoKyV4zIP0128/s/7zgmgBRolYurmD2dmZOxP+GAmTcvAZ8tDZyc4cV
         ZRvIxp27PBmRsF5Np6ABdkC2sJZfo6CVlmHGtSgMZhCCPvpvNZW/9SkLiFk13ZkibS
         E+fWSWUxim+emxax25OMp9mdFO7RbKlqHmuJW+8g=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211111084800epcas2p1d9d057a7e2e48ae79b242af30d4c46a3~2caflhPQv0752207522epcas2p1b;
        Thu, 11 Nov 2021 08:48:00 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Hqb2h4qbZz4x9Q2; Thu, 11 Nov
        2021 08:47:56 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        DF.34.51767.5B8DC816; Thu, 11 Nov 2021 17:47:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211111084749epcas2p1e80b3f3657310498bfdae65c425b3278~2caVMuCo20752207522epcas2p1_;
        Thu, 11 Nov 2021 08:47:49 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211111084749epsmtrp1e5a3985c46446422d9b4062680b4b868~2caVMBTyl2177521775epsmtrp1Y;
        Thu, 11 Nov 2021 08:47:49 +0000 (GMT)
X-AuditID: b6c32a45-c69bba800000ca37-07-618cd8b5441f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B9.C8.08738.5B8DC816; Thu, 11 Nov 2021 17:47:49 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211111084749epsmtip2ca99504cac0149ce945a00c71ce6451a~2caVClHu41450214502epsmtip2j;
        Thu, 11 Nov 2021 08:47:49 +0000 (GMT)
From:   Jaewon Kim <jaewon02.kim@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        chanho61.park@samsung.com,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Date:   Thu, 11 Nov 2021 17:43:27 +0900
Message-Id: <20211111084327.106696-3-jaewon02.kim@samsung.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111084327.106696-1-jaewon02.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+LIzCtJLcpLzFFi42LZdljTTHfrjZ5Egyu/1Cwu79e22NFwhNVi
        49sfTBYdf78wWsw4v4/JonXvEXaL531A1t39cxkdODxmNfSyeWxa1cnmcefaHjaPvi2rGD0+
        b5ILYI3KtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB
        OkVJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBk
        ClSYkJ3x7+hOpoJPdhVrL5Y1ME416mLk5JAQMJFYOHU9axcjF4eQwA5GiR1f97JAOJ8YJTo3
        dbBBOJ8ZJea1b2GDaZly5Rk7RGIXo8TJb8cZIZyPjBLtL7aDVbEJaEt8X7+YFcQWEaiT6N7V
        ClbELLCJUeLih9lgRcICzhK7bq5l7mLk4GARUJU4sEMUJMwrYCex8vkEJoht8hITJ9xjB7E5
        Bewl3k2YzQ5RIyhxcuYTFhCbGaimeetsZpD5EgIv2SX271zKCtHsIjHr2gUWCFtY4tXxLewQ
        tpTEy/42dpC9EgL1El9vOED09jBKrOn6BbXYXuLX9C2sIDXMApoS63fpQ5QrSxy5BbWWT6Lj
        8F+oKbwSHW1CEI1qEvennoOGlYzEpCMroQZ6SLT93wwN6kmMEqd3vmGZwKgwC8k3s5B8Mwth
        8QJG5lWMYqkFxbnpqcVGBYbwCE7Oz93ECE6ZWq47GCe//aB3iJGJg/EQowQHs5II7/dLPYlC
        vCmJlVWpRfnxRaU5qcWHGE2BQT2RWUo0OR+YtPNK4g1NLA1MzMwMzY1MDcyVxHktRbMThQTS
        E0tSs1NTC1KLYPqYODilGphWLrhu5fkowdS74c/hVTHH9nW379Te9njRtoO9s/4wzwsv7FJe
        o/f2ULe2S1rO/LJb2auW7HedxuEtEDe5cffxa1OeV0yv6P0zKUFtenp17q8SvxSx78ePMmlw
        eFVnfYo5d6n80NGlAe+WeUa798a4hbZUPH0nPLPh/oJfjT8YdM2Clv6PvfVQsK7hX9CCUN/d
        P2r5Ge7MvV+v0Vh/xX3ztGOX05ZsyT3MGZSYGtYhYXX3nEtJ6PPZ9+30FqvfCDhwdYrSmm28
        KoZzLQ9PTcvz0vcRZIjmnVHeqztx983YD/+1TyaEXb3JNPOf+3ImHtVJV2Ysusso+sVCRWSj
        9fJbH7ZeFnjTKVekodj/R6lTiaU4I9FQi7moOBEAKa9xISIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWy7bCSvO7WGz2JBteXC1lc3q9tsaPhCKvF
        xrc/mCw6/n5htJhxfh+TReveI+wWz/uArLv75zI6cHjMauhl89i0qpPN4861PWwefVtWMXp8
        3iQXwBrFZZOSmpNZllqkb5fAlfHv6E6mgk92FWsvljUwTjXqYuTkkBAwkZhy5Rl7FyMXh5DA
        DkaJznPfWSESMhLLn/WxQdjCEvdbjrBCFL1nlHi+dQ87SIJNQFvi+/rFYAkRgQZGibffFjGB
        JJgFtjFKNDWUg9jCAs4Su26uZe5i5OBgEVCVOLBDFCTMK2AnsfL5BCaIBfISEyfcA5vJKWAv
        8W7CbDBbCKhm4ernzBD1ghInZz5hgRgvL9G8dTbzBEaBWUhSs5CkFjAyrWKUTC0ozk3PLTYs
        MMpLLdcrTswtLs1L10vOz93ECA5uLa0djHtWfdA7xMjEwXiIUYKDWUmE9/ulnkQh3pTEyqrU
        ovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUamLzn9zXWrWBKX/O5rTWI
        JfHIQf6C5K1Bqy85dCz+HGbyKmWm7s+Nnr57Y1tcFJK1kroW5rLfZZU5qFV8oVonfn/apyAn
        rbKXOQzeRpNmse6riNuxs6X2rfnb/reRLSV6Mz5etM6rkGSu2clw93T9pJSeY/vZu149PvIx
        vsM/pd5maoUpv3gNp86amX5NW4p2nEuqLNaczR/y2HJeA7v8qpLkYGkFXbaD82W8cl+cjJkT
        NIc1I8snr28T16rq0rfZ0asDY30/LVM7t3ItQ87G3pyqhrhohkCXD3GTbnEF3ToVVcTdm8G2
        TyHKgnn9y3eXq1YHsRyLqpuRWB0UXd/GZS/8r2tyYHJsZmy6hxJLcUaioRZzUXEiAK0giO/d
        AgAA
X-CMS-MailID: 20211111084749epcas2p1e80b3f3657310498bfdae65c425b3278
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211111084749epcas2p1e80b3f3657310498bfdae65c425b3278
References: <20211111084327.106696-1-jaewon02.kim@samsung.com>
        <CGME20211111084749epcas2p1e80b3f3657310498bfdae65c425b3278@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Serial IPs(UART, I2C, SPI) are integrated into New IP-Core
called USI(Universal Serial Interface).

As it is integrated into USI, there are additinal HW changes.
Registers to control USI and sysreg to set serial IPs have been added.
Also, some timing registres have been changed.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 133 ++++++++++++++++++++++++++++---
 1 file changed, 123 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 97d4f3ac0abd..6a05af550aa5 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -22,6 +22,8 @@
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/spinlock.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 /*
  * HSI2C controller from Samsung supports 2 modes of operation
@@ -166,9 +168,21 @@
 
 #define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(100))
 
+/* USI(Universal Serial Interface) Register map */
+#define USI_CON					0xc4
+#define USI_OPTION				0xc8
+
+/* USI(Universal Serial Interface) Register bits */
+#define USI_CON_RESET				BIT(0)
+
+/* SYSREG Register bit */
+#define SYSREG_USI_SW_CONF_MASK			(0x7 << 0)
+#define SYSREG_I2C_SW_CONF			BIT(2)
+
 enum i2c_type_exynos {
 	I2C_TYPE_EXYNOS5,
 	I2C_TYPE_EXYNOS7,
+	I2C_TYPE_EXYNOSAUTOV9,
 };
 
 struct exynos5_i2c {
@@ -199,6 +213,10 @@ struct exynos5_i2c {
 
 	/* Version of HS-I2C Hardware */
 	const struct exynos_hsi2c_variant *variant;
+
+	/* USI sysreg info */
+	struct regmap		*usi_sysreg;
+	unsigned int		usi_offset;
 };
 
 /**
@@ -212,24 +230,34 @@ struct exynos5_i2c {
  */
 struct exynos_hsi2c_variant {
 	unsigned int		fifo_depth;
+	unsigned int		has_usi;
 	enum i2c_type_exynos	hw;
 };
 
 static const struct exynos_hsi2c_variant exynos5250_hsi2c_data = {
 	.fifo_depth	= 64,
+	.has_usi	= 0,
 	.hw		= I2C_TYPE_EXYNOS5,
 };
 
 static const struct exynos_hsi2c_variant exynos5260_hsi2c_data = {
 	.fifo_depth	= 16,
+	.has_usi	= 0,
 	.hw		= I2C_TYPE_EXYNOS5,
 };
 
 static const struct exynos_hsi2c_variant exynos7_hsi2c_data = {
 	.fifo_depth	= 16,
+	.has_usi	= 0,
 	.hw		= I2C_TYPE_EXYNOS7,
 };
 
+static const struct exynos_hsi2c_variant exynosautov9_hsi2c_data = {
+	.fifo_depth	= 64,
+	.has_usi	= 1,
+	.hw		= I2C_TYPE_EXYNOSAUTOV9,
+};
+
 static const struct of_device_id exynos5_i2c_match[] = {
 	{
 		.compatible = "samsung,exynos5-hsi2c",
@@ -243,6 +271,9 @@ static const struct of_device_id exynos5_i2c_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-hsi2c",
 		.data = &exynos7_hsi2c_data
+	}, {
+		.compatible = "samsung,exynosautov9-hsi2c",
+		.data = &exynosautov9_hsi2c_data
 	}, {},
 };
 MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
@@ -281,6 +312,31 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 		i2c->op_clock;
 	int div, clk_cycle, temp;
 
+	/* In case of HSI2C controllers in EXYNOSAUTOV9
+	 * timing control formula changed.
+	 *
+	 * FSCL = IPCLK / ((CLK_DIV + 1) * 16)
+	 * T_SCL_LOW = IPCLK * (CLK_DIV + 1) * (N + M)
+	 *  [N : number of 0's in the TSCL_H_HS]
+	 *  [M : number of 0's in the TSCL_L_HS]
+	 * T_SCL_HIGH = IPCLK * (CLK_DIV + 1) * (N + M)
+	 *  [N : number of 1's in the TSCL_H_HS]
+	 *  [M : number of 1's in the TSCL_L_HS]
+	 *
+	 *  result of (N + M) is always 8.
+	 *  In general use case, we don't need to control timing_s1, timing_s2.
+	 */
+	if (i2c->variant->hw == I2C_TYPE_EXYNOSAUTOV9) {
+		div = ((clkin / (16 * i2c->op_clock)) - 1);
+		i2c_timing_s3 = div << 16;
+		if (hs_timings)
+			writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_HS3);
+		else
+			writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_FS3);
+
+		return 0;
+	}
+
 	/*
 	 * In case of HSI2C controller in Exynos5 series
 	 * FPCLK / FI2C =
@@ -355,6 +411,20 @@ static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
 	return exynos5_i2c_set_timing(i2c, true);
 }
 
+static void exynos_usi_reset(struct exynos5_i2c *i2c)
+{
+	u32 val;
+
+	val = readl(i2c->regs + USI_CON);
+	val |= USI_CON_RESET;
+	writel(val, i2c->regs + USI_CON);
+	udelay(1);
+
+	val = readl(i2c->regs + USI_CON);
+	val &= ~USI_CON_RESET;
+	writel(val, i2c->regs + USI_CON);
+}
+
 /*
  * exynos5_i2c_init: configures the controller for I2C functionality
  * Programs I2C controller for Master mode operation
@@ -385,6 +455,9 @@ static void exynos5_i2c_reset(struct exynos5_i2c *i2c)
 {
 	u32 i2c_ctl;
 
+	if (i2c->variant->hw == I2C_TYPE_EXYNOSAUTOV9)
+		exynos_usi_reset(i2c);
+
 	/* Set and clear the bit for reset */
 	i2c_ctl = readl(i2c->regs + HSI2C_CTL);
 	i2c_ctl |= HSI2C_SW_RST;
@@ -422,7 +495,8 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 	writel(int_status, i2c->regs + HSI2C_INT_STATUS);
 
 	/* handle interrupt related to the transfer status */
-	if (i2c->variant->hw == I2C_TYPE_EXYNOS7) {
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS7 ||
+			i2c->variant->hw == I2C_TYPE_EXYNOSAUTOV9) {
 		if (int_status & HSI2C_INT_TRANS_DONE) {
 			i2c->trans_done = 1;
 			i2c->state = 0;
@@ -569,13 +643,13 @@ static void exynos5_i2c_bus_check(struct exynos5_i2c *i2c)
 {
 	unsigned long timeout;
 
-	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS5)
 		return;
 
 	/*
-	 * HSI2C_MASTER_ST_LOSE state in EXYNOS7 variant before transaction
-	 * indicates that bus is stuck (SDA is low). In such case bus recovery
-	 * can be performed.
+	 * HSI2C_MASTER_ST_LOSE state in EXYNOS7 or EXYNOSAUTOV9 variant before
+	 * transaction indicates that bus is stuck (SDA is low).
+	 * In such case bus recovery can be performed.
 	 */
 	timeout = jiffies + msecs_to_jiffies(100);
 	for (;;) {
@@ -611,10 +685,10 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
 	unsigned long flags;
 	unsigned short trig_lvl;
 
-	if (i2c->variant->hw == I2C_TYPE_EXYNOS7)
-		int_en |= HSI2C_INT_I2C_TRANS;
-	else
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS5)
 		int_en |= HSI2C_INT_I2C;
+	else
+		int_en |= HSI2C_INT_I2C_TRANS;
 
 	i2c_ctl = readl(i2c->regs + HSI2C_CTL);
 	i2c_ctl &= ~(HSI2C_TXCHON | HSI2C_RXCHON);
@@ -738,6 +812,41 @@ static const struct i2c_algorithm exynos5_i2c_algorithm = {
 	.functionality		= exynos5_i2c_func,
 };
 
+static int exynos_usi_init(struct exynos5_i2c *i2c)
+{
+	struct device *dev = i2c->dev;
+	int ret;
+
+	if (!i2c->variant->has_usi)
+		return 0;
+
+	/* System Register has a field that can select the serial IP
+	 * provided by USI. We need to set it to I2C to use I2C.
+	 */
+	i2c->usi_sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
+							  "samsung,sysreg");
+	if (IS_ERR(i2c->usi_sysreg)) {
+		dev_err(dev, "Cannot find sysreg\n");
+		return PTR_ERR(i2c->usi_sysreg);
+	}
+
+	ret = of_property_read_u32_index(dev->of_node, "samsung,sysreg",
+					 1, &i2c->usi_offset);
+	if (ret) {
+		dev_err(dev, "sysreg offset is not specified\n");
+		return ret;
+	}
+
+	ret = regmap_update_bits(i2c->usi_sysreg, i2c->usi_offset,
+			SYSREG_USI_SW_CONF_MASK, SYSREG_I2C_SW_CONF);
+	if (ret < 0)
+		return ret;
+
+	exynos_usi_reset(i2c);
+
+	return 0;
+}
+
 static int exynos5_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -777,6 +886,12 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	i2c->adap.algo_data = i2c;
 	i2c->adap.dev.parent = &pdev->dev;
 
+	i2c->variant = of_device_get_match_data(&pdev->dev);
+
+	ret = exynos_usi_init(i2c);
+	if (ret)
+		return ret;
+
 	/* Clear pending interrupts from u-boot or misc causes */
 	exynos5_i2c_clr_pend_irq(i2c);
 
@@ -794,8 +909,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	i2c->variant = of_device_get_match_data(&pdev->dev);
-
 	ret = exynos5_hsi2c_clock_setup(i2c);
 	if (ret)
 		goto err_clk;
-- 
2.33.1

