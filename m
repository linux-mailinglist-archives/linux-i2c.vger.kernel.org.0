Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F2C25266B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 07:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgHZFI6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 01:08:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:56192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbgHZFI6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 01:08:58 -0400
Received: from localhost (p54b33436.dip0.t-ipconnect.de [84.179.52.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC4612076C;
        Wed, 26 Aug 2020 05:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598418537;
        bh=ZewbGokjIPwrPd22kZW4jiPlCDpkUT+w7kxtaumNiMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H2uH7yf1LheFk6bGN6GL9bSSi7e3eEL4c+KMicA2Mm9Qr5iKjHsEvxIZr7Ezy+4Wx
         p5dcMRVPjha2uU8CuKWucEJuNuGIbu7shW6IBM3DcmKvyOdvjzJ4kpkpMLPejY7ChI
         UuWf6VNEgnGpxC8L/2Y80FI+Y55juQ3wXE1XgkEA=
Date:   Wed, 26 Aug 2020 07:08:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826050851.GA1081@ninjato>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 01:29:37PM +0900, Sergey Senozhatsky wrote:
> Unlike acpi_match_device(), acpi_driver_match_device() does
> consider devices that provide of_match_table and performs
> of_compatible() matching for such devices. The key point here is
> that ACPI of_compatible() matching - acpi_of_match_device() - is
> part of ACPI and does not depend on CONFIG_OF.
>=20
> Consider the following case:
> o !CONFIG_OF system
> o probing of i2c device that provides .of_match_table, but no .id_table
>=20
>  i2c_device_probe()
>  ...
>    if (!driver->id_table &&
>        !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
>        !i2c_of_match_device(dev->driver->of_match_table, client)) {
>        status =3D -ENODEV;
>        goto put_sync_adapter;
>    }
>=20
> i2c_of_match_device() depends on CONFIG_OF and, thus, is always false.
> i2c_acpi_match_device() does ACPI match only, no of_comtatible() matching
> takes place, even though the device provides .of_match_table and ACPI,
> technically, is capable of matching such device. The result is -ENODEV.
> Probing will succeed, however, if we'd use .of_match_table aware ACPI
> matching.
>=20
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

We have currently this in for-current which is even removing
i2c_acpi_match_device():

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D196990&state=
=3D*

=46rom a glimpse, this is basically equal but CCing Andy for the details.

> ---
>  drivers/i2c/i2c-core-acpi.c | 10 ++++------
>  drivers/i2c/i2c-core-base.c |  2 +-
>  drivers/i2c/i2c-core.h      | 10 +++-------
>  3 files changed, 8 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 2ade99b105b9..1dd152ae75e5 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -276,14 +276,12 @@ void i2c_acpi_register_devices(struct i2c_adapter *=
adap)
>  		dev_warn(&adap->dev, "failed to enumerate I2C slaves\n");
>  }
> =20
> -const struct acpi_device_id *
> -i2c_acpi_match_device(const struct acpi_device_id *matches,
> -		      struct i2c_client *client)
> +bool i2c_acpi_match_device(struct device *dev, struct i2c_client *client)
>  {
> -	if (!(client && matches))
> -		return NULL;
> +	if (!client)
> +		return false;
> =20
> -	return acpi_match_device(matches, &client->dev);
> +	return acpi_driver_match_device(&client->dev, dev->driver);
>  }
> =20
>  static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] =
=3D {
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 34a9609f256d..35ec6335852b 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -480,7 +480,7 @@ static int i2c_device_probe(struct device *dev)
>  	 * or ACPI ID table is supplied for the probing device.
>  	 */
>  	if (!driver->id_table &&
> -	    !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
> +	    !i2c_acpi_match_device(dev, client) &&
>  	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
>  		status =3D -ENODEV;
>  		goto put_sync_adapter;
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 94ff1693b391..7ee6a6e3fb8d 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -59,19 +59,15 @@ static inline int __i2c_check_suspended(struct i2c_ad=
apter *adap)
>  }
> =20
>  #ifdef CONFIG_ACPI
> -const struct acpi_device_id *
> -i2c_acpi_match_device(const struct acpi_device_id *matches,
> -		      struct i2c_client *client);
> +bool i2c_acpi_match_device(struct device *dev, struct i2c_client *client=
);
>  void i2c_acpi_register_devices(struct i2c_adapter *adap);
> =20
>  int i2c_acpi_get_irq(struct i2c_client *client);
>  #else /* CONFIG_ACPI */
>  static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) {=
 }
> -static inline const struct acpi_device_id *
> -i2c_acpi_match_device(const struct acpi_device_id *matches,
> -		      struct i2c_client *client)
> +bool i2c_acpi_match_device(struct device *dev, struct i2c_client *client)
>  {
> -	return NULL;
> +	return false;
>  }
> =20
>  static inline int i2c_acpi_get_irq(struct i2c_client *client)
> --=20
> 2.28.0
>=20

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9F7l8ACgkQFA3kzBSg
KbZjQxAAonAEmZmWBFz4kktZ2UBEn1LY/lVRzWpLpCPjSEc1jxRMlubYlOdFV/u+
XB6kJGIgjlVGSemIB0gCyBVp/cKGKdTUhgQYMbuq3XymGmsn7My6prIyJQxFd1E6
6gxysDzz9EezB4KF4KY68b8faxdtUGo6KW0j4VK8gzPvjwxsdghbRfOLXMJexAHQ
lfIGXES983r/u4I2XkZbO0KvCrb5e5XgoPXKKP7uAFYLixs81nWVeJlWxPEQVA1a
bXmqZIbZ03+J6ckpLWzOd6NsGroezEtnNkZoBL0hc05CV9s5Z9E/31Amzqg+D82S
7QX00/1cpCrddLaE475rUdx74Ykd0JAdS0igjuHNX52VubdvrJmQKktbTp6wlZ8F
yyIwT/cEKuR4aWcl5/ootySBo3W03DLAOaFxFLFk+RYiNPBtid4mPBiAWLxK4GEf
Zmtjg2qwBrEAoUbzNKhLPx5GZt8fg/6Whrl0EyMJMOvKOFB22XEyESHlttms2gzO
o32VR7o13plAfSRsWVi3ROHujXDUYbhIf14hMAhmL6zB2Jnnw5y4dVeVZwe4/aOD
OPZnhaP0D79+0PIFU4UwdYrzGEas8hJiEHseoq+Y1NW5cRFvmIYGjE82d3G4jswv
AkgZKBmL3Q15Wn6xUC9hzIrkufxHDMPUEkN0ICoG1uMyBx3I3xA=
=OB9K
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
