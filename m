Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9303A67CE
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 15:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbhFNN3v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 14 Jun 2021 09:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbhFNN3v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Jun 2021 09:29:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E0DC061574
        for <linux-i2c@vger.kernel.org>; Mon, 14 Jun 2021 06:27:48 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lsmcf-0003s8-VG; Mon, 14 Jun 2021 15:27:25 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lsmcc-0004SO-Lr; Mon, 14 Jun 2021 15:27:22 +0200
Message-ID: <67e00c18b71875a0aaa7a8a02b2b0507f5d7a575.camel@pengutronix.de>
Subject: Re: [PATCH 3/5] i2c: riic: Add RZ/G2L support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bence =?ISO-8859-1?Q?Cs=F3k=E1s?= <bence98@sch.bme.hu>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Mike Rapoport <rppt@kernel.org>,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 14 Jun 2021 15:27:22 +0200
In-Reply-To: <20210611165624.30749-4-biju.das.jz@bp.renesas.com>
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com>
         <20210611165624.30749-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Fri, 2021-06-11 at 17:56 +0100, Biju Das wrote:
> RZ/G2L i2c controller is compatible with RZ/A i2c controller.
> By default IP is in reset state, so need to perform release
> reset before accessing any register.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/i2c/busses/Kconfig    |  1 +
>  drivers/i2c/busses/i2c-riic.c | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 281a65d9b44b..5da09288b461 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -941,6 +941,7 @@ config I2C_QUP
>  config I2C_RIIC
>  	tristate "Renesas RIIC adapter"
>  	depends on ARCH_RENESAS || COMPILE_TEST
> +	select RESET_CONTROLLER

There's no need for this. The reset API defines inline stubs so this can
be compiled without RESET_CONTROLLER enabled.

>  	help
>  	  If you say yes to this option, support will be included for the
>  	  Renesas RIIC I2C interface.
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index 4eccc0f69861..a3860631c6db 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -42,8 +42,10 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  
>  #define RIIC_ICCR1	0x00
>  #define RIIC_ICCR2	0x04
> @@ -86,6 +88,11 @@
>  
>  #define RIIC_INIT_MSG	-1
>  
> +enum riic_type {
> +	RIIC_RZ_A,
> +	RIIC_RZ_G2L,
> +};
> +
>  struct riic_dev {
>  	void __iomem *base;
>  	u8 *buf;
> @@ -395,7 +402,9 @@ static int riic_i2c_probe(struct platform_device *pdev)
>  	struct i2c_adapter *adap;
>  	struct resource *res;
>  	struct i2c_timings i2c_t;
> +	struct reset_control *rstc;
>  	int i, ret;
> +	enum riic_type type;
>  
>  	riic = devm_kzalloc(&pdev->dev, sizeof(*riic), GFP_KERNEL);
>  	if (!riic)
> @@ -412,6 +421,17 @@ static int riic_i2c_probe(struct platform_device *pdev)
>  		return PTR_ERR(riic->clk);
>  	}
>  
> +	type = (enum riic_type)of_device_get_match_data(&pdev->dev);
> +	if (type == RIIC_RZ_G2L) {
> +		rstc = devm_reset_control_get(&pdev->dev, NULL);

Please use devm_reset_control_get_exclusive().

> +		if (IS_ERR(rstc)) {
> +			dev_err(&pdev->dev, "Error: missing reset ctrl\n");
> +			return PTR_ERR(rstc);
> +		}
> +
> +		reset_control_deassert(rstc);
> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
>  		res = platform_get_resource(pdev, IORESOURCE_IRQ, riic_irqs[i].res_num);
>  		if (!res)
> @@ -472,6 +492,7 @@ static int riic_i2c_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id riic_i2c_dt_ids[] = {
> +	{ .compatible = "renesas,riic-r9a07g044", .data = (void *)RIIC_RZ_G2L },
>  	{ .compatible = "renesas,riic-rz" },
>  	{ /* Sentinel */ },
>  };

regards
Philipp
