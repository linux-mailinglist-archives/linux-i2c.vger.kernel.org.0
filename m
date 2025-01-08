Return-Path: <linux-i2c+bounces-8968-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF70DA05CD0
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 14:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 952E93A68E5
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 13:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD521FBEB4;
	Wed,  8 Jan 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NIkRI5uL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2194E1F2C50;
	Wed,  8 Jan 2025 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343083; cv=none; b=iCmeOZ86E40dyG6DNkkiaDC3Z3axWEKpNXO9AFdSTAL7mzssvVnyrEFLiudbynAQ/h7op5ZP8lkmNPiNSV4LI/Ant0IW1yoWIcFOX9yny8cl8n7XntMUBsQIHF0Kc5IIir5iRa0XP5oKg0XMWceooGs7XwG8eANESLbxqqVwgvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343083; c=relaxed/simple;
	bh=0ox4Gok/cDwc/lMCPWEFwROP9f7HnlHHvDoz5gzQkb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DVKrzwoxFpKoahA1UsFQ/L1RYHjT5nuA2JDcBeb7kl4zMSs7tkXoj6u5GAwlpWzZ0z8wOMY5WJMAKz0prwgK/nWbbc8K/EaFCPilIYvGooF6AJXvkomtzXTLWYG9jr18GSJ8wbYG+dl001BjNvx7sGXzu6id+IxP+rzqYYoeCOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NIkRI5uL; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 297FC1BF20A;
	Wed,  8 Jan 2025 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736343078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cf2NWmnc2Jen5D58ipG2WLWbqKZuYBjzjSVe9QJgIPs=;
	b=NIkRI5uL7wk434caYW50oXj/MljX/TXQdQZaWLFHVy3edyf7sTb9UCMxSJP6ZB5+lPnvbz
	775S5cVRAvJ4GNBNYHG39BHJiAVedY1HO6FVx6laj+jTy2hL817Z2CRppgpgSy8hBjnoyD
	dv3OWCFasdJvbiwusnd1wBI9h/WE7oIsstJZh30+MxoBcPXN3Duy1RGDtgHramqm0S4zCx
	Fl9ddkN35RTM7j+zrnf/6no3ypmtA/c2s5wtQMumoKFacO+4FQhihaoq2sdRzVkAhkBiDV
	f72I5GajeTCCHYUnWhhMWFMdYhrbguep+t+j3scRvyTFZF6c7IvPTzpPqMegQA==
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
 Re: [PATCH v4 4/9] i2c: use client addresses directly in ATR interface
Date: Wed, 08 Jan 2025 14:31:16 +0100
Message-ID: <6115974.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <f63b7744-b86e-4dbe-aa49-10614a025b7e@ideasonboard.com>
References:
 <20241230-fpc202-v4-0-761b297dc697@bootlin.com>
 <20241230-fpc202-v4-4-761b297dc697@bootlin.com>
 <f63b7744-b86e-4dbe-aa49-10614a025b7e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4977285.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart4977285.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 08 Jan 2025 14:31:16 +0100
Message-ID: <6115974.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <f63b7744-b86e-4dbe-aa49-10614a025b7e@ideasonboard.com>
MIME-Version: 1.0

Hi,

On lundi 6 janvier 2025 10:51:20 heure normale d=E2=80=99Europe centrale To=
mi=20
Valkeinen wrote:
> Hi,
>=20
> On 30/12/2024 15:22, Romain Gantois wrote:
> > The I2C Address Translator (ATR) module defines mappings from i2c_client
> > structs to aliases. However, only the physical address of each i2c_clie=
nt
=2E..
> >=20
> > -	dev_dbg(atr->dev, "chan%u: client 0x%02x mapped at alias 0x%02x (%s)
\n",
> > -		chan->chan_id, client->addr, alias, client->name);
> > +	dev_dbg(atr->dev, "chan%u: addr 0x%02x mapped at alias 0x%02x\n",
> > +		chan->chan_id, addr, alias);
>=20
> This, and the dev_dbg() below, sound a bit odd to my ear. But I'm not
> sure what would be a good print... "added alias 0x12 for address 0x34"?

Maybe "assigned address 0x34 to alias 0x12"? Since the alias doesn't really=
 go=20
anywhere, we just assign different downstream addresses to it.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart4977285.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmd+fiQACgkQ3R9U/FLj
287kzhAAmx9rt3wn5w/RFRgHFY4GuprPGlHlzS4A/sIiGl08K3sd/NTa8HFad5Hw
ZOTjBx2jYIAP6okEaYXNR1Jc2rMXqtVIFy+juU/Q6JdZPv9AKD8oQaX35bT2i5cH
qgYVy/1B0f7Dx8r0SPrYIlHXftZxfcAwQguiO3vVuJKIEBYHNfCPrIIS++IY+D4E
/JaOeymz0wiagnz8rZcSo5EdVKS6YFsbWp89CQrma/lrR7oe7ljV4l6Y37PuaDjv
tZyQo21tDJ5fkzuUDXi69VHd4ZdhsAnToY4lZrN6/vl/Lft62UoI1PZ2M3ATpopr
X/9REUhDPQszy16pOrPbakeCZT4wATrCpHyAKZSDaDofj0eR0FlNy6urTW2PqVUn
fshpFdWw7+/a3zgchq/w1nUeijYTe9GShrRKQyH6MLl1DUVgSz5VHkePl8v+Rpjh
Xy5ZKWgXN48CE7bCsDkfTB+6rWkj2N9p7W5DSQ68o8LkD/d2kGrzTcuo1F4RY0mj
X7fIAK45gHxCUVCxbWXxlYdVvH70yQUvQu+ll8ZnauNVBeGE4RqvEnNjG4JD9mBU
lW9onTWytYyu8/q5vlX577aZOi/iOpYAtFoNNQ0Nevx/D6eXuTLtiRhwVzD2tMss
Wm9Q7rkksUWtWeIIO7QjNWjA/+oefM9qUyWmdGEa61sNGEh6ioI=
=yP4c
-----END PGP SIGNATURE-----

--nextPart4977285.31r3eYUQgx--




