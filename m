Return-Path: <linux-i2c+bounces-12102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF0B17B1F
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 04:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC07A169987
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 02:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A83914AD2D;
	Fri,  1 Aug 2025 02:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RmJ5JaV4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C5A5B21A
	for <linux-i2c@vger.kernel.org>; Fri,  1 Aug 2025 02:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754014459; cv=none; b=pHR1mXwhUj0JvPW6mu2ss/gnvl9bLypSgvf4df+vf66lnw9yJOhsBf4zVz0Xu65vW91Z4ahT4isSIRCR9vWoC8aDjHXeihigIFW+PkmKfahs2WnKEYxLcV2UifZ0hOuKrxeQW2Pb12AGqKqBoKyZaMTOVxAmRAIGc3qHAqyGWFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754014459; c=relaxed/simple;
	bh=dGdzesUjLFEVzlQbZipjk40EVtyj/CBR1JgeHdoE1xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaUq298oo3QynEUvjx730ayWyGH+TTlJ3Dy+csva0Egz9aS1cNJ9QuUEVKSU+XZPj+Rc8movMTOAqaeyuEo/yRBPwzgUwA90UP0oQYlmueVCNVEJOv/Is7k1aixGy3v3nVQVh/O4X/1pJKvVhjtCxXTnDTbpnU0wdP+tL6+gYrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RmJ5JaV4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9Lgo
	ZWBHB5DU+NfJH/hzoVfR/ri0ZYwSy5XsBwi6rUs=; b=RmJ5JaV4papSEg8CETVA
	KWwkFcLIvf7E7ZnqYA0JBHqnradOBVmrGovX5YGcYY90Gttgdg6NfK9vOYicd8lE
	bQk68gXPKsXplAOM2dG3mIiov5/j8Q9ip32jRB6M9TUDlnzSNLqdAreRmBOcCTDQ
	p/8EATR1DSKnSXqZC0KKqs7chcU5hGxM4vPzH6Ji9d2Lg4j6AB3wkB/n57To7l7a
	/NxxOAEackZvxNK7cwa5TEKQwpfUwpQhLgeuy9k0MpD3ciWtf1uBtIJkNBSUJmqp
	TmEJv222OXJg39pMLPgLCIC5lWwKjHqjjgCUVY7QphDUHc2XoMVgsAQGDR+44LVM
	Dw==
Received: (qmail 573495 invoked from network); 1 Aug 2025 04:14:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2025 04:14:13 +0200
X-UD-Smtp-Session: l3s3148p1@fOFuUEQ7Tt8ujnum
Date: Fri, 1 Aug 2025 04:14:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Wojciech Siudy <wojciech.siudy@nokia.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	peda@axentia.se, andi.shyti@kernel.org, mariusz.madej@nokia.com
Subject: Re: [PATCH v6 RESEND 2/2] i2c: muxes: pca954x: Reset if (de)select
 fails
Message-ID: <aIwi9finiCDE4H0F@ninjato>
References: <20250603124721.449739-1-wojciech.siudy@nokia.com>
 <20250603124721.449739-3-wojciech.siudy@nokia.com>
 <aIdTSrxDFSt98Tjl@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I+zIa8JerNr8QgU1"
Content-Disposition: inline
In-Reply-To: <aIdTSrxDFSt98Tjl@shikoro>


--I+zIa8JerNr8QgU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +static void pca954x_reset_mux(struct pca954x *data)
> > +{
> > +	dev_warn(&data->client->dev, "resetting the device\n");
>=20
> To me, this is not the proper place for such a report. Can't the reset
> framework be instrumented in some way?

I removed it.

>=20
> > +	pca954x_reset_assert(data);
> > +	udelay(1);
> > +	pca954x_reset_deassert(data);
> > +}
> > +
> >  static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
> >  {
> >  	struct pca954x *data =3D i2c_mux_priv(muxc);
> > @@ -328,6 +348,8 @@ static int pca954x_select_chan(struct i2c_mux_core =
*muxc, u32 chan)
> >  		ret =3D pca954x_reg_write(muxc->parent, client, regval);
> >  		data->last_chan =3D ret < 0 ? 0 : regval;
> >  	}
> > +	if (ret =3D=3D -ETIMEDOUT && (data->reset_cont))
>=20
> Braces around 'data...' not needed. Use '--strict' with checkpatch to
> get notified.

Fixed this, too.

> > -		return pca954x_reg_write(muxc->parent, client,
> > +		ret =3D pca954x_reg_write(muxc->parent, client,
> >  					 data->last_chan);
>=20
> Indentation of the above line needs to be adapted.

Ditto.

Applied to for-next, thanks!


--I+zIa8JerNr8QgU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiMIvUACgkQFA3kzBSg
KbYBIA/+MQS8GhYD1B2rl37wfc0qNp+8svv5KAVYLmYwNhTYYSxyXyONcwBe/mtX
yiX+wWR2nmGAROzoMXidFEGrSk4JliRbJ1O3OzVXPbjbuhoe7MbKue8sLiNuH0EM
FIvNZ1pDLBqY/0mjRyo0DJ6dyF4XP3sau3y2xbIC69oQbGWn+SWgGETg5HF0HWqU
XNMhlOe/YMWWGmZNrFaBrdaRQXdGVY06A8843X0blnVgtT7q6LhUC44DSu0O569z
W/COymdf2bbRp8M47lD1DpqwidEO8TL3mrgvmst0ItRKbbwmJ/boUShEFjzA25NR
JhLGo7XnB2wSTKJEvK94X9Bw5VCroj9rrjVKiNPisuE1H8p0MlV/uoFpnWVqeRif
JAkhi+W7jERwpQ9S+vW5ZUWRp+S+2Pf1n8OTA54dcd6Yrd0XuxjoJO4yNSgNdtvw
xizjVonMiuKxvSEItWHd+c7w/kzYO3sBzQc6WLS0OEzxX5OjDubjNDyDF5I14afT
FTmOESNfQwhtUlQGIB887D6hflLdowEy5kHHlE3hNRKnVgTXASqvoOhN9zc/0Wck
4y0bWBRFcBJWl/6xhGo0ABhgIROG06YdZPaJKNzbXpbfnJfMBJYxlb7W5+0yjuT0
vcRKUzS0QlcMUbVY9JL990ZFoBWpKKtIwuBN4NznbBqCGYf4Dr4=
=rgnE
-----END PGP SIGNATURE-----

--I+zIa8JerNr8QgU1--

