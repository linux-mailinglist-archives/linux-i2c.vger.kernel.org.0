Return-Path: <linux-i2c+bounces-2151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E234870491
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7F271F23A5B
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 14:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783044438F;
	Mon,  4 Mar 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="InYb+2E1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CF7168A8;
	Mon,  4 Mar 2024 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709564039; cv=none; b=NjDIZcye0jiTe6iqvf0uebzE5HtUj4VyyDlq6DzIsgdnLM3qFnXlGzS8ArmTPweVNlL3ikZgupkLhZCBFkb0knoQNbcrpgj/5QbAr9FlmA9tb0h5rIFiZixgxFsS630nkvQ/2xN5DENVzoITd3l+ZmhhDK6VkCe63F0uYAMT32Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709564039; c=relaxed/simple;
	bh=877LLuKe2NbaQT+sN5vEnqY5OtwPmsoasNubm8CyC9A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Mf1BzDmdUA1EfSAxtNYxLtsOciTEq3UGZTXELJRY/JzwFJw/UhC3g7D7BvThhJJcLHHgsOt/IRIrC3cuNOhCOy4tQo8yJcC2zg0ZMdSSHL1TL/hnu6+dlf51nxUNll/Ag4NBjjblFt+S8mTM9SaF+fmnjA9qSx0A/8b9ArTxuRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=InYb+2E1; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8010FE0009;
	Mon,  4 Mar 2024 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709564034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2mZgoKXYTO1ujBY2Bxuy+zGS8qyMDZgJ2hp2iONc9U=;
	b=InYb+2E1syN3tbl5sbWUUNtuoCgNn3nrekFusBtyA5lFrKKfL8Nsc6B97SJH6WJlxYOpIT
	2OJBK8FDkBy35AJInmol9dDEWp2doHu6ygimpZrNsMIdWCROjksOvL3jhE1EH7Nsh7quFj
	rUqdwwz5PCzfk+BWIW1s37+JuX4xmQBla6MXBaTtbQQyDEkbFOAsV+ChmeiQKqytouP//U
	8l/g/BCidGQzdEOBsfcwgbz+5cXyKkJXrZNxxQ+dVeyYqXg9RgcDk1Pfz1A8a5CKJd9FaF
	gHLvkJwRyo7L3E4IAJbqF6Og5WsA6laxnq5EhVDoIPvwGmdSX1hXg5DjfKDz1g==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Mar 2024 15:53:52 +0100
Message-Id: <CZL1VED24SZ0.7ETRO4YZ70CF@bootlin.com>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Andi Shyti" <andi.shyti@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v2 09/11] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
X-Mailer: aerc 0.15.2
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-9-b32ed18c098c@bootlin.com>
 <yqyhu3qsrfyj52sraeo76jnpbgq6wi4o66hfqepxwwwupaggoa@7t5bah3qqcwb>
In-Reply-To: <yqyhu3qsrfyj52sraeo76jnpbgq6wi4o66hfqepxwwwupaggoa@7t5bah3qqcwb>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Mar 4, 2024 at 3:08 PM CET, Andi Shyti wrote:
> Hi Theo,
>
> ...
>
> > +#include <linux/amba/bus.h>
> >  #include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> >  #include <linux/init.h>
> > -#include <linux/module.h>
> > -#include <linux/amba/bus.h>
> > -#include <linux/slab.h>
> >  #include <linux/interrupt.h>
> > -#include <linux/i2c.h>
> > -#include <linux/err.h>
> > -#include <linux/clk.h>
> >  #include <linux/io.h>
> > -#include <linux/pm_runtime.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/pinctrl/consumer.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
>
> Please reorder the headers in a different patch.

Will do.

