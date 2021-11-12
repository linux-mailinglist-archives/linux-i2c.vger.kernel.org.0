Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B53E44DF9A
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 02:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234713AbhKLBJM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 20:09:12 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:19670 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234701AbhKLBJJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 20:09:09 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211112010618epoutp04d97615a10e9e9cc212244c593dd7474b~2pwqa3T1B2216622166epoutp04P
        for <linux-i2c@vger.kernel.org>; Fri, 12 Nov 2021 01:06:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211112010618epoutp04d97615a10e9e9cc212244c593dd7474b~2pwqa3T1B2216622166epoutp04P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636679178;
        bh=sMIpQvY0g2CWwnUxLVwcXn4g4440YdISvsNazNQY/gk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VELMaKVjJigs16LfuCCLxD6cdjbqJInSUHarVt7cZx0hiYrGOyK/C+tiyehxYNjq5
         GcnX6S1GetHDxflPYVov/NP6cBcW79FwwfVewLT762k7I6CBYcD00YqAvZHq1RX+8M
         hR7kfcPZwqtGpxoUS5tXoNJLEu3FBEDU/6drK2rg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211112010618epcas2p4218f014a51c65a7ee935801277750754~2pwp4obp52822828228epcas2p4u;
        Fri, 12 Nov 2021 01:06:18 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Hr0lQ28NXz4x9Q8; Fri, 12 Nov
        2021 01:06:10 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        13.AF.10014.BFDBD816; Fri, 12 Nov 2021 10:06:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0~2pwcP4-Ct0385403854epcas2p31;
        Fri, 12 Nov 2021 01:06:03 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211112010603epsmtrp227c72a234ce514d8976159d5a584bc52~2pwcPF1xg2332823328epsmtrp2W;
        Fri, 12 Nov 2021 01:06:03 +0000 (GMT)
X-AuditID: b6c32a47-473ff7000000271e-0e-618dbdfb91c8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        1D.B4.08738.BFDBD816; Fri, 12 Nov 2021 10:06:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211112010603epsmtip2c7898062be1b3dbf4dfb10ddafc16bf4~2pwb_4gMg1614716147epsmtip29;
        Fri, 12 Nov 2021 01:06:03 +0000 (GMT)
From:   Jaewon Kim <jaewon02.kim@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH v3 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Date:   Fri, 12 Nov 2021 10:01:37 +0900
Message-Id: <20211112010137.149174-3-jaewon02.kim@samsung.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112010137.149174-1-jaewon02.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmme7vvb2JBrtWmVpc3q9tMf/IOVaL
        HQ1HWC02vv3BZLHp8TVWi46/XxgtLu+aw2Yx4/w+JovWvUfYLZ73AVl3989ldOD2mNXQy+ax
        aVUnm8eda3vYPDYvqffo27KK0ePzJrkAtqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwND
        XUNLC3MlhbzE3FRbJRefAF23zByg65QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5
        BeYFesWJucWleel6eaklVoYGBkamQIUJ2Rn//x9mKrhgV/H6QXgD4y/DLkZODgkBE4krk24x
        dzFycQgJ7GCUWLTvCyuE84lRYs+uWSwgVUICnxklrn9Kg+l49eckO0TRLkaJA/svs0IUfWSU
        eHJLFMRmE9CW+L5+MVhcRKBOontXKyNIA7PANCaJm5OOsIMkhAXcJN58OApkc3CwCKhK3Pqu
        CRLmFbCTuPBlBjPEMnmJiRPugZVzCthLbG3ewgRRIyhxcuYTsOOYgWqat84Ge0FCoJND4siu
        dlaIZheJ0xMWMEHYwhKvjm9hh7ClJD6/28sGsldCoF7i6w0HiN4eRok1Xb+g6u0lfk3fwgpS
        wyygKbF+lz5EubLEkVtQa/kkOg7/ZYcI80p0tAlBNKpJ3J96jg3ClpGYdGQl1EAPiXfXLkCD
        bRKjxMo3h1gmMCrMQvLNLCTfzEJYvICReRWjWGpBcW56arFRgTE8epPzczcxgpOqlvsOxhlv
        P+gdYmTiYDzEKMHBrCTCe35hb6IQb0piZVVqUX58UWlOavEhRlNgUE9klhJNzgem9bySeEMT
        SwMTMzNDcyNTA3MlcV5L0exEIYH0xJLU7NTUgtQimD4mDk6pBqa9mulbq/VTexxu+uiIpm4M
        Nn4askOkYGujc5kYe/fiqUt9JzM5nnr46dvLu/5aBw/Z6Pw7s0iwRW6/vGmu2wyXhXcr5fU2
        1R9013L/srfRmdPyg29++MTL+iKTN0bsdJF/yzFj143yD37aN1O+aFQd419zY86VJfOvTFvs
        WKkk0n+m+scl7j57QYa2Pu2f52e0zrx+K9ema7NY02vjurZWJhHLPFbzeXNKJPX36d6dP9t+
        qerRmPRtN77crFznubaQvXadXF1znvynFeeWdX1ye/VGxXPiDQfFIBe2noPZnG/687hSnPzt
        tbs6rz09cNvx79XTmrlvFCeIaUxNiHlzuLrKe99B+9IDG8T2fVJiKc5INNRiLipOBADwKzl9
        MwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsWy7bCSvO7vvb2JBk+/8Fhc3q9tMf/IOVaL
        HQ1HWC02vv3BZLHp8TVWi46/XxgtLu+aw2Yx4/w+JovWvUfYLZ73AVl3989ldOD2mNXQy+ax
        aVUnm8eda3vYPDYvqffo27KK0ePzJrkAtigum5TUnMyy1CJ9uwSujP//DzMVXLCreP0gvIHx
        l2EXIyeHhICJxKs/J9m7GLk4hAR2MEp86FzHBpGQkVj+rA/KFpa433KEFaLoPaPEpLZ5YAk2
        AW2J7+sXgyVEBBoYJd5+W8QE4jALzGGSWPD/HRNIlbCAm8SbD0eBdnBwsAioStz6rgkS5hWw
        k7jwZQYzxAZ5iYkT7rGD2JwC9hJbm7eAtQoB1fza/oUZol5Q4uTMJywgNjNQffPW2cwTGAVm
        IUnNQpJawMi0ilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOAq0tHYw7ln1Qe8QIxMH
        4yFGCQ5mJRHe8wt7E4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzXug6GS8kkJ5YkpqdmlqQWgST
        ZeLglGpg8rufn5xZkm+htY3twzPdS3slmH+0b3ePXh7xdaK1xfU7hQkbJsRMFd/EcvZyQ1DF
        543rBNtmCbzpdFyS06VwIFpQZYlpRtMt8WlJs/auVH0ephB25X8Q/8LnTxp9XNfe6poVqn0l
        MnuPYvIatsLweXpxnw5PPXhjwtt5E49tOLw9cadYl6QYC9eDtanZVlFLCku2zu7gXih/6G6N
        7J+ilczPA25em1q892mLy9K/ndqOmnvKbBS3/SsoSvnsaijGsqyL1aLdhnnb9PpdN/NXCu7I
        kz0ftufJosMMJyQEzJJ4O2+KuMTukM4R/rNycVvc/mpDzoK3eRtrVRfnr22Qk2vtsnnzaefE
        i5/1dzVUKLEUZyQaajEXFScCAMFqGQPxAgAA
