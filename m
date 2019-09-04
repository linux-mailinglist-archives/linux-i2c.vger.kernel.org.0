Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E60A94BA
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 23:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfIDVNP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 17:13:15 -0400
Received: from sauhun.de ([88.99.104.3]:46222 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbfIDVNP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 17:13:15 -0400
Received: from localhost (p54B337F1.dip0.t-ipconnect.de [84.179.55.241])
        by pokefinder.org (Postfix) with ESMTPSA id 3AE8E2C4F2F;
        Wed,  4 Sep 2019 23:13:14 +0200 (CEST)
Date:   Wed, 4 Sep 2019 23:13:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-i2c@vger.kernel.org, tglx@linutronix.de,
        Benjamin Rouxel <benjamin.rouxel@uva.nl>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: exynos5: Remove IRQF_ONESHOT
Message-ID: <20190904211313.GD23608@ninjato>
References: <20190813115555.10542-1-bigeasy@linutronix.de>
 <20190813115555.10542-2-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline
In-Reply-To: <20190813115555.10542-2-bigeasy@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 01:55:54PM +0200, Sebastian Andrzej Siewior wrote:
> The drivers sets IRQF_ONESHOT and passes only a primary handler. The IRQ
> is masked while the primary is handler is invoked independently of
> IRQF_ONESHOT.
> With IRQF_ONESHOT the core code will not force-thread the interrupt and
> this is probably not intended. I *assume* that the original author copied
> the IRQ registration from another driver which passed a primary and
> secondary handler and removed the secondary handler but keeping the
> ONESHOT flag.
>=20
> Remove IRQF_ONESHOT.
>=20
> Reported-by: Benjamin Rouxel <benjamin.rouxel@uva.nl>
> Tested-by: Benjamin Rouxel <benjamin.rouxel@uva.nl>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Applied to for-next, thanks!


--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1wKOkACgkQFA3kzBSg
KbbOxw/9EUb9woFTGUxe6ImqXADvpNauUqMh05cfQpJGMfjpUytL/g1lrBAAm0A0
+tLIIgCyZKQsGtR+iih+MaKOjiC5DySW9AqW7zi6+Omv038Ao1AH+LC37SHSEClC
V6OHVdwC0HsbrapAJouW3rWKxxSps17jR8AgD14fIuXCZVYIGzE9etuIOGiYXkX+
CLFL8CbvJ0mWR6+4dccjrwsFSoHRG4Rd6+iWUVUBhsBqFgnzoynYx3tkezDO5EWB
UDUZSmwdVPeq/Xh2VW5QMidJJvnp41xM3GG0Py33xtFPyUN23y4Btqom3WzcO/Ah
A2Nu5S/r7JCcGmJn8ihDbZlAAuXFU3OLrd5muR2YGPd7Z1N0L70cCUdFEW7GBjcF
djUc2qexgoJ/nOqih7+cAD/mCJ1M/HOfw28dMyfeFgMDEu50uBYrjkmqx+wRqlU0
SrRD29cx3SzswBguafeFgdceCJ/aueTfC5s4rHA+pTZTDOAz+eoENAjkSsUvoItb
FySGQNZsFRgHOzevsWozH9F+ypMvU2Afy1kjNe9j5WN4Nf3+sszdwG8Eauib4im6
DtI0hfLsxjLE//S8wQX4b0PZEzXAAdkD8zUzDfFHO8QkNy+2X+a6RW2DlmzKKQGJ
kCHidGDSxLDUU0HzrejvjtUjbwq3DNn7zM9QNk91daq9SjsKBuM=
=mqXe
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--
