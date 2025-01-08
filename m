Return-Path: <linux-i2c+bounces-8967-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59443A05CBC
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 14:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C0287A2830
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 13:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132A81FBEA6;
	Wed,  8 Jan 2025 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NyaLbDRP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5831F2C44;
	Wed,  8 Jan 2025 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342873; cv=none; b=HzakFMXuWfYPv+OwGnFRnPkDEed+wk/Bcsuc1+pD8KKc3fBwJFI54TDSNXGbm1Oa/zYZpjsaVo+S1KjCaK7QNsIjJIbqlPqDmSMx3bqy+LlHE4LuF5NOtRGiHyNlDX2JRtdE61Atl1Y3iUxgu4JIC3IXo2v16PhVFa32WlbLBys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342873; c=relaxed/simple;
	bh=K3vKch6pwTZcFhHb3zmyX67q0tEfzd/HAjj6PSe+e7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3L+DsN/bLn4mSj6lxBc1xmse+IqH0yvlqB54eTnD//mSRAwhQK/XpeeEl1QZfbeYC3jnvd8Cpw/uGt+kfHCbAF9yV70Dzz79ygEOm71znddeBdkxfCMTYlJQU9q+0+71/x+2TQil1m0gGKIPtn2NYcvgnZL6alxkmRdLWjiCn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NyaLbDRP; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B195E40005;
	Wed,  8 Jan 2025 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736342868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrbytonOxInlQhTuoGN3sUJ1B7TmgLdiBbBf/qnlJJg=;
	b=NyaLbDRP15Uw7ie3FAjz5w+HVy+/bmmd6ALlpvc9RtKEZ307L+GirMYw+l2VxuhHwwT8pX
	ie6y5SU5Xy8kwDFG4+/02WOAhvtstQ7ze1W/qUwgNAgrhyJ8eHcqYomN76ZAsSYf0wIvfX
	HTUqq85mMLfq2i68C6v+rjVzvt4wSBsVaX+ll0aQf2qSRk8cI1FgMj4NYZ2D2d0vfDr6G5
	TVkHh5j4lAGOm6PK4JKrXnfO0Nh+9B0pqNDqxG2FAbcKJsVgAZ3sbScARWUbf+LgwB9z9B
	V24VF0lZlLnBGnksSVOVTgPdCb0wh7/xQfxMSSxkwsI1R0pt7aevYXw23alIVw==
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
 Re: [PATCH v4 2/9] media: i2c: ds90ub960: Replace aliased clients list with
 address list
Date: Wed, 08 Jan 2025 14:27:36 +0100
Message-ID: <2762571.mvXUDI8C0e@fw-rgant>
In-Reply-To: <7a6fd045-3513-4979-9210-8e30361022e3@ideasonboard.com>
References:
 <20241230-fpc202-v4-0-761b297dc697@bootlin.com>
 <20241230-fpc202-v4-2-761b297dc697@bootlin.com>
 <7a6fd045-3513-4979-9210-8e30361022e3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12584284.O9o76ZdvQC";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart12584284.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 08 Jan 2025 14:27:36 +0100
Message-ID: <2762571.mvXUDI8C0e@fw-rgant>
In-Reply-To: <7a6fd045-3513-4979-9210-8e30361022e3@ideasonboard.com>
MIME-Version: 1.0

Hi Tomi,

On lundi 6 janvier 2025 10:34:10 heure normale d=E2=80=99Europe centrale To=
mi=20
Valkeinen wrote:
> Hi,
>=20
> On 30/12/2024 15:22, Romain Gantois wrote:
=2E..
> > @@ -1031,17 +1031,17 @@ static int ub960_atr_attach_client(struct i2c_a=
tr
> > *atr, u32 chan_id,>=20
> >   	struct device *dev =3D &priv->client->dev;
> >   	unsigned int reg_idx;
> >=20
> > -	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients);
> > reg_idx++) { -		if (!rxport->aliased_clients[reg_idx])
> > +	for (reg_idx =3D 0; reg_idx < UB960_MAX_PORT_ALIASES; reg_idx++) {
>=20
> Any reason to drop the use of ARRAY_SIZE()? Usually when dealing with
> fixed size arrays, it's nicer to use ARRAY_SIZE().

No reason in particular, I just thought it was more explicit to use ARRAY_S=
IZE=20
but I'll keep the UB960_MAX_PORT_ALIASES since you think it's nicer.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart12584284.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmd+fUkACgkQ3R9U/FLj
286cKw/9GhzDSwcSpgGMmFby1lU9mmX18t6BSx1U9pic2TrlaD9TSE1oisI9vGj4
wNYw5SVl0tvlVNnYGgpOIohecJbW9Oq1yFSyDCiCKTr+kSUooNqMOj9Iqy1lDtBn
1ntBEu938RStiwhhYqb5hloFTODwLY+S16OroeeOa8/9GC0ueC6IDoetccfFlD+m
KztldSKL+rJJyEBbMBUoHSiHgDaUXBz3D+YRSmDzl+yH2mFh7y+0nvZV8JgYJ6UG
VlkqqZCXKzVCze/cyjs1yRJDlYLMFUIEQMHfUEhTpVzUd+oZZzr0fSlIcKgoQoO0
PyzhB3nZcd1GRTB99akoSvZOa4ovr8R7W5kn+5PajYVihMBStYPTF1nj4gNXusFx
vuFttK+ITt9mxV0tVLOwNvtAIGQQinz2m3fhQWW/xWlnj4dI/FqjRqF04LgD4EeL
/dg2M6qkkBbEqzGFCX5hWrDYtGRS2rcezNXX0ybLOmD1R/gtHllzXOaKgeBPxvOj
QmClb3hf+9ZVpS1uZST5wByvfJSMV6s/+qf9jSYJ1T+rbFFhbbHr2bvjMI+T/lLP
/yJ5KymRwT3h9MYnz0hgnHsudnTomCQtbspL3TDVl6a8RayKhdtsZwFU6gwNpmj6
i78QJwjPWd8ttk8ItnbP1ubuqxz/2Oiot+ECzgd0K2xIIcwoXb0=
=L+BG
-----END PGP SIGNATURE-----

--nextPart12584284.O9o76ZdvQC--




