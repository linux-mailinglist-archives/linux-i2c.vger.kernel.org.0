Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4D0781A87
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Aug 2023 18:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbjHSQ2m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Aug 2023 12:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbjHSQ2l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Aug 2023 12:28:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A3849F2;
        Sat, 19 Aug 2023 09:28:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D1ABE60A52;
        Sat, 19 Aug 2023 16:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9BEC433C7;
        Sat, 19 Aug 2023 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692462519;
        bh=kNsFAGrMZEVhMwKSLZtPv/3+FOkb3JmUkm8Ympki2Tc=;
        h=Date:From:To:Cc:Subject:From;
        b=uHkmxVhYhVGblLdP3ZKETzRNmMDHPCi0bL+2wih0/dvcqZMZ6VnoNXJbZiuBmSdHw
         t/fGSfc/5Uh+fe23yj/opV6GL7+HWrNQ9C4xwNRYC3Wj/fqGz3QA957G1smzOkY+Ly
         rijct7e+QBR1ld6zlB7RajU4n2rVdGZG5K4FPbPZU03AVBa39WRUOVfw0rJ//it9oN
         hqFrGm1WeK20Q2jS1rwMsfL/h2wtlEyMv02uZZ4F/CXHHZH//DisOUQRuWV3LWFzHI
         /gr8MpqK5c/6JvufGYIf2xInb7xvjLUQ5VR8wW5eaq6cLuQzJytZ/bYseylIQg4Asw
         CwrDErwfjSTKA==
Date:   Sat, 19 Aug 2023 18:28:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.5-rc7
Message-ID: <ZODtsyZ2g1EX8C0X@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a4zpuF0QjFstCsq9"
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a4zpuF0QjFstCsq9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 2ccdd1b13c591d306f0401d98dedc4bdcd02b421:

  Linux 6.5-rc6 (2023-08-13 11:29:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.5-rc7

for you to fetch changes up to 4caf4cb1eaed469742ef719f2cc024b1ec3fa9e6:

  i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue (2023-08-14 18:17:13=
 +0200)

----------------------------------------------------------------
Usual set of driver fixes. A bit more than usual because I was
unavailable for a while.

----------------------------------------------------------------
Carlos Song (1):
      i2c: imx-lpi2c: return -EINVAL when i2c peripheral clk doesn't work

Chengfeng Ye (1):
      i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue

Dan Carpenter (1):
      i2c: sun6i-p2wi: Fix an error message in probe()

Parker Newman (1):
      i2c: tegra: Fix i2c-tegra DMA config option processing

Quan Nguyen (1):
      i2c: designware: Correct length byte validation logic

Tam Nguyen (1):
      i2c: designware: Handle invalid SMBus block data response length value

Thierry Reding (1):
      i2c: tegra: Fix failure during probe deferral cleanup

Uwe Kleine-K=C3=B6nig (1):
      i2c: Update documentation to use .probe() again

Yicong Yang (1):
      i2c: hisi: Only handle the interrupt of the driver's transfer


with much appreciated quality assurance from
----------------------------------------------------------------
Akhil R (1):
      (Test) i2c: tegra: Fix failure during probe deferral cleanup

Andi Shyti (8):
      (Rev.) i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
      (Rev.) i2c: Update documentation to use .probe() again
      (Rev.) i2c: sun6i-p2wi: Fix an error message in probe()
      (Rev.) i2c: hisi: Only handle the interrupt of the driver's transfer
      (Rev.) i2c: tegra: Fix failure during probe deferral cleanup
      (Rev.) i2c: designware: Handle invalid SMBus block data response leng=
th value
      (Rev.) i2c: designware: Correct length byte validation logic
      (Rev.) i2c: imx-lpi2c: return -EINVAL when i2c peripheral clk doesn't=
 work

Javier Martinez Canillas (1):
      (Rev.) i2c: Update documentation to use .probe() again

Jean Delvare (1):
      (Rev.) i2c: Update documentation to use .probe() again

 Documentation/i2c/writing-clients.rst      |  2 +-
 drivers/i2c/busses/i2c-bcm-iproc.c         | 11 +++++++----
 drivers/i2c/busses/i2c-designware-master.c | 16 ++++++++++++++--
 drivers/i2c/busses/i2c-hisi.c              |  8 ++++++++
 drivers/i2c/busses/i2c-imx-lpi2c.c         |  3 +++
 drivers/i2c/busses/i2c-sun6i-p2wi.c        |  3 ++-
 drivers/i2c/busses/i2c-tegra.c             |  3 ++-
 7 files changed, 37 insertions(+), 9 deletions(-)

--a4zpuF0QjFstCsq9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTg7bMACgkQFA3kzBSg
KbaTgA/9HSHLZ9ifxYmz3krFPKWEY/wt00yoyniiHTtcs7D/wZS1ZQmXzzgj4Ag5
SreHZtdBakgojri05pyWP0hCGRZ6ms0DgMojpoJlcbxqKmYE3E5RUvG5jo42sy3o
QTQ+qX0cekpDvp3xm1fzx+Zf40YXKuRP14rRHEgdpgvsUS0yEhVxi+DDIe2ZPx2M
vQHdlvQrf19neHDPkDPWRPOBs95Ehpuv0QpdPih9gK+gOVdUek7QqluWE97zMCL+
zTWqusPjUyu3vHuD+Kee7YcVO35lQBoRcZE9otEM3EoycKA2wNuM5y604snFwgZE
SUKIaH8FNx80xyor9wpCiTQnUvtdAZq3K4UN1BYNF/ePpU5OF+H8qA49no3CW12s
nnyxkqQT+ZZ52+MdXaTCqpLo6+fG1zAx600xDCUAWC2sId05gIuWuygtdgkZ5Czb
SKRA683RZiEyhU0mdchcqB7FB1DGdPmOG1wfZfLv1ElzsRUYILDGeA0QBC63JV/d
xCUSE0clPhi4Igg45QSfU+77a4haWTYVX94c8Lkl325d5XcxEYq0MXG02EqjkZrZ
dDAqeYmwMY3D60XvJaZHOUtvlTRKbTcT5oT0aHV+Nzpq4gYuKptbHGSK9aSZqAem
HPZ4mDJ0payB9hbdVrX2kvZxP1GdCZDZPLotfJDCWvBNRGrQVcs=
=BuR2
-----END PGP SIGNATURE-----

--a4zpuF0QjFstCsq9--
