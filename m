Return-Path: <linux-i2c+bounces-7301-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54425996BE3
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 15:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F33F51F216F6
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 13:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D14192583;
	Wed,  9 Oct 2024 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fStKmwy/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F637462;
	Wed,  9 Oct 2024 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728480686; cv=none; b=e4xxX1IXT6IZET4himAfj8lFKK+VBXuHEtXcoJpVH741mb4H7yvD8v/mjJQkwbUYgJxezlqM5LA/dPdTZ4MSA9HUH30b40fKXlwwS9rhNivUe3ZEec2A++43JxebOKzMKFAcNSofxmCd/xNJOHqKfnS7GEBFDmgrUc2IlYoudk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728480686; c=relaxed/simple;
	bh=giV52/vmcYWViMZfBPIzXa2HgtORI8AVA0AJ4iUjPB4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=QpP6N6gxj32UyhtbCYcsEIuOcjGgVsu9uQ8XwuFpqtvLzh23mUut9fsrJ7pAWkOaCpz4QxdQwUV3OgAeCWopm8PpwOvhuvQpmoh/hmL+UNTBJzp1bpizxoKmuHJBYYDblVaX5boifxWHGSBaSMHMm/eScR7N/hpO9Pay4p+mM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fStKmwy/; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D4E5FF807;
	Wed,  9 Oct 2024 13:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728480681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmB3TVTLAYoejXpiOXxmeOtUKDtgamIRXEwjeFLgEBk=;
	b=fStKmwy/a24cNXVfFv6HOUgx+VRqdHvokCfSDoeKcmZlfI0GqbtJ28FJ9zrNBeaHj7GEw+
	fIZ+67ymxDtcBZ+TNboySyb1WBuu5p0YRdx5g5tZAl6/qhnTnjtQorle0NkVYsOw5W9uNg
	lZmarUQQCIjCip+Btj+2b8xmshPg7rxw68036EQ39F1+eITNH6v4I+hY+aS+vO92c1jUQu
	QRhqUDGLBnpCuH/WReRH/nVMQJiiOLQ6Dnw9DjQvEfjkHtkyjJfdJ8NhIkXhWFuf5IpptN
	L1PNEXUI38bsO6NMETaOhCrmx03cPoLPmNUyvDdwbUFHj5u4k0MrEZTMB1z/fw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 15:31:20 +0200
Message-Id: <D4RB9IS3O0L1.2G9E2688BL4PZ@bootlin.com>
Subject: Re: [PATCH v2 5/6] i2c: nomadik: fix BRCR computation
Cc: "Andi Shyti" <andi.shyti@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, =?utf-8?q?Gr=C3=A9gory_Clement?=
 <gregory.clement@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Linus Walleij" <linus.walleij@linaro.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com>
 <20241009-mbly-i2c-v2-5-ac9230a8dac5@bootlin.com>
 <CACRpkdZyyFR1niN+w_t43uE0XASKMzkUHGHuHWdj_VXCKLTR-g@mail.gmail.com>
In-Reply-To: <CACRpkdZyyFR1niN+w_t43uE0XASKMzkUHGHuHWdj_VXCKLTR-g@mail.gmail.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Linus,

On Wed Oct 9, 2024 at 1:34 PM CEST, Linus Walleij wrote:
> On Wed, Oct 9, 2024 at 12:23=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
> > --- a/drivers/i2c/busses/i2c-nomadik.c
> > +++ b/drivers/i2c/busses/i2c-nomadik.c
> > @@ -454,9 +454,12 @@ static void setup_i2c_controller(struct nmk_i2c_de=
v *priv)
> >          * operation, and the other is for std, fast mode, fast mode
> >          * plus operation. Currently we do not supprt high speed mode
> >          * so set brcr1 to 0.
> > +        *
> > +        * BRCR is a clock divider amount. Pick highest value that
> > +        * leads to rate strictly below target.
> >          */
>
> You could push in some more details from the commit message here so it's =
not
> so terse.

Most of the details from the commit message come from behavior changes:
what was done previously versus what is the new behavior we implement.

Having a clock divider picking the bus rate that is below the target
speed rather than above sounds rather intuitive. Eg when you ask for
400kHz you want <=3D400kHz, not >=3D400kHz.

I'll add that last sentence "Eg when you ask for 400kHz you want a bus
rate <=3D400kHz (and not >=3D400kHz)". It is straight forward and easy to
understand.

> >         brcr1 =3D FIELD_PREP(I2C_BRCR_BRCNT1, 0);
> > -       brcr2 =3D FIELD_PREP(I2C_BRCR_BRCNT2, i2c_clk / (priv->clk_freq=
 * div));
> > +       brcr2 =3D FIELD_PREP(I2C_BRCR_BRCNT2, i2c_clk / (priv->clk_freq=
 * div) + 1);
>
> Doesn't the last part correspond to something like
> #include <linux/math.h>
> u64 scaler =3D DIV_ROUND_DOWN_ULL(i2c_clk, (priv->clk_freq * div));
> brcr2 =3D FIELD_PREP(I2C_BRCR_BRCNT2, (u32)scaler);
>
> Certianly one of the in-kernel division helpers like DIV_ROUND_DOWN
> round_up() etc are better to use IMO, but I might not be understanding th=
e
> fine details of the math here.

Indeed what we want is:
	DIV_ROUND_DOWN(i2c_clk, priv->clk_freq * div)

I see no reason to use DIV_ROUND_DOWN_ULL(). It would be useful if
	i2c_clk + (priv->clk_freq * div)
had a chance to overflow.

Worst case is:
	3_400_000 + (48_000_000 * 3) =3D 147_400_000

Will send v3 straight away as this is a significant change,
thanks Linus!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


