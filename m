Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8DD42A97ED
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Nov 2020 15:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgKFOxQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Nov 2020 09:53:16 -0500
Received: from www.zeus03.de ([194.117.254.33]:58182 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgKFOxQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Nov 2020 09:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=O7V+Y72sr6RN6gyNLPqHQZGWdnnO
        OzflgLCny78ebjw=; b=QcYbKiWlAxUkLkoo+vZV+/TEjKB1cUH/GjfL2o/n+PxF
        kcEZokoPesWgmRE19P1vDM2b/aglsL5TGPLC+YtvvrSjPPcHoqzAvVQsFmh8By2m
        VRhemWNtCbyxid434Dyhcq1fgfbnHdhra67dTFMx3Y4M7elHIcam10zDI+gQn1g=
Received: (qmail 982494 invoked from network); 6 Nov 2020 15:53:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 15:53:14 +0100
X-UD-Smtp-Session: l3s3148p1@SpxAX3GzsqIgAwDPXxn+AAvEwmht7CYV
Date:   Fri, 6 Nov 2020 15:53:14 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v2 4/6] i2c: mlxbf: Update reference clock
 frequency
Message-ID: <20201106145314.GE1059@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khalil Blaiech <kblaiech@nvidia.com>, linux-i2c@vger.kernel.org
References: <cover.1604432921.git.kblaiech@nvidia.com>
 <d7d989d8518171d4c7073904dafb23ece3af8cec.1604432921.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xA/XKXTdy9G3iaIz"
Content-Disposition: inline
In-Reply-To: <d7d989d8518171d4c7073904dafb23ece3af8cec.1604432921.git.kblaiech@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 02:54:41PM -0500, Khalil Blaiech wrote:
> The reference clock frequency remains the same across Bluefield
> products. Thus, update the frequency and rename the macro.
>=20
> Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueF=
ield SoC")
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>

Applied to for-current, thanks!


--xA/XKXTdy9G3iaIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+lY1kACgkQFA3kzBSg
KbZxoBAAio6iz+A6ZY6xV61IOe2PBhCOL/+9bka7NL5EtBid/CIbmezv5RmxaQ/4
7sw5A6M9igza5qPwQYWuOKwYzjHYRySOKqs5aJohXhdimMAcjrU9981Q6Mlo0kvx
HRjBl9yBvDzxJMy/k6BMKSdH7dPlRcorSu4/IwV+OjuZo5pqPlJpjB+omM5xjyOA
uUEsul1pEDP4v79sreFHbmnum8Ch7jiZON2r2hRj/f6LxEIvcLU/28QHLPigttmx
QfB3uJWoY8Pj+f6ew/1UuBTYhgKNN+O+XNiSCFCANGD4Y7J0ut6E6fx08Ji18+qg
CIsL/6vfHCr56uMYbUg4TSaot9h9o/CC20Ubi6FJKXJLH1a2KEVYVN/XwwzlYDtY
rYl2ZnVjJPfCs84L8SixPvKuBuLVF4rPScTdeRfoj240RCn/fQL1xLpZC1g+Hr9G
yT9CKh2yBxtB6/Zbq/6IdGJCjIjGxmuT+N13kO3+WGEXaPAdnq75hJUybk0A0TJ/
/rCk1FHlkdbzyU9g1mSfiTdqTS7uQbi7aaXYnEl2bajHp9iZ+1ykNLXm/PxDssEt
uoNdy+qGN1d8pidgkGbOOZK1TzpodDBEo4982PvDAFTX/1d9AuxW1wY8jRyGjIii
QJvLxnUVy7w7bd+MbHQ7VGHmtWA0KNM7z1duCvSil8pquWKbpVI=
=DjMo
-----END PGP SIGNATURE-----

--xA/XKXTdy9G3iaIz--
