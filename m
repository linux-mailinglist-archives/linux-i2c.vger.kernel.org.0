Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4159E5394F6
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 18:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346144AbiEaQ1r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 12:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241124AbiEaQ1q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 12:27:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD7E61292;
        Tue, 31 May 2022 09:27:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 63A1760BA2;
        Tue, 31 May 2022 16:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34224C34114;
        Tue, 31 May 2022 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654014463;
        bh=B8h/Nl/GxDM6gtW3ZmfFBoNHflbB4tr9I2FiYsyzqD8=;
        h=Date:From:To:Cc:Subject:From;
        b=a9CJxF53XxvLYeKIzW4T/P0fYmzUQneViV8QvO6Vas08itkY3DAIWEQFD3WQLabE5
         wpwtrFEJ8licE12W+hqWVGngLypA6cm5EHfh9UmEaHKBipK9LDOHIAnrncRXBMhCIa
         FjMXEA+EJ6HszAFcBvqhYXOrM6xlIYgGXAJQY6+fCj2V5Pk9c4Xx6sEeQkXs+BcFjk
         RemlOSMN2qDZArNMEmkxQhihy1BBLMsWNV4SesGtHU03Js08qJ6h0JRpHG7ePVMSXY
         8ZkMqZs/BP8q56AqO8hKDNfWuGWQyhbHQh6kOzgQu1QT/0YIXs3xU99AOkh/rHQrUQ
         GANkGk4Fxz4cg==
Date:   Tue, 31 May 2022 18:27:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-5.19
Message-ID: <YpZB/KoqwZJxvzv4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6HWRmP+l7FBzBA39"
Content-Disposition: inline
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6HWRmP+l7FBzBA39
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Linus,

I finally updated my scripts, and one effect is that they finally use signe=
d tags.
I hope it works and nothing else is broken. Please pull.

All the best,

   Wolfram


The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
5.19

for you to fetch changes up to 3cd4030da3a9b54ee1ffb8397aba857397c703e4:

  i2c: meson: fix typo in comment (2022-05-21 13:33:25 +0200)

----------------------------------------------------------------
I2C for 5.19-rc1

I2C has only driver updates for 5.19. Bigger changes are for Meson,
NPCM, and R-Car, but there are also changes all over the place.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      i2c: mediatek: Optimize master_xfer() and avoid circular locking

Christophe Leroy (1):
      i2c: powermac: Prepare cleanup of powerpc's asm/prom.h

Dan Carpenter (1):
      i2c: qcom-geni: remove unnecessary conditions

Geert Uytterhoeven (1):
      dt-bindings: i2c: renesas,rcar-i2c: R-Car V3U is R-Car Gen4

Jan Dabros (1):
      i2c: designware: Modify timing parameters for amdpsp mailbox

Jarkko Nikula (1):
      i2c: designware: Sort timing parameter ACPI method calls by the speed

Julia Lawall (1):
      i2c: meson: fix typo in comment

Krzysztof Kozlowski (1):
      dt-bindings: i2c: qcom,i2c-qup: convert to dtschema

Kuninori Morimoto (2):
      i2c: rcar: fix PM ref counts in probe error paths
      i2c: rcar: use flags instead of atomic_xfer

Lucas Tanure (3):
      i2c: meson: Use _SHIFT and _MASK for register definitions
      i2c: meson: Use 50% duty cycle for I2C clock
      i2c: cadence: Increase timeout per message if necessary

Michael Walle (1):
      i2c: at91: use dma safe buffers

Michal Simek (1):
      i2c: xiic: Fix coding style issues

Minghao Chi (1):
      i2c: davinci: using pm_runtime_resume_and_get instead of pm_runtime_g=
et_sync

Nathan Chancellor (1):
      i2c: at91: Initialize dma_buf in at91_twi_xfer()

Raviteja Narayanam (1):
      i2c: xiic: Fix Tx Interrupt path for grouped messages

Shubhrajyoti Datta (2):
      i2c: xiic: return value of xiic_reinit
      i2c: xiic: Correct the datatype for rx_watermark

Stephen Kitt (1):
      docs: i2c: reference simple probes

Tali Perry (5):
      i2c: npcm: Change the way of getting GCR regmap
      i2c: npcm: Remove unused variable clk_regmap
      i2c: npcm: Fix timeout calculation
      i2c: npcm: Add tx complete counter
      i2c: npcm: Handle spurious interrupts

Tyrone Ting (1):
      i2c: npcm: Correct register access width

Wolfram Sang (5):
      i2c: rcar: add support for I2C_M_RECV_LEN
      i2c: rcar: avoid race condition with SMIs
      i2c: rcar: refactor handling of first message
      i2c: rcar: use BIT macro consistently
      i2c: rcar: REP_AFTER_RD is not a persistent flag

Yang Yingliang (2):
      i2c: meson: fix missing clk_disable_unprepare() on error in meson_i2c=
