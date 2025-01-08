Return-Path: <linux-i2c+bounces-8971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EC7A05DA3
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 14:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5AA7167C12
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 13:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F061FCFF6;
	Wed,  8 Jan 2025 13:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j101E+6h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795BF1FCF47;
	Wed,  8 Jan 2025 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344420; cv=none; b=VF5PD8JjNjgl8l716opuluwJ2q/wxSGb/zEM9xuTMFFIB1G9/q/4UpVYEvVqlVP+XjbWz0C/kKr7+7r93MFDK/JJ9fIwWHt7y5HbtKLGdBZksYF+dfzi6MO/JZJYK24Ks1r1Hg4nBxmwlH0obA+7YLHfz1p8ymPyShz0ELar+c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344420; c=relaxed/simple;
	bh=uct8ngrtAYFwmaDlO5TtIfQDb3EXImPieYEtv+ChXJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uLo4dvOkclt/1fcC5yvokH/uobJa85NAwIhBSrI+173/HxAU5O1CNVmi+d5hogsUPDKY0zfQW6HuyQaMlK8O9BWU0kvwizdDrJUYmnvb282KfbT2AiBizjYbyCuubo2ZUU2P8TcsBtxR2xrjotTvCtR4yoNCprQcfd/zRrQvfv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j101E+6h; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DB021C0006;
	Wed,  8 Jan 2025 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736344415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+3Kh9FOtNOABfkcFw/vRG/uViQsqV0K16PlRC2zuhdE=;
	b=j101E+6hfpDaOII7o8qnF6mR1fc7olv4PQ6l0r0/K6hxVDwAXRJu4o7lBS/fH4Y3cH2GS1
	ejsRWmHcz2BXVgAP8n1uyWattPKWJ09TclfPYz0NOGEqJAvryaw8cxrGVewo47ZuKPwKlb
	whPuWO7FSJQODopUA/rsRkwRdhjXOMQ8rshHdpGPHaDhv6s7pKnkM7WYtRYl1W66jo7A/H
	pTu/pEEF7f434jPbQ8TnW7SVwLpzGoFOLnhxQh9jkwMlfPf4A4+qJlpczuuiNRr0MfOZvi
	NIf/EyfHghbGLZPGXb6AAH4H/r/h1JEX7jQZBkxdPZuWppAA6WuU0SqSWhLyDg==
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
Date: Wed, 08 Jan 2025 14:50:13 +0100
Message-ID: <2351676.ElGaqSPkdT@fw-rgant>
In-Reply-To: <54985f33-a15a-4d9e-89ff-8999802e3a35@ideasonboard.com>
References:
 <20241230-fpc202-v4-0-761b297dc697@bootlin.com> <2762571.mvXUDI8C0e@fw-rgant>
 <54985f33-a15a-4d9e-89ff-8999802e3a35@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4948939.GXAFRqVoOG";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart4948939.GXAFRqVoOG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 08 Jan 2025 14:50:13 +0100
Message-ID: <2351676.ElGaqSPkdT@fw-rgant>
In-Reply-To: <54985f33-a15a-4d9e-89ff-8999802e3a35@ideasonboard.com>
MIME-Version: 1.0

On mercredi 8 janvier 2025 14:32:54 heure normale d=E2=80=99Europe centrale=
 Tomi=20
Valkeinen wrote:
> Hi,
>=20
> On 08/01/2025 15:27, Romain Gantois wrote:
> > Hi Tomi,
> >=20
> > On lundi 6 janvier 2025 10:34:10 heure normale d=E2=80=99Europe central=
e Tomi
> >=20
> > Valkeinen wrote:
> >> Hi,
> >=20
> >> On 30/12/2024 15:22, Romain Gantois wrote:
> > ...
> >=20
> >>> @@ -1031,17 +1031,17 @@ static int ub960_atr_attach_client(struct
> >>> i2c_atr
> >>> *atr, u32 chan_id,>
> >>>=20
> >>>    	struct device *dev =3D &priv->client->dev;
> >>>    	unsigned int reg_idx;
> >>>=20
> >>> -	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients);
> >>> reg_idx++) { -		if (!rxport->aliased_clients[reg_idx])
> >>> +	for (reg_idx =3D 0; reg_idx < UB960_MAX_PORT_ALIASES; reg_idx++) {
> >>=20
> >> Any reason to drop the use of ARRAY_SIZE()? Usually when dealing with
> >> fixed size arrays, it's nicer to use ARRAY_SIZE().
> >=20
> > No reason in particular, I just thought it was more explicit to use
> > ARRAY_SIZE but I'll keep the UB960_MAX_PORT_ALIASES since you think it's
> > nicer.
> You got that the wrong way. The driver uses ARRAY_SIZE, but you change
> it to UB960_MAX_PORT_ALIASES...

Yes indeed, I meant the opposite, I'll keep ARRAY_SIZE.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart4948939.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmd+gpUACgkQ3R9U/FLj
286cThAAoJuYYEDN1yt1QTy35tgWwGqUs77u4aQ6LzSFGn4S7zya0Ly6LwBUUwR3
e1+cg0aSI/5fNN61eAWDQQP0dGC3fS34i3E3C5AsTV+lCjUN5a6wFR0Mazf0dTkl
4Y1FiBdq7dobiATIg3j1tZFaZp7yCdUyXo2S72AOoNs3y1hG8ZNgdIrMOoJoUsky
LZjRBIFTqCfWpQUXZ8t8//ef2XFNp/CnsCd81WY7QpH9OyFDGSSLDKoJxIqcQhOJ
hgqGUgn1eHfeG7qgGcReqaSsKc2ubXjdPb90n0jrkU2oBDwSjRjyO4P95n1q8KX8
WTXFpr3ORoacVpqKZpRegw/jgDi/y796gwXML9xVIRMvBpEPrqJ1bOkHoupWXZhT
+D84JuVxCVQ7z383A4M/9DsD6lmcS74vPTqMScULr54FZZtrgLPOuCd26WFBrTN+
rq135zABgLi8u2CXD2GBWFtRfMoGfWHAtrqre21dU9HUYTy++M+lks8pH46TzX/2
M3wqf3MkIzaMsN8+wO/pnobuDACQ+A8gotYUsV0KEpfa46qPQuw91G3LxAQbA3pr
TstHTOw1IsiX5LbhAEaDUzaCFE7YNyn1OHaUDjo+MekzIz1pQtiTJOZKfIUF39Og
VaArH0UHHwyK+elwx59F/cw/OwJV3kxljW9kG3jsg3xYGCEcw5M=
=nweI
-----END PGP SIGNATURE-----

--nextPart4948939.GXAFRqVoOG--




