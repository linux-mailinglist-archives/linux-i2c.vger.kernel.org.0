Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142342EBFAC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jan 2021 15:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbhAFOiy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jan 2021 09:38:54 -0500
Received: from sauhun.de ([88.99.104.3]:57828 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725803AbhAFOiy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Jan 2021 09:38:54 -0500
Received: from localhost (p54b33782.dip0.t-ipconnect.de [84.179.55.130])
        by pokefinder.org (Postfix) with ESMTPSA id D0CCF2C07EC;
        Wed,  6 Jan 2021 15:38:11 +0100 (CET)
Date:   Wed, 6 Jan 2021 15:38:06 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v2 1/1] i2c: mlxcpld: Add support for I2C bus
 frequency setting
Message-ID: <20210106143806.GA997@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>, peda@axentia.se,
        linux-i2c@vger.kernel.org
References: <20210105233347.459-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <20210105233347.459-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 01:33:47AM +0200, Vadim Pasternak wrote:
> Add support for I2C bus frequency setting according to the specific
> system capability. This capability is obtained from CPLD frequency
> setting register, which could be provided through the platform data.
> If such register is provided, it specifies minimal I2C bus frequency
> to be used for the devices attached to the I2C bus. Supported
> freqeuncies are 100KHz, 400KHz, 1MHz, while 100KHz is the default.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to for-next, thanks!


--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/1y0oACgkQFA3kzBSg
KbYsShAAhyAjozlGKV0PpD/PuFb2aUe9bR9FyFpO8qYNKWPNp4RQVI/piID9Knk7
TrPYIQfclgEzVpH7zdpt9XzU6DgAoUOO71H3CbeAhI8KyGuqy/uUrzZLzdfkTZIg
xQzLfsld6wXzNFOAf29dTAiGuFRitQqXWRbUroI7nYObBqPRXVrLX0nG8mzzI1dL
B1IwiR42VInR4bSAsJtKbdhWjIrn47t5jP5YNMcUKRk4rbZ5vgOzj1fVgKiPTzTv
hh2c6KJxTErDLjY2ogNRcF+/qHLqMXW4QD03azlD65DSW+X/aToaUPhfrLoSAjkD
XL97eBPLoMV/bJG0p3UpKWqc346L8tdpZJnCVHUB6VFup80ZmexO2PtI5U3DQCfP
qgWHQvA1XiRCkDX4dZ8R/Qs9dBaEHiEXRxK/9IcG6ha+aojSWKd0HgFNXs2TCeoO
d9R5weBLrjftDULH+VIobxE9kaKO6gynn+MFN1hHs2NxqpkZsFwWw21erFJXG57/
0rVDQOYK0JTB0lPPVAiZrLPkE9gvj247ixAnu2G+afHoXEdlnKxnC6TTos0Adfyb
LX+3MgvB7YjKIRnT0NCxmPa9uCzZO/bl0U3ER5gsOhfK7IhlsrRNNcF89T2lJ9d1
xPRmD1ytR8qC6dBiEqXhLvZHfLa5goP03TtT5wVpP+QQvR16i2I=
=N4hf
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
