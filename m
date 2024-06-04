Return-Path: <linux-i2c+bounces-3760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF38FA6D0
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 02:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D8831C21385
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 00:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A2D63E;
	Tue,  4 Jun 2024 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HY6ST8IK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFFF384;
	Tue,  4 Jun 2024 00:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717459828; cv=none; b=eReN3PhNOpfsAzn+32zhaRYZ1kcdd+s8/PKcX0qJ39LdFbgxBbiKbie/AfuNjRtlYUEmqZnRga4GPp65zobyZEH7rKTDcavPmiPYfy5+OKYVLTe6GbHuFdKMsUNAT5cfOOAKknb/IjKQTLp4N/rs9+zME3F2D9RHbA2z7p+sp9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717459828; c=relaxed/simple;
	bh=UnZP8hTxJqNQKBXlQ6Yjy1MXD2T4EGPiF4S7k9wGFSg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Dg2ppSX+Pe9NPAvIJZ3EKxAOoghSBAuNs/V6JWCxoCU7CGGI/u+xgV2Mm7BqM2nQbo5psJpJY0YkV5blNz1L5bPH84VB/QOLwUfv2FiMzUlWUE/wiZFzWmBBb+y7RzGJQMmcixsfhQSCQM33u88OEUZrjQoMmtg3yFOOq8db+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HY6ST8IK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A99EC2BD10;
	Tue,  4 Jun 2024 00:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717459827;
	bh=UnZP8hTxJqNQKBXlQ6Yjy1MXD2T4EGPiF4S7k9wGFSg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HY6ST8IK5UWhR0hRot1g38azQUr9oyF17qxp+LOxv8q+7KMnYN+vZXvW/Q79AAj5b
	 lpYejqrtRCnSUFNrRFk9G1ZDCwvE9OYyK1abre8em4OHt07PbM+uV7cjqDe8Ty6qVN
	 mwi+wyg9Nge//d+hy+O2GZHHJwJ+93Ftg9TVlARIbem0MFG+LCMW4IkjypNyHq8B+b
	 wju0Er2rj8HtQVxlNX82BFnAc+Kvvj9CtWRJvJzZQcYCnzntXFGj5g6KRMVKH39H5U
	 /3JGEvq0y0PhoXV57OstJSggR5wyr6mId88RvkzKg8qOqUrg8PFIGIFk6HRm34Q+4I
	 TTQuNVL4j5VFQ==
Message-ID: <8e6fcde41671b0a1e8365214e6df4ec2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240517-a2b-v1-8-b8647554c67b@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk> <20240517-a2b-v1-8-b8647554c67b@bang-olufsen.dk>
Subject: Re: [PATCH 08/13] clk: add AD24xx clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, Alvin =?utf-8?q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
To: Alvin =?utf-8?q?=C5=A0ipraga?= <alvin@pqrs.dk>, Andi Shyti <andi.shyti@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rafael J. Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 03 Jun 2024 17:10:25 -0700
User-Agent: alot/0.10

Quoting Alvin =C5=A0ipraga (2024-05-17 06:02:15)
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 3e9099504fad..a3d54b077e68 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -257,6 +257,13 @@ config COMMON_CLK_LAN966X
>           LAN966X SoC. GCK generates and supplies clock to various periph=
erals
>           within the SoC.
> =20
> +config COMMON_CLK_AD24XX
> +       bool "Clock driver for Analog Devices Inc. AD24xx"

tristate

> +       depends on A2B_AD24XX_NODE

Please make it be COMPILE_TESTed as well?

> +       help
> +         This driver supports the clock output functionality of AD24xx s=
eries
> +         A2B transceiver chips.
> +
>  config COMMON_CLK_ASPEED
>         bool "Clock driver for Aspeed BMC SoCs"
>         depends on ARCH_ASPEED || COMPILE_TEST
> diff --git a/drivers/clk/clk-ad24xx.c b/drivers/clk/clk-ad24xx.c
> new file mode 100644
> index 000000000000..ed227c317faa
> --- /dev/null
> +++ b/drivers/clk/clk-ad24xx.c
> @@ -0,0 +1,341 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * AD24xx clock driver
> + *
> + * Copyright (c) 2023 Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> + */
> +
> +#include <linux/a2b/a2b.h>
> +#include <linux/a2b/ad24xx.h>
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>

