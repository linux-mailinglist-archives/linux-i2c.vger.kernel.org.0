Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD62330723B
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbhA1JF4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:05:56 -0500
Received: from sauhun.de ([88.99.104.3]:36168 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231652AbhA1JFq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 04:05:46 -0500
Received: from localhost (p54b33782.dip0.t-ipconnect.de [84.179.55.130])
        by pokefinder.org (Postfix) with ESMTPSA id A2D202C04D8;
        Thu, 28 Jan 2021 10:05:01 +0100 (CET)
Date:   Thu, 28 Jan 2021 10:05:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: tegra: Use threaded interrupt
Message-ID: <20210128090501.GF963@ninjato>
References: <20210112131709.1711-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gdTfX7fkYsEEjebm"
Content-Disposition: inline
In-Reply-To: <20210112131709.1711-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gdTfX7fkYsEEjebm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 04:17:09PM +0300, Dmitry Osipenko wrote:
> Switch to use threaded interrupt context in order to avoid checking of
> "are we in interrupt?" for the code that may sleep in the IRQ handler.
> I2C doesn't require a very low interrupt-handling latency, hence this
> change doesn't introduce any noticeable effects.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-next, thanks!


--gdTfX7fkYsEEjebm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASfj0ACgkQFA3kzBSg
KbbYAg/+OLhhpEe21w2YYDrVVUpJPXZGZlB1FVXtSq6K33nZT0HgJWBzJ8B2k+W7
5i16Zs4zue4Fe7lE15/BBrkzHpiU+CAawOZE+jkH/BOgPgpsJqKkdJcc55EPwYyq
kTDm6rLCqU2ZtTEMQsEdhVOS/Vuza9zi5fbNvzU3K3O9xXtn9/Y6btEqchz9yJrI
VyReBjRjpPyLHl/xJw0GXKj+FVRikw1HoleIvJhPGX/tN5yyyLpse6eDktz+cI9e
bk3hPkjmvgjihe5GEQcEyM2tCSG/RGLFnqVu9cXut0hg7qQMrub89OA2JantW8gJ
ynzUyj02v8/QBfkd8x2+ZJ8PUgmaawbMcUnC4ayrtZPfU9vGbLjlTBzr3pYk6BJr
PVyYpIWQmjF1vhreW0WeGfLtXvPmy7E6ueQv0kN4MVULRsyd4Nc2zb33fJpqsOCF
yiiL1EC9qsj940OZO+ZmoKfo0P+nNr2FkvNFzXyprOMkfk23DxBeO0uNxE6KC/md
7IpOieecScGRMtplU/xyRyW2Lv3hrsugHunTA17z5AtBk4jLlhiSJ9xrRmZ4W247
D3CxUQQR5nW970NyPdoQXV6t7P06UXUlvW505vglyOE/a2W/xgqNGpa7nM3ch3Em
327fRmQutYCOhlehBdjv09Win2eS927afXM9C2WQpkXBNMTfJa0=
=o/jo
-----END PGP SIGNATURE-----

--gdTfX7fkYsEEjebm--
