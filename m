Return-Path: <linux-i2c+bounces-3486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 347548C48B4
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 23:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 668591C22C8F
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 21:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33510824AB;
	Mon, 13 May 2024 21:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eOZC+0n2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D8F1DA24;
	Mon, 13 May 2024 21:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715635074; cv=none; b=dY2bN1MH1rCQShPrgBicMtotVL/RDVLbrjnIyIG3kEhzGXIHLxf+dUHOF1QtwfwbL16QIoEzp2N/9+5m67//Uq6JePfg5gqvqcfrKswoTUDuyKudg1Qq9HXdAFUsFkmnb99h7l4ENCqglNqYUL6Oa3fgd50czZ2EHKHQD1V+5us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715635074; c=relaxed/simple;
	bh=oVVqK6WHIpXVbA0szVeaQq7lxDJEoXs14Hylmrigps8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fpz8jLO0rs9XvYC2OMi/YaCAt4QGlC58RL4XUFwf+cQ4YywwwmWxDf8IJdQfF5k6mQQpw91ussaNiIecrsn2WYgP/kmQo26YglkLl3mZma7iXc1dE2lw0LjqvGSJFtjVt3Dn1siiltSSTptmjVxTDu4EPJWRB6r+2FIyjt7Up4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eOZC+0n2; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715635069;
	bh=oVVqK6WHIpXVbA0szVeaQq7lxDJEoXs14Hylmrigps8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOZC+0n2SxqqByuyaY0QwKt38XxWtbh9Eqrpv9NK5DJXuH+BvpK4/0Rw9OFhyEnh5
	 I6vbbaHkV2daizLT8qTHGbpGOLqa4GKuoquexIDN8p23PKnAVLHx+TtpPSUNtc6ERG
	 Li96MpJ5wbLSHPEgGe+8YhIxSVu+Z3e8yxGhq4oV8e8J2TVcIgX7I8y5MPyMGAHxnf
	 k33zT/GeeOrCN+XR8u7ezJHK5eKktbZJPJZSix5GkNO38VA5wWBhSZq0d+9/vHNySj
	 ZWJqSSz3Rz8mj9p/mrPBYGcw/zYJIlyeX2WIRxOfnr5WHN1UR9qPadqiz7fvvQNR1E
	 fYNLpAJm477NA==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 02B7237820D0;
	Mon, 13 May 2024 21:17:49 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 6E8AA10606FD; Mon, 13 May 2024 23:17:48 +0200 (CEST)
Date: Mon, 13 May 2024 23:17:48 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Peter Rosin <peda@axentia.se>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, "Rob Herring (Arm)" <robh@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: supply: sbs-manager: Remove class argument from
 i2c_mux_add_adapter()
Message-ID: <4g4u2g2nrcpjvx4uswxppw2vsfzwcsy6kbsjp7ukksgfyhgnqb@s5n6jlz6w7af>
References: <20240513201400.16589-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d6m7btjvugjxoruz"
Content-Disposition: inline
In-Reply-To: <20240513201400.16589-2-wsa+renesas@sang-engineering.com>


--d6m7btjvugjxoruz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Mon, May 13, 2024 at 10:11:16PM +0200, Wolfram Sang wrote:
> Commit 99a741aa7a2d ("i2c: mux: gpio: remove support for class-based
> device instantiation") removed the last call to i2c_mux_add_adapter()
> with a non-null class argument. Therefore the class argument can be
> removed.
>=20
> Note: Class-based device instantiation is a legacy mechanism which
> shouldn't be used in new code, so we can rule out that this argument
> may be needed again in the future.
>=20
> This driver was forgotten by the patch in the Fixes tag.
>=20
> Fixes: fec1982d7072 ("i2c: mux: Remove class argument from i2c_mux_add_ad=
apter()")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> The to-be-fixed patch is only in linux-next in my i2c/for-next tree. We
> want to remove this unneeded parameter in the next mergewindow. I
> suggest that I just put it on top of my branch to avoid the
> dependencies. A quick ack would be super-awesome! Thanks.

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/power/supply/sbs-manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/sbs-manager.c b/drivers/power/supply/sb=
s-manager.c
> index 9e4141cffbf9..933b04806d10 100644
> --- a/drivers/power/supply/sbs-manager.c
> +++ b/drivers/power/supply/sbs-manager.c
> @@ -358,7 +358,7 @@ static int sbsm_probe(struct i2c_client *client)
>  	/* register muxed i2c channels. One for each supported battery */
>  	for (i =3D 0; i < SBSM_MAX_BATS; ++i) {
>  		if (data->supported_bats & BIT(i)) {
> -			ret =3D i2c_mux_add_adapter(data->muxc, 0, i + 1, 0);
> +			ret =3D i2c_mux_add_adapter(data->muxc, 0, i + 1);
>  			if (ret)
>  				break;
>  		}
> --=20
> 2.43.0
>=20

--d6m7btjvugjxoruz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZCg3gACgkQ2O7X88g7
+pp43w//VO9lJvcUaKz+JueNUDFd0HXec3yMyAZajSdxiWoBabx/LoCOh1+dgy5e
36cR9TO7e/+f+OcwUD34gZ1GY0De+XLMMsFBojVll20VH222lOMyhg+WROUcKbU8
AeZjL5YX6noqe4X+p+pRv5lQfU+GjKFY9Z3+TAm49Gk4zMHnL/KdCGwvgWhNFLiO
bmR1yUUs+AG6TRpDSJCjv6c3tTG9u5shrCoQ4I1CAU4RUDh7skztzsRME/lgYSbf
znikgB5tr3kIxiwwZHupaNitC7vXfhMXaMgjkkhCibkJNri/fqOv2/+taN79Zqct
mHECbusAcvoQv4c9cJvekMrCpd+oqBW2d5clldPsrguICpq8R8E1loTVg6CFCPeW
pXY79eqcCunzU1OEkCGZoYF3VkBthUuAn9lcdNS3oH6uPXosADrNoh2Raq4YHUYn
vHuBAjYPNl9P/Uf3Rr3QiCu+01Zo63fOFyOCFhYYG5GzKShrQ3bI9zFkM79JB87J
RHhRxr7Lqr5xM7lcAxJpBvP0JYBqgotP1PxpQ72ptjgzy0kcVky80uR5pXLCawxs
88IZW1h8CBhj3W/l6tcGWsVOByHYIE6SmKboAmo3h/WVI8PUMBSjtyygjJXkm9d9
MhgtdQjmV3vGk9s3rNJU7y9nwzKShjaE1sQgY87DrxXd5rvknEQ=
=2KO3
-----END PGP SIGNATURE-----

--d6m7btjvugjxoruz--

