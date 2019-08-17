Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22AF3910B4
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2019 16:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbfHQOMf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Aug 2019 10:12:35 -0400
Received: from sauhun.de ([88.99.104.3]:57146 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725929AbfHQOMf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 17 Aug 2019 10:12:35 -0400
Received: from localhost (p5486C5A7.dip0.t-ipconnect.de [84.134.197.167])
        by pokefinder.org (Postfix) with ESMTPSA id 737352C290E;
        Sat, 17 Aug 2019 16:12:32 +0200 (CEST)
Date:   Sat, 17 Aug 2019 16:12:32 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.3
Message-ID: <20190817141226.GA2867@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has one revert because of a regression, two fixes for tiny race
windows (which we were not able to trigger), a MAINTAINERS addition, and
a SPDX fix.

Please pull.

Thanks,

   Wolfram


The following changes since commit d45331b00ddb179e291766617259261c112db872:

  Linux 5.3-rc4 (2019-08-11 13:26:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 90865a3dc597bd8463efacb749561095ba70b0aa:

  i2c: stm32: Use the correct style for SPDX License Identifier (2019-08-14 14:56:54 +0200)

----------------------------------------------------------------
Fabio Estevam (1):
      Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()"

Nishad Kamdar (1):
      i2c: stm32: Use the correct style for SPDX License Identifier

Oleksij Rempel (1):
      MAINTAINERS: i2c-imx: take over maintainership

Wolfram Sang (2):
      i2c: rcar: avoid race when unregistering slave client
      i2c: emev2: avoid race when unregistering slave client

 MAINTAINERS                    |  8 ++++++++
 drivers/i2c/busses/i2c-emev2.c | 16 ++++++++++++----
 drivers/i2c/busses/i2c-imx.c   | 18 ++++++------------
 drivers/i2c/busses/i2c-rcar.c  | 11 +++++++----
 drivers/i2c/busses/i2c-stm32.h |  2 +-
 5 files changed, 34 insertions(+), 21 deletions(-)

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1YC0QACgkQFA3kzBSg
KbbaoQ//fKLQqFzckbfUJ3rOmrs9/mbL0UYaZB9MzjYU7D6JclHYagvAUmJ1pNl2
aewk25VtSgSfITkcZB71tU0EjNXxztI/rFVq2AOl9Rqzv6hYcZtZCXPe2tBvTDz4
QwFOtzcCJl442iP2b7lkaswB+5gTXBxJq/saE8mH3krFHx5B9qrmmTB8XlqoKXpu
yysJLysL6GQLWwFMOY/IIIKVQn4Aar1+myJzKz+qki3r9CySYfYL9/qH8irpppRZ
sGyfjDOz5u1gPclobGHowARshU9J/QiCJbaqPVf3LW7Gjs0EZsWs220tJXnBdSKb
N83zECmB/StYEyg5b0LoyNcAd7cTGe3c3t4IE71UG8uiiW43jSwut5DndkrpU86Z
a30tZQnTShI7sTVEunr9Rp2KGKSxP8EUJVKEKy6Mj6j6ejGRMCQdazmWWUf/sCjT
w1L+jMkAAW4x0jb2JDEqBa4JnFoMi0pvnG3m+1yxmszvpHovPA9sNDuKcfGEhg/7
KHJepZVVmSJ+FF4cK8L3MeKFcZoXvvdYiCoQxO8UWiH+t7Cy/rsGRxhYgoRCHEc5
eIsKVHGhgBXBuF7IcpyBnDxcYquT3LacJ1lpQQPbCU99UR0NOxWNRuG69W49A+oe
h1yX2kEKogbLgGqkQ468bLHeoKP6zGtKxR71zqjsBEVrLgGnbwY=
=krBM
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
