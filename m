Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 230BA8D034
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 12:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfHNKC1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 06:02:27 -0400
Received: from sauhun.de ([88.99.104.3]:47126 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbfHNKC1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 06:02:27 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 5060F2C311C;
        Wed, 14 Aug 2019 12:02:25 +0200 (CEST)
Date:   Wed, 14 Aug 2019 12:02:25 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        linux-i2c@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Chris Healy <cphealy@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v1] MAINTAINERS: i2c-imx: take over maintainership
Message-ID: <20190814100224.GE1511@ninjato>
References: <20190812050817.23279-1-o.rempel@pengutronix.de>
 <20190812064811.427cy7ahim54odkk@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Content-Disposition: inline
In-Reply-To: <20190812064811.427cy7ahim54odkk@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Even without this patch the generic "ARM/FREESCALE IMX / MXC ARM
> ARCHITECTURE" entry matches the i2c-imx driver.

It matches, but it didn't work well, I am afraid. Quite some IMX patches
in patchwork waiting for attention:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=&submitter=&state=&q=imx&archive=&delegate=


--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1T3CwACgkQFA3kzBSg
KbajTQ//VgglyM7CZxyc+Ld+REfPtwJNbH4MOU3yt3/ZblEZli85uYDYMuJvdPvA
8ujNPD7em/qfmwlnrhzNOCeNmdwGXFcs+T9e8qKwqZIazJ/2xZ11Ub9KeR5gixk+
+udm0DqRtnx5q019zanKGsuXsNDIjyOCKOkcU0v+dA4qZVw7cEv7OECGvMg6Z0gM
UyW9Qp0l39DsKJqRdwT/ei7K+tQl6slFi1kpMvZsiIEX+GIUK4nCHdjnc86uAIoZ
82ZlrciTgBMmMAqydTFOdGkp6NV3+2iiSZ/58Kqj2THHGVo2VxR2eMUrLyNn2Z1O
GPid13ndoVd6DOuevS6Bn/E1OovR6hIeZ3PetslltKmW/XKRbWwXsyayQxyH1Tqb
Jsey2AN8YXmNPKNyTUnYTKg6zkvvvtfCvrtKMIlAvEIEEQd1KShBPpEbPUqlLUv8
6XnmQsjuuiDytZAETbdOs3edV/hZJebz9/WH60qJlXmAzFLdnLgcn7Mv2zlZh6jn
wkLE3CEa+JG4hcYgzMsL68I1ccwXM8yVuzKOrEVuFILNjgA47yJFYqwb5f7eLk3G
wHuIN15QyeJ5LWslyr1LsSP7ekGq18qYKTvf8/qNx0nFF5w088AlKunLVoAqJwlI
TwoMZhdY0qfi3SGXmUQEt3oz8i9d1pW0nK/maZqmXS/I6Vp6UKw=
=m4xx
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--
