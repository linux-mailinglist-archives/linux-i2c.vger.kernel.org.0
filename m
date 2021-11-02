Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726AC4429FC
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 09:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhKBJAs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 05:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbhKBJAr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 05:00:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260CCC061714
        for <linux-i2c@vger.kernel.org>; Tue,  2 Nov 2021 01:58:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mhpcN-0008FJ-EC; Tue, 02 Nov 2021 09:58:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mhpcM-0008QC-Bk; Tue, 02 Nov 2021 09:58:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mhpcM-00059N-Ai; Tue, 02 Nov 2021 09:58:06 +0100
Date:   Tue, 2 Nov 2021 09:58:06 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     minyard@acm.org
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 3/3] i2c:imx: Use an hrtimer, not a timer, for checking
 for bus idle
Message-ID: <20211102085806.hefnttaxm5srxbov@pengutronix.de>
References: <20211005003216.2670632-1-minyard@acm.org>
 <20211005003216.2670632-4-minyard@acm.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zarilxdvchenwvmy"
Content-Disposition: inline
In-Reply-To: <20211005003216.2670632-4-minyard@acm.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zarilxdvchenwvmy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 07:32:16PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
>=20
> The timer is too slow and significantly reduces performance.  Use an
> hrtimer to get things working faster.
>=20
> Signed-off-by: Corey Minyard <minyard@acm.org>
> Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
> Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 26a04dc0590b..4b0e9d1784dd 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -38,7 +38,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/spinlock.h>
> -#include <linux/timer.h>
> +#include <linux/hrtimer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -53,6 +53,8 @@
>  /* This will be the driver name the kernel reports */
>  #define DRIVER_NAME "imx-i2c"
> =20
> +#define I2C_IMX_CHECK_DELAY 30000 /* Time to check for bus idle, in NS */
> +
>  /*
>   * Enable DMA if transfer byte size is bigger than this threshold.
>   * As the hardware request, it must bigger than 4 bytes.\
> @@ -214,8 +216,8 @@ struct imx_i2c_struct {
>  	enum i2c_slave_event last_slave_event;
> =20
>  	/* For checking slave events. */
> -	spinlock_t	  slave_lock;
> -	struct timer_list slave_timer;
> +	spinlock_t     slave_lock;
> +	struct hrtimer slave_timer;

This is unrelated to this patch, moreover it was introduced only in
patch 1.

>  };
> =20
>  static const struct imx_i2c_hwdata imx1_i2c_hwdata =3D {
> @@ -783,13 +785,16 @@ static irqreturn_t i2c_imx_slave_handle(struct imx_=
i2c_struct *i2c_imx,
>  	}
> =20
>  out:
> -	mod_timer(&i2c_imx->slave_timer, jiffies + 1);
> +	hrtimer_try_to_cancel(&i2c_imx->slave_timer);

Don't you need to check the return value here?

> +	hrtimer_forward_now(&i2c_imx->slave_timer, I2C_IMX_CHECK_DELAY);
> +	hrtimer_restart(&i2c_imx->slave_timer);
>  	return IRQ_HANDLED;
>  }
> =20

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zarilxdvchenwvmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGA/ZsACgkQwfwUeK3K
7AmMfwf+IHEYfSZj/jZrIAjqdJpcQNOQpdbQuztH4HELrqflt6dlHx6395ay3ohD
+OLZ7AP/7Goi5nKJqXAYniixp4IxWmEqdjbL/EBnlNT8jyuVInvCnVaaRsh7hMjB
1O2WiqwSXNLd+kYWoNy9GrKS5TZAnr5KotDd/XWaiNosi96eE/SPguroIvSXG8he
9uFv+Vr4lY58CkcOWJXGoGA0nbXdTyjEfp3QA+XPhNwVAyHF1SvKcnqQcZmOariI
vYSJRxynXBjRSB5BMPLiltkaVb6gWmoOOWcgvj/ngwpYUjOgAv/YE16K/IYVCNQb
Yq1rlVS9YgE3pUeRwL/ZEayyLC5IuQ==
=ys/d
-----END PGP SIGNATURE-----

--zarilxdvchenwvmy--
