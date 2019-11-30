Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE0910DE29
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Nov 2019 16:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfK3Poz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 Nov 2019 10:44:55 -0500
Received: from sauhun.de ([88.99.104.3]:45816 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725985AbfK3Poz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 Nov 2019 10:44:55 -0500
Received: from localhost (p5486CF24.dip0.t-ipconnect.de [84.134.207.36])
        by pokefinder.org (Postfix) with ESMTPSA id B4E002C05E1;
        Sat, 30 Nov 2019 16:44:50 +0100 (CET)
Date:   Sat, 30 Nov 2019 16:44:50 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.5
Message-ID: <20191130154442.GA7415@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has mostly driver updates for you this time. The few noteworthy
changes are: the core has now support for analog and digital filters
with at91 being the first user, a core addition to replace the NULL
returning i2c_new_probed_device() with an ERR_PTR variant, and the pxa
driver has finally being moved to use the generic I2C slave interface.
We have quite a significant number of reviews per patch this time, so
thank you to all involved!

Please pull.

Thanks,

   Wolfram


The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.5

for you to fetch changes up to a72e27f7a47069b1b4942051bffa7dc77b4aee0c:

  video: fbdev: matrox: convert to i2c_new_scanned_device (2019-11-28 17:19=
:20 +0100)

----------------------------------------------------------------
Akshu Agrawal (1):
      i2c: cros-ec-tunnel: Make the device acpi compatible

Alain Volmat (4):
      i2c: stm32f7: rework slave_id allocation
      i2c: stm32f7: fix & reorder remove & probe error handling
      i2c: stm32f7: report dma error during probe
      i2c: i2c-stm32f7: fix 10-bits check in slave free id search loop

Andy Shevchenko (1):
      i2c: i801: Correct Intel Jasper Lake SOC naming

Biju Das (2):
      dt-bindings: i2c: rcar: Add r8a774b1 support
      dt-bindings: i2c: sh_mobile: Add r8a774b1 support

Corey Minyard (1):
      i2c: smbus: Don't filter out duplicate alerts

Eddie James (2):
      dt-bindings: i2c: Aspeed: Add AST2600 compatible
      i2c: Aspeed: Add AST2600 compatible

Eugen Hristev (7):
      dt-bindings: i2c: at91: add new compatible
      dt-bindings: i2c: add bindings for i2c analog and digital filter
      i2c: add support for filters optional properties
      i2c: at91: add new platform support for sam9x60
      i2c: at91: add support for digital filtering
      i2c: at91: add support for advanced digital filtering
      i2c: at91: add support for analog filtering

Geert Uytterhoeven (1):
      i2c: rcar: Remove superfluous call to clk_get_rate()

Jarkko Nikula (2):
      i2c: i801: Add support for Intel Jasper Lake
      i2c: i801: Add support for Intel Comet Lake PCH-H

Jean Delvare (1):
      eeprom: at24: Improve confusing log message

Krzysztof Kozlowski (1):
      i2c: Fix Kconfig indentation

Lori Hikichi (1):
      i2c: iproc: Add i2c repeated start capability

Neil Armstrong (1):
      dt-bindings: i2c: meson: convert to yaml

Patrick Williams (2):
      i2c: pxa: migrate to new i2c_slave APIs
      i2c: pxa: remove unused i2c-slave APIs

Peter Ujfalusi (4):
      i2c: at91: Use dma_request_chan() directly for channel request
      i2c: qup: Use dma_request_chan() directly for channel request
      i2c: sh_mobile: Use dma_request_chan() directly for channel request
      i2c: tegra: Use dma_request_chan() directly for channel request

Shubhrajyoti Datta (1):
      i2c: xiic: Fix kerneldoc warnings

Wolfram Sang (6):
      i2c: icy: no need to populate address for scanned device
      Merge tag 'at24-v5.5-updates-for-wolfram' of git://git.kernel.org/...=
/brgl/linux into i2c/for-5.5
      i2c: remove helpers for ref-counting clients
      i2c: replace i2c_new_probed_device with an ERR_PTR variant
      i2c: icy: convert to i2c_new_scanned_device
      video: fbdev: matrox: convert to i2c_new_scanned_device


with much appreciated quality assurance from
----------------------------------------------------------------
Benjamin Tissoires (1):
      (Rev.) i2c: smbus: Don't filter out duplicate alerts

Brendan Higgins (2):
      (Rev.) i2c: Aspeed: Add AST2600 compatible
      (Rev.) dt-bindings: i2c: Aspeed: Add AST2600 compatible

Enric Balletbo i Serra (1):
      (Rev.) i2c: cros-ec-tunnel: Make the device acpi compatible

Geert Uytterhoeven (3):
      (Rev.) i2c: remove helpers for ref-counting clients
      (Rev.) dt-bindings: i2c: sh_mobile: Add r8a774b1 support
      (Rev.) dt-bindings: i2c: rcar: Add r8a774b1 support

Jarkko Nikula (1):
      (Rev.) i2c: i801: Correct Intel Jasper Lake SOC naming

Jean Delvare (4):
      (Rev.) i2c: i801: Correct Intel Jasper Lake SOC naming
      (Rev.) i2c: remove helpers for ref-counting clients
      (Rev.) i2c: i801: Add support for Intel Comet Lake PCH-H
      (Rev.) i2c: i801: Add support for Intel Jasper Lake

Luca Ceresoli (5):
      (Rev.) i2c: replace i2c_new_probed_device with an ERR_PTR variant
      (Test) i2c: remove helpers for ref-counting clients
      (Rev.) i2c: remove helpers for ref-counting clients
      (Rev.) i2c: rcar: Remove superfluous call to clk_get_rate()
      (Rev.) i2c: xiic: Fix kerneldoc warnings

Max Staudt (3):
      (Rev.) i2c: icy: convert to i2c_new_scanned_device
      (Rev.) i2c: replace i2c_new_probed_device with an ERR_PTR variant
      (Test) i2c: icy: no need to populate address for scanned device

Niklas S=C3=B6derlund (2):
      (Rev.) i2c: remove helpers for ref-counting clients
      (Rev.) i2c: rcar: Remove superfluous call to clk_get_rate()

Peter Rosin (7):
      (Rev.) i2c: at91: add support for analog filtering
      (Rev.) i2c: at91: add support for advanced digital filtering
      (Rev.) i2c: at91: add support for digital filtering
      (Rev.) i2c: at91: add new platform support for sam9x60
      (Rev.) i2c: add support for filters optional properties
      (Rev.) dt-bindings: i2c: add bindings for i2c analog and digital filt=
er
      (Rev.) dt-bindings: i2c: at91: add new compatible

Pierre-Yves MORDRET (4):
      (Rev.) i2c: i2c-stm32f7: fix 10-bits check in slave free id search lo=
op
      (Rev.) i2c: stm32f7: report dma error during probe
      (Rev.) i2c: stm32f7: fix & reorder remove & probe error handling
      (Rev.) i2c: stm32f7: rework slave_id allocation

Rob Herring (3):
      (Rev.) dt-bindings: i2c: meson: convert to yaml
      (Rev.) dt-bindings: i2c: add bindings for i2c analog and digital filt=
er
      (Rev.) dt-bindings: i2c: at91: add new compatible

Vinod Koul (4):
      (Rev.) i2c: tegra: Use dma_request_chan() directly for channel request
      (Rev.) i2c: sh_mobile: Use dma_request_chan() directly for channel re=
quest
      (Rev.) i2c: qup: Use dma_request_chan() directly for channel request
      (Rev.) i2c: at91: Use dma_request_chan() directly for channel request

Wolfram Sang (1):
      (Rev.) eeprom: at24: Improve confusing log message

 .../bindings/i2c/amlogic,meson6-i2c.yaml           | 53 +++++++++++++++
 .../devicetree/bindings/i2c/i2c-aspeed.txt         |  3 +-
 Documentation/devicetree/bindings/i2c/i2c-at91.txt |  3 +-
 .../devicetree/bindings/i2c/i2c-meson.txt          | 30 ---------
 Documentation/devicetree/bindings/i2c/i2c.txt      | 18 ++++++
 .../devicetree/bindings/i2c/renesas,i2c.txt        |  1 +
 .../devicetree/bindings/i2c/renesas,iic.txt        |  1 +
 Documentation/i2c/busses/i2c-i801.rst              |  1 +
 Documentation/i2c/instantiating-devices.rst        | 10 +--
 Documentation/i2c/writing-clients.rst              |  8 +--
 drivers/i2c/busses/Kconfig                         | 24 +++----
 drivers/i2c/busses/i2c-aspeed.c                    |  4 ++
 drivers/i2c/busses/i2c-at91-core.c                 | 38 +++++++++++
 drivers/i2c/busses/i2c-at91-master.c               | 53 +++++++++++++--
 drivers/i2c/busses/i2c-at91.h                      | 13 ++++
 drivers/i2c/busses/i2c-bcm-iproc.c                 | 63 ++++++++++++++----
 drivers/i2c/busses/i2c-cros-ec-tunnel.c            | 15 +++--
 drivers/i2c/busses/i2c-i801.c                      |  8 +++
 drivers/i2c/busses/i2c-icy.c                       |  9 ++-
 drivers/i2c/busses/i2c-pxa.c                       | 75 +++++++++++++++++-=
----
 drivers/i2c/busses/i2c-qup.c                       |  4 +-
 drivers/i2c/busses/i2c-rcar.c                      |  2 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |  2 +-
 drivers/i2c/busses/i2c-stm32.c                     | 16 ++---
 drivers/i2c/busses/i2c-stm32f7.c                   | 32 ++++++---
 drivers/i2c/busses/i2c-tegra.c                     |  4 +-
 drivers/i2c/busses/i2c-xiic.c                      |  2 +
 drivers/i2c/i2c-core-base.c                        | 63 ++++++++----------
 drivers/i2c/i2c-smbus.c                            |  7 --
 drivers/i2c/muxes/Kconfig                          | 18 +++---
 drivers/misc/eeprom/at24.c                         |  9 ++-
 drivers/video/fbdev/matrox/i2c-matroxfb.c          |  4 +-
 include/linux/i2c-pxa.h                            | 18 ------
 include/linux/i2c.h                                | 21 ++++--
 include/linux/platform_data/i2c-pxa.h              |  4 --
 35 files changed, 431 insertions(+), 205 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2=
c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-meson.txt
 delete mode 100644 include/linux/i2c-pxa.h

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3ijmYACgkQFA3kzBSg
KbYfZxAAlXQktz5qKkyqVKdpd+e52KdcvfsQn39BbCpLKlQXumpvkYUj+mftbIvW
ZTLRhBLuLPW+bQ6VPydNRBLKUmwgNxHGBKqSDWxWR77yhw2qXu6Iie3dBCZFr3uU
9Ewy+hK5HI06Mwrk2RyP2h8rpiCrBOY+qQ01B/tmy5i3LARaZiyIg7S7hhLyDsOF
Ipnxzlyq/xA7FWA0mH0eH8HaFlR97wrO/cnWu/kAERtyUDISHs9HN+Xt0vJZLsOP
/1soVG3R6+83nvDSG2WAl6Y3zX/YOZiXHQtUm6Ehk7E7pGTlEDMRoR4FCtyvqnSh
E4YsJdLrkTrfCLMy9trpfudfNaA2UDS6f2ZfUoPhQE2IDqUkSBEkdi9DnptN6PNt
W3NivA40Zx39ha8cEZRzacWQ2qIEAGFgMyLkV/aUgICtVnSFIGUgMDDFvqKlz6d0
dA/45GK5HYNWXGA7xudeh9Zz+NlwYjwRd5UTpOaIPUdJY9u+Ku2nuiQH753ISN41
FBXvUh8PePNawbPeUrw9ekiUdI54i1fuSlZSy9DJIC8TeP2jfqw8ySkrfctenRHA
4jKsK7lj3J5TVveAhiR7ZQtcxw+I1q0sfWWYHeVVO5uPzQZM5W4c1KWbplzdWn9P
ZAuma6FA2RoUDle07SGU21DDFDEuATtFCE6q/+5+xH6H5oJoZUo=
=5EM3
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
