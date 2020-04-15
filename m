Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591DE1AAE54
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 18:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416087AbgDOQbZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 12:31:25 -0400
Received: from sauhun.de ([88.99.104.3]:56514 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1416070AbgDOQbW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 12:31:22 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 097A02C1FF1;
        Wed, 15 Apr 2020 18:31:21 +0200 (CEST)
Date:   Wed, 15 Apr 2020 18:31:20 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Message-ID: <20200415163120.GC2830@ninjato>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline
In-Reply-To: <20200324191217.1829-2-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 10:12:16PM +0300, Dmitry Osipenko wrote:
> Boot CPU0 always handle I2C interrupt and under some rare circumstances
> (like running KASAN + NFS root) it may stuck in uninterruptible state for
> a significant time. In this case we will get timeout if I2C transfer is
> running on a sibling CPU, despite of IRQ being raised. In order to handle
> this rare condition, the IRQ status needs to be checked after completion
> timeout.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-current, thanks!


--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6XNtgACgkQFA3kzBSg
KbYgpw//Tp3dEVOrTD0EDeh5adYZ7oZJ90mS77fM9WqydszpDRrl235F9X6YEGt1
y6DZ6YgwGAYBOPRym13VHYm9fgKwXrRA/zjBO7AEN/ZT4+zKy/z1Yh3rw+BJxtNC
bqVjnRiIm+7bgN9bdo0NV82HWu/a/4GxQ695udZ+SZt07Z2ohDHx2qwbpPCEJHdb
wPH+DipJJI18iNWuKep4+p5GaoKqx7oEqqfghhVVBWDEEc5fPJ/IgtsXCxYwkKjR
8dbe6X3X6dK5VxL9mxBbmP4wJp6S/3/EpD2qmX9TKN/o87W2+v8KxSsj6VuBNcnZ
OU2f12d1HrEnhAc6XYAZuIWGAmAP9DgIofXF9Aep4WCy/aBQ2zeXrUbwKyEmS5jT
ZnMWrGbR+Ir9fNznmMd+oQwgLsrT4qJpr15l2uXp711XjYeshCHNMOfonHgQk4Wi
nRzQkMon/1DbzCBvjwoWcAEJG+faZdxjdOMG0vOJK74DIa3xxTUO/Ws9GmJQBtBs
ulGhzNuVuJyyzduJAv/dRweh7gJ7ARl21IoGDEUbWwX/0j2X830H8pvXwQlRfaIh
uida9TnFVG2IY3AHpZOsadGLCZycDY1IoJ9IJ8j68aljMxCNrz2KrLL+HRxdTl7a
Lyd0PTmyKHp//FdcUCu0GLnM5JufUjSIKM3vc+tyjRH8e2CskWw=
=+7O0
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
