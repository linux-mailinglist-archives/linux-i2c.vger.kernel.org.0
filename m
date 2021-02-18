Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A49331E97B
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 13:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhBRMCf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 07:02:35 -0500
Received: from sauhun.de ([88.99.104.3]:46182 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230133AbhBRKur (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Feb 2021 05:50:47 -0500
Received: from localhost (p5486ca7f.dip0.t-ipconnect.de [84.134.202.127])
        by pokefinder.org (Postfix) with ESMTPSA id 50F0A2C0448;
        Thu, 18 Feb 2021 11:49:38 +0100 (CET)
Date:   Thu, 18 Feb 2021 11:49:36 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: implement atomic transfers
Message-ID: <20210218104936.GA890@ninjato>
References: <20210212164541.8986-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <20210212164541.8986-1-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Uli,

> Implements atomic transfers. Tested by rebooting an r8a7790 Lager board
> after connecting the i2c-rcar controller to the PMIC in
> arch/arm/boot/dts/r8a7790-lager.dts like so:
>=20
> 		compatible =3D "i2c-demux-pinctrl";
> 		pinctrl-names =3D "default";
> 		pinctrl-0 =3D <&pmic_irq_pins>;
> -		i2c-parent =3D <&iic3>, <&i2c3>;
> +		i2c-parent =3D <&i2c3>, <&iic3>;
> 		i2c-bus-name =3D "i2c-pwr";
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Doesn't apply against 5.11 or i2c/for-next. What is the base here?

Regards,

   Wolfram


--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAuRjwACgkQFA3kzBSg
KbZm7w//aI9BB2FjjDihzkogx9Pyct2B8o7p/OaDSP3lmoqCqHbNwL9RDjTlyhDw
Y2GrCuMITPmxIZhApiWpHe3n6OScbOdgKRCnzxXINGHEwfR6Gf/3r0m9DZGCu+yo
YSeRSeLOmMksxa4GJaMR/ztKdb/gnqaHbssuZMijSQ2h6/KMxoNGdU8NX/yozms+
PA8b0Mrq+JEUU85ddCTNMFx27Pr+n3iOu484XBcJXZvELVyFvlE7+9wpheClMlcU
klqrbcxzPj1/6NEQY6sGD5tcfFwd6ApPwxa8MYf1HP9FD1ynJjugD6BSnXYsNyzA
E3LC3+tJ7M3vkSM0zUD46IxDTZCDlkvoBzgkJFv2oHdFpM+GPzSHWz9VpFrQKnXM
pgRzRmcRKv7C86FmipnqNzwY+A96zb/tW5D9m9+6lI7Q9cvnVRJHhc++33KRgiKb
O2rej83z77YZ7s+929KZlFxbfEWvD3ZCwnDh0c8K1C5NaCJrtzVwM/hxnOc8AqDs
OnHjTTGW/DBWDVCwV2DbT4hD30dSt4MWIYU2j4EsUE3ieGwioVhbnkPbpyOChU7l
heVjkjz4Yd+6F3cJpne+E1euX/JK4Mdj2j7ZPxrcqR2CdOpRB7hvsTL9iUXk17tc
zZZOWuwh5h+T9UgY1kcrCXjcVa8LQAmpePk8yHXgviMyQovwsB4=
=l7d1
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
