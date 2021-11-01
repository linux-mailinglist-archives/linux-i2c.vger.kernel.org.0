Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF5E441AC6
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 12:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbhKALok (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 07:44:40 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:43588 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbhKALok (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 07:44:40 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211101114205epoutp04ed04d4709352d57e46eaa1776461a180~zaVoMY05a1474814748epoutp04W
        for <linux-i2c@vger.kernel.org>; Mon,  1 Nov 2021 11:42:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211101114205epoutp04ed04d4709352d57e46eaa1776461a180~zaVoMY05a1474814748epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635766925;
        bh=QN+i4jk5sZNzsmQDPHkVcSROkjef5YbRggvFnVgoBn4=;
        h=From:To:Cc:Subject:Date:References:From;
        b=V8dJSfsuIaeHIAGoNe11KQCBADBaHY3CAVt4FYqBKI/rYg0Eqk06PgtmdiqQ9v3od
         VNLi2LWYnZ5d90zLh8UAiRmtVXH11C/wHXt8/AcdYY46oQCSDU3zQLbe9zfcAQS6ME
         Cn+ZrVl4mhk0c+W7SgVVKPZ5rjAQQfZTR3eTNhWM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211101114204epcas2p480621179bb911c6c56861afaa076ed0b~zaVn7oG-_2684026840epcas2p4F;
        Mon,  1 Nov 2021 11:42:04 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.89]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HjWN6624Cz4x9Q3; Mon,  1 Nov
        2021 11:41:58 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        0B.55.10014.682DF716; Mon,  1 Nov 2021 20:41:58 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211101114158epcas2p1d0762d52029b1b09912fd99665dd66f5~zaVh34sFr2930929309epcas2p15;
        Mon,  1 Nov 2021 11:41:58 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211101114158epsmtrp1b6726529433fdd6c007b7b2eafd049e6~zaVh3MCSC1195811958epsmtrp1B;
        Mon,  1 Nov 2021 11:41:58 +0000 (GMT)
X-AuditID: b6c32a47-489ff7000000271e-db-617fd286b854
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C3.69.08738.682DF716; Mon,  1 Nov 2021 20:41:58 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211101114158epsmtip21baa0edd755472331bc85ef878246980~zaVhsJ6Wb3135631356epsmtip28;
        Mon,  1 Nov 2021 11:41:58 +0000 (GMT)
From:   Jaewon Kim <jaewon02.kim@samsung.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Chanho Park <chanho61.park@samsung.com>, linux-i2c@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH 1/2] i2c: exynos5: support USI(Universal Serial Interface)
Date:   Mon,  1 Nov 2021 20:38:18 +0900
Message-Id: <20211101113819.50651-1-jaewon02.kim@samsung.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHKsWRmVeSWpSXmKPExsWy7bCmuW7bpfpEg1ULDC0u79e22NFwhNVi
        49sfTBYdf78wWlzeNYfNYsb5fUwWrXuPsFvc3T+X0YHDY1ZDL5vHplWdbB59W1YxenzeJBfA
        EpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0hZJC
        WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLxArzgxt7g0L10vL7XEytDAwMgUqDAh
        O+Pc5+MsBfMsK17vesnSwPhWt4uRk0NCwETi3dUFbF2MXBxCAjsYJRY1P2eFcD4xSnRf/sEE
        4XwGykzvY+xi5ABr+bHdCyK+i1Fi1bQ3UB0fGSXW/L/PBjKXTUBb4vv6xawgtohAnUTb0xks
        IEXMApsYJR5MbmEGSQgLeEnMOX6LBcRmEVCVONx6GayZV8BW4m3XLmaIA+UlJk64xw4RF5Q4
        OfMJWD0zULx562xmkKESAufYJbbs6WODaHCReHKjhxXCFpZ4dXwLO4QtJfGyv40d4oV6ia83
        HCB6e4Cu7vrFBFFjL/Fr+hZWkBpmAU2J9bv0IcqVJY7cglrLJ9Fx+C/UFF6JjjYhiEY1iftT
        z0EdICMx6chKqIEeEn+2/AI7QEggVuLM7d+sExjlZyF5ZhaSZ2Yh7F3AyLyKUSy1oDg3PbXY
        qMAYHqnJ+bmbGMEJUct9B+OMtx/0DjEycTAeYpTgYFYS4Y24UJMoxJuSWFmVWpQfX1Sak1p8
        iNEUGLwTmaVEk/OBKTmvJN7QxNLAxMzM0NzI1MBcSZzXUjQ7UUggPbEkNTs1tSC1CKaPiYNT
        qoGp/32YwKy4XaGfLSOW3LywvmjLIk/THTd3TFm80ej4EneFCQmcqgVJmR6ff+W9/qx1Jiup
        wahLufPUfe+ngY6L1FbU9F6WvnJ70gTX0+eW2B9btvd7HoPCboGH0jf2/mlQ1FgdH/lT5nnq
        SzvHzE/8s72vdf/OF7bYneIgsvo8167JOp1nnm8PWttV2/b6M5ugC2/Y97SLZ8vbLxzh/a2+
        YuEk8e08T/zaHrRHsTQI70hdzpRsq+rxy8q+4Vf3Bn/px7O1D1TVc8RFRr/3tM6Pyou1rZqS
        trZIe7NQQqiu4+LuaiFN7t8uYXYb1mx99vR04I4Vupwb5yX7G/1L3DiVMWfz+Y1R+arBQjyv
        tiopsRRnJBpqMRcVJwIAKNmBuBEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWy7bCSvG7bpfpEgxc7RS0u79e22NFwhNVi
        49sfTBYdf78wWlzeNYfNYsb5fUwWrXuPsFvc3T+X0YHDY1ZDL5vHplWdbB59W1YxenzeJBfA
        EsVlk5Kak1mWWqRvl8CVce7zcZaCeZYVr3e9ZGlgfKvbxcjBISFgIvFju1cXIxeHkMAORokF
        V3oYuxg5geIyEsuf9bFB2MIS91uOsEIUvWeUuDP/HhNIgk1AW+L7+sWsILaIQAOjxM4WW5Ai
        ZoFtjBKHb59iAUkIC3hJzDl+C8xmEVCVONx6GWwqr4CtxNuuXcwQG+QlJk64xw4RF5Q4OfMJ
        WD0zULx562zmCYx8s5CkZiFJLWBkWsUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERyk
        Wlo7GPes+qB3iJGJg/EQowQHs5IIb8SFmkQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYL
        CaQnlqRmp6YWpBbBZJk4OKUamJwkz3qZfnkiYZFueGLjbLvPm4oWBi4wzlc0n/HiU02P9y5L
        E5eNNoHZJ3ov1LDyJ6+t+Okz8fzsn38vTg7jrf6dV7tqg4SYfGVIs+vLLVecrPbnnfu2YJPX
        kjeVKtv4ljN9VG2Q/3DvqMhc26+a4mdD6lzmx1p8D/q5/pHEbD7dZ9ess0WsX/nZdBfnmT5n
        /Ntg+ophj4+jwWrflSJ2101bF92wnfe6LtPxdHpBmVE4X1jvCZfO+YuUnebOTxQWWrVwWstk
        DfELc9kWJJ9mTb3aud5ur1v/h5PfDx50tm+U3LlfqMByU6bEreRfFzZWHPt+/HC39dOyJK5v
        e9avc7Z8pxA5xTL2p86PfXNDvZVYijMSDbWYi4oTAVZBjAbBAgAA
