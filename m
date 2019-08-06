Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B32983A75
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2019 22:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfHFUlL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Aug 2019 16:41:11 -0400
Received: from sauhun.de ([88.99.104.3]:36628 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbfHFUlL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Aug 2019 16:41:11 -0400
Received: from localhost (p54B3324E.dip0.t-ipconnect.de [84.179.50.78])
        by pokefinder.org (Postfix) with ESMTPSA id 4A2442C290E;
        Tue,  6 Aug 2019 22:41:09 +0200 (CEST)
Date:   Tue, 6 Aug 2019 22:41:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     wsa+renesas@sang-engineering.com, orsonzhai@gmail.com,
        zhang.lyra@gmail.com, vincent.guittot@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: sprd: Change to use
 devm_platform_ioremap_resource()
Message-ID: <20190806204108.GE911@ninjato>
References: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
 <29fa51009a97e6b7d8622190810b7505819ac0b2.1564041157.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline
In-Reply-To: <29fa51009a97e6b7d8622190810b7505819ac0b2.1564041157.git.baolin.wang@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 03:56:17PM +0800, Baolin Wang wrote:
> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
>=20
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Applied to for-next, thanks!


--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1J5eQACgkQFA3kzBSg
KbYoWw/6Ay3QLXDyDjiOR0IQrT5EjvxtPTRSdk7QaFV+xDHgOhkhMABKjV1aojp3
Zh4wX97PPlwNuiICoEXe982xJFHUHN6ntT5yk4JkALOaJdZsfCrjKfM/dYFfElsh
7fxhJHj9aZ60hUOBaKcq5zaiNHhyzUtarOvJ7ehvsAd0MJvc5nB1qut/tj7TNTxy
SMzYk8DVlgwF1OB8lYiV9FXdV6L8YUa8nsTS6prJQ8vcVIS/VnL/xO/j1fHwccOl
70WkpIeJRX3OCR8dKME1X12BTmDeUoVAkGs2UfFrdSZQ37X4QCgcD8oCoBHtdJ+u
50/8NnH92AFJWGl8WVyaNV5l1QfuiIBBRWB6cExdwL0MNKaBeil/eEsxhAEu6J3E
L8qN6Xz0Gb92irtyP60YWGTYLiCCdqSul7XosXwCOficF1ooe0yNdO0W0UIjsvUK
r1PFrQF1KPkztO2f5+BabIy1nqL68ZW47R12461pN5gVEy41NAEVYs2NsFr1zSm1
quT893AuyfADEZwfdiOX5vYpZw8VV1BmJL8OwigLcv4WGwpBAMPkpQoUgrrBl7ei
YWqzCI6Xn86d4et/sT4agRZXu8p0EDPeGYSZvzR7+PySP59eiuR9n+ntZz2kr2kt
MeEo56iYp7TdVBlXBTlOyg9o1JCMZ1DoP9Vxvhk5TYPiZ64dTGI=
=M37f
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
