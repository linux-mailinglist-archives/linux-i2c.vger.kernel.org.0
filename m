Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD774224B
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 12:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732076AbfFLKVs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 06:21:48 -0400
Received: from sauhun.de ([88.99.104.3]:58186 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732038AbfFLKVr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 06:21:47 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id EA9564A1203;
        Wed, 12 Jun 2019 12:21:45 +0200 (CEST)
Date:   Wed, 12 Jun 2019 12:21:45 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bitan Biswas <bbiswas@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Dmitry Osipenko <digetx@gmail.com>,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V5 3/7] i2c: tegra: fix alignment and spacing violations
Message-ID: <20190612102145.3mqqypv4rnnazvzi@ninjato>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-3-git-send-email-bbiswas@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b7sla4kzaeii3ty7"
Content-Disposition: inline
In-Reply-To: <1560250274-18499-3-git-send-email-bbiswas@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--b7sla4kzaeii3ty7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 03:51:10AM -0700, Bitan Biswas wrote:
> Fix checkpatch.pl alignment and blank line check(s) in i2c-tegra.c
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-next, thanks!


--b7sla4kzaeii3ty7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A0jkACgkQFA3kzBSg
KbZk5g//U8gjLwP6Dt7BbOe6+mSEEBv0AIzOxtmWYpKyFKc5A5ex8IUmr/I79uQK
t74YBX5dq6Ub8/6JLmZOXrpm8GJrN59il3dEChmjMMltuU+DuT2SrLIGfdZ3OgCR
4xXTOJaM4fiiHE/20Qrq9Dz4/n8pyOuGViPpdeo6uWEL5ofTiDEIkwp5wFMsRej3
QEo2WgMaMrwSpo53ExWbmyXIxJRN2tSfHwjllvkMYpwbpN2VpYFeu/NLOYLK9GQr
dpz26B9M3FqvQUIRSESqFj6PumJk1dm6C25KpLwDUnFm+Pum6zdc/UBSIG9A325h
sYNiEacP5yUBvHheyWiVPzWlk4MnQHKXD+0xlcxqElS1OIYYTgk7DeVfHC5/CKvD
JweShVg4CHKRSB+kpnmBYyb+RGLe8RmsTdR5TJLWxQL4IFnUS8EJxIc9A0P7xfbb
8XUJ3dPN8LreXEqhXRmmUlu8636o8H6kUR8rm1Z+oa3rvovU53+MiI741tyXlWVM
Db9O0RaOVVFXKSTARgazZz7YVLzfSGxKDGpJXjymNT/W7LHNnbkPp2AxNlRQSSrv
XO70O49gzfBylids+/GQ+qwACJ3GbXnLSqjly+6iU2Ks86aPDTP6B7k/Ro/GOGl8
txzkKpkGw0iFfa4AE6LLZ5gFASo+ea1ioc3OOdZitCyimh3DAxs=
=lPC8
-----END PGP SIGNATURE-----

--b7sla4kzaeii3ty7--
