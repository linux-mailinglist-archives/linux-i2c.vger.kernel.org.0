Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD3741AA0A6
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 14:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369438AbgDOM3v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 08:29:51 -0400
Received: from sauhun.de ([88.99.104.3]:53654 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S369431AbgDOM3u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 08:29:50 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 949342C1FF1;
        Wed, 15 Apr 2020 14:29:45 +0200 (CEST)
Date:   Wed, 15 Apr 2020 14:29:45 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: iproc: generate stop event for slave writes
Message-ID: <20200415122945.GC910@ninjato>
References: <20200322182019.32493-1-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline
In-Reply-To: <20200322182019.32493-1-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2020 at 11:50:19PM +0530, Rayagonda Kokatanur wrote:
> When slave status is I2C_SLAVE_RX_END, generate I2C_SLAVE_STOP
> event to i2c_client.
>=20
> Fixes:=C2=A0c245d94ed106 ("i2c: iproc: Add multi byte read-write support =
for slave mode")
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

Just to make sure: That means the HW has already detected a STOP
condition on the bus?

> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-=
bcm-iproc.c
> index 30efb7913b2e..b58224b7ba79 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -360,6 +360,9 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_=
i2c_dev *iproc_i2c,
>  			value =3D (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
>  			i2c_slave_event(iproc_i2c->slave,
>  					I2C_SLAVE_WRITE_RECEIVED, &value);
> +			if (rx_status =3D=3D I2C_SLAVE_RX_END)
> +				i2c_slave_event(iproc_i2c->slave,
> +						I2C_SLAVE_STOP, &value);
>  		}
>  	} else if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
>  		/* Master read other than start */
> --=20
> 2.17.1
>=20

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W/jUACgkQFA3kzBSg
Kba56w//YyHFH3d77V7+5og30eKP1+eGDNLfHEL29jHAg9fqHDj+PlN8Z6kWxoir
2w/sI1a0Yj3e/G1q3G2bL7gWErqYjOMTHP8gYVJQSdNoFTMF3i1ynawW6x7aAXh6
HOLy/0ijpt52+YGlFvfwDdtzYf1lc6t5nBiqp3OiK7PKLWS6Oj88SjtImTwIFpZD
yW3RdHndNZ7dj1nG+Ny+nVIlLRjPBPX415uKOgpcw759SGezT07llFsD65sK9c/r
hWWHgKLq+l9bzFd3LQTF9WwqHyUzx8RTpiJ0U6hwh9PPTcRwuuomynDUdS4R0EeA
PTYPmPrxpI6psoTJFAEKD3VTYS/QymiatT+TKmvZZXiGTStG3zIK2THaLPIPV93U
UIwRD1DOPeSPX/EzBuZ7D31EYhjfmsJzpbIPgryIj4AFS567yrm7lwWMVlUwvQ5A
GGyPrPDHraPDRibrDts+i3YXXOZrIrHJ6OVK25xoz3HcRYULe7Ik5t2YocwmHSHa
ymjlay9LXDG0fTqjmo7KvAZ9Iv992jKH7an2n1m+TEWNZ6yVqQvJ304NHoDmbydO
05SgO8qnX7eAeGiNKls7H8J8+3uY3cEMiOLdQlccWpUZEP6fCN0fkFlR+oop2IgJ
EKuHtdrx8QEMYgiRI8OuEqwINsqawezG89uWHCCSENvhh9Hu73s=
=PQOf
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
