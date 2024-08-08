Return-Path: <linux-i2c+bounces-5221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7035794C0BD
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 17:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A18571C220B6
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 15:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC8C18F2C1;
	Thu,  8 Aug 2024 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cS4lizkf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8A918CC1F
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130112; cv=none; b=TMk+9H4zekkcjcoljJWrMxCbt2P1ZfpmRgyam14bg4xFh5arVaynX9r+7/TwOVd2rGK/VCGG/Z80Cc/XpINrk9H82z0lyVQmt5B6SLM5pPC3Ef+HUo8qHAZFvkMvSUt+KDY9wYeXxe0DUmtI4jS68dNrF8lqSLi55xXyFrNTUrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130112; c=relaxed/simple;
	bh=o7SmzSxpbblcPkXZek08dunjTx38MkQ++I3Heodj1Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToMgiJjRWqlLgkKxrD7RhAGQ6cEPA0v3hUvjWBypZHfm+tDklFSYCyxwj0B9YaErW9YqbbnaqwoPFYWCVrrfo/CTkSlZogluN12zYIjMET2CCtshtLU9GCuCdXv6i34+5zWd+Hkjvx4c0Wf11XKCSr3Xi3ruTIphlpXJVIf5TTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cS4lizkf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hD3E
	ybRmbdszWR+1bsev5jge2unZIgrR46iiu3qRQH4=; b=cS4lizkfbZRsJUVr2pLC
	B/Nsj8Jdhl93uIpiawRLBwnGNldIsbpdfiitrMuKh0bSosh3CVfybBjPF0rD6ytn
	9qMowQj8wekCJUTMMfGWelzNboXb6/VyDhKFrni3PqBh9Yj05J1Mbr4ZhKrSu2S0
	k4O1PoCWG51lB1GmOpHe1g/szqKPP3knMrOVQ1olyIi5mCb1GNxcLEzowuwUnD0d
	wWyFE7D/v2Yy1DLXdWjOvo0vlaU5aEKfC6zuvicPbrHF8z4snDYQTgbbeChm3VuQ
	FoIJ8YYCe4gDKsNkW21N1kPEc45TWvHYF0V527XIl2WjF58LHZ8LBerJwA5wH3Vd
	+w==
Received: (qmail 353249 invoked from network); 8 Aug 2024 17:15:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Aug 2024 17:15:08 +0200
X-UD-Smtp-Session: l3s3148p1@g+H7fS0f/mNtKPBr
Date: Thu, 8 Aug 2024 17:15:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 05/11] i2c: riic: Add suspend/resume support
Message-ID: <ZrTg-_Tzmu6whv_W@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-6-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KFRkbgohFrXfxXXm"
Content-Disposition: inline
In-Reply-To: <20240711115207.2843133-6-claudiu.beznea.uj@bp.renesas.com>


--KFRkbgohFrXfxXXm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 02:52:01PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add suspend/resume support for the RIIC driver. This is necessary for the
> Renesas RZ/G3S SoC which support suspend to deep sleep state where power
> to most of the SoC components is turned off. As a result the I2C controll=
er
> needs to be reconfigured after suspend/resume. For this, the reset line
> was stored in the driver private data structure as well as i2c timings.
> The reset line and I2C timings are necessary to re-initialize the
> controller after resume.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

? Doesn't apply on top of the previous patches for me?

> +static int riic_i2c_resume(struct device *dev)
> +{
> +	struct riic_dev *riic =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D reset_control_deassert(riic->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D riic_init_hw(riic);
> +	if (ret) {
> +		reset_control_assert(riic->rstc);

Is this assertion really needed? It is not done when init_hw fails in
probe().


--KFRkbgohFrXfxXXm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma04PsACgkQFA3kzBSg
KbZrCxAArVOkJfnwVBG5lNzbLnAWmEo/9gunHcrfFzzdSDu7y0bwgvF69lTBqAXb
ZJ7siPXjbglOBpCNtt0fIoKetPbT242YZszRJfl9Qk8jKZeUDO8W1v6egmo7BGz9
irlyuY3PaUxYLPrdNuS3OIO2jZjAHrqOKZLe3nAOuUxRl5A4Ca2xkiMR7hY77Zyc
6Xsi8DsAH5HESNjFB8tFE19wCpkLtK+hZqE9ke0e8ch+9t27G02GJl2vOapGYdcp
yV6AMCmNmQhcTtMTaK76iypBkRwEB3TPT+rwplpjnbq2uEpiaYuuvPyW7aFJ562D
DymAcUvU9ra71pIswFG7FlqDokTSQLTOm4xdd4ZsSotQYzg2znK8KYiJQB7TpMSB
c+XcMGA7tM4UL3w5LzcY24wUsaXegJQtd+mSYq38SblIfzwsZyfitSokf5dVUEU3
5rvrZ+vxoWhASutLTsanPgLmdWR6kuwPQRme1uc4fOs8YqkAkhugcoZJSYvkrODD
2Le/xm43wMJfpVoIHf74NgLCWMrGfyaDz+f/Jh2KQKxnAJVTWauiDpoZRJ/noS2T
yXObEsknH5dY4cWIJEvpBIT+RjfzF0GBLO3UaO7Lud+2zC0eTuI/D7aQCHWk5ygl
lyXxVyvDL1Q3qWLAC3Hnw+1qchOY9lYu2fni1dUB7D0L2fKjJws=
=Z8hg
-----END PGP SIGNATURE-----

--KFRkbgohFrXfxXXm--

