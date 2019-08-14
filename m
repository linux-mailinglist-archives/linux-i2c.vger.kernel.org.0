Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 474158D051
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 12:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbfHNKH7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 06:07:59 -0400
Received: from sauhun.de ([88.99.104.3]:47182 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbfHNKH7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 06:07:59 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 42A722C311C;
        Wed, 14 Aug 2019 12:07:57 +0200 (CEST)
Date:   Wed, 14 Aug 2019 12:07:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: avoid sleep in IRQ context
Message-ID: <20190814100756.GF1511@ninjato>
References: <20190807071807.17488-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cpvLTH7QU4gwfq3S"
Content-Disposition: inline
In-Reply-To: <20190807071807.17488-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cpvLTH7QU4gwfq3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2019 at 03:18:07PM +0800, Fuqian Huang wrote:
> i2c_pxa_handler -> i2c_pxa_irq_txempty ->
> i2c_pxa_reset -> i2c_pxa_set_slave -> i2c_pxa_wait_slave
>=20
> As i2c_pxa_handler is an interrupt handler, it will finally
> calls i2c_pxa_wait_slave which calls msleep.
>=20
> Add in_interrupt check before msleep to avoid sleep
> in IRQ context.
> When in interrupt context, use mdelay instead of msleep.
>=20
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>

Adding RMK to CC because he is the PXA I2C slave user I know of.

> ---
>  drivers/i2c/busses/i2c-pxa.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 2c3c3d6935c0..876e693bafd9 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -456,7 +456,10 @@ static int i2c_pxa_wait_slave(struct pxa_i2c *i2c)
>  			return 1;
>  		}
> =20
> -		msleep(1);
> +		if (in_interrupt())
> +			mdelay(1);
> +		else
> +			msleep(1);
>  	}
> =20
>  	if (i2c_debug > 0)
> --=20
> 2.11.0
>=20

--cpvLTH7QU4gwfq3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1T3XwACgkQFA3kzBSg
KbZRyw//cTr0sByawJ6jOB3ewub37WDzoXSmdd3Q9hCacD8Ya66zum7xtMEbO2uq
dG5djFuGXNRsUWQlYo66bxUYHm7zqqYt4EKvKxqJ3WKfreUW805Tjz6HkhCbZvqd
5euudhyXvpW6cKLU1zBL6hCvf3rPXbigDAiEuJdTin5HrOsNtBeTpceLN1YClze8
fIJAKfF3zINoI2rvH9Y3lQubb89FohC6kDvwQ3plJtc5a2zFT31BKNI0HaodmKVs
jGUUTYqAAXr/o/tvTodoZGE9I3dfOraW6qDfv2uetQQRLeaU5c+6BUxqyJIBmwp3
Btjx+zSXx+/4EBfSKWFnur/VQlhozE2b+tDSlFsnSMFRGr78pNs4sP2yIdGx2WT8
XCNDiwGgFD4FIGmtzuyBOjwu8XwktDDPgMgK5RXgjXJY/kN6pWZRhYAhwBcRzPjo
MOD+CJ9Gz49xgigRvO5BwHb+EGK2eh8jMDN6CcjIUwttIyA9QFn9Bmd49yu0YlYc
M3ZC8u29HR8kraIv+qL61xKVw1+0ZRNKUAV2/nIpn0Quv1AtGPa3iEgny03nseIF
emlAKD9GZ58FQBzUBeNHbulWnbfVrcNiBeEXEKiRPa/DBwr8ZeAWstnCLOfd55UH
xA2OXGyXzxRpTdoFwlmR3VLIB2r0QPWJOJtVwsNfi+WEcns7G9I=
=RuWr
-----END PGP SIGNATURE-----

--cpvLTH7QU4gwfq3S--
