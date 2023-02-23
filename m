Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDF716A0F2E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 19:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBWSKd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Feb 2023 13:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjBWSKc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 13:10:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174642A6EA;
        Thu, 23 Feb 2023 10:10:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C95C4B81AB7;
        Thu, 23 Feb 2023 18:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18877C433D2;
        Thu, 23 Feb 2023 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677175812;
        bh=FiDOcwrpBh62X/8FrHN4IMGEpJnmx6Eu4Ea64vzU8VE=;
        h=Date:From:To:Cc:Subject:From;
        b=EKIO+U0N83T77sxqZ9nPUP5m02l8DQtyc4Ad059mZPwEJRdbyuHIePDHayBqrDp5v
         9zHmDA56xX37mtIBpRq3EqhnBsu+HR3XJItrXK564vJM6VnzYcxUiRR2HhjOAqDgkC
         /f/p7vAkocnSVl2MbWxI/OZ8O90jbWNJP0AwjkgNGPdeZJdmPGZyJgkjSC9ochcjqh
         KUWSCL1PvOARvR1ntmTApeNnOtHSOSxrn9lkbFJ1U1km2fiPwWpfCo3TzU65sLwJMP
         kDwiXndj7Y4meFkWycdedrrrTbqTEd9L1Ok0DCqAkO/tou2XXHMl5LoRiFrhTFa8DH
         Yu7Ydx2SzVlZQ==
