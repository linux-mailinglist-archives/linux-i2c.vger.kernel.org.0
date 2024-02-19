Return-Path: <linux-i2c+bounces-1874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 872BF85A670
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 15:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CB2C1F21524
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA32037700;
	Mon, 19 Feb 2024 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aqUuKFXX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64512EB10;
	Mon, 19 Feb 2024 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354363; cv=none; b=dWpswNpDmPC2AiB2yPaOJRfNZiRBsbAdsXShXH1KKyjQio4ENTHZb2GZXTMhVPlfvUXgvvOhFQBzrPYr/v2ZbBK3Jroz0y60NRfWx8Oipf5W+hjpczXDW2RWaKqmWYt5dRJPF/IaRd9rG6yC86NeG+MWbzjg/PPMQgJS4cUwI2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354363; c=relaxed/simple;
	bh=KI8gYtgQc3D6K7JrkCR8/DBx6/PE/xTzlqPXlmn93UQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=CRNuHSDfF5W18RWl69H/IdD9TvWd7qJfuAfefKQv7itK7J0VR6tjb81RbUmXMLuxaRjlVdKRRDLovygLpyVGgtFuEi7PqSo7OHsXFyCzAVKld5yFmj3BzujNz24dqh94rZ8m/tJl0XKs2VcdC23T6jcy4T0KNPTYeJn2wykOrJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aqUuKFXX; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A95A60005;
	Mon, 19 Feb 2024 14:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708354359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ZI2x7L+5DI9OHRIbLNWtIWuWsNLPZDbExC8tkmjT4Q=;
	b=aqUuKFXXla1EFJCYNm9WJ4ROhvvw47hyqdD5c80VjAQIDQNfR/kfOwXylSn/abIZA4gNmF
	VWHmcHDdT2mlxvLEhLkUEsIayg0Z+BGQc7mUH4uBrF4dsRcArXUys3waztbUWZQ9/ciM1F
	VL72U8mZnu23eFUEMiqSkrMtAR/W6ZpnrruMBCM3G6qACADeBL0DqXUDispK6q5Oc3ARim
	ZNL7tB/TW8Mm00WcsKUa3XtwhQqiMSqIAAL5intyz6tf57yjQIaY9IDUlzHp4YUNq5kJFx
	p7AyA6bgBPwKALcdR48Uks7g6qolAjjdBLUjjKP5iNiun1b9vSkKDNPBkzzJ8g==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Feb 2024 15:52:37 +0100
Message-Id: <CZ952TBZGEVD.JYSAQGNL1ZAQ@bootlin.com>
Cc: "Andi Shyti" <andi.shyti@kernel.org>, "Rob Herring"
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
To: "Linus Walleij" <linus.walleij@linaro.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 10/13] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-10-19a336e91dca@bootlin.com>
 <CACRpkdY4PtnWkAEa=8sHdx7zYXLVAsrqKEVJY9m7VqeG5h6ChQ@mail.gmail.com>
In-Reply-To: <CACRpkdY4PtnWkAEa=8sHdx7zYXLVAsrqKEVJY9m7VqeG5h6ChQ@mail.gmail.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Feb 19, 2024 at 3:35 PM CET, Linus Walleij wrote:
> On Thu, Feb 15, 2024 at 5:52=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
>
> > Add compatible for the integration of the same DB8500 IP block into the
> > Mobileye EyeQ5 platform. Two quirks are present:
> >
> >  - The memory bus only supports 32-bit accesses. One writeb() is done t=
o
> >    fill the Tx FIFO which we replace with a writel().
> >
> >  - A register must be configured for the I2C speed mode; it is located
> >    in a shared register region called OLB. We access that memory region
> >    using a syscon & regmap that gets passed as a phandle (mobileye,olb)=
.
> >
> >    A two-bit enum per controller is written into the register; that
> >    requires us to know the global index of the I2C
> >    controller (mobileye,id).
> >
> > We add #include <linux/mfd/syscon.h> and <linux/regmap.h> and sort
> > headers.
> >
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> (...)
>
> > -               writeb(*priv->cli.buffer, priv->virtbase + I2C_TFR);
> > +               if (priv->has_32b_bus)
> > +                       writel(*priv->cli.buffer, priv->virtbase + I2C_=
TFR);
> > +               else
> > +                       writeb(*priv->cli.buffer, priv->virtbase + I2C_=
TFR);
>
> Are the other byte accessors working flawlessly? I get the shivers.
> If it's needed in one place I bet the others prefer 32bit access too.

I see where your shivers come from; I'll investigate as I don't remember
my conclusion from the time when I worked on this driver (a few months
ago).

> Further the MIPS is big-endian is it not? It feels that this just happens
> to work because of byte order access? writel() is little-endian by
> definition.

Actually, no. Our platform is little-endian.

The full story, summarised: the endianness of our cores in kernel and
hypervisor mode is defined by a pin read at reset. User mode can toggle
the endianness at runtime I believe, but that is not of our concern.
Our endianness in kernel mode is little-endian because the pin in
question is hardwired to the value meaning little-endian.

> What happens if you replace all writeb():s with something like
>
> static void nmk_write_reg(struct nmk_i2c_dev *priv, u32 reg, u8 val)
> {
>     if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>         writeb(val, priv->virtbase + reg + 3);
>         // if this doesn't work then use writeb((u32)val,
> priv->virtbase + reg) I guess
>    else
>         writeb(val, priv->virtbase + reg);
> }
>
> and conversely for readb()?

As mentionned above, big endian isn't the worry for us. I'll be checking
the readb() calls found in i2c_irq_handler() though.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

