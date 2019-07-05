Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9D1E60BC0
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 21:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfGETVb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 15:21:31 -0400
Received: from sauhun.de ([88.99.104.3]:53992 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbfGETVb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jul 2019 15:21:31 -0400
Received: from localhost (p54B334DF.dip0.t-ipconnect.de [84.179.52.223])
        by pokefinder.org (Postfix) with ESMTPSA id 2C5D62C0398;
        Fri,  5 Jul 2019 21:21:30 +0200 (CEST)
Date:   Fri, 5 Jul 2019 21:21:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.2
Message-ID: <20190705192126.GA13751@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has a MAINTAINERS update which will be benfitial for developers, so
let's add it right away.

Please pull.

Thanks,

   Wolfram


The following changes since commit 6fbc7275c7a9ba97877050335f290341a1fd8dbf:

  Linux 5.2-rc7 (2019-06-30 11:25:36 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to f3a3ea28edd9a17588fede4ff53bc02d986cf4d1:

  i2c: tegra: Add Dmitry as a reviewer (2019-07-05 20:46:56 +0200)

----------------------------------------------------------------
Dmitry Osipenko (1):
      i2c: tegra: Add Dmitry as a reviewer

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0fozEACgkQFA3kzBSg
KbbvtxAAtDtIFBQq4LzR8NsNxLg1RYtW/63y/WUMrikqCqG2DoUApdTy1IrOPrXJ
jSCeJOHNh2KVDLYRbIu6Ry2MdJNsvQvgez1QBgDPgkPV3byLQoYSLbGzwMQ8dBsX
QbmAEF+8jzuxF2jq4fjF1tHZUfZJssuBaeQ3Uj1ayDW/M8VuM3jGsdSISB16KVWN
KpotLElxS17Ddubo+qb1zyED7qxqZPTGhQsyaNKw8it/5Vl7jvUBCgvfQyZSvjaC
osMkgLYbSMsJvSUV/eWHbs6q8NDK9XD1dwSIwg+tkOIz7ZKxtTHecHJz7ilhgJWW
mzhYMyp7mMPeD9dTQOntGR83qfj7hJjLibcA0ybMMAPAlOrTuOvj6YHmP/tkIJBj
4nwhaMmPQKKL1BhNd430tFMMWLOIUIEMtwshkpqSJ+KthrU0vSyGmdSB1h6TKWsk
Tf0r8uwaQHuSTjSYBtMkB8aa+Mrw6swsArfazCr+E6/pO497hF0TsyoXKvacNX/Q
Th+xwO5MdaWekOyTfufNGdhJXMmfTWj6LBH4c0l2ZCoapm3RO7Wx4maFPTXmKSC5
+DGIUi0BJ2tIClcura0zLLYql5NphILON7rfCy09AhAOOajo3fPre36qLNvudy1D
GWsBkCQVfP2Gyekbfa3bBeqWKc5aRL62uSlebIZcORWi2Px7p6E=
=dvvr
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
