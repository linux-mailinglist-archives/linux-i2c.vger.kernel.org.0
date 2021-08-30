Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4969C3FBCEA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Aug 2021 21:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbhH3Tdi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Aug 2021 15:33:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:40368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229883AbhH3Tdh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Aug 2021 15:33:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2728760F23;
        Mon, 30 Aug 2021 19:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630351963;
        bh=k2ayJSOGuipFYHoVW9ZJt2bHIawPoYWLxaNRcpR/wvs=;
        h=Date:From:To:Cc:Subject:From;
        b=cDbFZj509F6XQoGcPNPIaTAIae2NL+wb41IhwS5uBayl7FM4di+V1QG8XxmwpX9SO
         q3q3ByiNezELTA5hM2nfNNnwNe1MShhRWL0QP7DWpCdU7r8G7ov+QRhmmhdX/Mtk5l
         2C+vWwY+8CwLtbhThk5tY5WiL0HMmcpmK3M+RD+TXB6L+3VBYd4nVY5b42KpTIgVyX
         y4D5wfmO6BJi5mUI/2bT/ddDDmU88lC/Se1cySRWgIAK7j6jk5TLNo4ve6EcAtMCG5
         DT+iyTnZHqfcXK48eA1iMYJDVrCPq1wVZNi3P2LlU7dHu+ERPxzAM8IarpMoV6U3ai
         3ulcgLHpxqgYg==
Date:   Mon, 30 Aug 2021 21:32:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.15
Message-ID: <YS0yUtFCdybL+A43@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="F0FakHc2Ftzbabwu"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--F0FakHc2Ftzbabwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has a smaller pull reuest this time:

* new driver for I2C virtio
* removal of PMC SMP driver because platform is already gone
* IRQ probing and DMAENGINE API cleanups
* add SI metric prefix definitions to units.h
* beginning of i801 refactorization
* a few driver improvements

linux-next had trivial merge conflicts for
include/uapi/linux/virtio_ids.h and include/linux/units.h. The fixes
=66rom Stephen were correct.

Please pull.

Thanks,

   Wolfram


The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-merge=
window

for you to fetch changes up to 8b51a8e64443b95fb9fec9f76f1c93777b35310a:

  i2c: cadence: Implement save restore (2021-08-25 23:07:05 +0200)

----------------------------------------------------------------
Andy Shevchenko (6):
      i2c: parport: Switch to use module_parport_driver()
      units: Add SI metric prefix definitions
      i2c: designware: Use DIV_ROUND_CLOSEST() macro
      i2c: designware: Fix indentation in the header
      i2c: dev: Define pr_fmt() and drop duplication substrings
      i2c: dev: Use sysfs_emit() in "show" functions

Claudiu Beznea (1):
      i2c: at91: remove #define CONFIG_PM

Heiner Kallweit (4):
      i2c: i801: Fix handling SMBHSTCNT_PEC_EN
      i2c: i801: Improve disabling runtime pm
      i2c: i801: make p2sb_spinlock a mutex
      i2c: i801: Remove not needed debug message

Jie Deng (1):
      i2c: virtio: add a virtio i2c frontend driver

Len Baker (1):
      i2c: sun6i-pw2i: Prefer strscpy over strlcpy

Lukas Bulwahn (1):
      i2c: remove dead PMC MSP TWI/SMBus/I2C driver

Sergey Shtylyov (7):
      i2c: highlander: add IRQ check
      i2c: synquacer: fix deferred probing
      i2c: iop3xx: fix deferred probing
      i2c: s3c2410: fix IRQ check
      i2c: hix5hd2: fix IRQ check
      i2c: mt65xx: fix IRQ check
      i2c: xlp9xx: fix main IRQ check

Shubhrajyoti Datta (1):
      i2c: cadence: Implement save restore

Wolfram Sang (6):
      i2c: at91-master: : use proper DMAENGINE API for termination
      i2c: imx: : use proper DMAENGINE API for termination
      i2c: mxs: : use proper DMAENGINE API for termination
      i2c: qup: : use proper DMAENGINE API for termination
      i2c: sh_mobile: : use proper DMAENGINE API for termination
      i2c: at91: mark PM ops as __maybe unused


with much appreciated quality assurance from
----------------------------------------------------------------
Codrin Ciubotariu (3):
      (Rev.) i2c: at91: mark PM ops as __maybe unused
      (Rev.) i2c: at91-master: : use proper DMAENGINE API for termination
      (Rev.) i2c: at91: remove #define CONFIG_PM

George Cherian (1):
      (Rev.) i2c: xlp9xx: fix main IRQ check

Jean Delvare (6):
      (Rev.) i2c: parport: Switch to use module_parport_driver()
      (Rev.) i2c: i801: Remove not needed debug message
      (Test) i2c: i801: Remove not needed debug message
      (Rev.) i2c: i801: make p2sb_spinlock a mutex
      (Rev.) i2c: i801: Improve disabling runtime pm
      (Test) i2c: i801: Fix handling SMBHSTCNT_PEC_EN

