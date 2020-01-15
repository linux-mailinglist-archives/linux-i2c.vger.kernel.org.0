Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD0013CB1F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 18:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgAORfh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 12:35:37 -0500
Received: from sauhun.de ([88.99.104.3]:38898 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgAORfh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 12:35:37 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id 935592C0742;
        Wed, 15 Jan 2020 18:35:35 +0100 (CET)
Date:   Wed, 15 Jan 2020 18:35:35 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/8] NVIDIA Tegra I2C driver fixes and improvements
Message-ID: <20200115173535.GF1239@ninjato>
References: <20200114013442.28448-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline
In-Reply-To: <20200114013442.28448-1-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 04:34:34AM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This patchset adds support for atomic transfers which are required for
> shutting down machine properly. Secondly, a (not)suspending I2C and some
> other things are fixed/improved by this small series as well. Please revi=
ew
> and apply, thanks in advance!
>=20
> Changelog:
>=20
> v5: Improved commit message of the "Support atomic transfers" patch,
>     thanks to Wolfram Sang.
>=20
>     Added explicit stable tags to these patches:
>=20
>       i2c: tegra: Fix suspending in active runtime PM state
>       i2c: tegra: Properly disable runtime PM on driver's probe error

Patches 1+2 applied to for-current and patches 3-8 applied to for-next,
thanks!

Checkpatch spit out some of those:

CHECK: Lines should not end with a '('

I didn't mind. We can fix it incrementally if you want to fix it.


--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fTWcACgkQFA3kzBSg
KbZWVA/+NxrcpkVvOHTsdyduEw2EdzQYJYsoUX2YW7c5NUXh0qu9julTWXAvt6cZ
K1qSAtOnOOTCUuyeIK/XIecVK0bvgjE8w6bfhk5+lAAlzo/qobdH9/AEPEG5khxa
WpcolSsDXCUNxFwmDnUhtQ3xRaQkF9Uj/lnZlZbtdCOSz0ZmniMYmhCFH7Q8h6VT
Aw35j9lNYxf8vyRaQAM9nEazCtGcViu1yVmRuikoGkf6MuKxmrwvYPdlwzROgXY9
C94MPFSygu5jE7ANk3qD67x9nOCrcghSRpObc+hO1ICco47+vUuaCDbVOAdsqV/b
Wy4paXcorxoi16zNhUijeMhEHcWKaBWAjb3WY7jPYZzEnBE/Jwtw46fzRlintm5H
XVoveLSRq16XmsthTfmp7anR1sHTYcbuSdvgFOOpef/8y3uiUANhUDKUnv3X3jrX
pHr+XZG5iXMudF902tjiTqCpxaY0NK3msph4dQXt0bM1bX+aUCAxijW43rkXstpB
PngSA4lEd2R35Hnu1JUlsIRamRZycmxqhDza6yeBJS99zhUK+ctDEcy2VpLhF5vo
reWCTZ6mNUDGjg8WAJkFttgvAc2HH1xdeelrx0I3xsUaumrQVWltfGjU0CYs3c+/
7go+y1UENWDtFzg/B5sP/ihlHD7BpZUGT0GId4CyG0JWp5EX0ks=
=oqWk
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--
