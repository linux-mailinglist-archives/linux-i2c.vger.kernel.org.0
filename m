Return-Path: <linux-i2c+bounces-12055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57112B13916
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 12:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9545C174F6B
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 10:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B27C24678F;
	Mon, 28 Jul 2025 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="B3wP+Ikb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17233596E
	for <linux-i2c@vger.kernel.org>; Mon, 28 Jul 2025 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753699152; cv=none; b=JwAQQjviDDW6IovcRVttDjIGeRynCnXc0qFCeN0Y8UQtU8IbY624MGleyAHzubHGleATu4306ykDxHn7iRjPFG3RW54J44zcENIR5khVEOGpBG32f7IXjZz+pA4hRnKO4lsgrJ2YnhYJgBwMbQrWyf+eGr6GE4nvwWrilRSiL4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753699152; c=relaxed/simple;
	bh=MgkTo8UGOPorFT8Y3Ku33gPKk3ioYdMe1B7Cuz2L8Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADBN0cS1ndePBrtQlGbwOKGXzRY/amJerMG8IeVA/rp75uEI6SeOMQKdrfoWi5vfUvNlrUD+z26OjUJ1Ji+z5xUWcBYhO4EqZekVBo5KGCSzMMCYA+3nKrUpthQsngPf/r6GrMAMuAEuSsDXEVeOBOBHDGi2jF2CD7tY5CQW+Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B3wP+Ikb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OGjI
	XIpleo/Djr6BGN/SZ7nFgM0LapiEmg25CVoeFq0=; b=B3wP+Ikb3AhQ98Gi/emo
	Y7pfD/GyaNdUelBgkRkZkXlKpMX8qJ48X9LFTGV+Uwdoh8fhSVd+dtY9JgdpMfHw
	H1EEHkZ6/MkvYSQzgKIZobF1HbVx+ls5EDhHwEHxE8K7URKGYb/m2AKuEhFM15Jb
	3xWh3SlLzxJc9EkLGWSpB36Wgf/Q9C4Zg8iwDqBWVG7+xJG4wQgUmh8gEW03nqWe
	r7rQh7q7PMZhjCsLOlcalxQOdiqqOrbqT987dZThRiymzHpNjAVB2wy0JD+xQtZ/
	EKIryB1fsM71VfAbFGlpGDC5JfrfFkHTJtLW5DniBfn/QaMIi8eXKbVb4qVoJdiK
	fw==
Received: (qmail 3404769 invoked from network); 28 Jul 2025 12:39:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2025 12:39:07 +0200
X-UD-Smtp-Session: l3s3148p1@e4m45vo6+E9tKPLn
Date: Mon, 28 Jul 2025 12:39:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Wojciech Siudy <wojciech.siudy@nokia.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	peda@axentia.se, andi.shyti@kernel.org, mariusz.madej@nokia.com
Subject: Re: [PATCH v6 RESEND 2/2] i2c: muxes: pca954x: Reset if (de)select
 fails
Message-ID: <aIdTSrxDFSt98Tjl@shikoro>
References: <20250603124721.449739-1-wojciech.siudy@nokia.com>
 <20250603124721.449739-3-wojciech.siudy@nokia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="up1W3+K6AfzirLJj"
Content-Disposition: inline
In-Reply-To: <20250603124721.449739-3-wojciech.siudy@nokia.com>


--up1W3+K6AfzirLJj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for improving this driver!

> +static void pca954x_reset_mux(struct pca954x *data)
> +{
> +	dev_warn(&data->client->dev, "resetting the device\n");

To me, this is not the proper place for such a report. Can't the reset
framework be instrumented in some way?

> +	pca954x_reset_assert(data);
> +	udelay(1);
> +	pca954x_reset_deassert(data);
> +}
> +
>  static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  {
>  	struct pca954x *data =3D i2c_mux_priv(muxc);
> @@ -328,6 +348,8 @@ static int pca954x_select_chan(struct i2c_mux_core *m=
uxc, u32 chan)
>  		ret =3D pca954x_reg_write(muxc->parent, client, regval);
>  		data->last_chan =3D ret < 0 ? 0 : regval;
>  	}
> +	if (ret =3D=3D -ETIMEDOUT && (data->reset_cont))

Braces around 'data...' not needed. Use '--strict' with checkpatch to
get notified.

> +		pca954x_reset_mux(data);
> =20
>  	return ret;
>  }
> -		return pca954x_reg_write(muxc->parent, client,
> +		ret =3D pca954x_reg_write(muxc->parent, client,
>  					 data->last_chan);

Indentation of the above line needs to be adapted.

Rest looks good to me.

Happy hacking,

   Wolfram


--up1W3+K6AfzirLJj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiHU0oACgkQFA3kzBSg
KbZnkhAArKAp/z/AiVsbvJQhLaly8iRwDlWdvJwLQFD76Ap2SgjrznDQ56XOCppx
E4ogRyiBziVBGHPA10b322PnHdYCd2xY4ORV5o0UQwT4+B4fPrWg3OVWQKBCbFk0
Rb1QaCjn+4uuvGzuYoWLiMXNNeaXoZkvW9C9aO6sFOJSf3gJkI9oz6oVKGKaAR9R
TDHsAP4GZ+jfdsgjYQU3xTnuUC8HjQO7nhZZIk/Bl+mt3MKyEPWBD1CVE2VVRX3i
ABFsQ1NYLGYJykJ4XDv2UXXFFRMBYCgqi2k9iJN/BSm6yM/+2hZjbWybEvg4PWJA
d35xOVSm/UV3nFUBTCLNxEXQ3t6Gv5RVf4id1x74fjcU7LmJyKd4HNz5qI7Y/57Q
MpQzTutnZAxgbo4wYRi0t4ZLd9etLk/VLnABfuvUSeqdoeGf6TYPA8p/KRAq5nkW
B0qnBj81DKpXiHZ9vTfn1mqpcBAjpE74WL7LB6WKL2GPxdjQbhGHK7Q55SMPGjzR
6TX9J828ws9xvwTa961XhNLE5nxnXKVgIID2seIRcGvos6mJ55z9uWclP3tFURl3
uvfsJRA4d5fv0cfcORgJvkc0Ef7CqTlKGs/apXeJKFVOVemYeqTjoW1b/mb+FPMj
n3XaPqjb9gFQLDgy4wLe619Rqv+bptAHWdec+vB01rPye9YgbXw=
=cHHz
-----END PGP SIGNATURE-----

--up1W3+K6AfzirLJj--

