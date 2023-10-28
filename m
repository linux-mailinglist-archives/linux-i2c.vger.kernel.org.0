Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3699C7DA6F9
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 14:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjJ1Ma5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 08:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ1Ma4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 08:30:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166C9F0
        for <linux-i2c@vger.kernel.org>; Sat, 28 Oct 2023 05:30:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F26CC433C8;
        Sat, 28 Oct 2023 12:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698496252;
        bh=2/eoE6Q2osE4BqkgLyz9yToEKTaTSe5PEsFGwZiLfbM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a2q2niv4RD3IWJ7AmdiMk2S/BpW2Q8wJYjTgps9d+ixpOcoYK969G6ylsRGwmKCUK
         5xUJV/Ix7pnkRocJZv4Y9Sfj5s0XAOPP9kR3tU/UhXjFtWjrYqVe8NhwhsqgGgRK4n
         4IoQ7uwIQhn+UUYy0cil4J58XThwmA3Bdvsi3tFePRKoofCOl0Q2YyagB7hNBZmtB0
         pKugVvek923hUHO3cIwe8vrZSL7B4b5S/Fm9lm7bbf8+ZXYNDD0GkvDDg6YSFByYgY
         C2VGEnapW5ymQWsxq1srINLOFpQfkfa9HouWRG4bsjUVvJG0MY6F2unWgmArrbJBaR
         95+0OiGgb8cBw==
Date:   Sat, 28 Oct 2023 14:30:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jens Frederich <jfrederich@gmail.com>,
        Jon Nettleton <jon.nettleton@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] staging: olpc_dcon: Remove I2C_CLASS_DDC support
Message-ID: <ZTz++FupTVs/vOxX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jens Frederich <jfrederich@gmail.com>,
        Jon Nettleton <jon.nettleton@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <da3070d9-e016-4167-843f-a08d5b2dc1fe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Zh2MsnwIhr/b4zsP"
Content-Disposition: inline
In-Reply-To: <da3070d9-e016-4167-843f-a08d5b2dc1fe@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Zh2MsnwIhr/b4zsP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 10:49:21PM +0200, Heiner Kallweit wrote:
> olpc_dcon is the only remaining i2c client device driver declaring
> I2C_CLASS_DDC support after the legacy eeprom driver has been removed.
>=20
> olpc_dcon is only used on olpc devices, connected to an i2c adapter
> driven by scx200_acb. This adapter driver declares support for
> I2C_CLASS_HWMON and I2C_CLASS_SPD. Therefore we can safely drop
> I2C_CLASS_DDC support in olpc_dcon.
>=20
> That's the last step before I2C_CLASS_DDC can be removed in general.
>=20
> This patch is solely based on documentation, and I don't have an olpc
> device for testing. Therefore some testing would be appreciated before
> patch is applied.

Yes, testing would be good, for sure. Still, I think we can apply it
even without. Because we are not dealing with HW features here, but only
with the Linux internal handling of i2c adapter classes. So:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/staging/olpc_dcon/olpc_dcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/olpc_dcon/olpc_dcon.c b/drivers/staging/olpc=
_dcon/olpc_dcon.c
> index d5271eac1..08ec3aae9 100644
> --- a/drivers/staging/olpc_dcon/olpc_dcon.c
> +++ b/drivers/staging/olpc_dcon/olpc_dcon.c
> @@ -777,7 +777,7 @@ static struct i2c_driver dcon_driver =3D {
>  		.name	=3D "olpc_dcon",
>  		.pm =3D &dcon_pm_ops,
>  	},
> -	.class =3D I2C_CLASS_DDC | I2C_CLASS_HWMON,
> +	.class =3D I2C_CLASS_HWMON,
>  	.id_table =3D dcon_idtable,
>  	.probe =3D dcon_probe,
>  	.remove =3D dcon_remove,
> --=20
> 2.42.0
>=20

--Zh2MsnwIhr/b4zsP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU8/u4ACgkQFA3kzBSg
KbZnug//eaVavJ8tyw/GmYXQgpJc73lK/2saRybvlXJcu4Pl0tbRBmRzWZ7uruJg
Ofu0vB7I2fB00TndRIXcYLjLpkI2rR4+ff5Si+o0Q9Uz5Dof+W+TaULbt0/swES6
1FXDKwLpJHfQ/sRkvSzNUz/bBzHkQgVImbbq16mQT8o0nV1+UuRmn8qTu0VuEzWJ
5llwMP6JiFtJMb423MTuxDlMpQJm9LRLN1js3ROwShgRXfoxGStZyp/V5YeRompp
uanT+UWY17PXLQaf6xmlrYabXaWn/mxu/veygRfXNVlCkeYWlMc00zWIfj5iKcVH
u4uz2n8ZBvBcJflOkI97s8wIsJxyPFJTuy3MILZfVDfua2W5i1D8WSA66ju5sTyz
eiWBMNCN4raadGg3AdFoozGREQMrC03AY39KD3m+oq0ep/0Vs7InvgCdIMpFpI91
uTNj+/fXhDUoSHTWdrFzakL99W4Ied8261yPAMh/glF2jZ0Z2wIxVPiqsSPUp77a
NwAxmK9hl3vvJvX5K9goxDGJiDejzeIl3Vavo69F6aIuJgsVMtQmyeFuuzbgOl2p
X/+goLW+jYDWk/cfjhOFR4aryZPmJyq3UAHFhUdHPWARyeCgQSewv7CaDNNaMUoM
mtLN9qlTVHBSX/mtIUNPQjJjZZHijEhkNM2ETtKa/Wgh0t36tzY=
=FtFj
-----END PGP SIGNATURE-----

--Zh2MsnwIhr/b4zsP--
