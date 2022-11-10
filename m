Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 437396244E9
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 15:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbiKJO51 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Nov 2022 09:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbiKJO50 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Nov 2022 09:57:26 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E626F12748
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 06:57:25 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ot8zV-0005Wm-6c; Thu, 10 Nov 2022 15:57:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ot8zQ-003TM9-VH; Thu, 10 Nov 2022 15:57:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ot8zR-00Ff2y-40; Thu, 10 Nov 2022 15:57:13 +0100
Date:   Thu, 10 Nov 2022 15:57:12 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     ye.xingchen@zte.com.cn
Cc:     linux@rempel-privat.de, linux-kernel@vger.kernel.org,
        chi.minghao@zte.com.cn, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: imx: use devm_platform_get_and_ioremap_resource()
Message-ID: <20221110145712.okxjbawfchp3tfje@pengutronix.de>
References: <202211101723428058432@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gocmzz3lynp2xdw6"
Content-Disposition: inline
In-Reply-To: <202211101723428058432@zte.com.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gocmzz3lynp2xdw6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2022 at 05:23:42PM +0800, ye.xingchen@zte.com.cn wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

As res is used later, we cannot switch to
devm_platform_ioremap_resource(), so the patch is fine.

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gocmzz3lynp2xdw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNtEUUACgkQwfwUeK3K
7AnaYAgAmhjSkv4KrIJ2g6QL8j81Wp8sZgaf/WPCJSZOqfALZok8OflVlj5bi4jh
XPF4VFUdNPRZI4t0IwQlN0/QawnMlGAkHf4TQAWzOM5/W632zb9zTggP2evCBBp4
5zY+omZJn/lizRGjU44+YqXGpu0KSIQJQmgzDDdx44139LgrjcA0vDaoG9ta1t7k
YJEBYZCP2tloATV5Q4opK96MQEHvbKyDMRv0bPouBbEkauHkWO6bhaOthE1ZCzjW
llaYYFyF0uFl1KruiZoZDHxPO30QR530W9V3pEcPlaxzihH82FTZuzxRgvbzed0q
UfB7n1LsVMiujx25c1t0bJsaVYmiNg==
=1TYz
-----END PGP SIGNATURE-----

--gocmzz3lynp2xdw6--
