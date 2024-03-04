Return-Path: <linux-i2c+bounces-2140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BCE86FE3A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 11:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C2321C219F7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FA8224D6;
	Mon,  4 Mar 2024 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="maGBN6NO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C2A24B2B;
	Mon,  4 Mar 2024 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709546451; cv=none; b=l0MT5Bsw8eczFjqsaGmUMf5MBFplnBxuno1zfVakksakhQjqlSFbo/fZcvFGt8aNIzuKTgBv20DdnPBcDYtjJT7gp7WZkDOwziZHZMU7+HiKwezUdNEoDEH00fE1CIPaYlr3uvifetFSKndXRLb7ubu+rsAgcMV0VUOd65Oz7t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709546451; c=relaxed/simple;
	bh=Ltz90TO6kzYU5NNZDHlenUvdrRAeb9Z4YTkBpwDlM6k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=flHKRM4ThWRKTv0OM7OnOduDta4uLQ23yuEzktjmGbirnDdkNqSlvu93BFRVHOspDzqXhf5agjf5KEJv2N6JlFbBYOBY10X53FvQdo1Bw+WtOT4ZpzMmBFOZieZioh9sG0jxUw+45nVSD9zWXhPpTyonGwLdbhRRVBzbUWNxiJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=maGBN6NO; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35D9C240011;
	Mon,  4 Mar 2024 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709546446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pz1yibsIsNHyK2XZsyjOxrFSmLQ7xgeVb+gsJobLKuE=;
	b=maGBN6NOtE6vKHL1RnDS5WOvUaS37rhoc/gAC3aGOI2TqC8PyRPfBQq4vQxP0Gyyl2s4ax
	NviTY9rFf8juUhThZVE4NqOCS0a8GhBFxTqjJTWIT0Qj92967tm4lPeJtTyWmQd84EBBiy
	qldXFnyRJGr0n3OuBAJuYV7jdzwjN9j4fa4AG3ajgES9yK3hpFDGwv1AjLl3lXErJFMoxG
	7PuFTSOxSFKsoOpmefpFyzU8wNLVcdJdgZE3F/4Q90L28+Q9T6+qgs8fZ0FGyFNNGffDEW
	B8V6f6p/JiNEsog8hUpRWKfVtcsdad7apTXg6PhzhUHOJ8dM2k1+VK0+1p+3HA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Mar 2024 11:00:45 +0100
Message-Id: <CZKVMZC3BEXV.380JV1IP5RYFG@bootlin.com>
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
Subject: Re: [PATCH v2 05/11] i2c: nomadik: use bitops helpers
X-Mailer: aerc 0.15.2
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-5-b32ed18c098c@bootlin.com>
 <3kooaexx6vhlfwoojcpmnyhagupqwppwenjh4k7ucxbvlfpjn6@e3b7c3ocu6kc>
In-Reply-To: <3kooaexx6vhlfwoojcpmnyhagupqwppwenjh4k7ucxbvlfpjn6@e3b7c3ocu6kc>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Sat Mar 2, 2024 at 2:31 AM CET, Andi Shyti wrote:

[...]

> > @@ -284,7 +290,7 @@ static int init_hw(struct nmk_i2c_dev *priv)
> >  }
> > =20
> >  /* enable peripheral, master mode operation */
> > -#define DEFAULT_I2C_REG_CR	((1 << 1) | I2C_CR_PE)
> > +#define DEFAULT_I2C_REG_CR	(FIELD_PREP(I2C_CR_OM, 0b01) | I2C_CR_PE)
>
> 0b01?

OM is a two-bit field. We want to put 0b01 in that. We do not declare
constants for its 4 potential values. Values are:

 - 0b00 slave mode
 - 0b01 master mode
 - 0b10 master/slave mode
 - 0b11 reserved

To me the comment above DEFAULT_I2C_REG_CR is enough to show that we go
into master mode. We could declare all values as constants but only
0b01 would get used.

>
> >  /**
> >   * load_i2c_mcr_reg() - load the MCR register
> > @@ -296,41 +302,42 @@ static u32 load_i2c_mcr_reg(struct nmk_i2c_dev *p=
riv, u16 flags)
> >  	u32 mcr =3D 0;
> >  	unsigned short slave_adr_3msb_bits;
> > =20
> > -	mcr |=3D GEN_MASK(priv->cli.slave_adr, I2C_MCR_A7, 1);
> > +	mcr |=3D FIELD_PREP(I2C_MCR_A7, priv->cli.slave_adr);
> > =20
> >  	if (unlikely(flags & I2C_M_TEN)) {
> >  		/* 10-bit address transaction */
> > -		mcr |=3D GEN_MASK(2, I2C_MCR_AM, 12);
> > +		mcr |=3D FIELD_PREP(I2C_MCR_AM, 2);
> >  		/*
> >  		 * Get the top 3 bits.
> >  		 * EA10 represents extended address in MCR. This includes
> >  		 * the extension (MSB bits) of the 7 bit address loaded
> >  		 * in A7
> >  		 */
> > -		slave_adr_3msb_bits =3D (priv->cli.slave_adr >> 7) & 0x7;
> > +		slave_adr_3msb_bits =3D FIELD_GET(GENMASK(9, 7),
> > +						priv->cli.slave_adr);
>
> This looks like the only one not having a define. Shall we give a
> definition to GENMASK(9, 7)?

Indeed. What should it be named? It could be generic; this is about
getting the upper 3 bits from an extended (10-bit) I2C address?

> > -		mcr |=3D GEN_MASK(slave_adr_3msb_bits, I2C_MCR_EA10, 8);
> > +		mcr |=3D FIELD_PREP(I2C_MCR_EA10, slave_adr_3msb_bits);
>
> ...
>
> > @@ -824,15 +827,16 @@ static irqreturn_t i2c_irq_handler(int irq, void =
*arg)
> >  	 * during the transaction.
> >  	 */
> >  	case I2C_IT_BERR:
> > +	{
> > +		u32 sr =3D readl(priv->virtbase + I2C_SR);
>
> please give a blank line after the variable definition.
>
> Besides, I'd prefer the assignment, when it is a bit more
> complex, in a different line, as well.

Will do.

> Rest looks OK, didn't see anything off.

Thanks for the review Andi!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


