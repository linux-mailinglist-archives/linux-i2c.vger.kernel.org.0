Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 021E58D01B
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 11:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfHNJy1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 05:54:27 -0400
Received: from sauhun.de ([88.99.104.3]:47068 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbfHNJy1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 05:54:27 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 93FCC2C311C;
        Wed, 14 Aug 2019 11:54:25 +0200 (CEST)
Date:   Wed, 14 Aug 2019 11:54:25 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH v1] MAINTAINERS: i2c-imx: take over maintainership
Message-ID: <20190814095425.GD1511@ninjato>
References: <20190812050817.23279-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline
In-Reply-To: <20190812050817.23279-1-o.rempel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2019 at 07:08:17AM +0200, Oleksij Rempel wrote:
> I would like to maintain the i2c-imx driver. Since I work with
> different i.MX variants and have access to the hardware, I can spend
> some time on the reviewing of this driver.
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied to for-current, thanks a lot!


--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1T2lEACgkQFA3kzBSg
KbbrhRAAneGKR0f3Txpqt75JZfm8+UF8/uBefRK+GlL/0soGoOY6PewgZ1U30saG
Ikd3B3OKt+30GHob2SkB52Y5j1ABWdk8xYvZYrHnZYGeaQZMWUawbfGNOo00ZE8r
znSeAvWRHUswoV+UhyhjxlElkSa9KrOKZVMDlaGFA1lAVuY5uW7DPRE4ZWfGwW+y
U8oSHeeOZLcAENtbx+qqThwtcED3JTsw+LHg+zRAInVRBChLvL6EQ+FvF3W2fNir
dXP2i7hr+hUCL5hL49w1tNt99bQeC5khfHaq4EEEH+fvaGTrtRklBbQv57PeVDoy
wgncQpNUlMuoRoFBI9gSD3nQNnanDnIT7uDnl+8x6FokTFLlHNlDXitVXVaES5BO
LXa3GRO+UE4SJzRcR0ykKFQOyF0OYLRVj8MMqE+n+TAR38DDDujQyBRHP2n4BMSK
RVZBsftCiykNVWXKxiSCqhbk7brk7juTwBDjpcxYYR43VYxwQJegvD7P1TgCT4es
fxQ6gkD4Mfpd0Bu+87rWGC++tC5eoQPcoSraImfCs8ybIDmW4pXQDAzipB3r1Wux
nth4OPyelsWkXaE8AqtdD9vdJUf5yn0QeXqD7KuTnWWXCeV4kjH4ZsX5S4C5JPAe
t6J4VBlMS/RtuFLFOvI+A/IerBJptsOoQvLwdlGjKzXfErva/N0=
=61CS
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
