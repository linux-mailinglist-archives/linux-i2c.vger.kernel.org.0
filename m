Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFD0332247
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2019 08:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfFBGYF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Jun 2019 02:24:05 -0400
Received: from sauhun.de ([88.99.104.3]:55462 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725871AbfFBGYF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Jun 2019 02:24:05 -0400
Received: from localhost (ip5b40b67c.dynamic.kabel-deutschland.de [91.64.182.124])
        by pokefinder.org (Postfix) with ESMTPSA id B24BD2C3559;
        Sun,  2 Jun 2019 08:24:02 +0200 (CEST)
Date:   Sun, 2 Jun 2019 08:24:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.2
Message-ID: <20190602062356.GA1616@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has for you a memleak fix for the core, two driver bugfixes, as well
as fixing missing file patterns to MAINTAINERS.

Please pull.

Thanks,

   Wolfram


The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to c8552db31d5e70f0311be031b22292bf256791da:

  MAINTAINERS: add I2C DT bindings to ARM platforms (2019-06-01 14:52:13 +0200)

----------------------------------------------------------------
Masahisa Kojima (1):
      i2c: synquacer: fix synquacer_i2c_doxfer() return value

Vadim Pasternak (1):
      i2c: mlxcpld: Fix wrong initialization order in probe

Wolfram Sang (2):
      MAINTAINERS: add DT bindings to i2c drivers
      MAINTAINERS: add I2C DT bindings to ARM platforms

Yingjoe Chen (1):
      i2c: dev: fix potential memory leak in i2cdev_ioctl_rdwr


with much appreciated quality assurance from
----------------------------------------------------------------
Andrew Lunn (1):
      (Rev.) MAINTAINERS: add DT bindings to i2c drivers

Heiko Stuebner (1):
      (Rev.) MAINTAINERS: add I2C DT bindings to ARM platforms

Linus Walleij (1):
      (Rev.) MAINTAINERS: add I2C DT bindings to ARM platforms

Michal Simek (1):
      (Rev.) MAINTAINERS: add I2C DT bindings to ARM platforms

 MAINTAINERS                        | 18 ++++++++++++++++++
 drivers/i2c/busses/i2c-mlxcpld.c   |  2 +-
 drivers/i2c/busses/i2c-synquacer.c |  2 +-
 drivers/i2c/i2c-dev.c              |  1 +
 4 files changed, 21 insertions(+), 2 deletions(-)

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzza3cACgkQFA3kzBSg
KbYKVRAAtJp1SvqEyUMCJKsSvsj67n7lEiL6A+YEDHqjU4joBDorP/x8ZnnWnVgl
T7MK1bQaiDxMOkyhSax+iFu+ufRigYlB+7He5zm+jvqbAkHVOn1BNY7ROF+up4n6
HGP1xsoQBWCMsz6HeXyL/WDJ3yLUVt9tz8tpaBlBKpmUOZUdnHJKUUIft3tuIhZ7
FT+LVrtQfYewUiKBajM8DK+8+YlJt0ttNhdD1BazTuP2ZyQhF6+KZXzNUOCM3UeE
9pMDiJaFI0lskHKSNu0OS18kgoCCXll0o79iFbOOKyZtPkgThvg01TuSssrk/n4I
livz1w6KKx/AExhcld7qIX322pjznXkcl0UrGPL9/7vrdjrml17FErWZG4sHUeXZ
DdALAo+oQVsJymaHnEaPPU8b3vJKzk3TVv/qpWbsfWYjvOW0nKkFfojhp8j39EXm
OF87XcyW6VjEIASY65DJFgEl7z7ngqFEyju6XIthx060UBrnFrXSoUF1ZuqkzjJP
eKZgBTaF7T50CSnj9uIQNaVkZ8nkOcmj6EAPsj4fZ4ByiGnp92cvTKGXMkZKtvPp
xB+VfG3X+umLXTZJjZ4WHOgoWpnGPqz0DMDsoYeBcSAHlmbYOKwE4V42Ez04cWT8
6KxBMfG9RXe0TyF0kTFGw0p9+nq3bSQc48CfdW2KhY11IOLPByI=
=QTnz
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
