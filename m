Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA0D22353
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2019 13:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfERLBE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 May 2019 07:01:04 -0400
Received: from sauhun.de ([88.99.104.3]:59826 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbfERLBE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 18 May 2019 07:01:04 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id 9D44B2C051A;
        Sat, 18 May 2019 13:01:01 +0200 (CEST)
Date:   Sat, 18 May 2019 13:01:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.2
Message-ID: <20190518110057.GA8674@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here are some I2C core API additions which are kind of simple but
enhance error checking for users a lot, especially by returning errno
now. There are wrappers to still support the old API but it will be
removed once all users are converted.

This comes a bit later in a seperate pull request because of my recent
illness. It would be great to have it merged in this cycle, however, so
we can start converting the users (spread across many subsystems) right
away.

Thanks,

   Wolfram


The following changes since commit a6a4b66bd8f41922c543f7a820c66ed59c25995e:

  Merge tag 'for-linus-20190516' of git://git.kernel.dk/linux-block (2019-05-16 19:10:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next

for you to fetch changes up to b8f5fe3bc5b9318d95770a09a480c31aced20cd2:

  i2c: core: add device-managed version of i2c_new_dummy (2019-05-17 19:29:40 +0200)

----------------------------------------------------------------
Heiner Kallweit (2):
      i2c: core: improve return value handling of i2c_new_device and i2c_new_dummy
      i2c: core: add device-managed version of i2c_new_dummy


with much appreciated quality assurance from
----------------------------------------------------------------
Bartosz Golaszewski (2):
      (Rev.) i2c: core: add device-managed version of i2c_new_dummy
      (Rev.) i2c: core: improve return value handling of i2c_new_device and i2c_new_dummy

Kieran Bingham (2):
      (Rev.) i2c: core: add device-managed version of i2c_new_dummy
      (Rev.) i2c: core: improve return value handling of i2c_new_device and i2c_new_dummy

Peter Rosin (2):
      (Rev.) i2c: core: add device-managed version of i2c_new_dummy
      (Rev.) i2c: core: improve return value handling of i2c_new_device and i2c_new_dummy

 Documentation/driver-model/devres.txt |   3 +
 drivers/i2c/i2c-core-base.c           | 118 ++++++++++++++++++++++++++++++----
 include/linux/i2c.h                   |   3 +
 3 files changed, 111 insertions(+), 13 deletions(-)

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzf5eUACgkQFA3kzBSg
KbZqThAAhQ2f9nbSeq51qCX9xRC95AxfJUnD+8JZhxegajCysG8OkpJaPkRA1g+f
fV2I1Jkm7Cg60Vn9QxdOcXPc4HMhu8iSgLEmPGcQOk4tHJ7b9kjNZOgp0xTuHmat
qmRWahtg58Qt71aJCda/Xr9IP/8n/Dckd93O8In1oTOOSoF20+d17HzCDri8Qc1i
A7HDY7Ii/UDU/MAXP1W35O6fG++WhCLxjbQ1XTVRRGvYJJ6sAnZrAY94xoYWl/nQ
F01zr5SKw6So1sxp1/M0P3ZcRyvNK3POBvOSrgl01Hhyo5kaOoVZYr1AV4tVvhZV
MUWTnnCgiKnwIpHyCg0aJY5n/d6MJNoJo33cqdrHKvhE3CaIP0FaDJ1+dlh9jzS1
DInaIkbDgLXUPs3GRUPvCfhIsm9JcKYke1WEE5JwtYIK5HZCv4KNwX46Rf2RiXJ/
tO5sMOGM2jN72cN8uQPEbeb8pURKTApG9oBjTbiiKFVCQ0VyN/6pL7FFCwOQxqCL
o/961twNqmGyC5dayQXJ4CjpoJHKeLxRjK8AcvZsRMB+kAdVyBr2Jc+O+uSLKNn1
Bq0xOMAGqXcz5YZ5xLvJh5gDTAHhrBD3ni7w04Yqkdu4yB2CFZxVDaNeuhLzDF0m
+Rfg4RE4ogW/M7x++gnD5YvCg5zNO68wqNdUoWHWDYOEMebEuus=
=SdzT
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
