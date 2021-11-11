Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C028644D3E8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 10:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbhKKJVz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 04:21:55 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:38003 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhKKJVo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 04:21:44 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211111091854epoutp0161674072bb87810c4abbee4cbf92af31~2c1eIS1Ge0692606926epoutp01Y
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 09:18:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211111091854epoutp0161674072bb87810c4abbee4cbf92af31~2c1eIS1Ge0692606926epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636622334;
        bh=wtCxQAquzIyQTsZujTOJ8QskfgRiqssK9QK0Ly/P6r0=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=k7L23t4trqkBCOkNy0KDN9fZNMBa267m+7d5oXWvNPr3MjN3q2AXzo0UbJk6j/pN5
         LSEwe3M8oLkswubT92bmAODvRYaq3ExjvfbRWaUKX8o5oWY5c1eCdAFBj+30RU8/ro
         qQpgNh3/aJ9Z1qqw93szsK3FVwNZqYcS/Ap33iGo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211111091853epcas2p1b574fb643a18dfa17d591b5c7a73bb94~2c1dBqkqH2753227532epcas2p1U;
        Thu, 11 Nov 2021 09:18:53 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.99]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HqbkF0kMRz4x9QX; Thu, 11 Nov
        2021 09:18:45 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        FC.74.51767.4FFDC816; Thu, 11 Nov 2021 18:18:44 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211111091844epcas2p3021786974697fb39e14fff83b4396364~2c1Ul8E880456504565epcas2p3H;
        Thu, 11 Nov 2021 09:18:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211111091844epsmtrp1ba201431b2a56db79dc51a6972aaa1e6~2c1UlRbWZ0843708437epsmtrp1W;
        Thu, 11 Nov 2021 09:18:44 +0000 (GMT)
