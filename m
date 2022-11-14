Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A79962847A
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 16:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237000AbiKNP5M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 10:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237306AbiKNP5E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 10:57:04 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34F12ED4D
        for <linux-i2c@vger.kernel.org>; Mon, 14 Nov 2022 07:57:02 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oubpU-0006CS-Vx; Mon, 14 Nov 2022 16:57:00 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oubpU-0007mA-BH; Mon, 14 Nov 2022 16:57:00 +0100
Date:   Mon, 14 Nov 2022 16:57:00 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-i2c@vger.kernel.org
Cc:     kernel@pengutronix.de, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: cadence: make bus recovery optional
Message-ID: <20221114155700.GA18924@pengutronix.de>
References: <20221023215121.221316-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20221023215121.221316-1-m.grzeschik@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 23, 2022 at 11:51:21PM +0200, Michael Grzeschik wrote:
>There is no need for the i2c driver to have functional bus recovery to
>probe successfully. We patch this by only adding bus_recovery_info only
>if we get usable pinctrl data.

Gentle Ping!

>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>---
> drivers/i2c/busses/i2c-cadence.c | 7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cad=
ence.c
>index fe0cd205502de9..cf212b8ffd56af 100644
>--- a/drivers/i2c/busses/i2c-cadence.c
>+++ b/drivers/i2c/busses/i2c-cadence.c
>@@ -1262,10 +1262,10 @@ static int cdns_i2c_probe(struct platform_device *=
pdev)
> 	}
>
> 	id->rinfo.pinctrl =3D devm_pinctrl_get(&pdev->dev);
>-	if (IS_ERR(id->rinfo.pinctrl)) {
>+	if (!IS_ERR(id->rinfo.pinctrl))
>+		id->adap.bus_recovery_info =3D &id->rinfo;
>+	else
> 		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
>-		return PTR_ERR(id->rinfo.pinctrl);
>-	}
>
> 	id->membase =3D devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
> 	if (IS_ERR(id->membase))
>@@ -1283,7 +1283,6 @@ static int cdns_i2c_probe(struct platform_device *pd=
ev)
> 	id->adap.retries =3D 3;		/* Default retry value. */
> 	id->adap.algo_data =3D id;
> 	id->adap.dev.parent =3D &pdev->dev;
>-	id->adap.bus_recovery_info =3D &id->rinfo;
> 	init_completion(&id->xfer_done);
> 	snprintf(id->adap.name, sizeof(id->adap.name),
> 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
>--=20
>2.30.2
>
>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmNyZUkACgkQC+njFXoe
LGSIaQ//Sqx1NmI1DFBC4qTBWmYuROqJ6bJ6g+9JvpLcGIExKUoOK+cr2yMOB58b
s43LL289LcGicJnvWtMZidRwd82Iq3/WMiGxJRNkPqNu/aCTCdvFn52oUdVi+wi1
0xMH7g2A5bkk4eVXUnCDcKJX9cZKV10FquDO5h+fUtSvL4fA0atiTvYm3aFbEbko
1Z32nLf4s1BhLzApeYM3r2fhin0R/w0TPGxfd5AupId9+4s4B57BT7Sl6FgnzhvG
1TwARmlWDCNAr6J2nA5GRctJwniYjvQ2I5V+YAXJb9Jy2SuZ/pMatfpoKXY3MQw7
F902tJ6+mt/wotxS7zzZsHe65KOV0BcMKl15SiDyAfz+5bYdoawqedkbvh8/erqy
epNZf+erjhE1HMcrvIgjpvTPnhplXTLcMqZemQztDIZfPjXLFKxhsCGsCVlbOpQk
22447Bqr0FRKVzsLEbC3I62cJsJpqQEgpExMZASIDFbOriISLWbLHNt+NRPxsq/n
MuDzESD99KD4XlYmOI1YbmnZOWnqH0wtrlze+lyozT+nO4FjUamvG+71U02q7q1Z
FbdTWJrm+hnk3He9HwBfeOgP93D067MQtxt+x3LPP1ts6a4LJaMJziCTClzvTUGV
22ZjiJvyyFMQ86H1RTTNXF1zUhAB3Z3+d0XARJDt8nWjiBb6xpU=
=Gepw
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
