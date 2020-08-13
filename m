Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B4F24405C
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Aug 2020 23:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgHMVJQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Aug 2020 17:09:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:41010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbgHMVJQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Aug 2020 17:09:16 -0400
Received: from localhost (p54b330f0.dip0.t-ipconnect.de [84.179.48.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80B9F20838;
        Thu, 13 Aug 2020 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597352955;
        bh=S2QbSSzT4gZ6Pua0h3oarqvHghUW7TYA7vxZVmX/TUQ=;
        h=Date:From:To:Cc:Subject:From;
        b=UpifvSifzTM9CgPihoG7nA3RU2qCQBlELshnLlYKJ9/k1pxHapZx2ddU6j59YAkN3
         rJ6jzZ68LX2Q8eUzdqP/7UN1txna/LRkGBAyvmUYwecmvpS1p0rfQk5kRcEhwDE7KL
         /kBkDMgZAoaDIWL0MXOW45kSAGghaobzyp7tQBuQ=
Date:   Thu, 13 Aug 2020 23:09:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.9
Message-ID: <20200813210906.GA4855@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

likely because of the holiday season, the I2C pull request is quite smaller
this time. Main features:

* bus recovery can now be given a pinctrl handle and the I2C core will
  do all the steps to switch to/from GPIO which can save quite some
  boilerplate code from drivers

* "fallthrough" conversion

* driver updates, mostly ID additions

Quite a list of reviewers, thanks everyone!

Regards,

   Wolfram


The following changes since commit 92ed301919932f777713b9172e525674157e983d:

  Linux 5.8-rc7 (2020-07-26 14:14:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.9

for you to fetch changes up to b1eef236f50ba6afea680da039ef3a2ca9c43d11:

  i2c: iproc: fix race between client unreg and isr (2020-08-12 22:03:58 +0=
200)

----------------------------------------------------------------
Alexander A. Klimov (1):
      i2c: bcm2835: Replace HTTP links with HTTPS ones

Codrin Ciubotariu (4):
      dt-bindings: i2c: add generic properties for GPIO bus recovery
      i2c: core: add generic I2C GPIO recovery
      i2c: core: treat EPROBE_DEFER when acquiring SCL/SDA GPIOs
      i2c: at91: Move to generic GPIO bus recovery

Dhananjay Phadke (1):
      i2c: iproc: fix race between client unreg and isr

Eddie James (1):
      i2c: fsi: Prevent adding adapters for ports without dts nodes

Gustavo A. R. Silva (1):
      i2c: busses: Use fallthrough pseudo-keyword

Jarkko Nikula (2):
      i2c: Use separate MODULE_AUTHOR() statements for multiple authors
      i2c: i801: Add support for Intel Tiger Lake PCH-H

John Keeping (1):
      i2c: rk3x: support master_xfer_atomic

Lad Prabhakar (2):
      dt-bindings: i2c: renesas,i2c: Document r8a774e1 support
      dt-bindings: i2c: renesas,iic: Document r8a774e1 support

Matthias Brugger (1):
      i2c: mediatek: Fix i2c_spec_values description

Mika Westerberg (1):
      i2c: i801: Add support for Intel Emmitsburg PCH

Qii Wang (4):
      i2c: mediatek: Add apdma sync in i2c driver
      i2c: mediatek: Add access to more than 8GB dram in i2c driver
      dt-bindings: i2c: update bindings for MT8192 SoC
      i2c: mediatek: Add i2c compatible for MediaTek MT8192

Sowjanya Komatineni (5):
      i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
      i2c: tegra: Remove NULL pointer check before clk_enable/disable/prepa=
re/unprepare
      i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
      i2c: tegra: Fix runtime resume to re-init VI I2C
      i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c

Vaibhav Gupta (2):
      i2c: eg20t: Drop PCI wakeup calls from .suspend/.resume
      i2c: eg20t: use generic power management

Wolfram Sang (6):
      i2c: revert "i2c: core: Allow drivers to disable i2c-core irq mapping"
      i2c: rcar: slave: only send STOP event when we have been addressed
      i2c: core: do not use logical device when creating irq domain
      Merge tag 'v5.8-rc7' into i2c/for-5.9
      i2c: rcar: avoid race when unregistering slave
      Documentation: i2c: dev: 'block process call' is supported

Yangtao Li (1):
      dt-bindings: i2c: mv64xxx: Add compatible for the A100 i2c node.


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: busses: Use fallthrough pseudo-keyword

Benjamin Tissoires (1):
      (Rev.) i2c: core: do not use logical device when creating irq domain

Bjorn Helgaas (2):
      (Rev.) i2c: eg20t: use generic power management
      (Rev.) i2c: eg20t: Drop PCI wakeup calls from .suspend/.resume

Brendan Higgins (1):
      (Rev.) i2c: busses: Use fallthrough pseudo-keyword

Dmitry Osipenko (5):
      (Rev.) i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
      (Rev.) i2c: tegra: Fix runtime resume to re-init VI I2C
      (Rev.) i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
      (Rev.) i2c: tegra: Remove NULL pointer check before clk_enable/disabl=
e/prepare/unprepare
      (Rev.) i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM

Florian Fainelli (1):
      (Rev.) i2c: iproc: fix race between client unreg and isr

Geert Uytterhoeven (2):
      (Rev.) dt-bindings: i2c: renesas,iic: Document r8a774e1 support
      (Rev.) dt-bindings: i2c: renesas,i2c: Document r8a774e1 support

Gregory CLEMENT (1):
      (Rev.) i2c: busses: Use fallthrough pseudo-keyword

Heiko Stuebner (2):
      (Test) i2c: rk3x: support master_xfer_atomic
      (Rev.) i2c: rk3x: support master_xfer_atomic

Jean Delvare (4):
      (Rev.) i2c: i801: Add support for Intel Tiger Lake PCH-H
      (Rev.) i2c: i801: Add support for Intel Emmitsburg PCH
      (Rev.) i2c: busses: Use fallthrough pseudo-keyword
      (Rev.) i2c: Use separate MODULE_AUTHOR() statements for multiple auth=
ors

Marian-Cristian Rotariu (2):
      (Rev.) dt-bindings: i2c: renesas,iic: Document r8a774e1 support
      (Rev.) dt-bindings: i2c: renesas,i2c: Document r8a774e1 support

Matthias Brugger (1):
      (Rev.) i2c: mediatek: Add apdma sync in i2c driver

Niklas S=C3=B6derlund (1):
      (Rev.) i2c: rcar: avoid race when unregistering slave

Qii Wang (1):
      (Rev.) i2c: mediatek: Fix i2c_spec_values description

Rob Herring (2):
      (Rev.) dt-bindings: i2c: add generic properties for GPIO bus recovery
      (Rev.) dt-bindings: i2c: mv64xxx: Add compatible for the A100 i2c nod=
e.

Yingjoe Chen (2):
      (Rev.) i2c: mediatek: Add access to more than 8GB dram in i2c driver
      (Rev.) i2c: mediatek: Add apdma sync in i2c driver

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   1 +
 Documentation/devicetree/bindings/i2c/i2c.txt      |  10 ++
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml          |   3 +
 .../devicetree/bindings/i2c/renesas,i2c.txt        |   1 +
 .../devicetree/bindings/i2c/renesas,iic.txt        |   1 +
 Documentation/i2c/busses/i2c-i801.rst              |   1 +
 Documentation/i2c/dev-interface.rst                |   2 +
 drivers/i2c/algos/i2c-algo-pca.c                   |   4 +-
 drivers/i2c/busses/Kconfig                         |   1 +
 drivers/i2c/busses/i2c-ali1535.c                   |   8 +-
 drivers/i2c/busses/i2c-ali15x3.c                   |   6 +-
 drivers/i2c/busses/i2c-amd8111.c                   |   2 +-
 drivers/i2c/busses/i2c-aspeed.c                    |   4 +-
 drivers/i2c/busses/i2c-at91-master.c               |  69 +--------
 drivers/i2c/busses/i2c-at91.h                      |   3 -
 drivers/i2c/busses/i2c-bcm-iproc.c                 |  13 +-
 drivers/i2c/busses/i2c-bcm2835.c                   |   2 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |   2 +-
 drivers/i2c/busses/i2c-digicolor.c                 |   2 +-
 drivers/i2c/busses/i2c-eg20t.c                     |  39 +----
 drivers/i2c/busses/i2c-emev2.c                     |   3 +-
 drivers/i2c/busses/i2c-fsi.c                       |   2 +-
 drivers/i2c/busses/i2c-i801.c                      |  19 ++-
 drivers/i2c/busses/i2c-mt65xx.c                    |  86 +++++++----
 drivers/i2c/busses/i2c-mv64xxx.c                   |   9 +-
 drivers/i2c/busses/i2c-nomadik.c                   |   3 +-
 drivers/i2c/busses/i2c-piix4.c                     |   4 +-
 drivers/i2c/busses/i2c-pnx.c                       |   3 +-
 drivers/i2c/busses/i2c-rcar.c                      |  15 +-
 drivers/i2c/busses/i2c-rk3x.c                      |  39 ++++-
 drivers/i2c/busses/i2c-sh_mobile.c                 |   3 +-
 drivers/i2c/busses/i2c-sibyte.c                    |   3 +-
 drivers/i2c/busses/i2c-sirf.c                      |   4 +-
 drivers/i2c/busses/i2c-synquacer.c                 |   3 +-
 drivers/i2c/busses/i2c-tegra.c                     | 101 +++++++------
 drivers/i2c/busses/i2c-viapro.c                    |   8 +-
 drivers/i2c/busses/scx200_acb.c                    |   2 +-
 drivers/i2c/i2c-core-base.c                        | 158 +++++++++++++++++=
++--
 drivers/i2c/i2c-dev.c                              |   4 +-
 drivers/i2c/i2c-slave-eeprom.c                     |   2 +-
 include/linux/i2c.h                                |  14 +-
 41 files changed, 409 insertions(+), 250 deletions(-)

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl81q+4ACgkQFA3kzBSg
KbZNoA//ZT/bqifULm8VooAJhVRWXOebMzotlAZTywWALQ3GmQQgx0KAdxXP3hZD
ec2L15FDlK+/ljvDpRkEPH5vMgN3hur1tX2gmih6zMmm6nuBOCUMfGtU1E+EfRa+
RV2b9zQGRBckckBTIY9Y/iyjOETxpZgZNJBqANzdlrFUPoqpGRMBuLnvg/afmKIB
W61Faxu1uoJBgXql+u1ZDO2acM807iXFFO34S72nlQ+3JTc+yl7SS6E9Za1hh3np
zLkEgA5cGh+lbvsbAMBcN+iSUYwL4kqGT3c7knSUjG7Fo53FooSb7uV78wqk+Zka
13TVV63upHmbMd02s4e/ts7Ax1YPsrhTo22W/T1wL20WUhn43t1VRdMYqWTv94hE
iLa3Uqj7c2SjdluD2GEsbHad+rznuTSgaOybsGOtfjsHZQAucsAlNtYfWbHsX185
hKahnANkUCUGXtIzcUzQvR95idx3ALl2thPVTi3M5lHImu25evAUfZgOBLdNwWgC
uGvxLeoCOlcVOTRctZf+AWTzq/wPgeZ0RyL7NZ2oicg29ujuzKOrSzVlDY70vs6V
NgfBDSvxjQ36cGRyJ+d8CgifYqhSAAf5c4zhStzrbM6xqflR+rs03Al2PWPchR3C
Tw3k4pV/znvOSYfWp8T3Q37AYhvm1/pqkElCv0iEJ+V7kQsZzww=
=5WS9
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
