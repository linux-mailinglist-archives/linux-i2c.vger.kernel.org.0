Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C67444FF3
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Nov 2021 09:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhKDINC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Nov 2021 04:13:02 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:14635 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbhKDINC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Nov 2021 04:13:02 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211104081022epoutp04d093d74fcb3187732edf165209b44f1d~0SYpBDgTO0379403794epoutp04U
        for <linux-i2c@vger.kernel.org>; Thu,  4 Nov 2021 08:10:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211104081022epoutp04d093d74fcb3187732edf165209b44f1d~0SYpBDgTO0379403794epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636013422;
        bh=mv+88NaXb2u4t4gOusIKlJdbzRvEYdcpyOEY7QsQnA8=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=OimtIXUXT9nx3kDG+7zbW0l5lYOXziJA+Oj7UnaipaZRivk8FegR7BRtTiA7QCFaO
         og0/fQm4N3Y0cYqicMP8dS5i9jydkbUYDV1XSCnCUmdHdme3eQvtLDs1ZevsXZuo6z
         80ZHDIrYICIXUbU/o/2PdlEgRSok2JQY4rUudQDI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211104081021epcas2p25ea9f11f5c66c7293f8b3c424e6cd8ce~0SYoPLgQt2375923759epcas2p2H;
        Thu,  4 Nov 2021 08:10:21 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.98]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HlGXL2PrQz4x9QY; Thu,  4 Nov
        2021 08:10:10 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        76.45.12141.D5593816; Thu,  4 Nov 2021 17:10:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211104081004epcas2p17bace0d1999b8ed273dba361b58b3cfb~0SYYbMjg71673516735epcas2p1J;
        Thu,  4 Nov 2021 08:10:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211104081004epsmtrp2313cc3fa22b556195b6be548672cd99e~0SYYacJ-P1651316513epsmtrp2m;
        Thu,  4 Nov 2021 08:10:04 +0000 (GMT)
