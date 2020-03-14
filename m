Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42FA618580F
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Mar 2020 02:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbgCOByQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 Mar 2020 21:54:16 -0400
Received: from sauhun.de ([88.99.104.3]:38226 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727519AbgCOByQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 14 Mar 2020 21:54:16 -0400
Received: from localhost (p5486CB31.dip0.t-ipconnect.de [84.134.203.49])
        by pokefinder.org (Postfix) with ESMTPSA id D24CC2C1EFA;
        Sat, 14 Mar 2020 22:08:52 +0100 (CET)
Date:   Sat, 14 Mar 2020 22:08:49 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.6
Message-ID: <20200314210830.GA1730@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has quite some regression fixes this time. One is also related to
watchdogs, we have proper acks from Guenter for them.

Please pull.

Thanks,

   Wolfram


The following changes since commit 2c523b344dfa65a3738e7039832044aa133c75fb:

  Linux 5.6-rc5 (2020-03-08 17:44:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 92bd1f2e1eed493a73a19012a3a7f1feed0883ff:

  Merge tag 'at24-fixes-for-v5.6-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into i2c/for-current (2020-03-13 16:32:28 +0100)

----------------------------------------------------------------
Hamish Martin (1):
      i2c: gpio: suppress error on probe defer

Jarkko Nikula (1):
      i2c: designware-pci: Fix BUG_ON during device removal

Michael Auchter (1):
      misc: eeprom: at24: fix regulator underflow

Mika Westerberg (3):
      watchdog: iTCO_wdt: Export vendorsupport
      watchdog: iTCO_wdt: Make ICH_RES_IO_SMI optional
      i2c: i801: Do not add ICH_RES_IO_SMI for the iTCO_wdt device

Wolfram Sang (3):
      macintosh: windfarm: fix MODINFO regression
      i2c: acpi: put device when verifying client fails
      Merge tag 'at24-fixes-for-v5.6-rc6' of git://git.kernel.org/.../brgl/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (2):
      (Rev.) i2c: acpi: put device when verifying client fails
      (Rev.) i2c: designware-pci: Fix BUG_ON during device removal

Erhard Furtner (1):
      (Test) macintosh: windfarm: fix MODINFO regression

Geert Uytterhoeven (1):
      (Rev.) i2c: acpi: put device when verifying client fails

Guenter Roeck (3):
      (Rev.) i2c: i801: Do not add ICH_RES_IO_SMI for the iTCO_wdt device
      (Rev.) watchdog: iTCO_wdt: Make ICH_RES_IO_SMI optional
      (Rev.) watchdog: iTCO_wdt: Export vendorsupport

 drivers/i2c/busses/i2c-designware-pcidrv.c  |  1 +
 drivers/i2c/busses/i2c-gpio.c               |  2 +-
 drivers/i2c/busses/i2c-i801.c               | 45 ++++++++---------------------
 drivers/i2c/i2c-core-acpi.c                 | 10 ++++++-
 drivers/macintosh/windfarm_ad7417_sensor.c  |  7 +++++
 drivers/macintosh/windfarm_fcu_controls.c   |  7 +++++
 drivers/macintosh/windfarm_lm75_sensor.c    | 16 +++++++++-
 drivers/macintosh/windfarm_lm87_sensor.c    |  7 +++++
 drivers/macintosh/windfarm_max6690_sensor.c |  7 +++++
 drivers/macintosh/windfarm_smu_sat.c        |  7 +++++
 drivers/misc/eeprom/at24.c                  |  3 +-
 drivers/watchdog/iTCO_vendor.h              |  2 ++
 drivers/watchdog/iTCO_vendor_support.c      | 16 +++++-----
 drivers/watchdog/iTCO_wdt.c                 | 28 ++++++++++--------
 14 files changed, 102 insertions(+), 56 deletions(-)

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5tR8oACgkQFA3kzBSg
Kbb8/g/8DRq7gPMUREIBT75XgWatigy4B5N5doEp744rN6UNdHtJ19NANM+vMH3c
YBX07YCQ9jLbXS95ewkMUMvpsCJKJ/Du1SYjvgnu1NpuTqqpmOWSmy1cCLRpAknp
tKMUI8Wr7pMFDomO+er1DM7/ccSXgtcyiA2qDvSXqqw5B+AS4jmM3Qcpju5FsVVY
dEjNUM3E9bVNi4Npqixe7QAdkPl8/Q4MgwD63enxj5ghL8DZrBPl6QeGkE404PCs
dsnyycdxBtM4UeMItXzjfaPhWWVOwMnvtW5ggurVhoKs6Ydv51YIyZelvx6IkZv5
hTULfhs+b4KG5VgjvjhEbiebshAvDP4/LiL7iafHU8tA05wx6k62OvBV6185wo0p
YIbopI1usa1+Qurwyrcb583Dq50BfxeWWI+RvbHlyN3MhQlTc/ZNGcwg1WlFGh7Q
i0GJPCuhJMkJd+MqML2DCHu/ep/N2SOAA185I3uuQCPR5ZPMNVbI3Xv3gd+CYZ9p
Lh2NW4+1EPocvVPvQoWAUgqCYABoptalFuzQqaMvLEpMOVjyVVhIit7wlHlZ/YeX
kKa7gSK4hPXNl0NnW25jPl6nH+cHGi0PcibYbDfMGZBB8uPYqZ30DcpwVXiRGxAL
IH5aJ83CGzpvOlQr9tkPO2n9A4peRe7ozPYSYtcDLUkV1CxlTGE=
=6aWb
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
