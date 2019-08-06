Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11EB583A4E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2019 22:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfHFUdR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Aug 2019 16:33:17 -0400
Received: from sauhun.de ([88.99.104.3]:36534 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbfHFUdR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Aug 2019 16:33:17 -0400
Received: from localhost (p54B3324E.dip0.t-ipconnect.de [84.179.50.78])
        by pokefinder.org (Postfix) with ESMTPSA id 0B67E2C290E;
        Tue,  6 Aug 2019 22:33:15 +0200 (CEST)
Date:   Tue, 6 Aug 2019 22:33:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: remove unused function
Message-ID: <20190806203314.GB911@ninjato>
References: <20190731105642.29664-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline
In-Reply-To: <20190731105642.29664-1-anders.roxell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Anders,

On Wed, Jul 31, 2019 at 12:56:42PM +0200, Anders Roxell wrote:
> GCC warns taht function 'i2c_acpi_find_match_adapter()' is not used.
>=20
> ../drivers/i2c/i2c-core-acpi.c:347:12: warning:
>   =E2=80=98i2c_acpi_find_match_adapter=E2=80=99 defined but not used [-Wu=
nused-function]
>  static int i2c_acpi_find_match_adapter(struct device *dev, const void *d=
ata)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Rework to remove the function 'i2c_acpi_find_match_adapter()'.
>=20
> Fixes: 00500147cbd3 ("drivers: Introduce device lookup variants by ACPI_C=
OMPANION device")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Can you resend with gkh and "Suzuki K Poulose <suzuki.poulose@arm.com>"
added to CC? Greg maintains a branch with device_lookup changes and
Suzuki is the author of it.

Kind regards,

   Wolfram

> ---
>  drivers/i2c/i2c-core-acpi.c | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index bc80aafb521f..bb6b39fe343a 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -344,17 +344,6 @@ u32 i2c_acpi_find_bus_speed(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(i2c_acpi_find_bus_speed);
> =20
> -static int i2c_acpi_find_match_adapter(struct device *dev, const void *d=
ata)
> -{
> -	struct i2c_adapter *adapter =3D i2c_verify_adapter(dev);
> -
> -	if (!adapter)
> -		return 0;
> -
> -	return ACPI_HANDLE(dev) =3D=3D (acpi_handle)data;
> -}
> -
> -
>  struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
>  {
>  	struct device *dev =3D bus_find_device_by_acpi_dev(&i2c_bus_type, handl=
e);
> --=20
> 2.20.1
>=20

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1J5AoACgkQFA3kzBSg
KbZDTQ/6AmedFvfIwu9NlIhayf2vJHURysQINDdu+Qak547nivAllwlq4TQwhgW9
yjifC0GCgdJZeSxkipNDgwQK+l0EgR4NuMypA1lqcH/r/0RoemNZRzM5kaR1leYl
+jx2AJdLsH8Jg4TJtxL5xnpNQmowDs6z2CtlkO7k6APCw8PE9ki2xhPVaR9VcSVk
SZJhlnUQlVJUN7i/Y6ittUAMDxS/XM/+CmO74e+aFZa2snpQyoEJ2WhPzHUnbfHv
gJjuZz6TyBSWCfNjDPcwUQkT0nTbq4XiGp5c3murLXkvFXPBI43MwNZRkyNyqyZy
E0gk18rL5242nprX4ffsvfz5biO+Ab+WgZk1r670XlETLs25S1x/374fSSDRYHXk
P1bKROABD829y5o0MlCt4T3vB7P/HFdmsaqJGePH0RUh0DL+yPHF3MXdGTxzwaC0
ADtGRJ1jXfEeq+vGtDkCExfUJOM6xVIFW6g9zwvHN9gHsoTM2gbnmfxHDNqfNBEN
foMxnzIZymeDgk0ZcYT0HNpD2OIBvfrtsQG1x9mbxew4CQU/6GgyVaFE4gHPzK9y
5vLZw31J0fOfWhLgAr9upR1qWQ9zDZQytQ4AFGTRv64EJoAGTMPzlFBGDzszV5L6
44Wn+sQjErHw2eIpaaeqJiRtv3f2NUxmwWzQDzxUIM/+7W8kgBM=
=I0Kb
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
