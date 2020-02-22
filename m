Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 901B0168EED
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 13:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgBVMp0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 07:45:26 -0500
Received: from sauhun.de ([88.99.104.3]:53746 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbgBVMp0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Feb 2020 07:45:26 -0500
Received: from localhost (p5486C6B7.dip0.t-ipconnect.de [84.134.198.183])
        by pokefinder.org (Postfix) with ESMTPSA id 361D12C07F9;
        Sat, 22 Feb 2020 13:45:24 +0100 (CET)
Date:   Sat, 22 Feb 2020 13:45:23 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <khali@linux-fr.org>,
        Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot <syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Fix memory corruption in i801_isr_byte_done()
Message-ID: <20200222124523.GI1716@kunai>
References: <0000000000009586b2059c13c7e1@google.com>
 <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1E1Oui4vdubnXi3o"
Content-Disposition: inline
In-Reply-To: <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1E1Oui4vdubnXi3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 10:34:06AM +0300, Dan Carpenter wrote:
> Assigning "priv->data[-1] =3D priv->len;" obviously doesn't make sense.
> What it does is it ends up corrupting the last byte of priv->len so
> priv->len becomes a very high number.
>=20
> Reported-by: syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com
> Fixes: d3ff6ce40031 ("i2c-i801: Enable IRQ for byte_by_byte transactions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Daniel, Jean: what do you think?
Also, adding Jarkko to CC who works a lot with this driver...

> Untested.
>=20
>  drivers/i2c/busses/i2c-i801.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f5e69fe56532..420d8025901e 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -584,7 +584,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
>  					"SMBus block read size is %d\n",
>  					priv->len);
>  			}
> -			priv->data[-1] =3D priv->len;
>  		}
> =20
>  		/* Read next byte */
> --=20
> 2.11.0
>=20

--1E1Oui4vdubnXi3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5RImMACgkQFA3kzBSg
KbZC0Q/+LOrn7S2BHakC6ciFfhoKlx1JKC1Ts+NkP4nKMIvrQMjYOREwWfvUvMRn
a1el8fzdk5NbUIp9RVmh0yt+YKxLzcWKKAWjusc8yiTWgJXapVe2Cc2pT/xEER8A
3APVZAmE7QvSWqbcCjYkBB6KoicYVKvOlIq2sr8OBdE5ERqgUhkGWB9LUh9syAn2
qLCkfXj9emCWAvV4AvcLk21rG4MlpqMSmzJUlP+nx/fHOkaFAFcUGwj4pHb25iUd
2a/JWiPpQ2dRX0+jVFL4S0TVCKGjvnvBOr+N3Dt2zQkDa9Ci1HvwAvwTgoRH1qc2
kgmDm4A6po9WNgz8AhITH+IjuP5ozjEPQHixhOG9r2/BV3LrDnUuhoZboxd/WZSN
5BLgOQvXbM7kS30droYZDMKCN9hE/TvphA/LuN45/LrzoCLOkMeiJOFGSrLCXZ1c
bjQuM41PRtsv/kcG4UHkoXCnt9b5f10Pe+qiw4pedI3+4yL1DGZLu6OQMIrO/Yih
yPNHocAQNoiGIMEKx2mC6gHra+LkHAUsHI+xutxO77VRmiHhQwf+z82P0CMTQSWz
6gnfkZMG0YM1EASYLaa+7MGvd/Cglg+/oMr5cOfKvE6rZAZMg4kSuTmm0lFWd3eH
t/YSAUEr8FsE32jUOjcShuLle3UDTeT6VHtCUPs9riSI28T0pR4=
=hhzM
-----END PGP SIGNATURE-----

--1E1Oui4vdubnXi3o--
