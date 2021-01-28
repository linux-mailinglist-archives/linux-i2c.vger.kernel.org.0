Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE7430720F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 09:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbhA1Iw7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 03:52:59 -0500
Received: from sauhun.de ([88.99.104.3]:60882 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232145AbhA1Iw0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 03:52:26 -0500
Received: from localhost (p54b33782.dip0.t-ipconnect.de [84.179.55.130])
        by pokefinder.org (Postfix) with ESMTPSA id 21CED2C04D8;
        Thu, 28 Jan 2021 09:53:06 +0100 (CET)
Date:   Thu, 28 Jan 2021 09:53:05 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v2 0/7] i2c: mux: mlxcpld: Extend driver
 functionality and update licenses
Message-ID: <20210128085305.GC963@ninjato>
References: <20210122192502.17645-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline
In-Reply-To: <20210122192502.17645-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vadim, Peter,

On Fri, Jan 22, 2021 at 09:24:55PM +0200, Vadim Pasternak wrote:
> The patchset adds new features for the existing Mellanox systems.
>=20
> Patches #1-#2 update license to SPDX-License.
> Patch #3  moves header file out of x86 realm.

I think I can add the first three patches right away, or?

Happy hacking,

   Wolfram


--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASe3EACgkQFA3kzBSg
KbYDOA/+MuqkLIl6LhFwZ5uYMoo1YNKSXCmwt751xeNkhpBsvizaZliVkT70hWLa
EAzF29YKpuWTE7U80WrnSLWKEvTc0CfMI9DR4Stq8tHkI5r52i6zvdUEH9MtPDd+
ySJRa/fB3F1IziFvJOHOXe6Zp1bqnLN1pfCEBOACAksCfdK4H2RF2wEki+GkcDby
7Yh2QYdtBy3wZB++hijw6LIKYzVhZR7SCi+vU9TI2JoOGPhGeL3W14htS25dSLrO
8BxX9sysxYPP7fR/RtxCHW7bpuIrW58r9kGWkTHnPGC9kEsUnsFBEuni6LkpZca9
0p7k4qAmn8OZ2hTh6HSg2rzLX12OuAVmm1XDrNQLIVOs6gUB4+RmdjENQngZm0hq
l1CTPUuVaguqNLp/OLesqpCoFPpVwEfUA+TQKVkHVurmBtFBgG4lFDX1QW7K7NWJ
gCqtL6rhZo7KFpLjio76UPAKZjXpT+c0KbAgsEcYbxLhasCcw+C81xLk2irokkRV
uf/zHbPrlfhOkTPeGXl4vSM1LgzFQtracoUlwTmenLDzI+GBS5V/alFyuAYrjSPV
xmf39DOvQybSaVaboJS7FOOS5kcYcNbO/Sb70q6V0DX0eyFeYlgf/pF2XzeCWBZT
wjTzSGR0mHI3R3vDJkX7LrO1Pt0K9SbfDtv0dC2n+YOyq8H/7Ck=
=Z0bL
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
