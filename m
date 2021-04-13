Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3292A35E75E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 21:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhDMT7S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 15:59:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:45716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230244AbhDMT7S (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 15:59:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F74F613CA;
        Tue, 13 Apr 2021 19:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618343938;
        bh=5bddcdQJZV2HK/VysiMwp2703Aq6rjJ1j6rCQCWbhLs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f8/OKm6v57j03Z47qRJY13vjZEfcqeDehdig8mpIvd+b2wLIniwGslXK+23oqTWkj
         bOK8D0B2ypX6P40FgwI6w8cft36esrsAt32f1rPH4BN+/VaGtpcbI5jzo2X/EuAdVF
         /i1+YzuO5Coy+eSkmPWOszZpesjPI/1aBqdkzOOE0ezk3Cr+365lITUp9FtyB6oqva
         bKjoneYkPR+HljfQ2brQyv4glsaUh9FN6v6ZatSQD6jE829wOYriCjgdDmv5nLcA2U
         bUi9/tep4JSxyBm6wpb6tQJQ8Jr0TEP40bFS5YidI/Sv+g/Hxy/4IRBphJeX9dx1Fp
         d94eWhMzk9qnQ==
Date:   Tue, 13 Apr 2021 21:58:54 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     linux-i2c@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] i2c: mv64xxx: Fix random system lock caused by runtime PM
Message-ID: <20210413195854.GB2751@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>
References: <20210408020000.21914-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline
In-Reply-To: <20210408020000.21914-1-kabel@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 04:00:00AM +0200, Marek Beh=C3=BAn wrote:
> I noticed a weird bug with this driver on Marvell CN9130 Customer
> Reference Board.
>=20
> Sometime after boot, the system locks with the following message:
>  [104.071363] i2c i2c-0: mv64xxx: I2C bus locked, block: 1, time_left: 0
>=20
> The system does not respond afterwards, only warns about RCU stalls.
>=20
> This first appeared with commit e5c02cf54154 ("i2c: mv64xxx: Add runtime
> PM support").
>=20
> With further experimentation I discovered that adding a delay into
> mv64xxx_i2c_hw_init() fixes this issue. This function is called before
> every xfer, due to how runtime PM works in this driver. It seems that in
> order to work correctly, a delay is needed after the bus is reset in
> this function.
>=20
> Since there already is a known erratum with this controller needing a
> delay, I assume that this is just another place this needs to be
> applied. Therefore I apply the delay only if errata_delay is true.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

Gregory? Looks reasonable to me and if so, we should have this in 5.12
already. Comments from others are welcome, too, of course.

> ---
>  drivers/i2c/busses/i2c-mv64xxx.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
> index c590d36b5fd1..5c8e94b6cdb5 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -221,6 +221,10 @@ mv64xxx_i2c_hw_init(struct mv64xxx_i2c_data *drv_dat=
a)
>  	writel(0, drv_data->reg_base + drv_data->reg_offsets.ext_addr);
>  	writel(MV64XXX_I2C_REG_CONTROL_TWSIEN | MV64XXX_I2C_REG_CONTROL_STOP,
>  		drv_data->reg_base + drv_data->reg_offsets.control);
> +
> +	if (drv_data->errata_delay)
> +		udelay(5);
> +
>  	drv_data->state =3D MV64XXX_I2C_STATE_IDLE;
>  }
> =20
> --=20
> 2.26.2
>=20

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB19/4ACgkQFA3kzBSg
KbZ0uw//U7Bl9nR2Gbar+SfrDajWg6geFRUjr4X42Qi4w5leFfRzr81aTMUk9rFm
QHk/0NiG5RH9lAzBLE8jTILcladqNVlBrGYUDqQkXGFZlyKDU5EaLG90rxX6r7h/
KRGpIl5iq5gYla+S4E2GYRka/dTe3UAV6QG40dPnQRKdO2YVpXb3VDxRGTlwqlzV
r/EInqFq4z4OPX+4uob+qujKVW6diQbIOT4XVd27yrrME2xUX9HYOpwwhYCOkAwN
y2isE5qQz5X2zp3RTdvPGAGfLo6EJ43S30xl9Vn+P2tknFZBG1TJ8ydhuMSvHRI2
eeZMazkZN+AiHPvMo78+uWbzJIghPlf7rIN7xHpQumJq9fA4uYsaNZfQPUUeqM8P
Pd2V4kute8JF4Kj15hXdNjmOCttEhhYlNa9SAjz0Z93SDFvA+kZwUuNJT75FTtuA
JhNJF+24mS8Hxaf9/ixLYEjXuzoJu45JwdTNQk88R8i/rGXfb4INYVdiqaGfRQjI
2uzLY50cYJR1olcBizQq8LQCBb5rkPOCCvUTcpgPbkrs8ZGrFF4qYtHKqsU5mmKX
3L6fiBcRCUjE6TCSqnn6gX9MGdm5JquavM+vDEGpFhdwdMGnjjre4ioBU9YteGI/
3x7ZPOz3U4u1YjkA5Dhp6z7VnDtm9w2u3BfGmiI1KWpldl0tTGQ=
=r1xV
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
