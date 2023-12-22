Return-Path: <linux-i2c+bounces-946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7225881C761
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00F961F24924
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 09:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BA4DF59;
	Fri, 22 Dec 2023 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X64JdxvV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFED8DF55
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 09:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB03C433C7;
	Fri, 22 Dec 2023 09:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703237913;
	bh=uN1shsmJ7NbadtE+i/zxIqdbKlVIvebXW2lxGVGmAuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X64JdxvVjUqYkMU56ASSPe9e7jX0U5qHiw/etSt0QQHbSvxJAwtMzEytf7BdPjN0o
	 Vn481ca/Dd9NbSymmA6p9+seOKXXEh5obgoaUoyGzS4cwYiHxaneRO76Q00XeEbhui
	 5joJCxMryXTH5+urnQKDw8RjnmYCdr/EsN41vjhllz/TpGl0z6H8dVMbqtCeItUObf
	 Mk5E4rP9IRZP8wjnhi6da2r+U2ztCfO7ZX706aMVCWe2xE4TVOcKi4iH7/zSYxTboa
	 ZT5r0SpteM8fNXWHDVwimd8eQkWT4yXWA0KZu0pKrSMTA41Wm+eTaVEC7mvq3GeUO/
	 9knvxfkrk3eVA==
Date: Fri, 22 Dec 2023 10:38:29 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v3 04/12] i2c: wmt: Reduce redundant: REG_CR setting
Message-ID: <ZYVZFam6zzIp++N3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
 <0fce410bbf7c3d5e01cf679fd435fa0065e55e53.1698889581.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ijRrNFhL3sECE+aR"
Content-Disposition: inline
In-Reply-To: <0fce410bbf7c3d5e01cf679fd435fa0065e55e53.1698889581.git.hanshu-oc@zhaoxin.com>


--ijRrNFhL3sECE+aR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 10:53:54AM +0800, Hans Hu wrote:
> These Settings for the same register, REG_CR,=20
> can be put together to reduce code redundancy.
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Some registers require that you first write a certain value, and only
then can write another value. Have you double checked with datasheets
that these register writes can safely be aggregated?

> ---
>  drivers/i2c/busses/i2c-wmt.c | 35 +++++++++--------------------------
>  1 file changed, 9 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
> index a44ce5fdde8a..d503e85752ea 100644
> --- a/drivers/i2c/busses/i2c-wmt.c
> +++ b/drivers/i2c/busses/i2c-wmt.c
> @@ -144,9 +144,6 @@ static int wmt_i2c_write(struct i2c_adapter *adap, st=
ruct i2c_msg *pmsg,
>  	if (!(pmsg->flags & I2C_M_NOSTART)) {
>  		val =3D readw(i2c_dev->base + REG_CR);
>  		val &=3D ~CR_TX_END;
> -		writew(val, i2c_dev->base + REG_CR);
> -
> -		val =3D readw(i2c_dev->base + REG_CR);
>  		val |=3D CR_CPU_RDY;
>  		writew(val, i2c_dev->base + REG_CR);
>  	}
> @@ -204,24 +201,15 @@ static int wmt_i2c_read(struct i2c_adapter *adap, s=
truct i2c_msg *pmsg,
>  	u32 xfer_len =3D 0;
> =20
>  	val =3D readw(i2c_dev->base + REG_CR);
> -	val &=3D ~CR_TX_END;
> -	writew(val, i2c_dev->base + REG_CR);
> +	val &=3D ~(CR_TX_END | CR_TX_NEXT_NO_ACK);
> =20
> -	val =3D readw(i2c_dev->base + REG_CR);
> -	val &=3D ~CR_TX_NEXT_NO_ACK;
> -	writew(val, i2c_dev->base + REG_CR);
> -
> -	if (!(pmsg->flags & I2C_M_NOSTART)) {
> -		val =3D readw(i2c_dev->base + REG_CR);
> +	if (!(pmsg->flags & I2C_M_NOSTART))
>  		val |=3D CR_CPU_RDY;
> -		writew(val, i2c_dev->base + REG_CR);
> -	}
> =20
> -	if (pmsg->len =3D=3D 1) {
> -		val =3D readw(i2c_dev->base + REG_CR);
> +	if (pmsg->len =3D=3D 1)
>  		val |=3D CR_TX_NEXT_NO_ACK;
> -		writew(val, i2c_dev->base + REG_CR);
> -	}
> +
> +	writew(val, i2c_dev->base + REG_CR);
> =20
>  	reinit_completion(&i2c_dev->complete);
> =20
> @@ -243,15 +231,10 @@ static int wmt_i2c_read(struct i2c_adapter *adap, s=
truct i2c_msg *pmsg,
>  		pmsg->buf[xfer_len] =3D readw(i2c_dev->base + REG_CDR) >> 8;
>  		xfer_len++;
> =20
> -		if (xfer_len =3D=3D pmsg->len - 1) {
> -			val =3D readw(i2c_dev->base + REG_CR);
> -			val |=3D (CR_TX_NEXT_NO_ACK | CR_CPU_RDY);
> -			writew(val, i2c_dev->base + REG_CR);
> -		} else {
> -			val =3D readw(i2c_dev->base + REG_CR);
> -			val |=3D CR_CPU_RDY;
> -			writew(val, i2c_dev->base + REG_CR);
> -		}
> +		val =3D readw(i2c_dev->base + REG_CR) | CR_CPU_RDY;
> +		if (xfer_len =3D=3D pmsg->len - 1)
> +			val |=3D CR_TX_NEXT_NO_ACK;
> +		writew(val, i2c_dev->base + REG_CR);
>  	}
> =20
>  	return 0;
> --=20
> 2.34.1
>=20

--ijRrNFhL3sECE+aR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFWRUACgkQFA3kzBSg
Kbb5Pw//e8dKwwHz5P9QkqNK3MEZw69PPnoCF86170EupJTqawNjoFo66oJjgYxR
e3JuRk0WbfLCOmAt4uywMmi/JRuZB6NAp4lalYbFG3WjQiRL3o3Z1cF7zJj7wxMJ
v+TwgZMoQRVQdwoZdDaNaq+SBMPBkHC9GGVL1R6SIwwA99irrrD0L3KcSXepeaFG
qzk6En17Cl92s1ed4gZvK9LiNFPC0MLLwxBaqlQAyQI1ro6zZVzEg/pRdnmn78eC
S+K8For10skK6ysGgu2nkqsE0lMA7hVqR1Hr0xjcD/1AJ+AwOsjWjpYVrPithv7I
6ncmDu+BVSGtc6De8D2Fy4NPw5yuZ4Q+p4/gh3ahDKlykrSwvgIns81CnG0+MmXm
h9BnhxXSICv6zeTVdwwhlY/4D1rEcT+ojCG+wJ6kBp+gwedAgZexPljqFkuQiN6j
ls7g4BPfSnoIdgcWuJSmHaG/HCjI3MfZ34pyipKsOVx5rDzLpy+Cuj9ISWifJAOS
/6j4TL1nPXSq4AD6eu9+YbLpFrIQv8fAxThLOKWLHPzQvbWnARJmZl8YReeAKUCq
0GTbYz72gJ4Awt2+8kAakXfFjty+Y+4HdFsu1fIMUB6vB8vVWXovWo4UMIgWwZSN
hGhxSag/OS/CBh7rkhmYAkukX3g5p4p0+dmwJlguRTFBb+ETU0g=
=9bVS
-----END PGP SIGNATURE-----

--ijRrNFhL3sECE+aR--

