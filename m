Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFF5202590
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jun 2020 19:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbgFTRQa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Jun 2020 13:16:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:46150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726838AbgFTRQa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Jun 2020 13:16:30 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF04222B2B;
        Sat, 20 Jun 2020 17:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592673389;
        bh=zbplmaCf3az+f6f2Jeh+YVePiNjF3AjtIdUa5LQ1o9Q=;
        h=Date:From:To:Cc:Subject:From;
        b=BSkLiv8IKNwx4NWopyCN0hYF0VFJhyRHUMaOP5TpJRquYNvPyUVpzUMfyv4fIlUgj
         7ROjWQzY9edJujwXbkl7hH6KRf5uqqxqoYLVYxM7e22XZHqgT5tkF5aHKH0g7tkmLW
         FH8+ijHHtzwplN/agdOSjUGQC369GROP70HZNsaI=
Date:   Sat, 20 Jun 2020 19:16:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.8
Message-ID: <20200620171624.GA9805@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has for rc2:

- a small collection of remaining API conversion patches (all acked)
  which allow to finally remove the deprecated API
- some documentation fixes and a MAINTAINERS addition

Please pull.

Thanks,

   Wolfram


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 28f9f8fb4f405ade488058f817b6cbd108e45e4e:

  MAINTAINERS: Add robert and myself as qcom i2c cci maintainers (2020-06-19 15:07:00 +0200)

----------------------------------------------------------------
Daniel Schaefer (1):
      Documentation/i2c: SMBus start signal is S not A

Keyur Patel (1):
      i2c: smbus: Fix spelling mistake in the comments

Loic Poulain (1):
      MAINTAINERS: Add robert and myself as qcom i2c cci maintainers

Wolfram Sang (6):
      drm: encoder_slave: fix refcouting error for modules
      drm: encoder_slave: use new I2C API
      x86/platform/intel-mid: convert to use i2c_new_client_device()
      video: backlight: tosa_lcd: convert to use i2c_new_client_device()
      Documentation: media: convert to use i2c_new_client_device()
      i2c: remove deprecated i2c_new_device API


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) x86/platform/intel-mid: convert to use i2c_new_client_device()

Daniel Thompson (1):
      (Rev.) video: backlight: tosa_lcd: convert to use i2c_new_client_device()

Emil Velikov (2):
      (Rev.) drm: encoder_slave: use new I2C API
      (Rev.) drm: encoder_slave: fix refcouting error for modules

Mauro Carvalho Chehab (1):
      (Rev.) Documentation: media: convert to use i2c_new_client_device()

 Documentation/driver-api/media/v4l2-subdev.rst    |  2 +-
 Documentation/i2c/smbus-protocol.rst              |  2 +-
 Documentation/userspace-api/media/conf_nitpick.py |  2 +-
 MAINTAINERS                                       |  9 ++++++++
 arch/x86/platform/intel-mid/sfi.c                 |  4 ++--
 drivers/gpu/drm/drm_encoder_slave.c               | 15 +++++---------
 drivers/i2c/i2c-core-base.c                       | 25 -----------------------
 drivers/i2c/i2c-core-smbus.c                      |  2 +-
 drivers/video/backlight/tosa_lcd.c                |  4 ++--
 include/linux/i2c.h                               |  8 +++-----
 10 files changed, 25 insertions(+), 48 deletions(-)

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7uRGQACgkQFA3kzBSg
Kba/sw/+KICcKVcOKJauUJqE1f8yccdPhyTOyEeVWDqq+bhOMrNcn51B45flcDNm
jBkGe+SHGYxIExBAZq4kT5EEfkAaxEoUCxdyHLhu1F6oOudfP2o3c01q115rCqWy
TiienA6mO4f/MdP4i+RPNZKLUpQJieoJ6hxfZtxT5RiiqVJcdGp0QAfbVhw97RFJ
6UlVHrQzEMm+W4UXIaUpiiC0TBf7ih0mH7UeGvCMAG0mwHB8XV+W9SeJ3k6ke+kh
yD5BALbTSsi0st3kHzrrhvk/Wr2uAlHQsyetWz32EUUNNqu8nxpAnPHyvHbisj7G
QaI3v/rGSwKqw24XUDwVg0GEHyqIoMEZInDZSMOI16jZndFRS9n2Po6dpbNPSPey
VoJ7olh2jMMx5B+4benEzN2YHd7vcHz3utaeIJgcOkDE2qSVVQjGwr0vZotdkf1x
81qM4LubmOu/2O/QezpS9lviH5r2g+K4Fl9pZV7PHv3eleiYdNnrkCH6RSz9jjk6
ooB4aji7CldwGFJ9cfsKgapCGjMu5loWg7n8OjnXLXuHnsIPu1ZsAe97ZSeB6V4A
hF/eq/CWESVTgrWg5veySZMYUW//ZzLXiCJpwowGAGzK0H4aK1rwZhjMLz5gXpAM
ESnI0KStQpKfdU60YwVHoBBz1ozdDKfj9OzwHyoGhuoR2xR6ebQ=
=pbA3
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
