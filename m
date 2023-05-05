Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 125B06F8A83
	for <lists+linux-i2c@lfdr.de>; Fri,  5 May 2023 23:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbjEEVBe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 May 2023 17:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjEEVBd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 May 2023 17:01:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3D14EFF;
        Fri,  5 May 2023 14:01:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7EC463DA0;
        Fri,  5 May 2023 21:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85860C433D2;
        Fri,  5 May 2023 21:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683320492;
        bh=TO8IRibfP223Tfp1AEaFYCYQ6KMuT4ejbMev0zPIScc=;
        h=Date:From:To:Cc:Subject:From;
        b=aezqVXH4405aF/9BMko5RSkXBxcxhY/gWTB95dPXQWTqZlUs5TMAi012ZbRCrhPph
         5qWdY7PWd6PLe8G//Tkp0AiJRgKlAT2+/UGgzjBr6aIPBYpfcqBEvUI8h6mJsI85Az
         S6d8gIBmCm03bU8Kp4WaE0PBy+DQx+TxVo7o2gSW/eGQoeZBdk8fOwr2psL6bO7PeE
         0AO1oVL+ZOf1q41B+jAS2LV+90GeVsGG6RMTyNILXfiv/OEnlxZXYLSXN/2mIhi9Lm
         bWFVqsFSEXwETAkbiHAroV9X7EnCIKxoSquQs2NlpGcEtqW/jzR65esF0Xl4p47bVl
         TVcEyEFZq02oA==
Date:   Fri, 5 May 2023 23:01:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.4-rc1-part2
Message-ID: <ZFVunzGXNMNUErVn@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kNcPYzM4z9x7X5z/"
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


--kNcPYzM4z9x7X5z/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 825a0714d2b3883d4f8ff64f6933fb73ee3f1834:

  Merge tag 'efi-next-for-v6.4' of git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi (2023-04-29 17:42:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.4-rc1-part2

for you to fetch changes up to 1bd922877a084c1c6c1d0cb1bb9c3700fa0f6c61:

  dt-bindings: i2c: brcm,kona-i2c: convert to YAML (2023-05-03 17:38:41 +0200)

----------------------------------------------------------------
some more driver bugfixes and a DT binding conversion

----------------------------------------------------------------
Akhil R (1):
      i2c: tegra: Fix PEC support for SMBUS block read

Alexander Stein (1):
      i2c: imx-lpi2c: avoid taking clk_prepare mutex in PM callbacks

Arnd Bergmann (1):
      i2c: gxp: fix build failure without CONFIG_I2C_SLAVE

Reid Tonking (1):
      i2c: omap: Fix standard mode false ACK readings

Stanislav Jakubek (1):
      dt-bindings: i2c: brcm,kona-i2c: convert to YAML


with much appreciated quality assurance from
----------------------------------------------------------------
Krzysztof Kozlowski (1):
      (Rev.) dt-bindings: i2c: brcm,kona-i2c: convert to YAML

Nick Hawkins (1):
      (Rev.) i2c: gxp: fix build failure without CONFIG_I2C_SLAVE

Tony Lindgren (1):
      (Rev.) i2c: omap: Fix standard mode false ACK readings

 .../devicetree/bindings/i2c/brcm,kona-i2c.txt      | 35 -------------
 .../devicetree/bindings/i2c/brcm,kona-i2c.yaml     | 59 ++++++++++++++++++++++
 drivers/i2c/busses/i2c-gxp.c                       |  2 -
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |  4 +-
 drivers/i2c/busses/i2c-omap.c                      |  2 +-
 drivers/i2c/busses/i2c-tegra.c                     | 40 ++++++++++-----
 include/linux/i2c.h                                |  4 +-
 7 files changed, 91 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml

--kNcPYzM4z9x7X5z/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRVbp8ACgkQFA3kzBSg
KbZePhAAmebRCzj8DoRCFGrvFLdykx2dq9y9s0JK+mGhewK8aW1f+PrJZgyZq2WM
uiFJKe4EbSTJ1fDJwibg6jsVSCcSGnJ9l05Jk/8H0o2UWMS22baed/8gVj94QI0Q
VASOpqBo5SKbO9brP5o5u3evocZfrM8xHQk89HG5zhULzaq+m6nLGiz4c7Zsz4Sb
8I8Nqa6jWTwE38yJEZIC8wQcu7DZjGFzOwgmjdmeiJM0bSE9rKD20teQhKJyzfWg
OP4MbbPcqzsiz5yfqFv93jRjL4wDeC2oBXN2Lo9rzWvVPboTNYiTDasNfb/OgwVS
oWilCxZoyv+VI87tsw5jSjS2c+JhAKlEq4mU3jG/8q+/ld3XAXELjrhOufVwEGU2
L1Pq3aXTVK8tM1/muMWGLnhrKDbw9giLBkAHSMi6mtv2NHUfzoDNw7UpPpFqFRR7
4mLtiL/tAjFGfmYUorc4R0UhWNhpeYLPRV5hnGOTnHkcofUGRNVUdVWuf+J4Xqh2
A6E+pYXZGzZIlYO/v4+Fw70CSGDPLmzrWUlEP2n3qN2hyOBQ7PHVfRtAxg8x7GAc
O5OOnmkSWBM1j+VcIXZ1/oRN40sr4nVRk1VHWCXc+D1pIQuFPC2Sfa8roO6DL0mY
AJsxnTFrgRjXe4ytmwENmsODvh7aDlazyIOWhsnYF1P5ha/poDs=
=S5Fy
-----END PGP SIGNATURE-----

--kNcPYzM4z9x7X5z/--
