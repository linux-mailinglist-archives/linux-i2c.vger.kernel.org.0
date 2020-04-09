Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1651A3500
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Apr 2020 15:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgDINka (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Apr 2020 09:40:30 -0400
Received: from sauhun.de ([88.99.104.3]:59026 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726559AbgDINk3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Apr 2020 09:40:29 -0400
Received: from localhost (p54B33209.dip0.t-ipconnect.de [84.179.50.9])
        by pokefinder.org (Postfix) with ESMTPSA id BDFE72C1F75;
        Thu,  9 Apr 2020 15:40:27 +0200 (CEST)
Date:   Thu, 9 Apr 2020 15:40:27 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave
 support
Message-ID: <20200409134027.GB1136@ninjato>
References: <20191204095348.9192-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <20191204095348.9192-1-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 10:53:48AM +0100, Sascha Hauer wrote:
> Always add the (un)reg_slave hooks to struct i2c_algorithm, even when
> I2C slave support is disabled. With the cost of some binary space I2C
> drivers with optional I2C slave support no longer have to #ifdef
> the hooks. For the same reason add a stub for i2c_slave_event and make
> enum i2c_slave_event present without I2C slave support.
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

This kind of reverts d5fd120e7860 ("i2c: Only include slave support if
selected"), so adding Jean here for more discussion.

I don't mind the additional bytes used in i2c_algorithm, so I am in
favor of this approach.

I do mind the extra bytes used in each and every i2c_client (which is
not affected in this patch). What we could do on top of this:

Because i2c-slave backends will be rare (and only those need it), it
might be worthwhile to introduce a struct i2c_slave_client and embed the
original i2c_client there. Maybe this way, we could get rid of the
I2C_SLAVE symbol entirely? The I2C core code is not a lot as well.

> ---
>  include/linux/i2c.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index d2f786706657..74ebfcb43dd2 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -359,7 +359,6 @@ static inline void i2c_set_clientdata(struct i2c_clie=
nt *dev, void *data)
> =20
>  /* I2C slave support */
> =20
> -#if IS_ENABLED(CONFIG_I2C_SLAVE)
>  enum i2c_slave_event {
>  	I2C_SLAVE_READ_REQUESTED,
>  	I2C_SLAVE_WRITE_REQUESTED,
> @@ -368,6 +367,7 @@ enum i2c_slave_event {
>  	I2C_SLAVE_STOP,
>  }
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
>  extern int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t =
slave_cb);
>  extern int i2c_slave_unregister(struct i2c_client *client);
>  extern bool i2c_detect_slave_mode(struct device *dev);
> @@ -379,6 +379,11 @@ static inline int i2c_slave_event(struct i2c_client =
*client,
>  }
>  #else
>  static inline bool i2c_detect_slave_mode(struct device *dev) { return fa=
lse; }
> +static inline int i2c_slave_event(struct i2c_client *client,
> +				  enum i2c_slave_event event, u8 *val)
> +{
> +	return -EINVAL;
> +}
>  #endif
> =20
>  /**
> @@ -553,10 +558,8 @@ struct i2c_algorithm {
>  	/* To determine what the adapter supports */
>  	u32 (*functionality)(struct i2c_adapter *adap);
> =20
> -#if IS_ENABLED(CONFIG_I2C_SLAVE)
>  	int (*reg_slave)(struct i2c_client *client);
>  	int (*unreg_slave)(struct i2c_client *client);
> -#endif
>  };
> =20
>  /**
> --=20
> 2.24.0
>=20

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6PJccACgkQFA3kzBSg
KbbozxAArm4Xnrxya8ZgIlxaKhJ+6dG6b7ZkCRwugV1rlHSqT2FO1amtM7NjK+5c
T+d76HPxSYhlQq2fQG7VjnuBWsdBQ6MErfiQ4wiE9h89vKxqJ8Im3d2yWCDYPHE0
8HbAyAmjSUB0d/n80bZkTKWw8eB+n0CkKj4A7JV6IfiaSO3jGbjRxFZnizQrNLcm
NRUj+wdhjhsnVyIZ1mNqZzc9tzDhCECSPY1RAA8uEZA3XN8wjwbOhW3384TEVHzN
fBss9w2TBigpd1BSbiG2fEHyZTVtCtQQMtiBJCphNyMdmTB4jaZdqJ7RHqTSNCdM
LIi15SynQTTDr1lmZnH6xYPAuvVMCGsK5f/lKKgytfO9IN8k8lTIpN5islkQBy91
urdI6hPtOv2zUXYliplCRWwcNDIv9iuJeVMliuVXXOoMBJ7BgekUIA+KodJGQWzU
Gl4BN/1a1Z4EPQpgShXtDtaba3Xbdb5y3h2XvhwKrFZWUqEijLOeT1HR65mBIAVy
d/vEK0s9z2u4DHHK5IW7amsl+20A9LjxR1tS3si8VUrsFT1eJTB9Oyj8zXhxbZSJ
f1HdBXMBQP7z1PHyB1L5UfN86L4yAdpXQhda/LxyWzwHzndNWcjKMOeRFDer1BfI
qPF8bfmlmTgKtXXzxIU8BXmakgkLVVZTipP2u68nl+jPyryosSI=
=WzXc
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
