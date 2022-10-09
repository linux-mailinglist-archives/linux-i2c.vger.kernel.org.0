Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75405F8CC5
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Oct 2022 20:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiJISNm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Oct 2022 14:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiJISNl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Oct 2022 14:13:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B60023BF4;
        Sun,  9 Oct 2022 11:13:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66AD760C38;
        Sun,  9 Oct 2022 18:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CD3C433D6;
        Sun,  9 Oct 2022 18:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665339219;
        bh=GQErVvLD+yTmsxHoJjsw2fsJ8p3oi70DsLzpF/U9rBM=;
        h=Date:From:To:Cc:Subject:From;
        b=BZ7soU0Ul+4LmuAFEufAvMqTyV44vzFaHEMLctzrZZApuIySJSli2RZmwSnJqKvFq
         toZV6V3+cQI297dtpGMLTk+RnXbWsSSMpE5fo3Hj+dj3Q2oDff/SusUqWVvcB4ZaWY
         iJ6Mwe2WYPEn25F085AVMOuK0D8QyfysB3xHMeK8G6h6jXdzWWLXgx8N2mCIKLmVY+
         DNC+ZYou661ZGgMYG2AH8sPf3wxmkldq3N3F25SvbRWy8bLe2nyyZk1Iw6GKtt040j
         EAk3Mas69AQynhRmWoS/U4JCH5jlemOG8tDfFt7qeQuhGXaG0wVMYrjMy3QoC9BjI8
         79FegUVsWeSaQ==
Date:   Sun, 9 Oct 2022 20:13:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.1-rc1-batch2
Message-ID: <Y0MPT6Mso6cD0mfN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ru4GaAzhnxfo7JvS"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ru4GaAzhnxfo7JvS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 2bca25eaeba6190efbfcb38ed169bd7ee43b5aaf:

  Merge tag 'spi-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/bro=
onie/spi (2022-10-04 19:36:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.1-rc1-batch2

for you to fetch changes up to fd66bd74afe880de4f008f96a795fedee887ff44:

  i2c: aspeed: Assert NAK when slave is busy (2022-10-05 21:06:46 +0200)

----------------------------------------------------------------
- correct a variable type in the new pci1xxxx driver
- add a new SoC to the qcom-cci driver
- fix an issue with the designware driver which now got enough testing
- the aspeed driver handles now busy target backends better

----------------------------------------------------------------
Colin Ian King (1):
      i2c: microchip: pci1xxxx: Fix comparison of -EPERM against an unsigne=
d variable

Jarkko Nikula (1):
      i2c: designware: Fix handling of real but unexpected device interrupts

Matti Lehtim=C3=A4ki (2):
      dt-bindings: i2c: qcom,i2c-cci: Document MSM8226 compatible
      dt-bindings: i2c: qcom,i2c-cci: Document clocks for MSM8974

Quan Nguyen (1):
      i2c: aspeed: Assert NAK when slave is busy

Rayyan Ansari (1):
      i2c: qcom-cci: Add MSM8226 compatible


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: designware: Fix handling of real but unexpected device in=
terrupts

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: qcom,i2c-cci: Document clocks for MSM8974
      (Rev.) dt-bindings: i2c: qcom,i2c-cci: Document MSM8226 compatible

Loic Poulain (1):
      (Rev.) i2c: qcom-cci: Add MSM8226 compatible

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 23 ++++++++++++++++++=
++--
 drivers/i2c/busses/i2c-aspeed.c                    |  9 ++++++++-
 drivers/i2c/busses/i2c-designware-core.h           |  7 +++++--
 drivers/i2c/busses/i2c-designware-master.c         | 13 ++++++++++++
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c             |  2 +-
 drivers/i2c/busses/i2c-qcom-cci.c                  |  1 +
 6 files changed, 49 insertions(+), 6 deletions(-)

--Ru4GaAzhnxfo7JvS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNDD0sACgkQFA3kzBSg
KbY3yA/+Kf9xLzPPyXq63N4x/FcmGGarGV+acLY2wC/Gn8bZO275VXbx8JpmqY61
XzyUhr3enJp9SAlBo2e2oFJz+9wGissvqa6lmKuLH4XrnI837s92DtiLyT+9GZnP
EuzILJ6m9Fh5fmK4RskMiakg4ksnqbwNDLJ/aDTac8QTrjH2PtPPwVR5WkFY01HQ
ezUrb1UPvFiDvuCVFhRpJEKlAX+Cj5E2LgJocqSYp0Mb4xjr2IPXhlJMDgXkLJ7m
maOe3hi8AOlvo8KWTl+CaH/8KRXIb0DmDsPVL4Xm+FBF+RM3TQkDByqAxpBS2ZDx
S0LlyiigDXkb56iTouyCHsA8yRWGMVD6mcHzoR6O9LiqW88d0o2CZWBCt1AtUeIF
hf5gPfaDb/+Ygpks4UUUQvZrHuA8hzYRRom8J4/f0UwQtIEMRuN8xPy0d+Ud4cc7
UmRCnrLSw2lK86AuAw4XuonZbjiLtO7mV6YVQS3q25mx3y00iJrSzeVGHPdm3eXV
9ITCfEaMmgQXTEvkXaYfbClcK4F8FEB0UnC5qfhneKng8/9JpTe5T/z6ziQgdkcA
Qam5n9yOLP+o6X1uBjTxD0s+76/UUHxi6ZESJdB6EniU9Ntu1bq8XBmchjiiKZby
JpAwZhP3RhuiLub3FWT/c9uWPgmyYdocg5wdqdvoGntl5lH60OM=
=aCZx
-----END PGP SIGNATURE-----

--Ru4GaAzhnxfo7JvS--