>
> >  #define DRIVER_NAME "nmk-i2c"
> > =20
>
> ...
>
> > +static inline u8 nmk_i2c_readb(const struct nmk_i2c_dev *priv,
> > +			       unsigned long reg)
> > +{
> > +	if (priv->has_32b_bus)
> > +		return readl(priv->virtbase + reg);
> > +	else
> > +		return readb(priv->virtbase + reg);
>
> nit: no need for the else (your choice though, if you want to
> have ti coherent with the write counterpart).

Indeed, the useless else block can be removed. Will do.

> > +}
> > +
> > +static inline void nmk_i2c_writeb(const struct nmk_i2c_dev *priv, u32 =
val,
> > +				unsigned long reg)
> > +{
> > +	if (priv->has_32b_bus)
> > +		writel(val, priv->virtbase + reg);
> > +	else
> > +		writeb(val, priv->virtbase + reg);
> > +}
>
> ...
>
> > +static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
> > +{
> > +	struct device *dev =3D &priv->adev->dev;
> > +	struct device_node *np =3D dev->of_node;
> > +	unsigned int shift, speed_mode;
> > +	struct regmap *olb;
> > +	unsigned int id;
> > +
> > +	priv->has_32b_bus =3D true;
> > +
> > +	olb =3D syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &=
id);
> > +	if (IS_ERR_OR_NULL(olb)) {
> > +		if (!olb)
> > +			olb =3D ERR_PTR(-ENOENT);
> > +		return dev_err_probe(dev, PTR_ERR(olb),
> > +				     "failed OLB lookup: %lu\n", PTR_ERR(olb));
>
> just return PTR_ERR(olb) and use dev_err_probe() in the upper
> layer probe.

Good catch. In previous revisions nmk_i2c_eyeq5_probe() had multiple
error cases so it had to be the one doing the logging. Now that there
is a single possible error parent can do it. It should simplify code.

>
> > +	}
> > +
> > +	if (priv->clk_freq <=3D 400000)
> > +		speed_mode =3D 0b00;
> > +	else if (priv->clk_freq <=3D 1000000)
> > +		speed_mode =3D 0b01;
> > +	else
> > +		speed_mode =3D 0b10;
>
> would be nice to have these as defines.

Agreed. Will be named based on I2C mode names, eg standard, fast, high
speed, fast plus.

>
> > +
> > +	shift =3D NMK_I2C_EYEQ5_OLB_IOCR2_SHIFT(id);
> > +	regmap_update_bits(olb, NMK_I2C_EYEQ5_OLB_IOCR2,
> > +			   0b11 << shift, speed_mode << shift);
>
> please define these values and for hexadecimals use 0x...

0b11 is a two-bit mask. What do you mean by "these values"? Something
like:



#define NMK_I2C_EYEQ5_SPEED_MODE_FAST		0b00
#define NMK_I2C_EYEQ5_SPEED_MODE_FAST_PLUS	0b01
#define NMK_I2C_EYEQ5_SPEED_MODE_HIGH_SPEED	0b10

static const u8 nmk_i2c_eyeq5_masks[] =3D {
	[0] =3D 0x0030,
	[1] =3D 0x00C0,
	[2] =3D 0x0300,
	[3] =3D 0x0C00,
	[4] =3D 0x3000,
};

static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
{
	// ...
	unsigned int id, mask, speed_mode;

	priv->has_32b_bus =3D true;

	olb =3D syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &id);
	// TODO: olb error checking
	// TODO: check id is valid

	if (priv->clk_freq <=3D 400000)
		speed_mode =3D NMK_I2C_EYEQ5_SPEED_MODE_FAST;
	else if (priv->clk_freq <=3D 1000000)
		speed_mode =3D NMK_I2C_EYEQ5_SPEED_MODE_FAST_PLUS;
	else
		speed_mode =3D NMK_I2C_EYEQ5_SPEED_MODE_HIGH_SPEED;

	mask =3D nmk_i2c_eyeq5_masks[id];
	regmap_update_bits(olb, NMK_I2C_EYEQ5_OLB_IOCR2,
			   mask, speed_mode << __fls(mask));
	return 0;
}

Else I do not see what you are suggesting by "please define these
values".

Have a nice day,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


