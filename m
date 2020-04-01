Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D276D19A4A1
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Apr 2020 07:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731861AbgDAFRS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Apr 2020 01:17:18 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33357 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731849AbgDAFRS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Apr 2020 01:17:18 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1jJVkZ-0005dO-Qu; Wed, 01 Apr 2020 07:17:15 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1jJVkY-0002PW-JR; Wed, 01 Apr 2020 07:17:14 +0200
Date:   Wed, 1 Apr 2020 07:17:14 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Biwen Li <biwen.li@oss.nxp.com>
Cc:     leoyang.li@nxp.com, linux@rempel-privat.de, kernel@pengutronix.de,
        wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] i2c: imx: add shutdown interface
Message-ID: <20200401051714.iz3ophbe2gtqhf4z@pengutronix.de>
References: <20200330121546.23872-1-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kxhumlv5b2iba3ot"
Content-Disposition: inline
In-Reply-To: <20200330121546.23872-1-biwen.li@oss.nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:52:53 up 137 days, 20:11, 145 users,  load average: 0.00, 0.00,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kxhumlv5b2iba3ot
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

thank you for your patch. It is good, but some changes are needed.

This driver has multiple attempts to reset the bus controller to
initial state:
- on probe. In this case controller is reset with  same sequence by using
  I2CR_IEN bit, but no zeroing of IMX_I2C_IADR is made.
- on module remove. All registers are set to zero. Which is not Vybrid
  compatible. In this cases, bus controller on Vybrid is not under
  reset.
- on shutdown (a new one), this is like probe, but with zeroing of
  IMX_I2C_IADR.

Why do we need to zero IMX_I2C_IADR if we do a controller reset? Do
reset is not enough to clear this register? Do we need to set I2CR_IEN
back on remove and shutdown? The documentation says:
|I2C enable. Also controls the software reset of the entire I2C.
|Resetting the bit generates an internal reset to the block.

I would assume, we should disable controller on remove and shutdown,
and enable it only for probe case.

Please create a new function and use in all 3 cases: probe, remove and
shutdown. This function should disable the bus controller and clear
registers (if really needed). Enable should be done only on probe.

Should we disable clock on shutdown as well?

Can you please describe, why i2c shutdown sequence is needed on this
chip. What problem is fixed with this patch?


On Mon, Mar 30, 2020 at 08:15:46PM +0800, Biwen Li wrote:
> From: Biwen Li <biwen.li@nxp.com>
>=20
> Add shutdown interface
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 0ab5381aa012..07da42cb0be4 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1281,6 +1281,16 @@ static int i2c_imx_remove(struct platform_device *=
pdev)
>  	return 0;
>  }
> =20
> +static void i2c_imx_shutdown(struct platform_device *pdev)
> +{
> +	struct imx_i2c_struct *i2c_imx =3D platform_get_drvdata(pdev);
> +
> +	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
> +	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
> +			i2c_imx, IMX_I2C_I2CR);
> +	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx, IMX_I2C_I2=
SR);
> +}
> +
>  static int __maybe_unused i2c_imx_runtime_suspend(struct device *dev)
>  {
>  	struct imx_i2c_struct *i2c_imx =3D dev_get_drvdata(dev);
> @@ -1310,6 +1320,7 @@ static const struct dev_pm_ops i2c_imx_pm_ops =3D {
>  static struct platform_driver i2c_imx_driver =3D {
>  	.probe =3D i2c_imx_probe,
>  	.remove =3D i2c_imx_remove,
> +	.shutdown =3D i2c_imx_shutdown,
>  	.driver =3D {
>  		.name =3D DRIVER_NAME,
>  		.pm =3D &i2c_imx_pm_ops,
> --=20
> 2.17.1


Regrads,
Oleksij
--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--kxhumlv5b2iba3ot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEERBNZvwSgvmcMY/T74omh9DUaUbMFAl6EI9IACgkQ4omh9DUa
UbMuKQ//V36wWPSodbonhJGQXf5sXi3eZrSHrrwlYSF/MYiVCrfCTPmEKCkILSJv
jWValu7i5lvhDmtsz/NFLdqR14e+cf9zbXVB5pKdSdqLhzJ8FgJxRUx6wBd25nDn
iI7pGxSZbBqs3pPp9tJgRi8op5pmCTr4nVb4lcKtCnjjoEgrZQGai1LBPIPF4u6d
z1vWvsYwjyJwv1oArOqRGGshAdbSAWosdc10xcHNcXrqSF2JrrKiFGn9Yv5IT2yH
M1OZkVBbAFQQM+SxU4Nu+qmOF1qdqIB/3emmncQCUr3BnLkfXsF5yMAzT80Z0+D/
Fk3OwqH55WG9yaiLqSqHkvBhHKnfigDAZCrSsB8PY78hIrcFRG8bnvRmcZS5zlsV
V7P4WAoSPN1NvXz4nQLZ8/nCBHa0jqwS+DaHlKEF1py9a+HuJ2gVvSjnGmGcvlnB
Nh0qZajeBlLW/RX6oGdhEatRQFucETKeN4f1FpV46H10R9TpUvvd5HF3tpsut2z0
9wkdhOSLOUKxnMR8KspMzuD7/w/n3DZX96CsMLSaSMto0oZwggjQMnsBXt8C6WFJ
UvIJQbvUdW19yeZDrgOXtAza5nBaUyXD7soaHSmg1AcZxFc4YItv53Dmy0t5EfJM
3Frx9/yeLknGi25YqQg14A3Eq+Ymtp98bp/m41V1imbKfSsb3ws=
=ITXi
-----END PGP SIGNATURE-----

--kxhumlv5b2iba3ot--
