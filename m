Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2E7D6EFA19
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Apr 2023 20:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234889AbjDZSdS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Apr 2023 14:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234679AbjDZSdR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Apr 2023 14:33:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205AC4698;
        Wed, 26 Apr 2023 11:33:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B550062FEA;
        Wed, 26 Apr 2023 18:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAFEC4339B;
        Wed, 26 Apr 2023 18:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682533995;
        bh=ytd2ITt+tOg4y1e9/JgLUKPPHZK6QJl6B7oyYLFObOg=;
        h=Date:From:To:Cc:Subject:From;
        b=XazoroWRpiZp4M1RKsyEeMkcrcXkVEdi/+t9Y5bfJ3TvqjtcItZVMCx5Fmtx8M+tG
         9FQ027sqkeGd6sItaOr5wXnENc6LGqAgpfDgKiGmuDnheO0JWvOM3bwsTSciuwxBaw
         7Kkx+loXBPgI7vZRcSkkLM1tLbebTb9Ex1jITXOGx1PugIhI2IdJgnpRfhcELlLuzl
         NxFQfF1hhWAoaQ3KEMtsklK0hIo1Yiu8s3Uq3+6W0FcUepPbH7Yt7G0Z4jBAEtHhYC
         j9jX0Au7gluh6W6jAjU8sT3b/yBTq6AqTXb9nqFFX4rfQz84244LxKcm1DcCWuynNa
         cwUiZUK4voyhQ==
Date:   Wed, 26 Apr 2023 20:33:11 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.4-rc1
Message-ID: <ZEluZxJDhXKFj2qk@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5X7aqb8SlVpKM3C2"
Content-Disposition: inline
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5X7aqb8SlVpKM3C2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

because I missed to send out my PR for 6.3 after rc7, I merged the two
fixes now into here.

Please pull,

   Wolfram


