Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B233E1230F7
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 16:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfLQP6E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 10:58:04 -0500
Received: from sauhun.de ([88.99.104.3]:54146 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbfLQP6E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Dec 2019 10:58:04 -0500
Received: from localhost (p54B330AA.dip0.t-ipconnect.de [84.179.48.170])
        by pokefinder.org (Postfix) with ESMTPSA id 3D19A2C06A5;
        Tue, 17 Dec 2019 16:58:02 +0100 (CET)
Date:   Tue, 17 Dec 2019 16:58:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: core: Use DEVICE_ATTR_*() helper macros
Message-ID: <20191217155801.GB14061@ninjato>
References: <20191113152306.13968-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline
In-Reply-To: <20191113152306.13968-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 04:23:06PM +0100, Geert Uytterhoeven wrote:
> Convert the i2c core sysfs attributes from DEVICE_ATTR() to
> DEVICE_ATTR_*(), to reduce boilerplate.
> This requires renaming some functions.
>=20
> Although no suitable macro exists for the delete_device attribute,
> rename i2c_sysfs_delete_device() to delete_device_store() for
> consistency.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Applied to for-next, thanks!


--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl34+wkACgkQFA3kzBSg
KbYrXA/9HJCyl76YLAfzC390t2ypvgJ272SNDRIpR0wyM39GFrUZiLtf0M+dNSMT
3P8l+j1gngw1J/b9ZAcK8hdwkTTYSVPa2lKAgaMYQbG0iNemf6Sr4G4ZTa6on75U
xDAU+Q/dV33lig6CciQi0FGJkKFjOsMoe8RbsIodynkkHvzdCVpPMiFYbtqKSmyJ
W4m2Hg7QNSd3loOjIGG58KkZaiuHp5rcAdWhkwom1dVM4om2P3nUd2STNs+R+6GK
NTSWcKfbZM1DRAyqO6IVqykRzVjdgouzWFgk4FgzFbYotUgvPnLhgMsPskomjw8O
D6NKz7saDhItZULIz5qogOkuspTkNDxPdU4govv9UXxXhnV/Qoq1kFSGhx1yB1zV
zqJBKqstV+1pGCC6rVfMj4C6yRhbVJso/LSptiDS3D+qqNse1sb7ytJ46zPqGglu
XL27/UjsPkqv6A4Xr2/exLmEFbIg71vH9tptmKg/VSEj8cuY5EuQ+8FWXP+WTyni
LDxwf2FxHjwc2D4vdek8BfR1sRrzFNV3Z1U4SQdkxPsRD0lJqWD4PC7/Qfh6KmFG
SVsiyl8DsAyKLrU56N2zaLhVtFlbipfW3ZhaADbXfNgYEsRIyKz+oV8z+EIbendC
2B09ar8jythkex+9bDmz2NiUUGbLF/Lt1WFP682uvh7gcEOOllA=
=LmlD
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