Date:   Thu, 23 Feb 2023 19:10:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.3-rc1
Message-ID: <Y/esAfKcQpM77Gql@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="G3R8IQbuJf0ZzKYp"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--G3R8IQbuJf0ZzKYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b7bfaa761d760e72a969d116517eaa12e404c262:

  Linux 6.2-rc3 (2023-01-08 11:49:43 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc1

for you to fetch changes up to e8444bb9fd77f153adcc263eab28e3c2bc1cf540:

  MAINTAINERS: Add HPE GXP I2C Support (2023-02-17 23:18:31 +0100)

----------------------------------------------------------------
I2C for 6.3:

* new drivers for HPE GXP and Loongson 2K/LS7A
* bigger refactorings for i801 and xiic
* gpio driver gained ACPI and SDA-write only support
* the core converted some OF helpers to fwnode helpers
* usual bunch of driver updates

----------------------------------------------------------------
Alain Volmat (2):
      i2c: st: use pm_sleep_ptr to avoid ifdef CONFIG_PM_SLEEP
      dt-bindings: i2c: i2c-st: convert to DT schema

Bartosz Golaszewski (1):
      i2c: dev: fix notifier return values

Binbin Zhou (4):
      i2c: gpio: Add support on ACPI-based system
      dt-bindings: i2c: Add Loongson LS2X I2C controller
      i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
      MAINTAINERS: Add entry for the Loongson LS2X I2C driver

Christophe JAILLET (1):
      i2c: xiic: Remove some dead code

Fabien Parent (1):
      dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC

Hanna Hawa (3):
      i2c: designware: fix i2c_dw_clk_rate() return size to be u32
      pinctrl: Add an API to get the pinctrl pins if initialized
      i2c: Set i2c pinctrl recovery info from it's device pinctrl

Heiner Kallweit (13):
      dt-bindings: i2c: gpio: Add properties for dealing with write-only SDA/SCL w/o pullup
      i2c: algo: bit: allow getsda to be NULL
      i2c: gpio: support write-only sda/scl w/o pull-up
      i2c: i801: improve interrupt handler
      i2c: i801: make FEATURE_HOST_NOTIFY dependent on FEATURE_IRQ
      i2c: i801: make FEATURE_BLOCK_PROC dependent on FEATURE_BLOCK_BUFFER
      i2c: i801: add helper i801_set_hstadd()
      i2c: i801: Add i801_simple_transaction(), complementing i801_block_transaction()
      i2c: i801: Handle SMBAUXCTL_E32B in i801_block_transaction_by_block only
      i2c: i801: Centralize configuring non-block commands in i801_simple_transaction
      i2c: i801: Centralize configuring block commands in i801_block_transaction
      i2c: i801: Call i801_check_pre() from i801_access()
      i2c: i801: Call i801_check_post() from i801_access()

Konrad Dybcio (2):
      dt-bindings: i2c: qcom,i2c-cci: Fall back to common compatibles
      i2c: qcom-cci: Deprecate duplicated compatibles

Kunihiko Hayashi (1):
      dt-bindings: i2c: uniphier: Add resets property

Lars-Peter Clausen (3):
      i2c: cadence: Remove unused CDNS_I2C_DATA_INTR_DEPTH define
      i2c: cadence: Remove `irq` field from driver state struct
      i2c: cadence: Remove redundant expression in if clause

Luca Weiss (1):
      dt-bindings: i2c: qcom-cci: Document SM6350 compatible

Nick Hawkins (3):
      dt-bindings: i2c: Add hpe,gxp-i2c
      i2c: Add GXP SoC I2C Controller
      MAINTAINERS: Add HPE GXP I2C Support

Randy Dunlap (1):
      Documentation: i2c: correct spelling

Raviteja Narayanam (9):
      i2c: xiic: Add standard mode support for > 255 byte
      i2c: xiic: Fix Rx and Tx paths in standard mode
      i2c: xiic: Switch to Xiic standard mode for i2c-read
      i2c: xiic: Add wait for FIFO empty in send_tx
      i2c: xiic: Add smbus_block_read functionality
      i2c: xiic: Remove interrupt enable/disable in Rx path
      dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
      i2c: xiic: Update compatible with new IP version
      i2c: xiic: Add SCL frequency configuration support

Russell King (Oracle) (1):
      i2c: add fwnode APIs

Shyam Sundar S K (2):
      i2c: designware: add a new bit check for IC_CON control
      i2c: designware: Change from u32 to unsigned int for regmap_read() calls

Wolfram Sang (1):
      Merge branch 'i2c/fwnode-api' into i2c/for-mergewindow

Yang Yingliang (1):
      i2c: qcom-geni: change i2c_master_hub to static

ye xingchen (4):
      i2c: aspeed: Use devm_platform_get_and_ioremap_resource()
      i2c: bcm2835: Use devm_platform_get_and_ioremap_resource()
      i2c: mt65xx: Use devm_platform_get_and_ioremap_resource()
      i2c: au1550: Use devm_platform_get_and_ioremap_resource()


with much appreciated quality assurance from
----------------------------------------------------------------
Andrew Jeffery (1):
      (Rev.) i2c: aspeed: Use devm_platform_get_and_ioremap_resource()

Andy Shevchenko (7):
      (Rev.) i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
      (Rev.) i2c: designware: Change from u32 to unsigned int for regmap_read() calls
      (Rev.) i2c: designware: add a new bit check for IC_CON control
      (Rev.) i2c: gpio: Add support on ACPI-based system
      (Rev.) i2c: Set i2c pinctrl recovery info from it's device pinctrl
      (Rev.) pinctrl: Add an API to get the pinctrl pins if initialized
      (Rev.) i2c: designware: fix i2c_dw_clk_rate() return size to be u32

AngeloGioacchino Del Regno (2):
      (Rev.) i2c: mt65xx: Use devm_platform_get_and_ioremap_resource()
      (Rev.) dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC

Bjorn Andersson (1):
      (Rev.) i2c: qcom-geni: change i2c_master_hub to static

Florian Fainelli (1):
      (Rev.) i2c: bcm2835: Use devm_platform_get_and_ioremap_resource()

Jean Delvare (10):
      (Rev.) i2c: i801: Call i801_check_post() from i801_access()
      (Rev.) i2c: i801: Call i801_check_pre() from i801_access()
      (Rev.) i2c: i801: Centralize configuring block commands in i801_block_transaction
      (Rev.) i2c: i801: Centralize configuring non-block commands in i801_simple_transaction
      (Rev.) i2c: i801: Handle SMBAUXCTL_E32B in i801_block_transaction_by_block only
      (Rev.) i2c: i801: Add i801_simple_transaction(), complementing i801_block_transaction()
      (Rev.) i2c: i801: add helper i801_set_hstadd()
      (Rev.) i2c: i801: make FEATURE_BLOCK_PROC dependent on FEATURE_BLOCK_BUFFER
      (Rev.) i2c: i801: make FEATURE_HOST_NOTIFY dependent on FEATURE_IRQ
      (Rev.) i2c: i801: improve interrupt handler

Joel Stanley (1):
      (Rev.) i2c: Add GXP SoC I2C Controller

Krzysztof Kozlowski (5):
      (Rev.) dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
      (Rev.) dt-bindings: i2c: i2c-st: convert to DT schema
      (Rev.) dt-bindings: i2c: Add Loongson LS2X I2C controller
      (Rev.) i2c: qcom-cci: Deprecate duplicated compatibles
      (Rev.) dt-bindings: i2c: qcom,i2c-cci: Fall back to common compatibles

Linus Walleij (1):
      (Rev.) pinctrl: Add an API to get the pinctrl pins if initialized

Matthias Brugger (1):
      (Rev.) dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC

Michal Simek (4):
      (Rev.) i2c: xiic: Remove some dead code
      (Rev.) i2c: cadence: Remove redundant expression in if clause
      (Rev.) i2c: cadence: Remove `irq` field from driver state struct
      (Rev.) i2c: cadence: Remove unused CDNS_I2C_DATA_INTR_DEPTH define

Mika Westerberg (1):
      (Rev.) i2c: add fwnode APIs

Peibao Liu (1):
      (Test) i2c: gpio: Add support on ACPI-based system

Rob Herring (1):
      (Rev.) dt-bindings: i2c: gpio: Add properties for dealing with write-only SDA/SCL w/o pullup

 .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml       |  59 ++
 .../devicetree/bindings/i2c/i2c-gpio.yaml          |  26 +
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml        |   4 +
 Documentation/devicetree/bindings/i2c/i2c-st.txt   |  41 --
 .../devicetree/bindings/i2c/loongson,ls2x-i2c.yaml |  51 ++
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  49 +-
 .../bindings/i2c/socionext,uniphier-fi2c.yaml      |   3 +
 .../bindings/i2c/socionext,uniphier-i2c.yaml       |   3 +
 .../devicetree/bindings/i2c/st,sti-i2c.yaml        |  71 +++
 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml          |  11 +-
 Documentation/i2c/gpio-fault-injection.rst         |   2 +-
 Documentation/i2c/smbus-protocol.rst               |   2 +-
 MAINTAINERS                                        |  11 +-
 drivers/i2c/algos/i2c-algo-bit.c                   |  77 ++-
 drivers/i2c/busses/Kconfig                         |  18 +
 drivers/i2c/busses/Makefile                        |   2 +
 drivers/i2c/busses/i2c-aspeed.c                    |   4 +-
 drivers/i2c/busses/i2c-au1550.c                    |   4 +-
 drivers/i2c/busses/i2c-bcm2835.c                   |   4 +-
 drivers/i2c/busses/i2c-cadence.c                   |  23 +-
 drivers/i2c/busses/i2c-designware-common.c         |  13 +-
 drivers/i2c/busses/i2c-designware-core.h           |   5 +-
 drivers/i2c/busses/i2c-designware-master.c         |  33 +-
 drivers/i2c/busses/i2c-designware-slave.c          |   4 +-
 drivers/i2c/busses/i2c-gpio.c                      |  47 +-
 drivers/i2c/busses/i2c-gxp.c                       | 620 +++++++++++++++++++++
 drivers/i2c/busses/i2c-i801.c                      | 310 +++++------
 drivers/i2c/busses/i2c-ls2x.c                      | 370 ++++++++++++
 drivers/i2c/busses/i2c-mt65xx.c                    |   7 +-
 drivers/i2c/busses/i2c-qcom-cci.c                  |   8 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   2 +-
 drivers/i2c/busses/i2c-st.c                        |   9 +-
 drivers/i2c/busses/i2c-xiic.c                      | 586 +++++++++++++++++--
 drivers/i2c/i2c-core-acpi.c                        |  13 +-
 drivers/i2c/i2c-core-base.c                        | 103 +++-
 drivers/i2c/i2c-core-of.c                          |  66 ---
 drivers/i2c/i2c-dev.c                              |  16 +-
 include/linux/i2c.h                                |  24 +-
 include/linux/pinctrl/devinfo.h                    |  15 +
 include/linux/platform_data/i2c-gpio.h             |   9 +
 40 files changed, 2248 insertions(+), 477 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-st.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/st,sti-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-gxp.c
 create mode 100644 drivers/i2c/busses/i2c-ls2x.c

--G3R8IQbuJf0ZzKYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmP3rAEACgkQFA3kzBSg
KbYztRAAo4Er8S+XHvhJfe1l3xIvq/CbZHidoXTX4/UeHLvG81BcNcrwAsfmkTFb
c2LDQbR3ZsERQDgCuzuNmHwVJ+/0g7thR27YjYuAegMwYDmPc4iif8nDjT+iE+Xz
ksFDLIVUutaMDs0BUqlJ/O2YvZZRYCablGy2NURdeMcmIEJWUafCxb+rlTrNO9KS
455Fyb9wW3CqeCcOZQovLq4QERFz2aIZigsO5pW8KNPNwWWDHAkfUUbFH+TEjMiQ
lFlso5iD6+cv6eG6AF9SQiexTvdeSBMy/Ih64zvtBmSjMANpPHloXRh79erYjGZy
vbGmhTaNpGKr7wuCSZCNUOI66y3AmJJ0XE24uRvV8xOiRXO0KWtR71VlAYxdIguu
kM2qEIYiu5qtPl0Bzm8XPvWeKsPTDS+KOSjPzqIDY3srY2z504TqddYlflf2PNUi
3P1OAm9JWt5KXohuBZGQ9GV+bXlvOMlO0P9f+1F1DsLp30+Fjs8Cj5lhxh00Qn6H
XdbSFbTNAbznaXiroXAhBLa6XaUEzbW6/+uMyDX+lDGk98ov7EZu7CET3KBKplgP
wHDOLU5V97DHDZeq3NOP798RNgxU5yO0UJlFaM1WWQ2XMJiELcKg/jPaLqD6CPQu
55lpvd5UWw/CEi4kO7DHV8DqBKQrGbFT41LderlcEDk2qH2FAN4=
=HKMw
-----END PGP SIGNATURE-----

--G3R8IQbuJf0ZzKYp--