X-AuditID: b6c32a48-d73ff70000002f6d-dc-6183955d6c85
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        FC.F2.29871.D5593816; Thu,  4 Nov 2021 17:10:05 +0900 (KST)
Received: from KORCO006858 (unknown [10.229.8.71]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211104081004epsmtip25fed3afa642850e82de05f386f0bfbb3~0SYYQf1Y71931819318epsmtip2N;
        Thu,  4 Nov 2021 08:10:04 +0000 (GMT)
From:   "Jaewon Kim" <jaewon02.kim@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Wolfram Sang'" <wsa@kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Chanho Park'" <chanho61.park@samsung.com>,
        <linux-i2c@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <a571af00-8ac1-f1a5-3240-2c93f823c995@canonical.com>
Subject: RE: [PATCH 1/2] i2c: exynos5: support USI(Universal Serial
 Interface)
Date:   Thu, 4 Nov 2021 17:10:04 +0900
Message-ID: <001001d7d153$5fb18840$1f1498c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH9TS3Ubwx9WhvNqO8Onnoqn/bWugGADPusApYBWVmrh1r0gA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjk+LIzCtJLcpLzFFi42LZdljTVDd2anOiwbI7ShaX92tbbHz7g8mi
        4+8XRovLu+awWcw4v4/JonXvEXaLu/vnMjqwe8xq6GXz2LSqk82jb8sqRo/Pm+QCWKKybTJS
        E1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOADlBSKEvMKQUK
        BSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGd0P77J
        UrDXu2LaA84Gxt+WXYycHBICJhJH/71k7GLk4hAS2MEosf/ND3YI5xOjxJkra6Ccb4wSs5v/
        MMK0TOhbxARiCwnsZZTo2sAIYT9nlJj3IR7EZhPQldi58RVYs4hAF6PEpS872EAcZoGpjBI3
        bnQxg1RxCjhKLPr5lqWLkYNDWCBA4tcKD5Awi4CKxN0bp8AW8ApYSlydt5YNwhaUODnzCQuI
        zSwgL7H97RxmiIMUJH4+XcYKYosIOEksutTBDFEjIjG7sw2qppNDYk8LE4TtInH9wQYoW1ji
        1fEt7BC2lMTnd3vZQM6REKiX+HrDAeRkCYEeRok1Xb+g6u0lfk3fwgpSwyygKbF+lz5EubLE
        kVtQl/FJdBz+yw4R5pXoaBOCaFSTuD/1HBuELSMx6chKpgmMSrOQ/DULyV+zkNw/C2HXAkaW
        VYxiqQXFuempxUYFJvCYTs7P3cQITphaHjsYZ7/9oHeIkYmD8RCjBAezkgjv8w1NiUK8KYmV
        ValF+fFFpTmpxYcYTYEhPZFZSjQ5H5iy80riDU0sDUzMzAzNjUwNzJXEeS1FsxOFBNITS1Kz
        U1MLUotg+pg4OKUamBbseZzztGfP+4ig+VKz5lasWjiX//EaSbeYmM8p6Usu/eR6elJS0vHm
        1mw2hv/vmdZJKp50+zCvfY2oQcGdh4rXjkf9VVVjKDnxafV+sfy2/QeDhQ1DOzbMaLi8X21/
        0bmZZ5K+eWc0mYY1/z0T4GNttyrm28f159Sqzs3naf/m+o1nwRPBucdWv9kaMldXtE7bxWm+
        3qz2Bdc3N9/zePPtxEWOyuNfNPwDp0+9reH99NCBuVdWnrOfv2zL1K1z7D/8i5ze0BEmJvWY
        +1TY/LUvdoQKypY57W28VZ0XHPtJskH5XMTWIMdFfsIpD6yPfhTNPWafvv3wtPMrBW1yZk9/
        EG0RfP6eu/fzE4IhGvlblFiKMxINtZiLihMBWs1wjCEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSvG7s1OZEg4VTeCwu79e22Pj2B5NF
        x98vjBaXd81hs5hxfh+TReveI+wWd/fPZXRg95jV0MvmsWlVJ5tH35ZVjB6fN8kFsERx2aSk
        5mSWpRbp2yVwZXQ/vslSsNe7YtoDzgbG35ZdjJwcEgImEhP6FjF1MXJxCAnsZpR4/uslG0RC
        RmL5sz4oW1jifssRVoiip4wSC0+9ZAVJsAnoSuzc+IodxBYR6GGUONcjBFLELDAdqGh1IwtE
        xxGgsVd2soBUcQo4Siz6+RbMFhbwk9izuAFsBYuAisTdG6eYQGxeAUuJq/PWskHYghInZz4B
        q2cW0JbofdjKCGHLS2x/O4cZ4jwFiZ9Pl7FCXOEksehSBzNEjYjE7M425gmMwrOQjJqFZNQs
        JKNmIWlZwMiyilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOIq0NHcwbl/1Qe8QIxMH
        4yFGCQ5mJRHe5xuaEoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzXug6GS8kkJ5YkpqdmlqQWgST
        ZeLglGpgMt2xKvG0UCP7j3m/OthKDx1o7+A5LWW4bsVuhcc8Ckyvi4PtspMM+3TiLOZea2p+
        flX1sPqOsnsZxdcPn6w8XX1S1qQ87c5MkR0mEUwHTl2eXOP8rNKyVSGsJ1RlWYigzeFv2gdf
        vjcuvyV39cHG4vjuvtCvJ/bG/oxVK2VJvf7He6v7ffXV31ISuRzjjk3afWZ1ptb7+MvmUx4H
        buWq4xXkq/yrOZe9R3Cq5KKangczlj0/yh27eOcZ/sfaapFCfybu/5985//3dV/ORJ76JBH9
        t/jzu1eTfe4p35G87XS47HqjVlj82bT0eZqbd5Xf5opcLLNlfQRb86GvomE7Uw1XmDf2HqpY
        M/26x+QjfkosxRmJhlrMRcWJAJlc+KYRAwAA
X-CMS-MailID: 20211104081004epcas2p17bace0d1999b8ed273dba361b58b3cfb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101114158epcas2p1d0762d52029b1b09912fd99665dd66f5
References: <CGME20211101114158epcas2p1d0762d52029b1b09912fd99665dd66f5@epcas2p1.samsung.com>
        <20211101113819.50651-1-jaewon02.kim@samsung.com>
        <a571af00-8ac1-f1a5-3240-2c93f823c995@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Krzysztof

> On 01/11/2021 12:38, Jaewon Kim wrote:
> > Serial IPs(UART, I2C, SPI) are integrated into New IP-Core called
> > USI(Universal Serial Interface).
> >
> > As it is integrated into USI, there are additinal HW changes.
> > Registers to control USI and sysreg to set serial IPs have been added.
> > Also, some timing registres have been changed.
> >
> > Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> > ---
> >  drivers/i2c/busses/i2c-exynos5.c | 120
> > ++++++++++++++++++++++++++++---
> >  1 file changed, 110 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-exynos5.c
> > b/drivers/i2c/busses/i2c-exynos5.c
> > index 97d4f3ac0abd..f2dc7848f840 100644
> > --- a/drivers/i2c/busses/i2c-exynos5.c
> > +++ b/drivers/i2c/busses/i2c-exynos5.c
> > @@ -22,6 +22,8 @@
> >  #include <linux/of_device.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/spinlock.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/regmap.h>
> >
> >  /*
> >   * HSI2C controller from Samsung supports 2 modes of operation @@
> > -166,9 +168,21 @@
> >
> >  #define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(100))
> >
> > +/* USI(Universal Serial Interface) Register map */
> > +#define USI_CON					0xc4
> > +#define USI_OPTION				0xc8
> > +
> > +/* USI(Universal Serial Interface) Register bits */
> > +#define USI_CON_RESET				(1 << 0)
> 
> BIT()
> 

Okay, I will change it to BIT()

> > +
> > +/* SYSREG Register bit */
> > +#define SYSREG_USI_SW_CONF_MASK			(0x7 << 0)
> > +#define SYSREG_I2C_SW_CONF			(1u << 2)
> 
> BIT()
> 

Okay, I will change it to BIT()

> > +
> >  enum i2c_type_exynos {
> >  	I2C_TYPE_EXYNOS5,
> >  	I2C_TYPE_EXYNOS7,
> > +	I2C_TYPE_USI,
> >  };
> >
> >  struct exynos5_i2c {
> > @@ -199,6 +213,10 @@ struct exynos5_i2c {
> >
> >  	/* Version of HS-I2C Hardware */
> >  	const struct exynos_hsi2c_variant *variant;
> > +
> > +	/* USI sysreg info */
> > +	struct regmap		*usi_sysreg;
> > +	unsigned int		usi_offset;
> >  };
> >
> >  /**
> > @@ -230,6 +248,11 @@ static const struct exynos_hsi2c_variant exynos7_hsi2c_data = {
> >  	.hw		= I2C_TYPE_EXYNOS7,
> >  };
> >
> > +static const struct exynos_hsi2c_variant exynos_usi_hsi2c_data = {
> > +	.fifo_depth	= 64,
> > +	.hw		= I2C_TYPE_USI,
> > +};
> > +
> >  static const struct of_device_id exynos5_i2c_match[] = {
> >  	{
> >  		.compatible = "samsung,exynos5-hsi2c", @@ -243,6 +266,9 @@ static
> > const struct of_device_id exynos5_i2c_match[] = {
> >  	}, {
> >  		.compatible = "samsung,exynos7-hsi2c",
> >  		.data = &exynos7_hsi2c_data
> > +	}, {
> > +		.compatible = "samsung,exynos-usi-hsi2c",
> > +		.data = &exynos_usi_hsi2c_data
> >  	}, {},
> >  };
> >  MODULE_DEVICE_TABLE(of, exynos5_i2c_match); @@ -281,6 +307,31 @@
> > static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
> >  		i2c->op_clock;
> >  	int div, clk_cycle, temp;
> >
> > +	/* In case of HSI2C controllers in USI
> > +	 * timing control formula changed.
> > +	 *
> > +	 * FSCL = IPCLK / ((CLK_DIV + 1) * 16)
> > +	 * T_SCL_LOW = IPCLK * (CLK_DIV + 1) * (N + M)
> > +	 *  [N : number of 0's in the TSCL_H_HS]
> > +	 *  [M : number of 0's in the TSCL_L_HS]
> > +	 * T_SCL_HIGH = IPCLK * (CLK_DIV + 1) * (N + M)
> > +	 *  [N : number of 1's in the TSCL_H_HS]
> > +	 *  [M : number of 1's in the TSCL_L_HS]
> > +	 *
> > +	 *  result of (N + M) is always 8.
> > +	 *  In genaral case, we don`t need to control timing_s1, timing_s2.
> 
> s/genaral/general/
> (please run spellcheck)
> s/don`t/don't/
> 

Sorry, I will run spellcheck in next.

> > +	 */
> > +	if (i2c->variant->hw == I2C_TYPE_USI) {
> > +		div = ((clkin / (16 * i2c->op_clock)) - 1);
> > +		i2c_timing_s3 = div << 16;
> > +		if (hs_timings)
> > +			writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_HS3);
> > +		else
> > +			writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_FS3);
> > +
> > +		return 0;
> > +	}
> > +
> >  	/*
> >  	 * In case of HSI2C controller in Exynos5 series
> >  	 * FPCLK / FI2C =
> > @@ -355,6 +406,16 @@ static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
> >  	return exynos5_i2c_set_timing(i2c, true);  }
> >
> > +static void exynos_usi_reset(struct exynos5_i2c *i2c)
> 
> The name of function suggests you are performing a reset but the code looks like it is only clearing
> the reset flag. How about calling the function exynos_usi_clear_reset()?
> 

Accroding to below review, I will add reset and clear code.

> > +{
> > +	u32 val;
> > +
> > +	/* Clear the software reset of USI block (it's set at startup) */
> > +	val = readl(i2c->regs + USI_CON);
> > +	val &= ~USI_CON_RESET;
> > +	writel(val, i2c->regs + USI_CON);
> > +}
> > +
> >  /*
> >   * exynos5_i2c_init: configures the controller for I2C functionality
> >   * Programs I2C controller for Master mode operation @@ -385,6 +446,9
> > @@ static void exynos5_i2c_reset(struct exynos5_i2c *i2c)  {
> >  	u32 i2c_ctl;
> >
> > +	if (i2c->variant->hw == I2C_TYPE_USI)
> > +		exynos_usi_reset(i2c);
> > +
> >  	/* Set and clear the bit for reset */
> >  	i2c_ctl = readl(i2c->regs + HSI2C_CTL);
> >  	i2c_ctl |= HSI2C_SW_RST;
> > @@ -422,7 +486,8 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
> >  	writel(int_status, i2c->regs + HSI2C_INT_STATUS);
> >
> >  	/* handle interrupt related to the transfer status */
> > -	if (i2c->variant->hw == I2C_TYPE_EXYNOS7) {
> > +	if (i2c->variant->hw == I2C_TYPE_EXYNOS7 ||
> > +			i2c->variant->hw == I2C_TYPE_USI) {
> >  		if (int_status & HSI2C_INT_TRANS_DONE) {
> >  			i2c->trans_done = 1;
> >  			i2c->state = 0;
> > @@ -569,13 +634,13 @@ static void exynos5_i2c_bus_check(struct
> > exynos5_i2c *i2c)  {
> >  	unsigned long timeout;
> >
> > -	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
> > +	if (i2c->variant->hw == I2C_TYPE_EXYNOS5)
> >  		return;
> >
> >  	/*
> > -	 * HSI2C_MASTER_ST_LOSE state in EXYNOS7 variant before transaction
> > -	 * indicates that bus is stuck (SDA is low). In such case bus recovery
> > -	 * can be performed.
> > +	 * HSI2C_MASTER_ST_LOSE state in EXYNOS7 or EXYNOS_USI variant before
> > +	 * transaction indicates that bus is stuck (SDA is low).
> > +	 * In such case bus recovery can be performed.
> >  	 */
> >  	timeout = jiffies + msecs_to_jiffies(100);
> >  	for (;;) {
> > @@ -611,10 +676,10 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
> >  	unsigned long flags;
> >  	unsigned short trig_lvl;
> >
> > -	if (i2c->variant->hw == I2C_TYPE_EXYNOS7)
> > -		int_en |= HSI2C_INT_I2C_TRANS;
> > -	else
> > +	if (i2c->variant->hw == I2C_TYPE_EXYNOS5)
> >  		int_en |= HSI2C_INT_I2C;
> > +	else
> > +		int_en |= HSI2C_INT_I2C_TRANS;
> >
> >  	i2c_ctl = readl(i2c->regs + HSI2C_CTL);
> >  	i2c_ctl &= ~(HSI2C_TXCHON | HSI2C_RXCHON); @@ -738,6 +803,37 @@
> > static const struct i2c_algorithm exynos5_i2c_algorithm = {
> >  	.functionality		= exynos5_i2c_func,
> >  };
> >
> > +static int exynos_usi_init(struct exynos5_i2c *i2c) {
> > +	struct device *dev = i2c->dev;
> > +	int ret;
> > +
> > +	if (i2c->variant->hw != I2C_TYPE_USI)
> > +		return 0;
> > +
> > +	/* USI regmap control */
> 
> Drop the comment, it's obvious. What is missing here, is a comment explaining what are you
> initializing exactly in the USI. Please add it.
> 

Okay, I will add detailed information.

> > +	i2c->usi_sysreg = syscon_regmap_lookup_by_phandle(
> > +			dev->of_node, "samsung,usi-sysreg");
> 
> Align the lines to opening parenthesis.
> 
> > +	if (IS_ERR(i2c->usi_sysreg)) {
> > +		dev_err(dev, "Cannot find usi-sysreg\n");
> > +		return PTR_ERR(i2c->usi_sysreg);
> > +	}
> > +
> > +	ret = of_property_read_u32_index(dev->of_node,
> > +				"samsung,usi-sysreg", 1, &i2c->usi_offset);
> 
> Align the lines to opening parenthesis.
> 

Okay.

> Offset is not described in the bindings.
> 

Okay, I will add offset description in bindings docs.

> > +	if (ret) {
> > +		dev_err(dev, "usi-sysreg offset is not specified\n");
> > +		return ret;
> > +	}
> > +
> > +	regmap_update_bits(i2c->usi_sysreg, i2c->usi_offset,
> > +			SYSREG_USI_SW_CONF_MASK, SYSREG_I2C_SW_CONF);
> > +
> > +	exynos_usi_reset(i2c);
> 
> You are clearing the reset flag, but not setting it back on probe failure. What happens if the probe
> fails after this clear()? E.g.
> because of deferred probe? The next probe try will start on a not-reset controller. Will it work?
> 

The user manual guides USI_RESET to be done after changing the system register.
For clarity, we will change not only to clear reset, but to clear after reset.

> > +
> > +	return 0;
> > +}
> > +
> >  static int exynos5_i2c_probe(struct platform_device *pdev)  {
> >  	struct device_node *np = pdev->dev.of_node; @@ -777,6 +873,12 @@
> > static int exynos5_i2c_probe(struct platform_device *pdev)
> >  	i2c->adap.algo_data = i2c;
> >  	i2c->adap.dev.parent = &pdev->dev;
> >
> > +	i2c->variant = of_device_get_match_data(&pdev->dev);
> > +
> > +	ret = exynos_usi_init(i2c);
> > +	if (ret)
> > +		return ret;
> > +
> >  	/* Clear pending interrupts from u-boot or misc causes */
> >  	exynos5_i2c_clr_pend_irq(i2c);
> >
> > @@ -794,8 +896,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
> >  		goto err_clk;
> >  	}
> >
> > -	i2c->variant = of_device_get_match_data(&pdev->dev);
> > -
> >  	ret = exynos5_hsi2c_clock_setup(i2c);
> >  	if (ret)
> >  		goto err_clk;
> >
> 
> 
> Best regards,
> Krzysztof


Thanks
Jaewon Kim

