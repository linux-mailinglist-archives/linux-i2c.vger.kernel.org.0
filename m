Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E036146BD7
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 23:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfFNVZt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 17:25:49 -0400
Received: from sauhun.de ([88.99.104.3]:57324 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbfFNVZs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 17:25:48 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id 146A02CF690;
        Fri, 14 Jun 2019 23:25:47 +0200 (CEST)
Date:   Fri, 14 Jun 2019 23:25:46 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v1 1/3] i2c: i801: Fix kernel crash in
 is_dell_system_with_lis3lv02d()
Message-ID: <20190614212546.GJ17899@ninjato>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Content-Disposition: inline
In-Reply-To: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 07:45:27PM +0300, Andy Shevchenko wrote:
> The commit
>=20
>   19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device on Del=
l machines")
>=20
> introduced a new check in order to enumerate some slave devices on Dell
> machines. Though, it brings a regression on machines where DMI vendor is =
not set.
>=20
>  BUG: kernel NULL pointer dereference, address: 0000000000000000
>  #PF: supervisor read access in kernel mode
>  #PF: error_code(0x0000) - not-present page
>  PGD 0 P4D 0
>  Oops: 0000 [#1] SMP PTI
>  CPU: 8 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc4-next-20190613+ #317
>  RIP: 0010:strcmp+0xc/0x20
>=20
> To fix this crash, check if vendor field is present before accessing to i=
t.
>=20
> Fixes: 19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device o=
n Dell machines")
> Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Cc: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next to fix the crash soonish, thanks!

For the other two patches, I'll give Jean a few more days to comment.


--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0EENYACgkQFA3kzBSg
KbbszRAAgGaVQx3SugKEXLnxQnDKSTxg7qjjoUpfWXVYCYuC6dAQtsopKrjUQ6py
QCcd7DJe9YJYLDnUEm/N3/tEnvtO5xplEUyse1EbR9bVg3LJkzXqxvT3Vr7Jezkf
9G9Y3eWqvjx38JNdMcAeGViQ2/9f/+8wx9FiEuKWgfOpLhRWAsk83Ta/1Vz1VYcX
5e98ONyr+5SRgyI4hs0W5O0gUG8vlRb+iclct5uqog2nA6XgNCMpQFb95yoOSo2I
GTkOIVnJslWe35nfY2u5+voTR8+XVnm/W38Os5GkeHp4OZmmSfg5QceE4+MRhqMg
8Q78iVnQKt/+yY3ENgc71e4QgY3sUXtw/SdI2mNC/OR0FDryTrk76P3U45gBJRqf
QzoK6FGCQrbR8VH5ewKMOmrLgYc1gXbDJhgtSYDPb6uPGYDciqjNgVagJ6zuZOk7
YQ6fyMB41oA86bmaoE+0RwDHjoVhs5ZpvR4Cn8Xw4fY9N/51zviTdsNbxJ1CU76M
0lLpJ8WlK4r1xeuACTge5ZYYhGKoXM2WosDFW31sJslqoBCfSFguIWNn+Wnx2/7m
+pN+moNXsAmvCFVb9BL9r2tCt5TIqQR0WvIjWwPW+DdcrQwv39sWkVdxHov4JH63
q8bk6ppDLGpFWI+Qp+PSTcJ6o8ZD+ygQzG7Dpbk8IFgmnFbDiyU=
=W7uQ
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--
