Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C43B2CD0BF
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 09:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729918AbgLCIDx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 03:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgLCIDx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Dec 2020 03:03:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81141C061A4E
        for <linux-i2c@vger.kernel.org>; Thu,  3 Dec 2020 00:03:13 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kkja4-0006Gh-17; Thu, 03 Dec 2020 09:03:12 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kkja3-0006fN-LC; Thu, 03 Dec 2020 09:03:11 +0100
Date:   Thu, 3 Dec 2020 09:03:11 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] i2c: pca-platform: drop two members from driver data
 that are assigned to only
Message-ID: <20201203080311.kpomqeeqvjr3pjef@pengutronix.de>
References: <20201123202746.2817480-1-u.kleine-koenig@pengutronix.de>
 <20201202155701.GD13425@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rslnat7clqcwp3bx"
Content-Disposition: inline
In-Reply-To: <20201202155701.GD13425@kunai>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rslnat7clqcwp3bx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 04:57:01PM +0100, Wolfram Sang wrote:
> On Mon, Nov 23, 2020 at 09:27:46PM +0100, Uwe Kleine-K=F6nig wrote:
> > io_base and io_size are assigned to only in .probe() and otherwise unus=
ed.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> My very first driver :)

Just for the record: I was never Wolfram's chauffeur. I guess he meant
that the i2c-pca-platform driver was the first i2c driver he wrote.

SCNR
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rslnat7clqcwp3bx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/Im7wACgkQwfwUeK3K
7AnvAQf/d5ehLH39FwtwNDp25SNw2i7LO7FLLdun+qBdH710HJh2GlA/ZUGCgDmB
nQigVGb7gwq/YcpYn6ufRHKmPEiyTR0FPE4yDTXbzH4Y/tP9BRP33OfgDKz6aG1j
obj54tWtpF+i8PU+3z5Y0kllgsrwKGLISesYVCOY/JPM5AZ06Z4XzqJvav4mcBp7
XNDs6zZo3E3hR96SUKsGRxVnYfQPgipHVScvx2BM1vg8ucRu8UXBn+etVKKJ/xZ9
RAr+//uHHStuBGeTCtglckq77eglXduCK8k1Wmkw0o7HgTqv+Pwyeuc0FkyyeLQy
jmmqdG+L5n3E2W+4jrjY18dKmjIZyQ==
=9kao
-----END PGP SIGNATURE-----

--rslnat7clqcwp3bx--
