Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDFD5ECD01
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 21:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbiI0ThF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 15:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbiI0ThE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 15:37:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0ADD12E407;
        Tue, 27 Sep 2022 12:37:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D32BB81D46;
        Tue, 27 Sep 2022 19:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A42C433C1;
        Tue, 27 Sep 2022 19:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664307421;
        bh=Sn2IgB3v5zqRRRe7wIi1YPm+NfevKPVdtb25s9lhNl0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rZ5ACcFm3va4kABK/y1FlUX4kg2AVe91rVBjLzID+kMGmJV9iI41XrwYWKOm1k9zt
         HzmQF+JA6qYDXs+Qcv52uwNMZKGackC791f54J+DXhD8g/gyDYd3Sp3FKCwOYNSgH3
         02KYqsg3DKnmbSUIdK73lMxfU0l3SDt29sBsoO+AaEWx7PEvuaIYPUiXOWXgu9se9K
         6dK6Ly+rmqD1eUHNn8sXyotNEEcA2KDIA9L3WWEwBZpDNXtmyfbamlKSGOIA6APCsY
         xfzjeuCk+YE3fLLmof9bldf1mwPfiJi/JljhldLT26EiqHeWd8X80E6Xy8eeIQpF4D
         w6s4ob0qMI3HQ==
Date:   Tue, 27 Sep 2022 21:36:54 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     jic23@kernel.org, gupt21@gmail.com, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/5] i2c: muxes: ltc4306: fix future recursive
 dependencies
Message-ID: <YzNQ1j30uoVvpkoF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>, jic23@kernel.org,
        gupt21@gmail.com, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20220911014048.64235-1-matt.ranostay@konsulko.com>
 <20220911014048.64235-2-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RRrEuFFQ6ejCmSTl"
Content-Disposition: inline
In-Reply-To: <20220911014048.64235-2-matt.ranostay@konsulko.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RRrEuFFQ6ejCmSTl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2022 at 06:40:44PM -0700, Matt Ranostay wrote:
> When using 'imply IIO' for other configurations which have 'select GPIOLI=
B'
> the following recursive dependency detected happens for I2C_MUX_LTC4306
>=20
> Switch from 'select GPIOLIB' to 'depends on GPIOLIB' to avoid this per
> recommendation in kconfig-language.rst
>=20
> drivers/gpio/Kconfig:14:error: recursive dependency detected!
> drivers/gpio/Kconfig:14:        symbol GPIOLIB is selected by I2C_MUX_LTC=
4306
> drivers/i2c/muxes/Kconfig:47:   symbol I2C_MUX_LTC4306 depends on I2C_MUX
> drivers/i2c/Kconfig:62: symbol I2C_MUX is selected by MPU3050_I2C
> drivers/iio/gyro/Kconfig:127:   symbol MPU3050_I2C depends on IIO
> drivers/iio/Kconfig:6:  symbol IIO is implied by HID_MCP2221
> drivers/hid/Kconfig:1227:       symbol HID_MCP2221 depends on GPIOLIB
>=20
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>

The I2C mux maintainer is not on CC. get_maintainer.pl would have
mentioned him.

> ---
>  drivers/i2c/muxes/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index ea838dbae32e..7b6a68df4a39 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -46,7 +46,7 @@ config I2C_MUX_GPMUX
> =20
>  config I2C_MUX_LTC4306
>  	tristate "LTC LTC4306/5 I2C multiplexer"
> -	select GPIOLIB
> +	depends on GPIOLIB
>  	select REGMAP_I2C
>  	help
>  	  If you say yes here you get support for the Analog Devices
> --=20
> 2.37.2
>=20

--RRrEuFFQ6ejCmSTl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMzUNIACgkQFA3kzBSg
KbaByQ//W8sMUkZmFQeVQQLSX+rSRAbiYWHLw1blIwPFknCSgmmUMnueX6xbFUJE
Yc+yaUNpM3JRd/kbKUeB4+WLOXjnE/FMVP+ku8Hws7hoGGR0zsS90NN0r1tWWcyy
m3/jKdu0XPEJpYdt+kfqN8/kWSqFtinDyuGJYF1BvsucmhpzSw8uhJpSAEOfBqdQ
Y9us+tru4QVnOVXbXg7shWMm9xAwmb0zUBj0XlQnIORuEtm7aRYmz3fZRh7ewiXx
/LtKzFQQ+3uxKsnPgu/5vuBejpGCmu8kk+E5hU8i1M39f5OYAstVmjBV0Lp7tyRz
LIqCmkV3i/EI7hjxLSVlfBlvm1oS4P9VgtlXKxs2gqODu0TS5Y0OYZpIlSqhfnu7
cB6Av2wpkM0p06CU1N5Hvxbfhr5GJ7Erzo4w/SfkO7+maBHIJq75uPqQJhdSrucN
ODdWERg6u5BfSQK/GvBy+ZgYR3PrVeCH7zaNYAXf40hUwkJL4GQ/yGXSAuUjrR1W
CMn++Ddhmubemky5MDpkn7ZGrIifqfYQWBBFVmLU/yV9+0qDSDNdwPzQuDsz+F5B
fBU79gtTuFUDvzWxaXyhJeEzaO5tRqEdlqvqjbhdoiukKc6glWmL0Dr7D8akrDI1
k8Rg3bWXgZbFE0xc36apCQbtiEsEJEiMLsTwW6CbFRNMSUDK4bs=
=XaXB
-----END PGP SIGNATURE-----

--RRrEuFFQ6ejCmSTl--
