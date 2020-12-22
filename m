Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10AD42E102C
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Dec 2020 23:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgLVWZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Dec 2020 17:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727245AbgLVWZu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Dec 2020 17:25:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B80C0613D6
        for <linux-i2c@vger.kernel.org>; Tue, 22 Dec 2020 14:25:09 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1krq5Y-0000Ih-IY; Tue, 22 Dec 2020 23:25:04 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1krq5W-0001Xi-0c; Tue, 22 Dec 2020 23:25:02 +0100
Date:   Tue, 22 Dec 2020 23:25:01 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux@rempel-privat.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: Re: [PATCH -next] i2c: busses: use DIV_ROUND_UP macro to do
 calculation
Message-ID: <20201222222501.bt6gb5uawtyzcvew@pengutronix.de>
References: <20201222133131.19525-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n3nnb6cwivgwbyvq"
Content-Disposition: inline
In-Reply-To: <20201222133131.19525-1-zhengyongjun3@huawei.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n3nnb6cwivgwbyvq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2020 at 09:31:31PM +0800, Zheng Yongjun wrote:
> Don't open-code DIV_ROUND_UP() kernel macro.
>=20
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

LGTM,

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--n3nnb6cwivgwbyvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/icjsACgkQwfwUeK3K
7Al5eAf/b1Ub67I8df7niqYSRLlKZGM92Xc8nzWFfJ4Df3CPEB/gCr3XcsHjlBrL
CsbFPJ83UTLQ+bETIA7JigTVaL/WjqWqju8kHXIpt2H4sim1R1JbKMzwJ1z3MbyS
cGeFYhKWjlSW7f0eGL5NaWWQUKLt/UgmPMW4M1xN+JH4k92UI7IdAqPD27wnp5RS
1cO6C29v+/6PHkhPmQ81cqr1eqRJMUEPXC3NtcfwAZzzRd16WB3rijl0ceJCltXf
o7NdjLHEFg9tfh02l7H9Q7ZL1R58s3Q0cTDnh6q8unl/JEfdgQTBGrGSFk7IaSE/
EV2DNG1zdpDZvqziifNNm5dys7VW0Q==
=JO8M
-----END PGP SIGNATURE-----

--n3nnb6cwivgwbyvq--