X-CMS-MailID: 20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0
References: <20211112010137.149174-1-jaewon02.kim@samsung.com>
        <CGME20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0@epcas2p3.samsung.com>
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
 drivers/i2c/busses/i2c-exynos5.c | 135 ++++++++++++++++++++++++++++---
 1 file changed, 125 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 97d4f3ac0abd..6ce94795a618 100644
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
@@ -213,21 +231,31 @@ struct exynos5_i2c {
 struct exynos_hsi2c_variant {
 	unsigned int		fifo_depth;
 	enum i2c_type_exynos	hw;
+	bool			has_usi;
 };
 
 static const struct exynos_hsi2c_variant exynos5250_hsi2c_data = {
 	.fifo_depth	= 64,
 	.hw		= I2C_TYPE_EXYNOS5,
+	.has_usi	= false,
 };
 
 static const struct exynos_hsi2c_variant exynos5260_hsi2c_data = {
 	.fifo_depth	= 16,
 	.hw		= I2C_TYPE_EXYNOS5,
+	.has_usi	= false,
 };
 
 static const struct exynos_hsi2c_variant exynos7_hsi2c_data = {
 	.fifo_depth	= 16,
 	.hw		= I2C_TYPE_EXYNOS7,
+	.has_usi	= false,
+};
+
+static const struct exynos_hsi2c_variant exynosautov9_hsi2c_data = {
+	.fifo_depth	= 64,
+	.hw		= I2C_TYPE_EXYNOSAUTOV9,
+	.has_usi	= true,
 };
 
 static const struct of_device_id exynos5_i2c_match[] = {
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
@@ -281,6 +312,32 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 		i2c->op_clock;
 	int div, clk_cycle, temp;
 
+	/*
+	 * In case of HSI2C controllers in EXYNOSAUTOV9
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
@@ -355,6 +412,20 @@ static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
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
@@ -385,6 +456,9 @@ static void exynos5_i2c_reset(struct exynos5_i2c *i2c)
 {
 	u32 i2c_ctl;
 
+	if (i2c->variant->hw == I2C_TYPE_EXYNOSAUTOV9)
+		exynos_usi_reset(i2c);
+
 	/* Set and clear the bit for reset */
 	i2c_ctl = readl(i2c->regs + HSI2C_CTL);
 	i2c_ctl |= HSI2C_SW_RST;
@@ -422,7 +496,8 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 	writel(int_status, i2c->regs + HSI2C_INT_STATUS);
 
 	/* handle interrupt related to the transfer status */
-	if (i2c->variant->hw == I2C_TYPE_EXYNOS7) {
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS7 ||
+			i2c->variant->hw == I2C_TYPE_EXYNOSAUTOV9) {
 		if (int_status & HSI2C_INT_TRANS_DONE) {
 			i2c->trans_done = 1;
 			i2c->state = 0;
@@ -569,13 +644,13 @@ static void exynos5_i2c_bus_check(struct exynos5_i2c *i2c)
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
@@ -611,10 +686,10 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
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
@@ -738,6 +813,42 @@ static const struct i2c_algorithm exynos5_i2c_algorithm = {
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
+	/*
+	 * System Register has a field that can select the serial IP
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
@@ -777,6 +888,12 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
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
 
@@ -794,8 +911,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	i2c->variant = of_device_get_match_data(&pdev->dev);
-
 	ret = exynos5_hsi2c_clock_setup(i2c);
 	if (ret)
 		goto err_clk;
-- 
2.33.1

