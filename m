Return-Path: <linux-i2c+bounces-5811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EAD95F4C2
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 17:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EBFCB20B20
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 15:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E07192599;
	Mon, 26 Aug 2024 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HNNmcxJc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46476191473
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684999; cv=none; b=irpwRK/pG1zfmFT6mop8JFJv5vNrQJH76hq707FT6g9S4jEf4cCtT9HhF7D6EMunHuMuKD1b43ylfonpYbI+mKMmedznBMX6oDO46ILs+QOR+Vt59fX+Fh7jGuai4dqyShZQ+o9vzWGf3mN0SpLl8KXKm7KQMnlqHpaCt1Jv2Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684999; c=relaxed/simple;
	bh=LcBlyqEJ4uIiIBUb6IZaPBefZMuuz6RuqjCbpXq+8Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYwqkUY5ZyLzDHYzHPAieaIhtaAUrtHOVs5SR20+e8iA566hSj8XVTYmuwfhFRjIH1tE41oDGP0szPZC4axGFOEgePp+5wCGvUenupwnLBuVQ3Fay+mYlWOUOK7qlb+TlJd3JfMeixwv2PSPsbdNXYcrXMLNuyl/FSv2FlnYmsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HNNmcxJc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+3Bk
	u/3QClAYt7+EUP4nIqlC/pgrGSQqTSgXrx4VpRI=; b=HNNmcxJcW+dKCjtVd+FI
	ACmtjFrqP933JUiWnLswcsqrn8defUU1vLm7Cjo522qyMr3v7YTfj26X1otCo0cy
	terFtO8tD+ChfPMJFUkdY8M613XcC4jfT7LliwWB+Yy+IIvzVgz7yCd3htRsL9nG
	YmaWjwtjfA1GdaFg1hwAIlpOByH6KqM6TgFFP/kCs5UUl21ZjiBKLZ1yYmpar8eU
	kzYXXVvJWoCoN168KUEgyEQwFMOriQ3TjX5JqxbHHIZOZJS95Q4H2ZwQ3wJndXyP
	UuXoo6M+CBbEAk7EAEKJdClD2QtUMiiYaRfWZV7TNsfjMM+SGEleov+hvbWI80bU
	Tg==
Received: (qmail 2032822 invoked from network); 26 Aug 2024 17:09:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 17:09:55 +0200
X-UD-Smtp-Session: l3s3148p1@4192hJcgvLUgAwDPXwdRANgvu6DX4+2c
Date: Mon, 26 Aug 2024 17:09:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] i2c: rcar: support named interrupts
Message-ID: <Zsyawm4CcfYb9Sls@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240826150840.25497-4-wsa+renesas@sang-engineering.com>
 <20240826150840.25497-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jAEO766LsXOem/JA"
Content-Disposition: inline
In-Reply-To: <20240826150840.25497-6-wsa+renesas@sang-engineering.com>


--jAEO766LsXOem/JA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 05:08:43PM +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-rcar.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 1104aafe4433..1a232bc88bed 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1192,10 +1192,13 @@ static int rcar_i2c_probe(struct platform_device =
*pdev)
>  			goto out_pm_put;
>  	}
> =20
> -	ret =3D platform_get_irq(pdev, 0);
> -	if (ret < 0)
> -		goto out_pm_put;
> -	priv->irq =3D ret;
> +	priv->irq =3D platform_get_irq_byname_optional(pdev, "main");
> +	if (priv->irq < 0) {
> +		priv->irq =3D platform_get_irq(pdev, 0);
> +		if (priv->irq < 0)
> +			goto out_pm_put;

'ret' should be set here, of course! Will fix when resending this
series.

> +	}
> +
>  	ret =3D devm_request_irq(dev, priv->irq, irqhandler, irqflags, dev_name=
(dev), priv);
>  	if (ret < 0) {
>  		dev_err(dev, "cannot get irq %d\n", priv->irq);
> --=20
> 2.43.0
>=20

--jAEO766LsXOem/JA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbMmr4ACgkQFA3kzBSg
KbaYIQ//Su7pyJwTwuNFnuY3cceSERF/eqN5RnERUai6KpJ6Z942cRrF56nVmqbQ
H0icGIZ5zHMdZsfAAGuzcb6U1F3Kmf7A7Z3VqyZL9s2grjxxjfDNPvratKcnBC2X
8xoBFjaoLyKzYMZLVg27DnYrgB3mznd9hzK3e/jWatciD/e49DW5JDsa0HcyXSEN
Qj2O20e5zdy9EckuvVpUyvs7FIHoKGWOMJcqjNhUsEaO1UcpqZNXkDjEaFamgXJq
C2frcVNpQs0z1gxBnpwvTNJZThkgUquyhQwPPNeuE0t9tMiBAENeNM/OSV56QyuY
W+aRaqK87QlmR1AQiGuBP2Y/4UMuHLqI6U7LlxLYXUYG6p3fzJ0iyKqYzBdWoHEJ
3fsKHi8idUVSofHsUzcRaL0NAS9mSoXfyTytHqT6UnIYQfkiX9d1uucRS8pnra6q
RC8zCk0qitbDiLAtS90vU/6CWMoSN1gaSoIuPr8KqsxD/WQ++iBGrSP5jOfs7VBe
2dzpBk4o+b2KSnvBqPleMgHM0jLL5w5QJAPegJgvxQ2mRWwIq9+6OlTu3xPijyEE
bP1Gz6X0LYe6s7Lw2jFQKiUkdcGcBKd1YaxIfWhP1r4gzeuMu586RKroWoVPaR0W
AQLZPnnAye/W3n/lmhcgMH+ta00qgDHHgu45gs1+jE63m9kXoms=
=14i6
-----END PGP SIGNATURE-----

--jAEO766LsXOem/JA--