Krzysztof Kozlowski (1):
      (Rev.) i2c: s3c2410: fix IRQ check

Mika Westerberg (1):
      (Rev.) i2c: i801: make p2sb_spinlock a mutex

Oleksij Rempel (1):
      (Rev.) i2c: imx: : use proper DMAENGINE API for termination

Qii Wang (1):
      (Rev.) i2c: mt65xx: fix IRQ check

Viresh Kumar (2):
      (Rev.) i2c: virtio: add a virtio i2c frontend driver
      (Test) i2c: virtio: add a virtio i2c frontend driver

 MAINTAINERS                                 |   9 +
 drivers/i2c/busses/Kconfig                  |  20 +-
 drivers/i2c/busses/Makefile                 |   2 +-
 drivers/i2c/busses/i2c-at91-core.c          |  19 +-
 drivers/i2c/busses/i2c-at91-master.c        |   4 +-
 drivers/i2c/busses/i2c-cadence.c            |  38 +-
 drivers/i2c/busses/i2c-designware-common.c  |   8 +-
 drivers/i2c/busses/i2c-designware-core.h    |   4 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |   5 +-
 drivers/i2c/busses/i2c-highlander.c         |   2 +-
 drivers/i2c/busses/i2c-hix5hd2.c            |   2 +-
 drivers/i2c/busses/i2c-i801.c               |  46 +--
 drivers/i2c/busses/i2c-imx.c                |   6 +-
 drivers/i2c/busses/i2c-iop3xx.c             |   6 +-
 drivers/i2c/busses/i2c-mt65xx.c             |   2 +-
 drivers/i2c/busses/i2c-mxs.c                |   4 +-
 drivers/i2c/busses/i2c-parport.c            |  36 +-
 drivers/i2c/busses/i2c-pmcmsp.c             | 600 ------------------------=
----
 drivers/i2c/busses/i2c-qup.c                |   2 +-
 drivers/i2c/busses/i2c-s3c2410.c            |   2 +-
 drivers/i2c/busses/i2c-sh_mobile.c          |   4 +-
 drivers/i2c/busses/i2c-sun6i-p2wi.c         |   2 +-
 drivers/i2c/busses/i2c-synquacer.c          |   2 +-
 drivers/i2c/busses/i2c-virtio.c             | 290 ++++++++++++++
 drivers/i2c/busses/i2c-xlp9xx.c             |   2 +-
 drivers/i2c/i2c-dev.c                       |  22 +-
 include/linux/units.h                       |  16 +
 include/uapi/linux/virtio_i2c.h             |  41 ++
 include/uapi/linux/virtio_ids.h             |   1 +
 29 files changed, 467 insertions(+), 730 deletions(-)
 delete mode 100644 drivers/i2c/busses/i2c-pmcmsp.c
 create mode 100644 drivers/i2c/busses/i2c-virtio.c
 create mode 100644 include/uapi/linux/virtio_i2c.h

--F0FakHc2Ftzbabwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEtMk4ACgkQFA3kzBSg
KbZhjg/+OdmsOL5GJ1VmefCIMAkFLEcOsiEj52zE8YxP5IDTsN08BAMGliB2cVNs
FMi1XjOk5FB8iVbq1BeBp5chcvCsFHwY56sGKVdDiaD5CqV5XCCCyBR/dlvAV7Rr
8luOoojt7ziLp+VJxollYUMYd96Dt22iH4WTh30bsnEJ0MTRgUyaZbe9nxTbBU2n
+B/O9NlOkp29wLQC93LICcJos2sRfGe4HBoF3njQ7ENbCS8WssJvTukMqoVhFrgf
PVp2aGmtWmScmqeC9madPjKayULMc0SOI8KqgRa4UclCl/L/qnVfb8ZsLgKwkbiH
RQ+qXTzgn/qNwnlIMq/49o7gNFIEguO9ZepIzjWRnngHLAmP3A/22re9csTH/y9s
cuYStckoK5gnnfMpYfD63bd0sG4V54SG7fTIliycqdrgW5mEHKF2otdL3HvBAXbC
gZwcT4Fd4vheYzC78zc9fEW/ydFpiIYpi4tTueopOErSomrMn+iXMSGGBO4UtW/2
LP4fjTlBghoV4rmA9J3BDCvUJyAUxSt4eV+AidNKmwEXWMxplq9JQXFkawUQw7D5
BQldWbm2q1MUKIP5MHtZM1g1ZhL7L9mGPzaqDnkJGot9O59p1TwhC2/k0OSKkG3L
8IZj+8Wa8ewKy6I3Z6G6obzgXeaaJi1/xWq60pA9v2Sx+A7Aroc=
=MEK/
-----END PGP SIGNATURE-----

--F0FakHc2Ftzbabwu--
