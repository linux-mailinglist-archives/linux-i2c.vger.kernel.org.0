Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5060D340411
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 12:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhCRK7u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 06:59:50 -0400
Received: from sauhun.de ([88.99.104.3]:40954 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230105AbhCRK7V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 06:59:21 -0400
Received: from localhost (i577BC015.versanet.de [87.123.192.21])
        by pokefinder.org (Postfix) with ESMTPSA id 0B6EE2C0640;
        Thu, 18 Mar 2021 11:59:13 +0100 (CET)
Date:   Thu, 18 Mar 2021 11:59:12 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: implement atomic transfers
Message-ID: <20210318105912.GH974@ninjato>
References: <20210212164541.8986-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MGu/vTNewDGZ7tmp"
Content-Disposition: inline
In-Reply-To: <20210212164541.8986-1-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MGu/vTNewDGZ7tmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 05:45:41PM +0100, Ulrich Hecht wrote:
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

Applied to for-next, thanks!


--MGu/vTNewDGZ7tmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMoAACgkQFA3kzBSg
KbZJzA//ZGZCpvJlr7Nz/v/JfDwmyh4coWWz8kqKFrsEWj95Q3yPiC5ji+aePeFD
KE9fXiPWzYur6I+1+uRDnRVtgM1/Z+MnRj6pntjTFZs2b7wcoZmZlXOWflwMYjqy
7C4k1t75JUNq9jXDIfxw/e7ueIOIdBgvP6bcGbQMLhmpCQGE/fzd6KUoYRB1eGWx
mzQ00vCPXSr7jW9ZicUhgw93HbAVQs5AgujGQhExx82BNrK9elIsKfbCFSBIvgK8
U6YJ2JnIUNrgmR2rGxBupiGAcF2/hhP8QpP6CrOM0KlCjADRyIYlLfAPExxWS/lP
3OE16TURcU7FkSgWWUqzK8DuA9Exys60X0QtvXc1zxhEGV+LKXDh5vW2zff5ab88
i8/FD0EDlh6sHDTYEQWZbPZhM5pEjscGE7orU2vbrTVE/2i8YavXQU5v0qA7k1YH
yo1NzZKaTPkhj+bQ8lVzOavCgz7epVCGtK8DXwmN9f6rcBc4JR+EdDrwngmPc0eh
Z7z1NSbiHIn+6zQi9cpTtRJhXoyI8YNWwSIGTy4G5SJVjU5VzDkl5XEThW9yqc73
T61dORWau8pTmpWFNl2FYxOjdpzEWaI/c+digzxkiSzRyWW9HWT3a/T+ocEQHt1A
ibPRSKrmqnPTmLKLcR0IuzRqWcKmRXvcuBbL/bepD2BOrIOTgDM=
=XEOj
-----END PGP SIGNATURE-----

--MGu/vTNewDGZ7tmp--
