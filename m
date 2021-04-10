Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8535C35ACCA
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 13:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234578AbhDJLAo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 07:00:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234180AbhDJLAo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Apr 2021 07:00:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 834A3610CC;
        Sat, 10 Apr 2021 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618052430;
        bh=FNfQfDTUtRjkPROBxVhZOjwwHM1e+WBZqb0vxIi4APo=;
        h=Date:From:To:Cc:Subject:From;
        b=lg4rsqiIji1aXb2fXe+VhXNq8OGFqSW75A5/6NuGwcw+6994lVr0YPqT+Lin8TQK5
         gfq/qw4LSwWMq4aKoVUXG77B0YfNFWLQHbVHEfUI6Cv1FOOzt9UvUpJj+MNekYaMnS
         pEYFQTL99cdQDvktseWvoR4MChrtntsgcbi0sj8loHV6g5TZj6XGGsJWqY4spYenH5
         8xOMZRUUalKZdFCZLsNR+2K12u4sTePaZF8SiMkirQYDqblbx2eK1t1HXa4IptTyyl
         4U3GjaWn43sgVdM9Y4iGGC1XFb2X/ki1aq1sMNUKeQZvtKLGC1AmOn4WdqMoQvst+Y
         RywUrAVpnxTBQ==
Date:   Sat, 10 Apr 2021 13:00:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.12
Message-ID: <20210410110024.GA1323@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

here is a mixture of driver and documentation bugfixes for I2C.

Please pull.

Thanks,

   Wolfram


The following changes since commit 1e28eed17697bcf343c6743f0028cc3b5dd88bf0:

  Linux 5.12-rc3 (2021-03-14 14:41:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to df8a39f2911a4c7769e0f760509f556a9e9d37af:

  i2c: imx: mention Oleksij as maintainer of the binding docs (2021-04-08 2=
2:39:12 +0200)

----------------------------------------------------------------
Andy Shevchenko (1):
      i2c: designware: Adjust bus_freq_hz when refuse high speed mode set

Bhaskar Chowdhury (1):
      i2c: stm32f4: Mundane typo fix

Hao Fang (1):
      i2c: hix5hd2: use the correct HiSilicon copyright

Krzysztof Kozlowski (1):
      i2c: exynos5: correct top kerneldoc

Wolfram Sang (4):
      i2c: turn recovery error on init to debug
      i2c: imx: drop me as maintainer of binding docs
      i2c: gpio: update email address in binding docs
      i2c: imx: mention Oleksij as maintainer of the binding docs

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (1):
      I2C: JZ4780: Fix bug for Ingenic X1000.


with much appreciated quality assurance from
----------------------------------------------------------------
Alain Volmat (1):
      (Rev.) i2c: stm32f4: Mundane typo fix

Barry Song (1):
      (Rev.) i2c: designware: Adjust bus_freq_hz when refuse high speed mod=
e set

Klaus Kudielka (1):
      (Test) i2c: turn recovery error on init to debug

Oleksij Rempel (1):
      (Rev.) i2c: imx: mention Oleksij as maintainer of the binding docs

Pierre-Yves MORDRET (1):
      (Rev.) i2c: stm32f4: Mundane typo fix

Rob Herring (1):
      (Rev.) i2c: imx: mention Oleksij as maintainer of the binding docs

=E6=9D=A8=E6=96=87=E9=BE=99 (Yang Wenlong) (1):
      (Test) I2C: JZ4780: Fix bug for Ingenic X1000.

 Documentation/devicetree/bindings/i2c/i2c-gpio.yaml | 2 +-
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml  | 2 +-
 drivers/i2c/busses/i2c-designware-master.c          | 1 +
 drivers/i2c/busses/i2c-exynos5.c                    | 2 +-
 drivers/i2c/busses/i2c-hix5hd2.c                    | 2 +-
 drivers/i2c/busses/i2c-jz4780.c                     | 4 ++--
 drivers/i2c/busses/i2c-stm32f4.c                    | 2 +-
 drivers/i2c/i2c-core-base.c                         | 7 ++++---
 8 files changed, 12 insertions(+), 10 deletions(-)

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBxhUQACgkQFA3kzBSg
KbYHIxAApxBBgKdTuXtE3aU4ffIz8/xWK/CVUEdpPygvLd3ptllOBlntdI82eJyI
O1zPwMA65VsG5vWJcusSlXPIoFXzLLcErXMatYF53LG+3kCvYkHbbwpbWi2XbLvu
p9Twh0BTOz6hjWMLMipKOA4bEJVqUXoaK56DYPBs/4wfreRdr4SX4OZNnjbsPMNM
mi9OILo328ta7V9E8QNdS3/ra+8TiVTsGgsQJ0+QHbrKWUhh6lbwKv7zN4ATDJ4m
aSVrYyGxVSLR+CdjMlRm9jW8LMFzQTyyoQiiCAnQyeNvNIBZdoW9dTj4RB90HLbT
IK9TR3GjBL3UF21baRA4vWPrASzKahIzDfgBg3dm/dE6nr8FN9BmoNMKLuXm7D9E
wokhpSi4udwljnoj1a9BaovE5hlTDXC+gbhmv2qtyDfYmXqMB5bZiuan7n9YLv/z
aNa00cQMSOMckvDfuyoNB1YVaxnhbgMTk+rGaNJO8G12EmJLaK2trNNOM25Kf7bM
7+1vPzDS9bdnsOBmBKIZ0p0MKd+Y3FNGcluOmX14ElJLrf2zluzqBzGSLljHorm3
u6urF74lf/P2PgPcz1e6ylFzJUI4i9n00G6BFw8oyfYd11WYv/Zletz/h7tp1cpW
JcEJXaIhpz2fhbnSt37QReys/nA+gKQCGdzDDU8ryaZZFjtLX3g=
=qAPL
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