_probe()
      i2c: mt7621: Use devm_platform_get_and_ioremap_resource()


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: designware: Sort timing parameter ACPI method calls by th=
e speed

Bartosz Golaszewski (1):
      (Rev.) i2c: davinci: using pm_runtime_resume_and_get instead of pm_ru=
ntime_get_sync

Codrin Ciubotariu (1):
      (Rev.) i2c: at91: use dma safe buffers

Eugeniu Rosca (2):
      (Rev.) i2c: rcar: add support for I2C_M_RECV_LEN
      (Test) i2c: rcar: add support for I2C_M_RECV_LEN

Jonathan Neusch=C3=A4fer (2):
      (Rev.) i2c: npcm: Correct register access width
      (Rev.) i2c: npcm: Remove unused variable clk_regmap

Michael Walle (1):
      (Rev.) i2c: at91: Initialize dma_buf in at91_twi_xfer()

Neil Armstrong (3):
      (Rev.) i2c: meson: fix missing clk_disable_unprepare() on error in me=
son_i2c_probe()
      (Rev.) i2c: meson: Use 50% duty cycle for I2C clock
      (Rev.) i2c: meson: Use _SHIFT and _MASK for register definitions

N=C3=ADcolas F. R. A. Prado (1):
      (Test) i2c: mediatek: Optimize master_xfer() and avoid circular locki=
ng

Qii Wang (1):
      (Rev.) i2c: mediatek: Optimize master_xfer() and avoid circular locki=
ng

Rob Herring (1):
      (Rev.) dt-bindings: i2c: qcom,i2c-qup: convert to dtschema

Stefan Roese (1):
      (Rev.) i2c: mt7621: Use devm_platform_get_and_ioremap_resource()

Wolfram Sang (1):
      (Rev.) dt-bindings: i2c: renesas,rcar-i2c: R-Car V3U is R-Car Gen4

 .../devicetree/bindings/i2c/qcom,i2c-qup.txt       |  40 ----
 .../devicetree/bindings/i2c/qcom,i2c-qup.yaml      |  89 +++++++++
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml  |   2 +-
 Documentation/i2c/writing-clients.rst              |  13 +-
 drivers/i2c/busses/i2c-at91-master.c               |  11 ++
 drivers/i2c/busses/i2c-cadence.c                   |  12 +-
 drivers/i2c/busses/i2c-davinci.c                   |  12 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c         |   4 +-
 drivers/i2c/busses/i2c-designware-common.c         |   2 +-
 drivers/i2c/busses/i2c-meson.c                     | 115 ++++++++---
 drivers/i2c/busses/i2c-mt65xx.c                    |  11 +-
 drivers/i2c/busses/i2c-mt7621.c                    |   5 +-
 drivers/i2c/busses/i2c-npcm7xx.c                   | 122 ++++++++----
 drivers/i2c/busses/i2c-powermac.c                  |   2 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   6 +-
 drivers/i2c/busses/i2c-rcar.c                      | 217 ++++++++++++-----=
----
 drivers/i2c/busses/i2c-xiic.c                      |  84 ++++----
 17 files changed, 469 insertions(+), 278 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml

--6HWRmP+l7FBzBA39
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKWQfgACgkQFA3kzBSg
KbbjPRAAjsUSnMiaGapfM5M5LHQL2v8SqNiOJQOeWXpvsfjOVE34P9D7ZVeJmttW
oTa+abBSFW94X+7pAqKqf1ws60++vjNmbq5f5oobb5AK7FnY8hs0Z4/ibZoDigx0
+2c3emTPml+E4vNYluZV3ZM4LrIO/Q/C3fpQ9Gki3Qj4xO9LKsvANPDgJHyiEBrJ
Xjw0QobYo2g9cNxq4ULOIbjLxRvF+6nJIB1OjqpL1y31LoDhYLtBjf6bPDXug2i7
ylTeakunuvqIZk/d1O/s6mZ5D5VEj59CtYQg+PjjyLHJwpkG1nSP2s+MlAtEEfoV
+rkEsyZkJh1MzcSBkYVzVa99EEfDJEzfVEhw8fjardK9C/yeUzMQzrEdmAq/kgyD
i/YgCC66RF7rYHQHYxKt9FK8pqAQh/NZ5w7sOgwNxTGOuo/QEzVK1ZvwL+p1Vo13
roM2cRUAy38kb5NEJxDGBMx71Fl2S2QVWuSOAs0j6H4G3YrGd5g5ZA2B6oUz/GWe
H9sMf4gGuNISuYMHfkr6pGb0Bs9EYI+HdUpw/BDVidJMteUBfqH6gVxWS2s3jA+V
xDe81qHCWFy8++Amn7hQPitXJtzIIPM4lCZGhpdgnV4hhPOcRpBuT0jsQCAzZfZM
NrsvA9KfQ9vTt0M96818OdJ0ejy386M+Fsd0BW845ZmjrrAO7ug=
=cVG4
-----END PGP SIGNATURE-----

--6HWRmP+l7FBzBA39--