X-AuditID: b6c32a45-45dff7000000ca37-1c-618cdff49687
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        DF.14.29871.4FFDC816; Thu, 11 Nov 2021 18:18:44 +0900 (KST)
Received: from KORCO006858 (unknown [10.229.8.71]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211111091843epsmtip17ee70bb120a8257b582aceb4367f559d~2c1Ucp_fE2976729767epsmtip1P;
        Thu, 11 Nov 2021 09:18:43 +0000 (GMT)
From:   "Jaewon Kim" <jaewon02.kim@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Wolfram Sang'" <wsa@kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     <linux-samsung-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <chanho61.park@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>
In-Reply-To: <4f46fefc-09c9-f9ee-a456-382a64d4ed6f@canonical.com>
Subject: RE: [PATCH 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Date:   Thu, 11 Nov 2021 18:18:43 +0900
Message-ID: <000201d7d6dd$1fd18420$5f748c60$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQCkbhN/M7EUb/u5BwPUYp0og6AbQQFvUiYiAmbXjY8BMemhEq48nBVw
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmhe6X+z2JBnPXSVlc3q9tsfHtDyaL
        jr9fGC1mnN/HZNG69wi7xfM+IOvu/rmMDuwesxp62Tw2repk87hzbQ+bR9+WVYwenzfJBbBG
        ZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAF2hpFCW
        mFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tLLbEyNDAwMgUqTMjO
        +Hmzl7Fgn0LF2XceDYxfJboYOTkkBEwkrp7ewN7FyMUhJLCDUeLE3/1MEM4nRoldXUdZIZxv
        jBLbTnxihGnZ/vAxM0RiL6PE3ub/LBDOc0aJ/Y+3sYNUsQnoSuzc+ApssIhAF6PEpS872EAc
        ZoHJjBL3jzxgBaniFHCUOPz6DDOILSzgLjH5+AsWEJtFQFXiw9xJQA0cHLwClhITb+SBhHkF
        BCVOznwCVsIsIC+x/e0cZoiTFCR+Pl3GChEXkZjd2QYWFxFwkzh35xcjyF4JgYkcEt/2boT6
        wUVi5e3XbBC2sMSr41vYIWwpiZf9bewgeyUE6iW+3nCA6O1hlFjT9YsJosZe4tf0LawgNcwC
        mhLrd+lDlCtLHLkFdRqfRMfhv1BTeCU62oQgGtUk7k89B7VURmLSkZVMExiVZiF5bBaSx2Yh
        eWYWwq4FjCyrGMVSC4pz01OLjQoM4ZGdnJ+7iRGcQLVcdzBOfvtB7xAjEwfjIUYJDmYlEd6E
        Oz2JQrwpiZVVqUX58UWlOanFhxhNgSE9kVlKNDkfmMLzSuINTSwNTMzMDM2NTA3MlcR5LUWz
        E4UE0hNLUrNTUwtSi2D6mDg4pRqYliSqLsw6W14lcyUqSvNV2lflHfOepNl4HDvY4hmy126r
        QNnahY666w8K7JpruX/Zw1czPijlVky+9Vg84q7BPeaNXjyeBQwM98Rb4mOWrGkODLF5u/6F
        FburjaLk0k+r7riXCK4VXSwo7162yPOoduHVx1P5JrgdtRbQTU58a+TffvSyLqt/1tI/PP/X
        exY9uKjZcY7Z/41ssdCOk2vcPE9ezpLa/aH6453I1c/ZGpZtVHpyL7d/a9SBKb7GGSGL2vlv
        Xww4Vxd9uF4z6qdZhZHd9A82ddVKEX/u7tp1v3DFD+2/BY87X5rNP/hR95WGY9zNlym1M1qm
        Rm4tu+bIGVXYsHD7i4h76s6VNse5lFiKMxINtZiLihMB1ABEaikEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42LZdlhJTvfL/Z5EgxWbWC0u79e22Pj2B5NF
        x98vjBYzzu9jsmjde4Td4nkfkHV3/1xGB3aPWQ29bB6bVnWyedy5tofNo2/LKkaPz5vkAlij
        uGxSUnMyy1KL9O0SuDJ+3uxlLNinUHH2nUcD41eJLkZODgkBE4ntDx8zdzFycQgJ7GaU6Jhx
        hg0iISOx/FkflC0scb/lCCtE0VNGif65/8ASbAK6Ejs3vmIHsUUEehglzvUIgdjMAtMZJVYe
        tIdo+MEoseL4XUaQBKeAo8Th12eYQWxhAXeJycdfsIDYLAKqEh/mTgIaysHBK2ApMfFGHkiY
        V0BQ4uTMJywQM7Ulnt58CmXLS2x/O4cZ4jgFiZ9Pl7FCxEUkZne2MUPc4yZx7s4vxgmMwrOQ
        jJqFZNQsJKNmIWlfwMiyilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOJa0NHcwbl/1
        Qe8QIxMH4yFGCQ5mJRHehDs9iUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1O
        TS1ILYLJMnFwSjUwTZ3pPok/yKJD9ZxObTTjVj2PpqLO9b+F8++cZ7/8ZY/9hMdrxDy6+u/Y
        HvOWmVA8J6b5tvS0Ca2PDL71BHga5alFXW7vNzz+/ECyHU/ztPmv4puqlwme35pwfIfbJ36u
        38n/p2ySc7E4s+DaxeIVH87M3KQzOUD/xOKinJlVjgZ8b5bstLJ13S1x/YyGZFilgN7M54c6
        d+25Zq84z9AlOeLTrZd3lzzztJ66TCAmOZWh5u+bgj/ReZvqK2dyFxmmRDTWvmM9tm+S4qkm
        46xVrEe/ZP1gceHZ/fHbk7CN56ItIwo1pBUmqazYtfOiS2Xc7Zn3Hywp4lGa/GHTt5Trcpsc
        61//Tt1eocjCun0mtxJLcUaioRZzUXEiALtEF9sUAwAA
X-CMS-MailID: 20211111091844epcas2p3021786974697fb39e14fff83b4396364
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211111084749epcas2p1e80b3f3657310498bfdae65c425b3278
References: <20211111084327.106696-1-jaewon02.kim@samsung.com>
        <CGME20211111084749epcas2p1e80b3f3657310498bfdae65c425b3278@epcas2p1.samsung.com>
        <20211111084327.106696-3-jaewon02.kim@samsung.com>
        <4f46fefc-09c9-f9ee-a456-382a64d4ed6f@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Krzysztof


> On 11/11/2021 09:43, Jaewon Kim wrote:
> > Serial IPs(UART, I2C, SPI) are integrated into New IP-Core called
> > USI(Universal Serial Interface).
> >
> > As it is integrated into USI, there are additinal HW changes.
> > Registers to control USI and sysreg to set serial IPs have been added.
> > Also, some timing registres have been changed.
> >
> > Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> > ---
> >  drivers/i2c/busses/i2c-exynos5.c | 133
> > ++++++++++++++++++++++++++++---
> >  1 file changed, 123 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-exynos5.c
> > b/drivers/i2c/busses/i2c-exynos5.c
> > index 97d4f3ac0abd..6a05af550aa5 100644
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
> > +#define USI_CON_RESET				BIT(0)
> > +
> > +/* SYSREG Register bit */
> > +#define SYSREG_USI_SW_CONF_MASK			(0x7 << 0)
> > +#define SYSREG_I2C_SW_CONF			BIT(2)
> > +
> >  enum i2c_type_exynos {
> >  	I2C_TYPE_EXYNOS5,
> >  	I2C_TYPE_EXYNOS7,
> > +	I2C_TYPE_EXYNOSAUTOV9,
> 
> The type in driver could stay USI, I only wanted the compatible to be using SoC product ID/number. But
> current AUTOV9 is fine as well.
> 
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
> > @@ -212,24 +230,34 @@ struct exynos5_i2c {
> >   */
> >  struct exynos_hsi2c_variant {
> >  	unsigned int		fifo_depth;
> > +	unsigned int		has_usi;
> 
> Sorry for not noticing it earlier, but this should be bool.


Sorry, I miss latest change in 
"tty: serial: samsung: Improve naming for common macro "

I will change it to bool.

> 
> >  	enum i2c_type_exynos	hw;
> >  };
> >
> >  static const struct exynos_hsi2c_variant exynos5250_hsi2c_data = {
> >  	.fifo_depth	= 64,
> > +	.has_usi	= 0,
> 
> And this should be "false".
> 
> >  	.hw		= I2C_TYPE_EXYNOS5,
> >  };
> >
> >  static const struct exynos_hsi2c_variant exynos5260_hsi2c_data = {
> >  	.fifo_depth	= 16,
> > +	.has_usi	= 0,
> >  	.hw		= I2C_TYPE_EXYNOS5,
> >  };
> >
> >  static const struct exynos_hsi2c_variant exynos7_hsi2c_data = {
> >  	.fifo_depth	= 16,
> > +	.has_usi	= 0,
> >  	.hw		= I2C_TYPE_EXYNOS7,
> >  };
> >
> > +static const struct exynos_hsi2c_variant exynosautov9_hsi2c_data = {
> > +	.fifo_depth	= 64,
> > +	.has_usi	= 1,
> > +	.hw		= I2C_TYPE_EXYNOSAUTOV9,
> > +};
> > +
> >  static const struct of_device_id exynos5_i2c_match[] = {
> >  	{
> >  		.compatible = "samsung,exynos5-hsi2c", @@ -243,6 +271,9 @@ static
> > const struct of_device_id exynos5_i2c_match[] = {
> >  	}, {
> >  		.compatible = "samsung,exynos7-hsi2c",
> >  		.data = &exynos7_hsi2c_data
> > +	}, {
> > +		.compatible = "samsung,exynosautov9-hsi2c",
> > +		.data = &exynosautov9_hsi2c_data
> >  	}, {},
> >  };
> >  MODULE_DEVICE_TABLE(of, exynos5_i2c_match); @@ -281,6 +312,31 @@
> > static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
> >  		i2c->op_clock;
> >  	int div, clk_cycle, temp;
> >
> > +	/* In case of HSI2C controllers in EXYNOSAUTOV9
> 
> Linux coding comment please, so with a separate /* :
> 
> /*
>  * In case of....

I miss this.
I will change it next version.

> 
> Rest looks good, thanks for the changes!
> 
> Best regards,
> Krzysztof

Thanks
Jaewon Kim

