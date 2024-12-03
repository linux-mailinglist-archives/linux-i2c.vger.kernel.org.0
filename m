Return-Path: <linux-i2c+bounces-8306-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4739E1635
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 09:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53BDE281C1B
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 08:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B011DC734;
	Tue,  3 Dec 2024 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cflINFwW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595621BDA99;
	Tue,  3 Dec 2024 08:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215747; cv=none; b=Bb6lAS5gzWR4jnGmKgPxoMyZFRZd3rQ6rXjUTzXvXYoUD1UnjyTXkbAEuyrAtg/Dd3GVCR2gZaLUrQP/KzawsP2IgPyHIDUwi8yhLmxL5SKHgzyYaOQNJvv7WzqTJPV0+oiq+inoAp7ndwZajpIJOxu6luDy39ardHaqxCw0eUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215747; c=relaxed/simple;
	bh=3bzQITP8wYOAiSafwbZaz1gTBad8OZaf6a8/RS+29uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J1+ULZWPlzuDCxGl3rKHj9EVGIIoVUd/f/6J1E/1NjmxW1NeJsqXROoDu6GHM4y5KubEpAHcnV5ZFTlDAvRpEGdcmg5majs1tkATzMWqNkDjRTAKWodn/wZWz3FAxCkNx2qyj/MOkHcwZlJsG3OmMDwhA9Pz7DVYMmY8U59Fhu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cflINFwW; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75CA62000B;
	Tue,  3 Dec 2024 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733215739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rAgbolLsw7T+gfcrbOkYE875TKvCH6FbdBvBw99vNsY=;
	b=cflINFwWl3sup/5iJau58w8SSeo4uXZI9UPYFbsDRVyKfHrSh3gjofqEfW/p1fgZDbQgJ9
	MO6O+ISo/42lwVExLaAE/9K0UlNRWgEUtW3fJvR1Vwdgs2IzxWRt6UlqVKEiRVKnRt4/Ta
	R8djTkoSxOETGsU0gEGbL6UAcp6WLIz2mB3CG8tufJJQnK+kXuPM6R65FTBl9bzsMuYjrJ
	SW+uznXe+isPf0X54WO5kSUqe47pFMQiFbhrTg8javj6pNWOdP1jJ+bN3veB82BqkN5Uyp
	KRpZm3915rRCNYhIRHuPBnRJIS8fOp58jTn8qC/v0fFb+wFdr5IAesSv/pAUfA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject:
 Re: [PATCH v3 2/9] media: i2c: ds90ub960: Replace aliased clients list with
 bitmap
Date: Tue, 03 Dec 2024 09:48:57 +0100
Message-ID: <1743994.6779kEWLuL@fw-rgant>
In-Reply-To: <92f06c2a-84be-4e89-adf5-9fa58d0806e6@ideasonboard.com>
References:
 <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
 <20241125-fpc202-v3-2-34e86bcb5b56@bootlin.com>
 <92f06c2a-84be-4e89-adf5-9fa58d0806e6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: romain.gantois@bootlin.com

Hi,

On vendredi 29 novembre 2024 14:46:38 heure normale d=E2=80=99Europe centra=
le Tomi=20
Valkeinen wrote:
> Hi,
>=20
> On 25/11/2024 10:45, Romain Gantois wrote:
> > The ds90ub960 driver currently uses a list of i2c_client structs to keep
> > track of used I2C address translator (ATR) alias slots for each RX port.
=2E..
> >   		dev_err(dev, "rx%u: alias pool exhausted\n", rxport->nport);
> >   		return -EADDRNOTAVAIL;
> >   =09
> >   	}
> >=20
> > -	rxport->aliased_clients[reg_idx] =3D client;
> > +	set_bit(reg_idx, rxport->alias_use_mask);
> >=20
> >   	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
> >   =09
> >   			   client->addr << 1);
> >=20
> > @@ -1063,18 +1059,15 @@ static void ub960_atr_detach_client(struct i2c_=
atr
> > *atr, u32 chan_id,>=20
> >   	struct device *dev =3D &priv->client->dev;
> >   	unsigned int reg_idx;
> >=20
> > -	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients);
> > reg_idx++) { -		if (rxport->aliased_clients[reg_idx] =3D=3D client)
> > -			break;
> > -	}
> > +	reg_idx =3D find_first_zero_bit(rxport->alias_use_mask,
> > UB960_MAX_PORT_ALIASES);
> The old code went through the alias table to find the matching client,
> so that it can be removed. The new code... Tries to find the first
> unused entry in the mask, to... free it?
>=20
> I'm not sure how this is supposed to work, or how the driver even could
> manage with just a bit mask. The driver needs to remove the one that was
> assigned in ub960_atr_attach_addr(), so it somehow has to find the same
> entry using the address or the alias.

Indeed, there is an issue here. Tracking client addresses is still required=
,=20
so the correct change would be to convert aliased_clients to aliased_addrs.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




