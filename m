Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37D8750462F
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Apr 2022 05:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233387AbiDQDDz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Apr 2022 23:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233373AbiDQDDn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Apr 2022 23:03:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66A8222A2;
        Sat, 16 Apr 2022 20:01:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DB62FB80835;
        Sun, 17 Apr 2022 03:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9DEC385A1;
        Sun, 17 Apr 2022 03:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650164465;
        bh=lUFkJLDBY6NZ/dlERmsGK/M1rsZz04lLDTPMRsMyWsc=;
        h=Date:From:To:Cc:Subject:From;
        b=WoCQ7IoBa8yT0C13PQp3NBcP/9GQAt9xpZX5RPB8GJHMSmXgjCFhKttxf3ESdd/v2
         pQwvb8dCuPjBaqvtz+3PLxW2CktBvOeOqGu8rp0O0rI/0qTC7niCdkKQwieWkGiuNu
         uBbel5pkRISyVV4b56dFQ/ye51RC7yl+r7nuKDwPSqrfhuKuRtlBGAY/ICcNZsakpY
         1pgdY+olO14wN9Ubj/Qjs0IHA3H8jQhf0cXzKzPTtTdVSzxTlnY74rX4VdbmsSzcXM
         aL8lTKWH+ePVwjILzbj/NMcKYJn/P9AgBs1E1+VjW8B2D0UI30eH8wJS2/CfAiSSMP
         QKPHVZ+nJ3jCg==
Date:   Sun, 17 Apr 2022 05:01:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.18
Message-ID: <YluC7rAj5syHOYWi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K1b8b/K9oM98zgqc"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--K1b8b/K9oM98zgqc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has a quite regular set of fixes for drivers and the dev-interface.

Please pull.

Thanks,

   Wolfram


The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to e35c93695c742b88f5fe32063674551440c63d08:

  i2c: ismt: Fix undefined behavior due to shift overflowing the constant (=
2022-04-15 23:49:02 +0200)

----------------------------------------------------------------
Andy Shevchenko (2):
      i2c: dev: check return value when calling dev_set_name()
      i2c: dev: Force case user pointers in compat_i2cdev_ioctl()

Bjorn Andersson (1):
      i2c: qcom-geni: Use dev_err_probe() for GPI DMA error

Borislav Petkov (1):
      i2c: ismt: Fix undefined behavior due to shift overflowing the consta=
nt

Marek Vasut (1):
      i2c: imx: Implement errata ERR007805 or e7805 bus frequency limit

Martin Povi=C5=A1er (1):
      i2c: pasemi: Wait for write xfers to finish


with much appreciated quality assurance from
----------------------------------------------------------------
Seth Heasley (1):
      (Rev.) i2c: ismt: Fix undefined behavior due to shift overflowing the=
 constant

Sven Peter (1):
      (Rev.) i2c: pasemi: Wait for write xfers to finish

Vinod Koul (1):
      (Rev.) i2c: qcom-geni: Use dev_err_probe() for GPI DMA error

 drivers/i2c/busses/i2c-imx.c         | 33 +++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-ismt.c        |  4 ++--
 drivers/i2c/busses/i2c-pasemi-core.c |  6 ++++++
 drivers/i2c/busses/i2c-qcom-geni.c   |  6 ++----
 drivers/i2c/i2c-dev.c                | 17 +++++++++++------
 5 files changed, 54 insertions(+), 12 deletions(-)

--K1b8b/K9oM98zgqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJbgukACgkQFA3kzBSg
KbZbqhAArzYscKt3nDsd5QT1v+szQtV9azuSIK1drUDpAf7A51PduRbik6HQjHhQ
CcmLRZwyORMJzoIUoxq47FaZSgW0rPbb0h5yIlpre3amiBAx55gtCasTwV9WTBNS
Scrn7cQixr8CKlSOyuCcrRTC5s0uQwGrzxuKZfNrIexhnhppJy0h4W2zhjS1GnES
VB9AIvAQlCgNq5Bjg/GgF7CbsFSD1OU0ieGW/kVl0ygjpj6/tdq0bNqT8udPYPX6
8vd86qL1OicyQQvNkTwM5rysbP10qeLyU6Fv4123HKFbcKFfxEpDLs3z2PHWjdY8
ib+uHsNakYzeAq10QXLIR0cO7tqdWF1nNdaAJTJPJgyQvmtRvARygTYJuvkr+QA0
Gi6Pyb2PZvkI+mcPhHqAeKsU/OwYDZm3IPSh72QwPla9Abahn1SlwIMrvXq7rWmh
WbQBDfpvsEJYcveLs47CbHA91dwBdJPmtgxKKLLwGb4scxly2Uj2DXYdxaNmtXLj
aGRlutTmE52qYTEUP2psziTjEYoRjKR4Re7+oGUm5wDRG9rJFQIDVZ5pqnvsKjDM
dOfAUqCin8VKcPNliuep6v8fgd0dY8yPx1C5kZAoeXn0TjORaPLHcwnSWL/yVJ81
2PVlg5a0OtD/JiClGmbZvpjp3BxdsW107YRFxeujocgo7eE99W4=
=Zqhk
-----END PGP SIGNATURE-----

--K1b8b/K9oM98zgqc--
