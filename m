Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617D62FFEBB
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jan 2021 09:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbhAVIxM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jan 2021 03:53:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:54696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726794AbhAVIxA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Jan 2021 03:53:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B3BC20739;
        Fri, 22 Jan 2021 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611305534;
        bh=i5K8PRu8K6SDis824K4FHNiulT02/Qmgs0OXLuaS/uE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sq6xb8Rqea0Bx8nd2o1FnlhwaLa8KazFhw3Lwf7w6zyWHbkUFatkbT0QVOgsxApX4
         /xwaGeLgw6PgvPRxjsJR59ifS3byh486NC91OCFn9AKDefORyLyTj3mFgYo46c++sl
         Y+PSIko4dMUfylrzjDF57lgFvxn8VSyF5V/UoeKxQ11QRxflpgHkl4dAbKRfJYfO3g
         l5yGALbYsLUNQwW3UmmSiyBMbmy35e3BjfGMP1k6G7/TDrmB4O3LWZsAVxs1rdrMcT
         ag54nHZBOPU9vlXsXW0x2xWyh+dh7M1B7DkLsiOIXcJHWYwNq4X9zlmoZL9ILlOqyc
         7JC7696HPoJbg==
Date:   Fri, 22 Jan 2021 09:52:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux@rempel-privat.de, s.hauer@pengutronix.de,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        Sascha Hauer <sha@pengutronix.de>
Subject: Re: [PATCH] Revert "i2c: imx: Remove unused .id_table support"
Message-ID: <20210122085209.GA858@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>, linux@rempel-privat.de,
        s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org, Sascha Hauer <sha@pengutronix.de>
References: <20210120024123.2534329-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <20210120024123.2534329-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 11:41:23PM -0300, Fabio Estevam wrote:
> Coldfire platforms are non-DT users of this driver, so
> keep the .id_table support.
>=20
> This reverts commit c610199cd392e6e2d41811ef83d85355c1b862b3.
>=20
> Fixes: c610199cd392 (i2c: imx: Remove unused .id_table support")
> Reported-by: Sascha Hauer <sha@pengutronix.de>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to for-current, thanks! imx21 could be removed, though.


--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAKkjUACgkQFA3kzBSg
KbYyCQ/8CFL0ldLzcmKPoCvPXj+93W1eswHMD2eqXW9ayHfJQWrmptkzKblsLWN6
0NyRCmlj12PRxrh4T09juS6vGChnw+fS9ilTyIOOg8XZePelQGPPySkU5AL+jl73
M7INQqjhwglFSLIUn9HFk/BHitIDIHlvMDixU9y1rRI0IMrHE/WBcRi8RcPXBBih
JJU3EkAo/n88pDxzjfFNsYQPiUUhWCKmO3Y7/MnoUpasGvMKGQsT76SDK/pE7oFI
zAEdtMO+yO5ZdgpMzhYH7EpSIQNJfFLJjD7pSaavFylJ/KpodQFnzyZKRIoyvm8Z
KoWzfIhYOxY+aN6sHEb1YBRgraKa5RXUANg6cKIREqQX4z3qNdVuI8qIC+7pGYUo
z/K8rOxSTMJvs+6rkxmnDTAnMrrA/2k3O+5NR28MlBDEOiZ+82KTh+dIK7SPqOwO
yZe5FB4TVFbXZU73VchsLpljxmbsUtMsnCXFUzcvOzkWx1ORlvCMimfr4ZqCBBQ6
txIHAluWWeHGUUP7mqfb3A4wyjYxreGAQfLrMWABwSpCluW7skRi+N1f0EP7OnmR
TQUx5gMujp83ybilNYRouG9UTvgYY5BquoV589OJ1Mvv9vtua8/tIvFPZummafii
olKlOL0/MYovr4KJ0cC4POpaVTI+XM1Nqzv2ijW2k8dYIl4fKbc=
=D999
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
