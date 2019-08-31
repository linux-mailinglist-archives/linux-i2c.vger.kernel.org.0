Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31824A4446
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2019 13:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfHaL35 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Aug 2019 07:29:57 -0400
Received: from sauhun.de ([88.99.104.3]:37228 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726282AbfHaL35 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Aug 2019 07:29:57 -0400
Received: from localhost (p5486C98B.dip0.t-ipconnect.de [84.134.201.139])
        by pokefinder.org (Postfix) with ESMTPSA id ED03B2C0093;
        Sat, 31 Aug 2019 13:29:54 +0200 (CEST)
Date:   Sat, 31 Aug 2019 13:29:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.3
Message-ID: <20190831112948.GA1230@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has a bunch of driver fixes and a core improvement to make the
on-going API transition more robust.

Pleas pull.

Thanks,

   Wolfram


The following changes since commit a55aa89aab90fae7c815b0551b07be37db359d76:

  Linux 5.3-rc6 (2019-08-25 12:01:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to abf4923e97c3abbbd1e59f0e13c7c214c93c6aaa:

  i2c: mediatek: disable zero-length transfers for mt8183 (2019-08-30 15:06:17 +0200)

----------------------------------------------------------------
Andrew Cooks (1):
      i2c: piix4: Fix port selection for AMD Family 16h Model 30h

Andy Shevchenko (1):
      i2c: i801: Avoid memory leak in check_acpi_smo88xx_device()

Denis Efremov (1):
      MAINTAINERS: i2c mv64xxx: Update documentation path

Hsin-Yi Wang (1):
      i2c: mediatek: disable zero-length transfers for mt8183

Jarkko Nikula (1):
      i2c: designware: Synchronize IRQs when unregistering slave client

Lori Hikichi (1):
      i2c: iproc: Stop advertising support of SMBUS quick cmd

Wolfram Sang (1):
      i2c: make i2c_unregister_device() ERR_PTR safe


with much appreciated quality assurance from
----------------------------------------------------------------
Geert Uytterhoeven (1):
      (Rev.) i2c: make i2c_unregister_device() ERR_PTR safe

Jean Delvare (1):
      (Rev.) i2c: i801: Avoid memory leak in check_acpi_smo88xx_device()

Pali Roh??r (1):
      (Rev.) i2c: i801: Avoid memory leak in check_acpi_smo88xx_device()

Qii Wang (1):
      (Rev.) i2c: mediatek: disable zero-length transfers for mt8183

Ray Jui (1):
      (Rev.) i2c: iproc: Stop advertising support of SMBUS quick cmd

 MAINTAINERS                               |  2 +-
 drivers/i2c/busses/i2c-bcm-iproc.c        |  5 ++++-
 drivers/i2c/busses/i2c-designware-slave.c |  1 +
 drivers/i2c/busses/i2c-i801.c             | 15 ++++++++++++---
 drivers/i2c/busses/i2c-mt65xx.c           | 11 ++++++++++-
 drivers/i2c/busses/i2c-piix4.c            | 12 +++++-------
 drivers/i2c/i2c-core-base.c               |  2 +-
 7 files changed, 34 insertions(+), 14 deletions(-)

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1qWicACgkQFA3kzBSg
KbaIHhAApRXiRuiIjNVd2TUteNcLHLndT0NQXFzePQF5t3Rj6YK+NgtRoZF9hOsm
PG98zfbePqs8GoeaajMtdAYYzUnYMYfy8PgT3R7+T2mSNDHKcgy1b3N/RP8xbnMC
RTbkidwpFByCiGjVezAY9c5DUpAGz/WlgWezWfmy7eIWTiUFhYiech8oZ6IRSzas
2Y8B0THEQGgoUJ3Qnd2xFenviNZ5h+H7jr5ap4DsWz2u0mioRRDGPftosPLtgOCB
KgmtdJsxMFIsoywQys7voEIlUNA+bjkyEaEjUpaF1liPKOxyXWjqQeIGAAgbb0T4
p/MgncKeDdh2tkymh7AbSzSkV+2oitaQjBKCOuKjm54ujqVt6XRe8gyY8ElLwe0a
YM5ytPWm15NiF4mXo3Wf6vRPsra3cnONWojjDKdysRpwLBQ5Rp2zww73fmyUSb5+
DdlSXyZH+vPLUGX49xz6s5Kj8G8CFr1YVzuEEkoVWNtYztqvKwnL/Q9E46srKY1z
fURgi0k4y+YTybjh0dc79qBmowbz6fdalX56t3KYv5wkThZ7c4yy/9h6WAIvJGcb
pdIsuYBwMqVCvl2G9AdgIWbIi72pYrzbC2fvbyO4fniPUhnJfoFrXXfNmuf/npVk
uI15YkOfH6PGH21Ra9FQInpi2B00F30CMyfPfUuyBDVJicqs5z8=
=BHUY
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
