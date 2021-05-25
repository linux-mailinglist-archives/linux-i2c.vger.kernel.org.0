Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD15B390A78
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 22:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbhEYUcZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 16:32:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:33968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229643AbhEYUcZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 16:32:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BA8A613EC;
        Tue, 25 May 2021 20:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621974655;
        bh=YB5s9KqU3I3U0EwmlQEZQw1u1H5+l4vhQZio8tQDxYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l/kSEVjzzpoSmDZtXwhyPpiLBWJFOMLiiJdkZnUkEnjVxIP+ymjMljIoA6VJxwL7f
         6oHEtmU95MjYLld20dbrEUhyRA5a05j5LdrpfZ1SoSD+sNzvAeJj/L+x4UOLzJAMS7
         jKhmGmaIqQUsWjxLEHCeJKHhYbQ7DLvN2m7scGtHFauO0fr53Y2S2j1EiuQcwC2/Vk
         iYl3Wl6Ge54GPYeQONO0Tgm40jtbkOUI63JYunfQuFF0kzdTPv08bgrSWHJxWDl8Dx
         ATTJniz3W3LO7Yyo3MkohMzYa407hq0Lp2pVYkkutpEObLKqUhHBmG4z72z+ZS9Uu8
         8JDPTeCNf/1mw==
Date:   Tue, 25 May 2021 22:30:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Sean Nyekjaer <sean@geanix.com>, trix@redhat.com, lars@metafoo.de,
        andy.shevchenko@gmail.com, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] iio: accel: fxls8962af: conditionally compile
 fxls8962af_i2c_raw_read_errata3()
Message-ID: <YK1efL7DMOVZSPuz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>, trix@redhat.com, lars@metafoo.de,
        andy.shevchenko@gmail.com, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20210518234828.1930387-1-trix@redhat.com>
 <a3329058-2b2d-415a-5d2a-0bdf2f97d23d@geanix.com>
 <20210521175406.274f713b@jic23-huawei>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v0fj/HaOmU5lDP4H"
Content-Disposition: inline
In-Reply-To: <20210521175406.274f713b@jic23-huawei>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--v0fj/HaOmU5lDP4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > The build is failing with this link error
> > > ld: fxls8962af-core.o: in function `fxls8962af_fifo_transfer':
> > > fxls8962af-core.c: undefined reference to `i2c_verify_client'
> > >=20
> > > This is needed for the i2c variant, not the spi variant. So
> > > conditionally compile based on CONFIG_FXLS8962AF_I2C.
> > >  =20
> > Fixes: 68068fad0e1c ("iio: accel: fxls8962af: fix errata bug E3 - I2C b=
urst reads")
> > > Signed-off-by: Tom Rix <trix@redhat.com> =20
> > Reviewed-by: Sean Nyekjaer <sean@geanix.com>
>=20
> Given the purpose of that check is to verify it was an i2c_client
> should we be looking to instead provide a stub for the case where
> we don't have CONFIG_I2C?
>=20
> +CC Wolfram and linux-i2c list for input.

Such a stub sounds reasonable.


--v0fj/HaOmU5lDP4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtXncACgkQFA3kzBSg
KbaGzg/+PC+EeK4TZxKGveYd0I11gaP37dNvJKXHqjBQO8pzsZnBpWzzprDPvrt7
7+hC6jYXPErO5okEMg+Dj+LC0T94F+YoNG7zvq4Q3BZ9aar6F8pmACeXKCTxU+di
NmBDqGVqGUqu6YQY/0Ya3XBewc4OXfAJtFvtxydVJjwZ4U1r0gKssXoT2QD9GY1r
0MzNUtP6Vqgqu65wOGmtp36+hsxJQ+kesKA9YQhV/NyNwKKwO5+PRbUMeyNjAGIr
nUsw7N+Y7K8jdinauJguJmwa75ff3ZL8fGj0hTJR4V+twKP+u0OwRHxNYi0jLNQF
Zq7/4K+ktNEupCl0yJenrQyGTwdS6F5lpr3trPm8uY03SZBdnUZHUmmzpviX251l
uyIv272uWq8PQVXQ203VjeOxbnvK6OUfOkc+yDoA5B22AWlrL/Q7HBWStZj8iVCr
yjADh39qnZjdAbggBCkcL54hKumFhiHcIXP6tGsrtx64uAOoo7ndnqKDLVKPbuz7
qZaggAabA18Pi6o3+y+jE8u8xSxoU2JRGu+WdsFvfCZaYkIAnP4mVgD/duhumWww
vC+x4XxSWVvR9bGX/FK5P3sh0J3kQF+Re7ysreydNBLiHlniVZ60Z7AhwetIw7eR
wwP2oeNwHfkF60289uRYcCtSCuwCfUBaY0w3TnP/PqUMXrvW98U=
=XRTq
-----END PGP SIGNATURE-----

--v0fj/HaOmU5lDP4H--
