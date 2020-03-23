Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A944E1900B6
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 22:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgCWVy1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 17:54:27 -0400
Received: from sauhun.de ([88.99.104.3]:40088 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgCWVy1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Mar 2020 17:54:27 -0400
Received: from localhost (p54B33416.dip0.t-ipconnect.de [84.179.52.22])
        by pokefinder.org (Postfix) with ESMTPSA id 082DF2C08FA;
        Mon, 23 Mar 2020 22:54:25 +0100 (CET)
Date:   Mon, 23 Mar 2020 22:54:21 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] i2c: rcar: Consolidate timings calls in
 rcar_i2c_clock_calculate()
Message-ID: <20200323215420.GA10635@ninjato>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <20200316154929.20886-3-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> +	struct i2c_timings i2c_t, *t =3D &i2c_t;
> =20
>  	/* Fall back to previously used values if not supplied */
> -	t->bus_freq_hz =3D t->bus_freq_hz ?: 100000;
> -	t->scl_fall_ns =3D t->scl_fall_ns ?: 35;
> -	t->scl_rise_ns =3D t->scl_rise_ns ?: 200;
> -	t->scl_int_delay_ns =3D t->scl_int_delay_ns ?: 50;
> +	t->bus_freq_hz =3D I2C_MAX_STANDARD_MODE_FREQ;
> +	t->scl_fall_ns =3D 35;
> +	t->scl_rise_ns =3D 200;
> +	t->scl_int_delay_ns =3D 50;

Here, the initialization to 0 is missing, so some values are broken.

Why don't we just drop the pointer and init the array directly?

	struct i2c_timings t =3D {
		.bus_freq_hz =3D ...
		...
	}


--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl55MAgACgkQFA3kzBSg
KbaIARAAiz6QqfUPaFd50Y2yAk7Hq+xmmPKYC/cEVbRbHIQv55wuBZdDNw1GcQ+a
4LbGFp31XKeBdMVSRBm1nvzmNBECz7RUNDAOf1sycTD53ppyCHSusW6W/Si1orJy
caLcsH5wVz/U1Atks/7LdgKHok/0zKxuAAdMROy6OgVyeKvXIfF6/+bszeN5+7RM
loFjWjA51FjfinyeadZmvADXD101sQpLiYcvTEtQ21A4f7DrkO2MxpMo5w5uke1G
eDeEkDDkDqVX5cgD4KGeVoOMHMcYOwqhO4++BO7rtDaY0D7BKeZMNji/ucBr8cC2
epz18kSVFnxi2QxTZjSDeSGjl+gpuGReQlx+DTB8KFrOGlZ60j36acHpobIGTrtM
8I8XbRfkrUxaAi/xgs+diAAgDlcKziiCXyz6nDhX0ijulig2LT52Z/JfFyi3FZDN
x0quglrSHnqCB5bq7T2kSVEUoQoFEobgwDq15uRT2x95+8SUCzzyQGoHucvc3hVI
crQfOV1Hn6Das5ts4Jywyozwhdsqqsfe8xxnH9FeI4wX3VNciO6VxpsxkOwiKBmC
7/jHy4zuR5i5WY1St7b5YdZrdoX74rH66KSfj9JB3FR0WqK9LJ5PjF/7NbYvE+yJ
bAvgajR2+aw4b0Y4jY7V8rWKHxDKhMMCHgFw9xzovOCOYhnHrLA=
=QVYb
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
