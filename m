Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEE3393718
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 22:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236829AbhE0UZU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 16:25:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:41352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236501AbhE0UZL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 16:25:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A30E613CC;
        Thu, 27 May 2021 20:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622147017;
        bh=cb3jt8nhfjvJuxgiaw2svdE299MPdHIy5rcv+d11iYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GiHznEruEg9ySCtBN/2heqSWqyYtvsyYPczx075KqbNFwXEEotDtZRidcu+niHbXI
         dIt2VqNals1oUhBFt6F9CWC96UcOHGeAGxsZgQWW0YZCXNaNfosV6gPks4ccRVAmcx
         pBWxWrHWwKuQnnEA1FnHCKZfRF2oVcoOYzJ65uMP8ac66daaE5ektcGQyRqS8h81Dh
         n2IKvrya9ltOSviRvGtANzAShJVqpjQAWxlt7uU/zOSm+IEWrBlIlcfSlm7o+KIXwB
         KBCJJ8YMA8mqHxBv4ovxzv4AGai5a9f5Vfs+KZ/WyWpS0wtdCYTcymBGsfVqowJDk0
         43+tbp3+P/19w==
Date:   Thu, 27 May 2021 22:23:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tom Rix <trix@redhat.com>, Sean Nyekjaer <sean@geanix.com>
Subject: Re: [PATCH] i2c: core: Add stub for i2c_verify_client() if
 !CONFIG_I2C
Message-ID: <YK//xmqZCZRT1VVD@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tom Rix <trix@redhat.com>, Sean Nyekjaer <sean@geanix.com>
References: <20210526174436.2208277-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FvCZ/2o9yGuPX0OU"
Content-Disposition: inline
In-Reply-To: <20210526174436.2208277-1-jic23@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FvCZ/2o9yGuPX0OU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

> Fixes: 68068fad0e1c ("iio: accel: fxls8962af: fix errata bug E3 - I2C bur=
st reads")
> Cc: Sean Nyekjaer <sean@geanix.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> ---
>=20
> Note the broken patch is only in the IIO/togreg branch at the moment.

Then the fixes tag should be removed. It is only for upstream commits.
It means we will have a merge dependency the next cycle, so I will send
my pull request early.

>=20
>  include/linux/i2c.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index e8f2ac8c9c3d..aa52738b9c46 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -343,7 +343,14 @@ struct i2c_client {
>  };
>  #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
> =20
> +#if IS_ENABLED(CONFIG_I2C)

Hmm, can't we move this into an already existing IS_ENABLED block?


--FvCZ/2o9yGuPX0OU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv/8YACgkQFA3kzBSg
KbZRyQ//cfgNMHzWq42WIf+cvU/nm0jhy3nvc4stw+mnFUf3rbcCQlXptlv8Nyus
0KD63wFONyhXAHjmxQ8DxSInAeNNn7QajATAsjjHPg3QQAalIQIXvpOTtFZaa+25
OTARmc+l0iFhoY4uu1HBk6J8EzEhFxlgYIZXevU2usF0kkdz4xvxuZzke93hqERN
Dl6BrCrYnkzU5hzsBjclBhZiz3yaYCfGzQlemLCMpq/hWJmD5jeYkXA6mXdiwRgX
EgT7A5MXr5LCdoTkw1faMQ3uuWOtR0NGszIt5vxqc7u9GtsLrxY6WcEiXUI2Qf1c
3Fzp/jJwUZoOQiOMQF3RmEF7IfQgkQquOPuGcSr2STwGiS/ktKJriMccOZSDxJ8Q
/FZdm7MmKwNuuHcisujykxRC/OkoOmSsHZ3Qzv78HnyehG17jOo9GgzIVt3Omrwz
rOXzG7xMQtlafsJ1bURD5p4kDVyysF3Ctj3JtjYlIxHD0Q6Y2v6xAWzf/n719zYA
M1/MkhxKduIDmxy09RV6M3hmN9qiD8Yu0iOEAv6+C0GohMhEYOZRuuG2T0NzkJCQ
Nlm1RbBWeKSL3oUGJxAAYzqiWXwM1f3r8W/bQxW1yaxLKyhnVeOS0m6neRDLzgKg
TD82QNyISZDBx5vSGhtZ/HoaRUNzHzjxN7xMm/0c+KrikxBPcWw=
=JZs8
-----END PGP SIGNATURE-----

--FvCZ/2o9yGuPX0OU--