X-CMS-MailID: 20211101114158epcas2p1d0762d52029b1b09912fd99665dd66f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101114158epcas2p1d0762d52029b1b09912fd99665dd66f5
References: <CGME20211101114158epcas2p1d0762d52029b1b09912fd99665dd66f5@epcas2p1.samsung.com>
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
 drivers/i2c/busses/i2c-exynos5.c | 120 ++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 97d4f3ac0abd..f2dc7848f840 100644
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
+#define USI_CON_RESET				(1 << 0)
+
+/* SYSREG Register bit */
+#define SYSREG_USI_SW_CONF_MASK			(0x7 << 0)
+#define SYSREG_I2C_SW_CONF			(1u << 2)
+
 enum i2c_type_exynos {
 	I2C_TYPE_EXYNOS5,
 	I2C_TYPE_EXYNOS7,
+	I2C_TYPE_USI,
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
@@ -230,6 +248,11 @@ static const struct exynos_hsi2c_variant exynos7_hsi2c_data = {
 	.hw		= I2C_TYPE_EXYNOS7,
 };
 
+static const struct exynos_hsi2c_variant exynos_usi_hsi2c_data = {
+	.fifo_depth	= 64,
+	.hw		= I2C_TYPE_USI,
+};
+
 static const struct of_device_id exynos5_i2c_match[] = {
 	{
 		.compatible = "samsung,exynos5-hsi2c",
@@ -243,6 +266,9 @@ static const struct of_device_id exynos5_i2c_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-hsi2c",
 		.data = &exynos7_hsi2c_data
+	}, {
+		.compatible = "samsung,exynos-usi-hsi2c",
+		.data = &exynos_usi_hsi2c_data
 	}, {},
 };
 MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
@@ -281,6 +307,31 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 		i2c->op_clock;
 	int div, clk_cycle, temp;
 
+	/* In case of HSI2C controllers in USI
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
+	 *  In genaral case, we don`t need to control timing_s1, timing_s2.
+	 */
+	if (i2c->variant->hw == I2C_TYPE_USI) {
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
@@ -355,6 +406,16 @@ static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
 	return exynos5_i2c_set_timing(i2c, true);
 }
 
+static void exynos_usi_reset(struct exynos5_i2c *i2c)
+{
+	u32 val;
+
+	/* Clear the software reset of USI block (it's set at startup) */
+	val = readl(i2c->regs + USI_CON);
+	val &= ~USI_CON_RESET;
+	writel(val, i2c->regs + USI_CON);
+}
+
 /*
  * exynos5_i2c_init: configures the controller for I2C functionality
  * Programs I2C controller for Master mode operation
@@ -385,6 +446,9 @@ static void exynos5_i2c_reset(struct exynos5_i2c *i2c)
 {
 	u32 i2c_ctl;
 
+	if (i2c->variant->hw == I2C_TYPE_USI)
+		exynos_usi_reset(i2c);
+
 	/* Set and clear the bit for reset */
 	i2c_ctl = readl(i2c->regs + HSI2C_CTL);
 	i2c_ctl |= HSI2C_SW_RST;
@@ -422,7 +486,8 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 	writel(int_status, i2c->regs + HSI2C_INT_STATUS);
 
 	/* handle interrupt related to the transfer status */
-	if (i2c->variant->hw == I2C_TYPE_EXYNOS7) {
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS7 ||
+			i2c->variant->hw == I2C_TYPE_USI) {
 		if (int_status & HSI2C_INT_TRANS_DONE) {
 			i2c->trans_done = 1;
 			i2c->state = 0;
@@ -569,13 +634,13 @@ static void exynos5_i2c_bus_check(struct exynos5_i2c *i2c)
 {
 	unsigned long timeout;
 
-	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS5)
 		return;
 
 	/*
-	 * HSI2C_MASTER_ST_LOSE state in EXYNOS7 variant before transaction
-	 * indicates that bus is stuck (SDA is low). In such case bus recovery
-	 * can be performed.
+	 * HSI2C_MASTER_ST_LOSE state in EXYNOS7 or EXYNOS_USI variant before
+	 * transaction indicates that bus is stuck (SDA is low).
+	 * In such case bus recovery can be performed.
 	 */
 	timeout = jiffies + msecs_to_jiffies(100);
 	for (;;) {
@@ -611,10 +676,10 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
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
@@ -738,6 +803,37 @@ static const struct i2c_algorithm exynos5_i2c_algorithm = {
 	.functionality		= exynos5_i2c_func,
 };
 
+static int exynos_usi_init(struct exynos5_i2c *i2c)
+{
+	struct device *dev = i2c->dev;
+	int ret;
+
+	if (i2c->variant->hw != I2C_TYPE_USI)
+		return 0;
+
+	/* USI regmap control */
+	i2c->usi_sysreg = syscon_regmap_lookup_by_phandle(
+			dev->of_node, "samsung,usi-sysreg");
+	if (IS_ERR(i2c->usi_sysreg)) {
+		dev_err(dev, "Cannot find usi-sysreg\n");
+		return PTR_ERR(i2c->usi_sysreg);
+	}
+
+	ret = of_property_read_u32_index(dev->of_node,
+				"samsung,usi-sysreg", 1, &i2c->usi_offset);
+	if (ret) {
+		dev_err(dev, "usi-sysreg offset is not specified\n");
+		return ret;
+	}
+
+	regmap_update_bits(i2c->usi_sysreg, i2c->usi_offset,
+			SYSREG_USI_SW_CONF_MASK, SYSREG_I2C_SW_CONF);
+
+	exynos_usi_reset(i2c);
+
+	return 0;
+}
+
 static int exynos5_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -777,6 +873,12 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
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
 
@@ -794,8 +896,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	i2c->variant = of_device_get_match_data(&pdev->dev);
-
 	ret = exynos5_hsi2c_clock_setup(i2c);
 	if (ret)
 		goto err_clk;
-- 
2.33.1

