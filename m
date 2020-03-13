Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8CB184940
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 15:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgCMO0a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 10:26:30 -0400
Received: from sauhun.de ([88.99.104.3]:52422 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbgCMO0a (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Mar 2020 10:26:30 -0400
Received: from localhost (p54B3314F.dip0.t-ipconnect.de [84.179.49.79])
        by pokefinder.org (Postfix) with ESMTPSA id 9A2C72C1ED4;
        Fri, 13 Mar 2020 15:26:27 +0100 (CET)
Date:   Fri, 13 Mar 2020 15:26:27 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Joe Perches <joe@perches.com>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH -next 010/491] ARM/SAMSUNG EXYNOS ARM ARCHITECTURES: Use
 fallthrough;
Message-ID: <20200313142627.GF1852@ninjato>
References: <cover.1583896344.git.joe@perches.com>
 <1d569e023b6cb7b8d0da8d1bcccd92e97fe436c8.1583896348.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NQTVMVnDVuULnIzU"
Content-Disposition: inline
In-Reply-To: <1d569e023b6cb7b8d0da8d1bcccd92e97fe436c8.1583896348.git.joe@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NQTVMVnDVuULnIzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 09:51:24PM -0700, Joe Perches wrote:
> Convert the various uses of fallthrough comments to fallthrough;
>=20
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390=
fa.1582230379.git.joe.com/
>=20
> Signed-off-by: Joe Perches <joe@perches.com>

Acked-by: Wolfram Sang <wsa@the-dreams.de> # for the I2C part


--NQTVMVnDVuULnIzU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5rmBMACgkQFA3kzBSg
Kba47w/+Lo0vuKn419fTKoi1bZI+iu4cVPczancfBFTyBaGwu2WxMvlfsZPZaWSQ
ZA0DwyJV/q7C5PiEXjkNhIAK9txlsUpVTcXrmki5X4Z3hG0k5D4HjP0i+6GtqsvX
yNpn8ebcK94e7HGKwN4Qg16jrh1hy22dd+Bcs7P2wb0zOpv2+VrL8n4ORXZVdSr9
RjSySKHXxDTTfBpQ+Fe9IHH3ObWFNH4ydniXhiDy5hAZUwYmkm4Lrv0ul5OCglwF
08LgjIkidixle3PEylgSVE2896WnDF3EgmDrO72uPXunarBbgFz+KaYeEnTTndvO
s2+fDykbBZye6kNZy89svJ+ljjbqLr5lIgGc/MiAIviJJ7qlq9MS7kWVCvjSROSL
G/9S5vjw4bxJhobzBmlZbW339Ki3UJDnMYJmGC5zv2eROAKHa3Hw/JXocUvsbE+v
LbXKVUm4cAMcL6ld0MXYBlDQasGcErb5HSk4huMr0Ye9/pyqycDrg788A2cW29/A
GovnQqR9rjJ6ebqHAOrFqPf2PnWvfqHqz01/zMyjOW1hYVEdfkH9EjFnuPjI0Ue7
PLlXv2NS+iSe01qRJaDCR+afknfWHEnCcEJCdua5/cvTFy6Q4MP/jGrod4ZCe7fV
yd/yi39OamvOtixkid1R84VFKuSrufZ30TYpeoaUTL6IcAdKl0g=
=3+s9
-----END PGP SIGNATURE-----

--NQTVMVnDVuULnIzU--
