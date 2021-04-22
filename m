Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892123684F2
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Apr 2021 18:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbhDVQgT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Apr 2021 12:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236459AbhDVQgS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Apr 2021 12:36:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71FADC06138B
        for <linux-i2c@vger.kernel.org>; Thu, 22 Apr 2021 09:35:43 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lZcIk-00069o-2S; Thu, 22 Apr 2021 18:35:38 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lZcIj-0003QK-E1; Thu, 22 Apr 2021 18:35:37 +0200
Date:   Thu, 22 Apr 2021 18:35:37 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v5 5/6] i2c: imx: Simplify using devm_clk_get_enableded()
Message-ID: <20210422163537.skhdsfafweel6sti@pengutronix.de>
References: <20210422065726.1646742-1-u.kleine-koenig@pengutronix.de>
 <20210422065726.1646742-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rta62bqblgeq3fll"
Content-Disposition: inline
In-Reply-To: <20210422065726.1646742-6-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rta62bqblgeq3fll
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 08:57:25AM +0200, Uwe Kleine-K=F6nig wrote:
> devm_clk_get_enabled() returns the clk already (prepared and) enabled
> and the automatically called cleanup cares for disabling (and
> unpreparing). So simplify .probe() and .remove() accordingly.
>=20
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

A propos typos: This patch needs $Subject ~=3D s/enableded/enabled/

Will fix this for the next submission round.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rta62bqblgeq3fll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCBpdYACgkQwfwUeK3K
7AkQPwf/YZqvojGSf/Z3Wd+QijlXwG9Dmubxl3H62+3zMdMXWS9nVKTf6vG+2Ova
g5YxQHa1endIKFYdDXnNncwLzRsvo70AdZb+/zGygRnirPdY++JMueL0cB+4g4kk
G0zGCtuw6LxOznPx/S1cNNeYJNWu943NBVPurcCp8UB6gjfs592l8UiEDZkUP/A0
PD6XUE3byoLT8itXRHl8ae/FyDoQzyLRNI3+9YlIB4i9++TjZPt5DDYqQC/PoLFA
AZN0rTQ9fYsFOdcIIQsMikJseG3HxSEbgS9F1nvfBNR0Eh6jL1rRhg6PuWLOUepp
LqYDxI1+Mh7ELQ6KLzZ4X6bGmWEdsA==
=qzO+
-----END PGP SIGNATURE-----

--rta62bqblgeq3fll--
