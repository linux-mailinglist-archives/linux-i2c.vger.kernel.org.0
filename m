Return-Path: <linux-i2c+bounces-1876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D24285A8F0
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 17:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E7F71F2217C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 16:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0ED3D384;
	Mon, 19 Feb 2024 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c4YDXXkS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27E43CF53;
	Mon, 19 Feb 2024 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708360082; cv=none; b=lf1L+E1xTVE6NPpbXCK81K6wyO+zN5HRos7DIMZmx7DaA7m80ZySbXl0tKt8w+Llp6K7ZzDFxKVIgOiLiNnix1mivsymGzrwK/f7fKrG/6mhyZlGlBcVVkgbOOpMLnlE2CK8VY2wreuoQTcEJX4vdV+4rCunEoxQu7mSOBho0AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708360082; c=relaxed/simple;
	bh=9JU8MTOHh8Epoa0sQCXObDtkwAXHJu26UejiP9YuhEk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Vx8bu1uXy6i2xn1OLQCFsMZK8hroZrotarwL1cwkB/e6ebVAyKIvCsqSz36GNFMR1MoD/Zy4pYKo7Oz1ZQk1ib/V6yAVdftxfBem5Fzb55c7gKs8+KTaIsQGqliinK59dfB0pcr7bNzPkm6/NxIr4OhSDrncRFJ1BvSiZhXwbEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c4YDXXkS; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9C7340002;
	Mon, 19 Feb 2024 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708360078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QSZ4uv/p4jrEtAF8IYICmdIzO8A6oWIZZjz46OQJxA=;
	b=c4YDXXkSeglvXQRkC8C9eSW8vjieW62azbJ98JOq6+hpqUqn8y6CzjzJJpEJ6OpIjEZPgC
	Uhkm9TNo59+SKB0GzB39RQnpCL50WsxTpjv12GFQGrjvd1g7gRoD8RCngl/W46fep77eyy
	P7xvtdjEYUpjRYZcsyE4hP9ipXeTfPOuIUf9vA42KKRjUrP/0Gmdxl+etilbgCR2PWp5Sk
	SHvQNactB6Nseu0E0hCx/HdxGE+9RMC7HDGSDb4iySDjWPkU9T/QE2LTvamfnZ/dNF/Bwp
	bxNmNIfO/u1x2ojLgVuNocNUgVgfIFdw63KzTpNVNB9Uv8bXjfXPEVxYQi/q6A==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Feb 2024 17:27:56 +0100
Message-Id: <CZ973SP3M9PS.3GG13IHI2DNR4@bootlin.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Linus Walleij"
 <linus.walleij@linaro.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 10/13] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
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
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-10-19a336e91dca@bootlin.com>
 <CACRpkdY4PtnWkAEa=8sHdx7zYXLVAsrqKEVJY9m7VqeG5h6ChQ@mail.gmail.com>
 <CZ952TBZGEVD.JYSAQGNL1ZAQ@bootlin.com>
In-Reply-To: <CZ952TBZGEVD.JYSAQGNL1ZAQ@bootlin.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Feb 19, 2024 at 3:52 PM CET, Th=C3=A9o Lebrun wrote:
> On Mon Feb 19, 2024 at 3:35 PM CET, Linus Walleij wrote:
> > On Thu, Feb 15, 2024 at 5:52=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@b=
ootlin.com> wrote:
> >
> > > Add compatible for the integration of the same DB8500 IP block into t=
he
> > > Mobileye EyeQ5 platform. Two quirks are present:
> > >
> > >  - The memory bus only supports 32-bit accesses. One writeb() is done=
 to
> > >    fill the Tx FIFO which we replace with a writel().
> > >
> > >  - A register must be configured for the I2C speed mode; it is locate=
d
> > >    in a shared register region called OLB. We access that memory regi=
on
> > >    using a syscon & regmap that gets passed as a phandle (mobileye,ol=
b).
> > >
> > >    A two-bit enum per controller is written into the register; that
> > >    requires us to know the global index of the I2C
> > >    controller (mobileye,id).
> > >
> > > We add #include <linux/mfd/syscon.h> and <linux/regmap.h> and sort
> > > headers.
> > >
> > > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> >
> > (...)
> >
> > > -               writeb(*priv->cli.buffer, priv->virtbase + I2C_TFR);
> > > +               if (priv->has_32b_bus)
> > > +                       writel(*priv->cli.buffer, priv->virtbase + I2=
C_TFR);
> > > +               else
> > > +                       writeb(*priv->cli.buffer, priv->virtbase + I2=
C_TFR);
> >
> > Are the other byte accessors working flawlessly? I get the shivers.
> > If it's needed in one place I bet the others prefer 32bit access too.
>
> I see where your shivers come from; I'll investigate as I don't remember
> my conclusion from the time when I worked on this driver (a few months
> ago).
>
> > Further the MIPS is big-endian is it not? It feels that this just happe=
ns
> > to work because of byte order access? writel() is little-endian by
> > definition.
>
> Actually, no. Our platform is little-endian.
>
> The full story, summarised: the endianness of our cores in kernel and
> hypervisor mode is defined by a pin read at reset. User mode can toggle
> the endianness at runtime I believe, but that is not of our concern.
> Our endianness in kernel mode is little-endian because the pin in
> question is hardwired to the value meaning little-endian.
>
> > What happens if you replace all writeb():s with something like
> >
> > static void nmk_write_reg(struct nmk_i2c_dev *priv, u32 reg, u8 val)
> > {
> >     if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
> >         writeb(val, priv->virtbase + reg + 3);
> >         // if this doesn't work then use writeb((u32)val,
> > priv->virtbase + reg) I guess
> >    else
> >         writeb(val, priv->virtbase + reg);
> > }
> >
> > and conversely for readb()?
>
> As mentionned above, big endian isn't the worry for us. I'll be checking
> the readb() calls found in i2c_irq_handler() though.

Follow up on this. It was working by luck.

 - writeb() are generating Store Byte (sb) instructions which are
   unsupported on the memory bus.

 - readb() are generating Load Doubleword (ld) instructions and not the
   expected Load Byte (lb). It explains why readb() are working.

To be safe I'll make sure to use readl() and writel() everywhere for our
compatible. There is one writeb() and three readb(). Only the writeb()
was covered by this V1.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

