Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC206242503
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Aug 2020 07:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgHLFju (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Aug 2020 01:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgHLFju (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Aug 2020 01:39:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7479C06174A
        for <linux-i2c@vger.kernel.org>; Tue, 11 Aug 2020 22:39:49 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1k5jUH-0001vV-48; Wed, 12 Aug 2020 07:39:45 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1k5jUF-0004fV-F7; Wed, 12 Aug 2020 07:39:43 +0200
Date:   Wed, 12 Aug 2020 07:39:43 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] i2c: imx: Use dev_err_probe() to simplify error handling
Message-ID: <20200812053943.oeiqz57turtdckal@pengutronix.de>
References: <1597203954-1803-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jijteoo6ouqerxuc"
Content-Disposition: inline
In-Reply-To: <1597203954-1803-1-git-send-email-Anson.Huang@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:38:58 up 270 days, 20:57, 245 users,  load average: 0.02, 0.03,
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


--jijteoo6ouqerxuc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 11:45:54AM +0800, Anson Huang wrote:
> dev_err_probe() can reduce code size, uniform error handling and record t=
he
> defer probe reason etc., use it to simplify the code.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 0ab5381..63f4367 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1159,11 +1159,9 @@ static int i2c_imx_probe(struct platform_device *p=
dev)
> =20
>  	/* Get I2C clock */
>  	i2c_imx->clk =3D devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(i2c_imx->clk)) {
> -		if (PTR_ERR(i2c_imx->clk) !=3D -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "can't get I2C clock\n");
> -		return PTR_ERR(i2c_imx->clk);
> -	}
> +	if (IS_ERR(i2c_imx->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_imx->clk),
> +				     "can't get I2C clock\n");
> =20
>  	ret =3D clk_prepare_enable(i2c_imx->clk);
>  	if (ret) {
> --=20

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--jijteoo6ouqerxuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEERBNZvwSgvmcMY/T74omh9DUaUbMFAl8zgJYACgkQ4omh9DUa
UbPa5A/+KlXDbb1pvMrWyT66unEtS9yFMs/oh2Yc4sCS/uN5d5fwEEcI+GRYqOxi
IEpHJ/sihFh32RVMbY+YaL1RAcWOy8yZiYjwxCiWc6EreWsziuoC54gr4XAuH/h5
mE2c0GKyrbr1jkBCh4rCWQvQSyopjnNNFVE3Xwq4gfl18//NCYfBccWJ86tJ4ZS1
TKBOxu26BDbaqFo1xKuZaEQdtHY8ICnTrMtopOVFfH3Sn/BHn0en4KnyJ1oGdtbP
8T5z4P0ML4IOaaorGmgPdvBwyEpSTLsuhrqpeC86t1EFw6yowZ5XQx34HETFvKPY
AhbUE2m1d8ljKx3itj509+1lWamDVgFGZf0y1i+m/ihuLhfZca9cUjc9tDcduVSh
PpVE9127XsM66aBRGQogMunu/G4qRshOp7Ockm+DoHaOaaqXr530MnYzCJJS1QqV
NExxl7sHDaZ4Um0JapMc5ulinMOsK8kN1wJk4+/4Yxf/QBubcPS1cadmkTZQz+3V
bQZBUccWCPuDG8HvDrLt1+xUsfyn6JMHSgDUpaxEer9zJZXIuOCbhMwLY/XORea0
Xb2Ck4vcPrzKt6WE+/DugxN7k2JbTCzw5JxovT8WyFWSsVGQDIu4o79a90bZQI6c
vAvMBDQZtlM4WsASHmHN6o+sBJiWe/9WGMsaBInRwRW6sP7Vcto=
=MZ2A
-----END PGP SIGNATURE-----

--jijteoo6ouqerxuc--
