Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF60046B4E
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 22:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfFNUzS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 16:55:18 -0400
Received: from sauhun.de ([88.99.104.3]:56944 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfFNUzS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 16:55:18 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id 9EB4D2CF690;
        Fri, 14 Jun 2019 22:55:16 +0200 (CEST)
Date:   Fri, 14 Jun 2019 22:55:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Avoid error message on deferred probe
Message-ID: <20190614205515.GB17899@ninjato>
References: <20190527102939.7616-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <20190527102939.7616-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 12:29:39PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> If the driver defers probe because of a missing clock, avoid outputting
> an error message. The clock will show up eventually.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0ECbMACgkQFA3kzBSg
KbYZqxAAs513VrkPBqqBMnxMR4OgMiHe0iOGj/Z1H0ULyniDEp+tzmuKyu300vkw
oMq3WWIBYcrS/+GgOACqWbTrkD6YeliWaM2NZF0AmhSs9DsMG6+gqa4dKNJfYYoP
qbfMfXgKQscFWsMeSYSUY+gz6abkccIptbh1R2AekkULXpQfHPzwzHlBqoa/tfSD
FLkFt04rCoIE8+wfkISTo+aySx2diMYrzpfxuKNI0DVNif9tpNw032EiI7GLJB5M
kAaEKuSv4B78kNJ/VbO1GOY2IkFkWl2S0T/v9+qSewrk/Cief/nvKVpv0e8gKYRj
XqckopSzdeIl9T4EyQVR5W9i2mWqyySIrdTcrwkKlziakOPT6dzGcI4prfijz0RK
eR5b3PawqkbuEGDyivAi0KoCYR2Cdbc+TUeWP0mrdrYHDcB5KxGWAa3JUW6jvxEX
Wwx5VGkyrMY/nwNcQ5P1iUtLQQZXXFn+ZFaKl+Zv+t9YFyDUetczorMX2J1YC75T
Os/5PN2nYYbf6t1/MHIP3uT99OJ/KJsX4LjWc3rOgq2GC6NbOpJ5Qbpnhu5QV362
ZWsQLoCOawmpzV3cOMdiLpUrb3dHipo9GgOpls77USNkdqhGDR+SfEFd9DGxGCuL
wvOA4b/59xsvf/9eAz7W8/dSDD5FhsvIgDzyiCkkJwAgvwC+06o=
=bpVM
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
