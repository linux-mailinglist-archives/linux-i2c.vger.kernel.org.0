Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41819314D5B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 11:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhBIKoo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 05:44:44 -0500
Received: from sauhun.de ([88.99.104.3]:56182 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231196AbhBIKjh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Feb 2021 05:39:37 -0500
Received: from localhost (p5486c396.dip0.t-ipconnect.de [84.134.195.150])
        by pokefinder.org (Postfix) with ESMTPSA id 087AB2C04E4;
        Tue,  9 Feb 2021 11:38:46 +0100 (CET)
Date:   Tue, 9 Feb 2021 11:38:43 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Vadim Pasternak <vadimp@nvidia.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v5 0/6] mux: mlxcpld: Extend driver functionality
Message-ID: <20210209103843.GA9698@ninjato>
References: <20210208201606.10620-1-vadimp@nvidia.com>
 <e86e396b-b099-5174-ae0a-393401b1e767@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <e86e396b-b099-5174-ae0a-393401b1e767@axentia.se>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 10:26:08PM +0100, Peter Rosin wrote:
> Hi!
>=20
> On 2021-02-08 21:16, Vadim Pasternak wrote:
> > The patchset adds new features for the existing Mellanox systems.
> >=20
> > Patch #1 converts driver to platform driver.
> > Patch #2 prepare driver for word addressing support.
> > Patch #3 removes adapter numbers enforcement.
> > Patch #4 adds support for word address space devices.
> > Patch #5 extends mux number supported by driver.
> > Patch #6 adds callback notification about mux creation.
> >=20
> > Vadim Pasternak (6):
> >   i2c: mux: mlxcpld: Convert driver to platform driver
> >   i2c: mux: mlxcpld: Prepare mux selection infrastructure for two-byte
> >     support
> >   i2c: mux: mlxcpld: Get rid of adapter numbers enforcement
> >   i2c: mux: mlxcpld: Extend driver to support word address space devices
> >   i2c: mux: mlxcpld: Extend supported mux number
> >   i2c: mux: mlxcpld: Add callback to notify mux creation completion
> >=20
> >  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 128 ++++++++++++++++++++------=
--------
> >  include/linux/platform_data/mlxcpld.h |  11 ++-
> >  2 files changed, 83 insertions(+), 56 deletions(-)
> >=20
>=20
> I am now happy with this series. All looks good and every patch makes sen=
se
> on its own. Thank you for putting in the effort!

All applied to for-next, thanks everyone!


--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAiZi8ACgkQFA3kzBSg
KbZHxg/+LHkdgc/ul/h6t7rFn22Iq8/0ffPiN7Djoz9fC5DQc7/hAgvZnNU+4JFX
rjkowpHgd8x0Kd10ZBxHcdsgjEXcRtb85nRBZ5VnJcOLGW1gWLwNDNRfB+NZwh8B
n8cCdSKDXS+39v2RdpgqbpzPTcWPagInPVyX7Ic2CYUxBkWDQOXgxGh/gkgWwnxj
ABf5z13cO91fi/cof9LoF+Gsh0wu47wMVD4v+dGWaVqtV5KBRme9ZJxE5X+3fmhg
hxi3xbPknc6j1/ldIm0PUCOOj1VwRfzu+zcv+/xfG5cDoKgn4RUQx/+8hOJnsTo2
yhVAbAaMHjeUZRYyP9JZNaMWS/WDr8UfYkRjmfXhLNxm2R/5DesJ3tKRynIm3Mb4
F3UlsRxtlJ0JDMg6CspPMDK0hqO5SKvwbyFaKHP+lMmkNZd7PehSgeYsBocJydG/
FuszeuJ/Zq4ggufWF9FI2/+su4RsLmmRWVJFOUuroeGTLxesPbRtSJntiETMX4js
O9nCCM3VZgY3zq0THZ3Aj3hibhu3GbuZRsMD2Wp5vPya9L5wHXt1eAcXkqR1nzIt
h9Ff9w/xG1SnZDAdcmLDOQl0z+ErpuyLsdIiFDObX/SsU1S65WrNLxu48WoODrLK
6dvfhj6c/6sK4Oxk1T1DL3oveO0/e758jJug4COnBad/s4p3kJQ=
=aBrR
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