Include header for static_assert() at least. There's probably more that
are needed, please check.

> +
> +#define AD24XX_NUM_CLKS 2
> +
> +/* Define some safe macros to make the code more readable */
> +#define A2B_CLKCFG(_idx)        (!(_idx) ? A2B_CLK1CFG : A2B_CLK2CFG)
> +
> +#define A2B_CLKCFG_DIV_SHIFT    A2B_CLK1CFG_CLK1DIV_SHIFT
> +#define A2B_CLKCFG_PDIV_SHIFT   A2B_CLK1CFG_CLK1PDIV_SHIFT
> +
> +#define A2B_CLKCFG_DIV_MASK     A2B_CLK1CFG_CLK1DIV_MASK
> +#define A2B_CLKCFG_PDIV_MASK    A2B_CLK1CFG_CLK1PDIV_MASK
> +#define A2B_CLKCFG_INV_MASK     A2B_CLK1CFG_CLK1INV_MASK
> +#define A2B_CLKCFG_EN_MASK      A2B_CLK1CFG_CLK1EN_MASK
> +
> +static_assert(A2B_CLK1CFG_CLK1DIV_MASK  =3D=3D A2B_CLK2CFG_CLK2DIV_MASK);
> +static_assert(A2B_CLK1CFG_CLK1PDIV_MASK =3D=3D A2B_CLK2CFG_CLK2PDIV_MASK=
);
> +static_assert(A2B_CLK1CFG_CLK1INV_MASK  =3D=3D A2B_CLK2CFG_CLK2INV_MASK);
> +static_assert(A2B_CLK1CFG_CLK1EN_MASK   =3D=3D A2B_CLK2CFG_CLK2EN_MASK);
> +
> +struct ad24xx_clkout {
> +       struct clk_hw hw;
> +       unsigned int idx;
> +       bool registered;
> +};
> +
> +struct ad24xx_clk {
> +       struct device *dev;

Is this used?

> +       struct a2b_func *func;

Is this used?

> +       struct a2b_node *node;

Is this used?

> +       struct regmap *regmap;
> +       struct clk_hw *pll_hw;

Is this used outside of probe?

> +       struct ad24xx_clkout clkouts[AD24XX_NUM_CLKS];
> +};
> +
[..]
> +
> +static const struct regmap_config ad24xx_clk_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .cache_type =3D REGCACHE_RBTREE,

No max_register?

> +};
> +
> +static struct clk_hw *ad24xx_clk_of_get(struct of_phandle_args *clkspec,=
 void *data)
