Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D90256A45
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfFZNUp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:20:45 -0400
Received: from sauhun.de ([88.99.104.3]:56086 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbfFZNUp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:20:45 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id D88E52C0114;
        Wed, 26 Jun 2019 15:20:43 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:20:43 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-i2c@vger.kernel.org,
        =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
        Jan Breuer <jan.breuer@jaybee.cz>,
        John Crispin <john@phrozen.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 2/2 v4] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C
 driver
Message-ID: <20190626132043.GH801@ninjato>
References: <20190617083117.1690-1-sr@denx.de>
 <20190617083117.1690-2-sr@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Content-Disposition: inline
In-Reply-To: <20190617083117.1690-2-sr@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 10:31:17AM +0200, Stefan Roese wrote:
> This patch adds a driver for the I2C controller found on the MediaTek
> MT7621/7628/7688 SoC's. The base version of this driver was done by
> Steven Liu (according to the copyright and MODULE_AUTHOR lines). It
> can be found in the OpenWRT repositories (v4.14 at the time I looked).
>=20
> The base driver had many issues, which are disccussed here:
>=20
> https://en.forum.labs.mediatek.com/t/openwrt-15-05-loads-non-working-i2c-=
kernel-module-for-mt7688/1286/3
>=20
> From this link an enhanced driver version (complete rewrite, mayor
> changes: support clock stretching, repeated start, ACK handling and
> unlimited message length) from Jan Breuer can be found here:
>=20
> https://gist.github.com/j123b567/9b555b635c2b4069d716b24198546954
>=20
> This patch now adds this enhanced I2C driver to mainline.
>=20
> Changes by Stefan Roese for upstreaming:
> - Add devicetree bindings
> - checkpatch clean
> - Use module_platform_driver()
> - Minor cosmetic enhancements
> - Removed IO warpped functions
> - Use readl_relaxed_poll_timeout() and drop poll_down_timeout()
> - Removed superfluous barrier() in mtk_i2c_reset()
> - Use i2c_8bit_addr_from_msg()
> - Added I2C_FUNC_PROTOCOL_MANGLING
> - Removed adap->class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>
> Tested-by: Ren=C3=A9 van Dorst <opensource@vdorst.com>
> Cc: Jan Breuer <jan.breuer@jaybee.cz>
> Cc: John Crispin <john@phrozen.org>
> Cc: Ren=C3=A9 van Dorst <opensource@vdorst.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TcSsACgkQFA3kzBSg
KbbVeRAAq2VdDTVPUkvcaJs8v6Ec+lC5k6bVROFDh8rsLJc+iufbIVRiRK1TSC5x
17sqxHn47WC3h8ExJQiijxKWr5OTX1E4Sjf/aLa3TBOMfhnOyMMtj6CILTdBCGkI
u1UUnvId3qwqLleTMW3OMbS0Ae+3OPs792iSCa+PhDUzGjroiKMUUYinVw9fD24o
zCCXhInOM8ljckzOrkIFV5jJDbCCEPvoeZoWqF8ltOUV+0m1zGB6Q9L+wHRcW94M
sYbTBB0YFnZSpD6aP2t+V+fUMbHTn1LuCEwX4P7Kj9XNqeNYDIKd2eGyt99cMI30
eaIrOpBc8T2b4t9m/Y6Yls3FYgaFjrqqaIqTO7zhRq9Zknd6msHw2rjcI3V58N99
F5yDxhB2kkc79VXh1eSGYUr7T4Kbbd939azh1aKscGNXrywgT0pFQxonYeaOE5i1
UWrTZCmLUb9B9E46AgF++J2GYJYTVwQhwr0sR8g7CQA4kNTLZCJrDGkCJciMkgZX
eY4GUa0v71JcOzRO69YXYsMP8hBM178NP31iTWmaqmMGHApVqr47soUva/Wn4RWv
IEL55fEBBX7BNSpTih7I7Hi20f+eFuy5SZJz0mYLYEEnSxGEYlS7E1hFpOvBPY73
ix3oXS56sV/5gf2vdI9u6SAssfpODhL3NWcDw3AjnQARlAdiVOw=
=cCVE
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--