The following changes since commit 6a8f57ae2eb07ab39a6f0ccad60c760743051026:

  Linux 6.3-rc7 (2023-04-16 15:23:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.4-rc1

for you to fetch changes up to 38c87827ffd3c7e1dd61eee9a7dea13d487dc2ed:

  Merge branch 'i2c/for-current' into i2c/for-mergewindow (2023-04-24 12:50=
:20 +0200)

----------------------------------------------------------------
Mostly fixes for DTs or DT handling this time. And a few driver
bugfixes.

----------------------------------------------------------------
Andi Shyti (3):
      dt-bindings: i2c: mpc: Mark "fsl,timeout" as deprecated
      i2c: mpc: Use of_property_read_u32 instead of of_get_property
      i2c: mpc: Use i2c-scl-clk-low-timeout-us i2c property

AngeloGioacchino Del Regno (1):
      dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10

Conor Dooley (1):
      i2c: microchip-core: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHI=
P_POLARFIRE

Daniel Golle (2):
      dt-bindings: i2c: i2c-mt65xx: add MediaTek MT7981 SoC
      i2c: mediatek: add support for MT7981 SoC

Dongliang Mu (1):
      i2c: davinci: remove dead code in probe

Krzysztof Kozlowski (5):
      i2c: mt65xx: drop of_match_ptr for ID table
      i2c: owl: drop of_match_ptr for ID table
      i2c: cros-ec-tunnel: Mark ACPI and OF related data as maybe unused
      i2c: synquacer: mark OF related data as maybe unused
      i2c: xiic: hide OF related data for COMPILE_TEST

Lars-Peter Clausen (9):
      i2c: cadence: Remove always false ternary operator
      i2c: cadence: Remove unnecessary register reads
      dt-bindings: i2c: cadence: Document `fifo-depth` property
      i2c: cadence: Allow to specify the FIFO depth
      i2c: cadence: Detect maximum transfer size
      dt-bindings: i2c: cadence: Document `resets` property
      i2c: cadence: Add reset controller support
      i2c: cadence: cdns_i2c_master_xfer(): Fix runtime PM leak on error pa=
th
      i2c: xiic: xiic_xfer(): Fix runtime PM leak on error path

Rob Herring (2):
      i2c: Use of_property_read_bool() for boolean properties
      dt-bindings: i2c: Drop unneeded quotes

Uwe Kleine-K=C3=B6nig (2):
      i2c: imx: Simplify using devm_clk_get_enabled()
      i2c: omap: Improve error reporting for problems during .remove()

Wolfram Sang (1):
      Merge branch 'i2c/for-current' into i2c/for-mergewindow

Yang Li (1):
      i2c: xiic: Use devm_platform_get_and_ioremap_resource()

Ye Xingchen (1):
      i2c: brcmstb: use devm_platform_ioremap_resource_byname()


with much appreciated quality assurance from
----------------------------------------------------------------
Alain Volmat (1):
      (Rev.) dt-bindings: i2c: Drop unneeded quotes

Alexandre Mergnat (1):
      (Rev.) i2c: mediatek: add support for MT7981 SoC

AngeloGioacchino Del Regno (3):
      (Rev.) i2c: mediatek: add support for MT7981 SoC
      (Rev.) dt-bindings: i2c: i2c-mt65xx: add MediaTek MT7981 SoC
      (Rev.) i2c: mt65xx: drop of_match_ptr for ID table

Bartosz Golaszewski (1):
      (Rev.) i2c: davinci: remove dead code in probe

Chris Packham (5):
      (Rev.) i2c: mpc: Use i2c-scl-clk-low-timeout-us i2c property
      (Test) i2c: mpc: Use i2c-scl-clk-low-timeout-us i2c property
      (Test) i2c: mpc: Use of_property_read_u32 instead of of_get_property
      (Rev.) i2c: mpc: Use of_property_read_u32 instead of of_get_property
      (Rev.) i2c: Use of_property_read_bool() for boolean properties

Guenter Roeck (5):
      (Rev.) i2c: xiic: hide OF related data for COMPILE_TEST
      (Rev.) i2c: synquacer: mark OF related data as maybe unused
      (Rev.) i2c: cros-ec-tunnel: Mark ACPI and OF related data as maybe un=
used
      (Rev.) i2c: owl: drop of_match_ptr for ID table
      (Rev.) i2c: mt65xx: drop of_match_ptr for ID table

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: Drop unneeded quotes
      (Rev.) i2c: mpc: Use i2c-scl-clk-low-timeout-us i2c property

Michal Simek (3):
      (Rev.) i2c: xiic: xiic_xfer(): Fix runtime PM leak on error path
      (Rev.) i2c: cadence: cdns_i2c_master_xfer(): Fix runtime PM leak on e=
rror path
      (Rev.) i2c: xiic: Use devm_platform_get_and_ioremap_resource()

Neil Armstrong (1):
      (Rev.) dt-bindings: i2c: Drop unneeded quotes

Nicolas Ferre (1):
      (Rev.) dt-bindings: i2c: Drop unneeded quotes

Rob Herring (2):
      (Rev.) dt-bindings: i2c: cadence: Document `fifo-depth` property
      (Rev.) dt-bindings: i2c: mpc: Mark "fsl,timeout" as deprecated

Tony Lindgren (1):
      (Rev.) i2c: omap: Improve error reporting for problems during .remove=
()

 .../bindings/i2c/amlogic,meson6-i2c.yaml           |   4 +-
 .../devicetree/bindings/i2c/apple,i2c.yaml         |   4 +-
 .../devicetree/bindings/i2c/atmel,at91sam-i2c.yaml |   2 +-
 .../devicetree/bindings/i2c/cdns,i2c-r1p10.yaml    |  16 ++-
 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml |   3 +-
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml        |   5 +
 .../devicetree/bindings/i2c/i2c-mux-gpio.yaml      |   4 +-
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           |   4 +-
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |   2 +-
 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml          |   4 +-
 drivers/i2c/busses/Kconfig                         |   2 +-
 drivers/i2c/busses/i2c-brcmstb.c                   |   4 +-
 drivers/i2c/busses/i2c-cadence.c                   | 117 ++++++++++++++++-=
----
 drivers/i2c/busses/i2c-cros-ec-tunnel.c            |   4 +-
 drivers/i2c/busses/i2c-davinci.c                   |   5 +-
 drivers/i2c/busses/i2c-imx.c                       |  12 +--
 drivers/i2c/busses/i2c-mpc.c                       |  37 ++++---
 drivers/i2c/busses/i2c-mt65xx.c                    |  15 ++-
 drivers/i2c/busses/i2c-omap.c                      |   9 +-
 drivers/i2c/busses/i2c-owl.c                       |   2 +-
 drivers/i2c/busses/i2c-pxa.c                       |   6 +-
 drivers/i2c/busses/i2c-synquacer.c                 |   2 +-
 drivers/i2c/busses/i2c-xiic.c                      |   9 +-
 drivers/i2c/i2c-core-of.c                          |   2 +-
 24 files changed, 181 insertions(+), 93 deletions(-)

--5X7aqb8SlVpKM3C2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRJbmcACgkQFA3kzBSg
KbYxMA//d+YPo98h3d6iwTaWRdXrU4276sQ9iMhqwhX9Sy78mR+WIEWkhJDLYyZw
ad7lmPb/3/wLf0TRlQjak9BEjK8JbCTJLqz34WR0gGkSuYvScUkHWAt2N7n70CDW
XqADxRdEpjq16JkwY4mDLgUQmbv8htVMECPovW+CpfPDhm32TopvcxFSwyKiyNhw
hqvqnJe7m/C25Ozs12vH5I/mU62Ye5I4brWvXvwwnXBjv7Faf+Iv/kbnXhUtj3sz
hkJMssqFy1TU7ctB+dSOvRht/8DA3tnB6a9k095DUrTUkZAwYN2fe/V446Caksj1
2I3NpaHXXi8CswNunwqKQJ3HzCSPoWXCXNNxvUzdVUY/+4lHg3Dl+VSQX1+b3KR8
gSde/i1cqX0tuwgzdWex3F3DPIojqmz3+qRjpvfbqsgjCFsvycPmN0bVqNaTWNtc
/Bv4qIL0RvtNLFOL6kZiy5iaScTPS6lbnV6lG2ASHMYKTC7KFIJth/klUOunUvSv
G8NqU13MN3TTQWsRHL56v8owIgIFpXPmgqeC64QDD1gBAnLGepR2DIo4/5v9E/oQ
XqhvVGf8HSYmnKhxIV2shSrPPAyQEJ5toZNaGuEN+1w1JoUEgj5H6av3wh5OAhq3
WgO0CbEybOHcchPIOwin46kkofoLpx7Wp6BO0/6ecTi/xTzyIP0=
=2t0Q
-----END PGP SIGNATURE-----

--5X7aqb8SlVpKM3C2--
