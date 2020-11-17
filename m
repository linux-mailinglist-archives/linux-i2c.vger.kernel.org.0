Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB3F2B59F8
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Nov 2020 08:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgKQHBr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Nov 2020 02:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgKQHBr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Nov 2020 02:01:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCC2C0613CF
        for <linux-i2c@vger.kernel.org>; Mon, 16 Nov 2020 23:01:46 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1keuzm-00050L-VY; Tue, 17 Nov 2020 08:01:42 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1keuzm-00076R-3M; Tue, 17 Nov 2020 08:01:42 +0100
Date:   Tue, 17 Nov 2020 08:01:40 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     wsa@the-dreams.de, shawnguo@kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] i2c: imx: Remove unused .id_table support
Message-ID: <20201117070140.mtkwuxfb5gb5olg2@pengutronix.de>
References: <20201116202910.30061-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yixxt7vw6tnuqqvr"
Content-Disposition: inline
In-Reply-To: <20201116202910.30061-1-festevam@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yixxt7vw6tnuqqvr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 05:29:10PM -0300, Fabio Estevam wrote:
> Since 5.10-rc1 i.MX is a devicetree-only platform and the existing
> .id_table support in this driver was only useful for old non-devicetree
> platforms.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yixxt7vw6tnuqqvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl+zdVEACgkQwfwUeK3K
7AmkHgf+OGadHZJiUOk9Ybo29WPl/0gGHF8l8V5k0eTCbThvhyeu7T/Dd1NCA78N
aaEZReeDKcvNu0xdKwIv0hRUxpOIaeSRVC55E4Y7h78bEQc8lHuc7FDe/A0YBEzj
t6zsqqlTEHfvA3b7K8L6hUgbGZwFgXYDJ9GfsiIFaxFbMn+4buM6xApVMcEqUFtZ
Us+w6ESWnFnGWEJrO5421DGX5/sMI2DiL2rN5KZzMeVh3ZkDDsYY13fKpfIZhuOf
BLbPBWp48UFpwoQCQ1WzvqMKpaDUja5kdIXeKsWm+9fm9DqydzD16ZB7srg3cgTc
xMvs4N8FjV71H53ZxfQfn6n0YdI/eA==
=kZdb
-----END PGP SIGNATURE-----

--yixxt7vw6tnuqqvr--
