Return-Path: <linux-i2c+bounces-8972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67009A05ECA
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 15:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0AB718880A5
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 14:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104F41FC7CC;
	Wed,  8 Jan 2025 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QSSzq61I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899081FCFE5;
	Wed,  8 Jan 2025 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346934; cv=none; b=NM4Tq5LLtYQZ+IvUIeM/ObZH6/VebukhY4rACODtefO4AlZ9eqcHTkeekj6EDisa8dcT9AzxrwEg9JKAjOxLsZDmhdeNkRMcf1B4hWv7U1sfff8SANUUK7EQM940xXIlqLNiJ/o66CGPIslYZwrXEuuU25OCJ8Kza9TrZ1NALz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346934; c=relaxed/simple;
	bh=1Vcd3m5CeikLybOKNrCxgdhM/0s/YGKHXucTnN2vmZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AP9XZZ3QA7LBpCzWizQ/gW4SogzIrwlBBJvh+q5EjJntX6W/BrE7MGlqr3IfrWW8g6xKYYjgUeOdS1/0jmja9tR69MbuokpleQP9ockiRAMIGYON44XItm/DHua8Ky/WIwxQAtVd0bCW3fDGwXzYh0/msYXN10zjBkWrtyVQKnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QSSzq61I; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 911011BF20A;
	Wed,  8 Jan 2025 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736346929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=trpeX/yrgvrx494dZDc3rwrb5PajAOKim9AmZ1tZ+lA=;
	b=QSSzq61Itkc1oOkrfZwMJKrQ6ZFbMI9AcPaR0XBBVP7ZR1zJhjcgLaTXcgaLikFc3BVl85
	FKrxPuLrGjehuO6N5WeuuSY+K+A7vZ73jP2hyAc1SRM1TAj26cNF3d83+LqtGhaKSi9uRj
	5a4QAjEeYhqtKKSEqFP4BDnypEtXKlZe1udJkniN7BoTejJIUYZDuYKHzN3eujKSqPusWk
	2Ynu1kzc1e+JunbINDJX0oYqffMcivRIZmyqz+Fla1eY2fCsWQ9lRHHRWmlMqgWaw32FnY
	Sy9+fElj5FClUsirb0TYouOIctDMd6uxAuAUVg7xb+BV/NgC8v5kehh05lA17w==
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
Date: Wed, 08 Jan 2025 15:35:28 +0100
Message-ID: <2292785.iZASKD2KPV@fw-rgant>
In-Reply-To: <0281025b-983a-42ab-90d3-3de845944de4@ideasonboard.com>
References:
 <20241230-fpc202-v4-0-761b297dc697@bootlin.com> <6115974.lOV4Wx5bFT@fw-rgant>
 <0281025b-983a-42ab-90d3-3de845944de4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1988756.PYKUYFuaPT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart1988756.PYKUYFuaPT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 08 Jan 2025 15:35:28 +0100
Message-ID: <2292785.iZASKD2KPV@fw-rgant>
In-Reply-To: <0281025b-983a-42ab-90d3-3de845944de4@ideasonboard.com>
MIME-Version: 1.0

Hi,

On mercredi 8 janvier 2025 14:38:11 heure normale d=E2=80=99Europe centrale=
 Tomi=20
Valkeinen wrote:
> Hi,
>=20
> On 08/01/2025 15:31, Romain Gantois wrote:
> > Hi,
> >=20
> > On lundi 6 janvier 2025 10:51:20 heure normale d=E2=80=99Europe central=
e Tomi
> >=20
> > Valkeinen wrote:
> >> Hi,
> >>=20
> >> On 30/12/2024 15:22, Romain Gantois wrote:
> >>> The I2C Address Translator (ATR) module defines mappings from i2c_cli=
ent
> >>> structs to aliases. However, only the physical address of each
> >>> i2c_client
> >=20
> > ...
> >=20
> >>> -	dev_dbg(atr->dev, "chan%u: client 0x%02x mapped at alias 0x%02x (%s)
> >=20
> > \n",
> >=20
> >>> -		chan->chan_id, client->addr, alias, client->name);
> >>> +	dev_dbg(atr->dev, "chan%u: addr 0x%02x mapped at alias 0x%02x\n",
> >>> +		chan->chan_id, addr, alias);
> >>=20
> >> This, and the dev_dbg() below, sound a bit odd to my ear. But I'm not
> >> sure what would be a good print... "added alias 0x12 for address 0x34"?
> >=20
> > Maybe "assigned address 0x34 to alias 0x12"? Since the alias doesn't
> > really go anywhere, we just assign different downstream addresses to it.
>=20
> I guess it's how you look at this =3D). I like to think it (in this
> order): alias -> address, as it's basically a mapping. So a debug print
> that prints the alias first and address second feels more natural.
> "using alias 0x12 for address 0x34"?

This seems like a valid view as well. Since you're the ATR maintainer I'll =
go=20
with your suggestion.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart1988756.PYKUYFuaPT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmd+jTAACgkQ3R9U/FLj
285usw//Qd4pYBDL9wAILta7WOsX1FQ43pSO2+H1a85+OJH0dWd2pFOArEifUDnB
VY+UIhmN5nyWFNG8I+ULDma9wXzGmQASm71ezBHPnezL53FeZYJMcmtHSAntkiy8
T7ddbYtZaIeuMSdhyb3kXPumT2rVB0WpROo8dD2yU9YCRvrC1NDACoGAU9S45XSN
B2gb8TpDDFIJnCExt03BQuWBHbPoWG48XisJUUnwcimF/rhTKG3Uonhzbk6UU3zn
0mBA0Cno2iZ8q95/eM1mTKDilrP/UkrWUi4CfwVdmRhEzHyrbrlxM2rjD+Ru6iQj
Smmw+rFLdbRU8xz7RRkG9DSJIBYtwaLRNsHe3WJvtmwvUWiEeXs55fcuIma1qPR8
kEhaTZTiW2H4kuqlrtOrLHtTzkFE6iwpeOAaQnDbDRPVc7eJjEb6k5GLegCWKC9G
xIFF83LpQ/mR/GpAhH/RSCNxY6mmKsgHKU/BEYvJSSr5kuTzewhp/1c56eAYRMPf
Egeutv1p4PgLkVQe2r6mlUtxokSkzYhbI4cpFyfxOdlq1YosACb3mLfJTTrxYvBs
8JDlkT3GtmgFvLxYcEXkNy+kVEPf+BpNA2m1qyZZhi9pbUc82/d+skI/gvLjDr0c
Qp8mh+68O7NtSjEoT9fRJFM087bRHDEOL6SKnroCdV9Y/j/KBOs=
=nOA3
-----END PGP SIGNATURE-----

--nextPart1988756.PYKUYFuaPT--