> +{
> +       struct ad24xx_clk *adclk =3D data;
> +       unsigned int idx =3D clkspec->args[0];
> +
> +       if (idx >=3D AD24XX_NUM_CLKS)
> +               return ERR_PTR(-EINVAL);
> +
> +       if (!adclk->clkouts[idx].registered)
> +               return ERR_PTR(-ENOENT);
> +
> +       return &adclk->clkouts[idx].hw;
> +}
> +
> +static int ad24xx_clk_probe(struct device *dev)
> +{
> +       struct a2b_func *func =3D to_a2b_func(dev);
> +       struct a2b_node *node =3D func->node;
> +       struct device_node *np =3D dev->of_node;
> +       char *pll_name;
> +       const char *sync_clk_name;
> +       struct ad24xx_clk *adclk;
> +       int num_clks;
> +       int ret;
> +       int i;
> +
> +       /*
> +        * Older series AD240x and AD241x chips have a single discrete
> +        * A2B_CLKCFG register that behaves differently to the A2B_CLKnCFG
> +        * registers of the later AD242x series. This driver only support=
s the
> +        * latter right now.
> +        */
> +       if (!(node->chip_info->caps & A2B_CHIP_CAP_CLKOUT))
> +               return -ENODEV;

Maybe print a warning message to make it more obvious.

> +
> +       adclk =3D devm_kzalloc(dev, sizeof(*adclk), GFP_KERNEL);
> +       if (!adclk)
> +               return -ENOMEM;
> +
> +       adclk->regmap =3D
> +               devm_regmap_init_a2b_func(func, &ad24xx_clk_regmap_config=
);

Put it on one line please .

> +       if (IS_ERR(adclk->regmap))
> +               return PTR_ERR(adclk->regmap);
> +
> +       adclk->dev =3D dev;
> +       adclk->func =3D func;
> +       adclk->node =3D node;
> +       dev_set_drvdata(dev, adclk);
> +
> +       num_clks =3D of_property_count_strings(np, "clock-output-names");
> +       if (num_clks < 0 || num_clks > AD24XX_NUM_CLKS)
> +               return -EINVAL;

Please register all the clks provided by this chip.

> +
> +       /*
> +        * Register the PLL internally to use it as the parent of the CLK=
OUTs.
> +        * The PLL runs at 2048 times the SYNC clock rate.
> +        */
> +       pll_name =3D
> +               devm_kasprintf(dev, GFP_KERNEL, "%s_pll", dev_name(&node-=
>dev));
> +       if (!pll_name)
> +               return -ENOMEM;
> +       sync_clk_name =3D __clk_get_name(a2b_node_get_sync_clk(func->node=
));
> +       adclk->pll_hw =3D devm_clk_hw_register_fixed_factor(
> +               dev, pll_name, sync_clk_name, 0, 2048, 1);

I think this should be devm_clk_hw_register_fixed_factor_fwname().

> +       if (IS_ERR(adclk->pll_hw))
> +               return PTR_ERR(adclk->pll_hw);
> +
> +       for (i =3D 0; i < num_clks; i++) {
> +               struct clk_init_data init =3D { };
> +               const char *parent_names =3D clk_hw_get_name(adclk->pll_h=
w);

Please use struct clk_parent_data instead of strings to describe
topology.

> +               unsigned int idx =3D i;
> +
> +               /* Clock outputs can be skipped with the clock-indices pr=
operty */
> +               of_property_read_u32_index(np, "clock-indices", i, &idx);
> +               if (idx > AD24XX_NUM_CLKS)
> +                       return -EINVAL;
> +
> +               ret =3D of_property_read_string_index(np, "clock-output-n=
ames", i,
> +                                                   &init.name);

The name should only be for debug purposes. Please don't use
clock-output-names DT property. If you need to make it unique perhaps
you can add in the device name or something like that?

> +               if (ret)
> +                       return ret;
> +
> +               init.ops =3D &ad24xx_clk_ops;
> +               init.parent_names =3D &parent_names;
> +               init.num_parents =3D 1;
> +
> +               adclk->clkouts[idx].hw.init =3D &init;
> +               adclk->clkouts[idx].idx =3D idx;
> +               adclk->clkouts[idx].registered =3D true;
> +
> +               ret =3D devm_clk_hw_register(dev, &adclk->clkouts[idx].hw=
);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret =3D devm_of_clk_add_hw_provider(dev, ad24xx_clk_of_get, adclk=
);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

Please just return devm_of_clk_add_hw_provider(...) to prevent the
cleanup crews from sending a followup patch.

> +}
> +
> +static const struct of_device_id ad24xx_clk_of_match_table[] =3D {
> +       { .compatible =3D "adi,ad2420-clk" },
> +       { .compatible =3D "adi,ad2421-clk" },
> +       { .compatible =3D "adi,ad2422-clk" },
> +       { .compatible =3D "adi,ad2425-clk" },
> +       { .compatible =3D "adi,ad2426-clk" },
> +       { .compatible =3D "adi,ad2427-clk" },
> +       { .compatible =3D "adi,ad2428-clk" },
> +       { .compatible =3D "adi,ad2429-clk" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ad24xx_clk_of_match_table);
> +
> +static struct a2b_driver ad24xx_clk_driver =3D {

I guess because this isn't a platform driver I can't merge this through
the clk tree? Is there any difference from the platform bus?

> +       .driver =3D {
> +               .name =3D "ad24xx-clk",
> +               .of_match_table =3D ad24xx_clk_of_match_table,
> +               .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +       },
> +       .probe =3D ad24xx_clk_probe,
> +};
> +module_a2b_driver(ad24xx_clk_driver);

