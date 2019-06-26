Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBDAA56A78
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbfFZNbP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:31:15 -0400
Received: from sauhun.de ([88.99.104.3]:56196 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbfFZNbP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:31:15 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id 36DEF2C0114;
        Wed, 26 Jun 2019 15:31:13 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:31:12 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: sun6i-p2wi: Add YAML schemas
Message-ID: <20190626133112.GI801@ninjato>
References: <20190611090309.7930-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline
In-Reply-To: <20190611090309.7930-1-maxime.ripard@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 11:03:08AM +0200, Maxime Ripard wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>=20

Applied to for-next, thanks!


--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0Tc6AACgkQFA3kzBSg
KbYFIBAAn90YIJ6WnfHlOWYekdGKw59XB6kiuS9WYVF9MaVxtzaV2fSMT8HHP5bq
IBShQCsa9dIEwYQy0tRoHMVneJ8+2/sy/tH72NPBn/2bT9cDnftMJr+Z3Yje3Oyt
o6+wGiI/2isqmbP4VmcLT21ymS9qXNk+WngA7j6tBaIkgxLPbANOIYsOcFcITo2Z
2eUj/22BvqqI28DEmQ/5oqUd1TBh+z9Cmfr6J9PzG8YPJJVvsz9gYt3NOYOXWBaO
p6rJ1rcD3hww2abwSLX3h9LEviG8UM1HzpO4O0Ob0T40GkhrvCOLtJsYBbwGEbob
IF/FoVOW030itSX1kRvOY1diiGgIk79zmiwGOrmPT/rzLXaHA5yfMDKL2wI1TAVA
/84zp8P1e6kzwplGF/Qj3b64+ZOvJmo+WejV+Xo/2Dq6Lu3ZvA7TUPDQwjVZE8tx
vL3S3/1R5RNXRmvyknypcitsymSRWBnwIWW8aQlzMaKaH0pfHnImNNS4IamViOkP
qc/PHfVXb0uTkJjFWu60iFhGBVReBzHorbC+1Ll+vcR1n7bKLwT6m6pp5pbOwmOM
hUiXm5vRN7HqT4mO0kUK+utR5JPuiKxHat1e/bAIWxARUswpkKDLHZhEPJ8U1B+w
F7RbsEfjeopQ0Eo/XID0hLdLC/qlS3KS6l5Re3dhU8yEgDmnghM=
=kX9l
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--
