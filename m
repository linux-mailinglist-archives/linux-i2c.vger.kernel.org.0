Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95928E5DB6
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2019 16:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfJZOhC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Oct 2019 10:37:02 -0400
Received: from sauhun.de ([88.99.104.3]:47482 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbfJZOhB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Oct 2019 10:37:01 -0400
Received: from localhost (p5486CC3E.dip0.t-ipconnect.de [84.134.204.62])
        by pokefinder.org (Postfix) with ESMTPSA id DB1AA2C03C5;
        Sat, 26 Oct 2019 16:36:58 +0200 (CEST)
Date:   Sat, 26 Oct 2019 16:36:58 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.4
Message-ID: <20191026143655.GA5216@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here are a few driver fixes for the I2C subsystem.

Please pull.

Thanks,

   Wolfram


The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

for you to fetch changes up to 348e46fbb4cdb2aead79aee1fd8bb25ec5fd25db:

  i2c: stm32f7: remove warning when compiling with W=1 (2019-10-24 20:52:21 +0200)

----------------------------------------------------------------
Alain Volmat (1):
      i2c: stm32f7: remove warning when compiling with W=1

Fabien Parent (1):
      i2c: mt65xx: fix NULL ptr dereference

Fabrice Gasnier (2):
      i2c: stm32f7: fix first byte to send in slave mode
      i2c: stm32f7: fix a race in slave mode with arbitration loss irq

Jae Hyun Yoo (1):
      i2c: aspeed: fix master pending state handling


with much appreciated quality assurance from
----------------------------------------------------------------
Brendan Higgins (1):
      (Rev.) i2c: aspeed: fix master pending state handling

Cengiz Can (1):
      (Rev.) i2c: mt65xx: fix NULL ptr dereference

Hsin-Yi Wang (1):
      (Rev.) i2c: mt65xx: fix NULL ptr dereference

Pierre-Yves MORDRET (3):
      (Rev.) i2c: stm32f7: remove warning when compiling with W=1
      (Rev.) i2c: stm32f7: fix a race in slave mode with arbitration loss irq
      (Rev.) i2c: stm32f7: fix first byte to send in slave mode

Tao Ren (1):
      (Test) i2c: aspeed: fix master pending state handling

Ulrich Hecht (1):
      (Test) i2c: mt65xx: fix NULL ptr dereference

 drivers/i2c/busses/i2c-aspeed.c  | 54 +++++++++++++++++++++++++---------------
 drivers/i2c/busses/i2c-mt65xx.c  |  2 +-
 drivers/i2c/busses/i2c-stm32f7.c | 21 ++++++++++------
 3 files changed, 48 insertions(+), 29 deletions(-)

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl20WgMACgkQFA3kzBSg
KbZwPBAAq462lPIS4LKK7pQC8PkwkJNl7wlI1M+fg+ZWT0G89AEv8kuMMqz93NXV
DtUnKp+e/98TvH28JUOnlhmsmrtoXK6v78HeNX8XKGZ+k0n6vQHSEC06DppfIqem
VE6MazdLZKUkdtaQrLGiBzWSOAv0nlKqrVGoMZSiTF7R7wRy3ec0XIppLOFwwrpl
e8I0cdtK1lQToiGCtn9PdhGuv6q9S0gMp2JLc976GQMBF/12HBhC18pmzLG7Ey5p
anVP7JogyvAGWUnQBgzp0gDEykRFDRpOVrOUqSDgoK551F4ijdraIll770ouiCmB
ypIGQhW7OMvbDm5c8ndWqiOuQDkfd2SNFW2f3PmyabId4wafdB5jbflgL26nWmek
1Yxhcm6guAI3ty2eGUT+NitAfUUtcp1b7sRy44IPgWmLSdaZ8YddoKTT/z32ZSh6
cLwZ+rv7CX5xMhvAzUUhIhhKbmdjqdLZH0L8gnJRoKjkqz5EmX6hxSK17ntTQlDh
TGkfyDBOqSFnam/BVD1jPgf3aU2qzHwTZZyHW/D0OFQAtmv4I/tflmbdaXQoLYN/
P69oAbn03S723IrgQq5/FuQmyS7szwPMXAaAPH++6Vl7la02LfebCZF0QjuUPyKo
GFcYWWsCbAGJCBJMcaOIeK9oTTd2ekXCfop9yZk1flcbpERBgrw=
=tsxo
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
