Return-Path: <linux-i2c+bounces-4659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 648DC9283AF
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 10:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DDF9B2216D
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 08:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815DC13A89C;
	Fri,  5 Jul 2024 08:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtoBmJAg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411562BCF6
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jul 2024 08:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720168243; cv=none; b=HlWh4VbvCEP52Ha4nGhrGCUdlZ8c2EKZ6N2R5nSiwioyQCPxyqNcYgOHkWEljT93BV/khsW0b9ydkkO41zYU9WYAGeHK1WDGXF6M2RMySzJ2iERCGGJvQoq9U104wFWwiByJQNsMvKeIVxW57L52KwMHgaOaWhhWHZlUNXoF+kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720168243; c=relaxed/simple;
	bh=9hcUZs/A+MJEANUcuyHjoQ2lOAGFVvVsvuftLkazFuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDlzx6NjzSH5n2KrZQzNwqvVriCVbVdO9tSGoRFxb6PVxbP4Iex/SnpgfU2b1CdwLC8msipAlzXsoVHTUhTCEWLq4Rh1b7kJCzYJEvv8cYKJFzCnjVTplaToFw6ozbzOmiUO37EEfdRxIsOCUqNyPDS6PmstTcGEYlXCkC4Rwx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtoBmJAg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FA6C116B1;
	Fri,  5 Jul 2024 08:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720168242;
	bh=9hcUZs/A+MJEANUcuyHjoQ2lOAGFVvVsvuftLkazFuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtoBmJAgZle8hB/hOKsIGYYoOP97hqjfxkLz+qZjM76ygraVyo/3qJQqPasr+PaGS
	 vTSiJIUl6/SmV35RD0qK2MwVnCMA43p8kHwjJyYZUhATcSgaWYFE6cOMwBAVtk7Dmt
	 WbJL1/B2YUakB5jtSjf7TwO1/HNr2IQreb3zDYexqc+qyTPpJxfaFll5WZViRBtPk5
	 6Znte+ZGGzWO5gWWAFT9aGpWspvFk1S6RRSI9z86OlAU2fSr4+JG4tFarSuNFZQ24i
	 hwfbb1OfWYTw8LZY4yW9jpprrlOo7bsXRz4ljVr1qVWkZ0aHxkvrI4vc2YsrkFN5Oy
	 fRf0s6ho6fO9w==
Date: Fri, 5 Jul 2024 10:30:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i2c@vger.kernel.org, sr@denx.de, andi.shyti@kernel.org,
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	upstream@airoha.com, benjamin.larsson@genexis.eu
Subject: Re: [PATCH 2/2] i2c: mt7621: make device_reset optional
Message-ID: <ZoevL9XaIWn2AvFm@lore-desk>
References: <cover.1720130844.git.lorenzo@kernel.org>
 <3ea697be239c450cbc622f3e2e9dff8bf17515c0.1720130844.git.lorenzo@kernel.org>
 <b402896c-6b91-4973-9e4f-8d1f7128afdc@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qWGuLQzavc0AqsjT"
Content-Disposition: inline
In-Reply-To: <b402896c-6b91-4973-9e4f-8d1f7128afdc@collabora.com>


--qWGuLQzavc0AqsjT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 05/07/24 00:16, Lorenzo Bianconi ha scritto:
> > Rely on device_reset_optional() instead of device_reset() in
> > mtk_i2c_reset routine since Airoha EN7581 reset controller does not
> > implement the reset callback and device reset is not mandatory on this
>=20
> Not mandatory means that the reset line for I2C exists, but you don't want
> to use it? If so, that's not right.

ack, it was not so clear, sorry for that. What I mean with "not mandatory" =
is
the mt7621 i2c controller works on EN7581 SoC even w/o this reset configura=
tion.

>=20
> On the other hand, if there is an issue with using that reset line and you
> want to avoid using it for a good reason, please describe it into the com=
mit
> description and - in that case, you'll have to add a EN7581 compatible and
> code to avoid calling device_reset() on that SoC.

what I mean is device_reset() will call .reset() callback of reset APIs. EN=
7581
reset driver does not implemetn this callback, just .assert() and .deassert=
()
(I think the hw does not support the reset line automatic re-arm) so the ca=
ll to
device_reset() will always fails. Maybe a possible approach would be adding
in the reset driver something like:

en7581_reset() {
    en7581_assert();
    msleep(x);
    en7581_deassert();
    msleep(x);
}

What do you think? It seems a bit hacky to me and I am not sure what would =
be the
right delay in this case.

Regards,
Lorenzo

>=20
> What you're doing here is removing an error log on SoCs that do *need* th=
at
> reset line to be in place, so, hiding a problem that could be causing oth=
er
> issues on peripherals connected to the I2C bus of those other SoCs.
>=20
> Cheers,
> Angelo
>=20
> > SoC. This will remove the following log:
> >=20
> > i2c-mt7621 1fbf8000.i2c0: I2C reset failed!
> >=20
> > Tested-by: Ray Liu <ray.liu@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   drivers/i2c/busses/i2c-mt7621.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-m=
t7621.c
> > index 81d46169bc1f..8cd89a2f59df 100644
> > --- a/drivers/i2c/busses/i2c-mt7621.c
> > +++ b/drivers/i2c/busses/i2c-mt7621.c
> > @@ -85,7 +85,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
> >   {
> >   	int ret;
> > -	ret =3D device_reset(i2c->adap.dev.parent);
> > +	ret =3D device_reset_optional(i2c->adap.dev.parent);
> >   	if (ret)
> >   		dev_err(i2c->dev, "I2C reset failed!\n");
>=20
>=20

--qWGuLQzavc0AqsjT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZoevLwAKCRA6cBh0uS2t
rFLKAPoCcGjfQ2AxTtEEvP+EYpVE0hRg/zDrFjdXREan8uuMTgD/UCpZqMHpwHLg
KjnmRGoc2Y1UOrlEbDiGtHzrLQY2yAA=
=xgRt
-----END PGP SIGNATURE-----

--qWGuLQzavc0AqsjT--

