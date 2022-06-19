Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC90550964
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jun 2022 10:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbiFSIk6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Jun 2022 04:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiFSIk6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Jun 2022 04:40:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7D163A2;
        Sun, 19 Jun 2022 01:40:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C805960FD0;
        Sun, 19 Jun 2022 08:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697C1C34114;
        Sun, 19 Jun 2022 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655628056;
        bh=QmXFtycrCbfBmrXZnhK+ptOa35gEtx2Chm9E61iE/+A=;
        h=Date:From:To:Cc:Subject:From;
        b=pKrFv5GZQtyVgeiWSIf1cgP+k6JgWXS+77ZuT3UlnrhLPajxSfBZje/ZWYBb7pz5f
         LiMlvofwXC8j9QYAmNkNHckysMbnbK28bjqw4LMu108aeeEMEMhKjwIPUK0R2gxZYI
         fzwBSibPPhpEXZqTNxeuSFOnJYWytbBGhYFrjTpjsjuTKfchulxUClrh5NoO1Wskid
         DDtlblnDal1dX95L/fRJwP1a4pCVlq6I7NlcohTE2FxR6lF9EitTXzPBwAZ7BGMogv
         PmD2u+5KedKqmLHmyfyNZxr9YUaJVb64FSVrPAr6mY4kedb3q1b0HNgVOvlKbOERur
         piaskGUCHi1Og==
Date:   Sun, 19 Jun 2022 10:40:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-5.19-rc3
Message-ID: <Yq7hDqjsFlxifNIl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZiReLyznSM3ThwxX"
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


--ZiReLyznSM3ThwxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19-rc3

for you to fetch changes up to de87b603b0919e31578c8fa312a3541f1fb37e1c:

  i2c: mediatek: Fix an error handling path in mtk_i2c_probe() (2022-06-14 22:11:54 +0200)

----------------------------------------------------------------
MAINTAINERS rectifications and a few minor driver fixes

----------------------------------------------------------------
Andy Shevchenko (1):
      MAINTAINERS: Update Synopsys DesignWare I2C to Supported

Christophe JAILLET (1):
      i2c: mediatek: Fix an error handling path in mtk_i2c_probe()

Jiasheng Jiang (1):
      i2c: npcm7xx: Add check for platform_driver_register

Lukas Bulwahn (1):
      MAINTAINERS: add include/dt-bindings/i2c to I2C SUBSYSTEM HOST DRIVERS

Serge Semin (1):
      i2c: designware: Use standard optional ref clock implementation

Wolfram Sang (1):
      MAINTAINERS: core DT include belongs to core


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: designware: Use standard optional ref clock implementation

AngeloGioacchino Del Regno (1):
      (Rev.) i2c: mediatek: Fix an error handling path in mtk_i2c_probe()

Qii Wang (1):
      (Rev.) i2c: mediatek: Fix an error handling path in mtk_i2c_probe()

 MAINTAINERS                                 |  4 +++-
 drivers/i2c/busses/i2c-designware-common.c  |  3 ---
 drivers/i2c/busses/i2c-designware-platdrv.c | 13 +++++++++++--
 drivers/i2c/busses/i2c-mt65xx.c             |  9 +++++++--
 drivers/i2c/busses/i2c-npcm7xx.c            |  3 +--
 5 files changed, 22 insertions(+), 10 deletions(-)

--ZiReLyznSM3ThwxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKu4Q4ACgkQFA3kzBSg
KbZ+HBAAsF1TnjkQkfNkhbkx1TUdmrQbPD2bAywZHORtjnthhAvdPVPaOe7266we
+We6rtvBk8VW5jftlnOfykpqXrl7fE7KkQukbiTEMRAq5o65emXmoDQ3yWvmR3Rx
8q2iDvjezn+zfHs3CGTO6CxM9JXapjMpuD1pgnXEP622s8pPG5UA0NwhqolMceV3
wMp6o9q+qzIQEP9VwzN0F8MJVyoRkA/RYEEk3A5V2reyCuaXeJr/r5OM0GpQAwJK
Jizm2SZzuOlIDTeve4HNuj32vMO7l/e2BotrRatGQXF0Sf2GtgWkeEQnSGHxLtaK
oBQIn+Nhr4mjDK0FNfnu2cJm3SVwlFpGTJGAOwz1d1VYYxl4kpfpi5raK7PQwkCc
9PlOZ5NzUQtgCPreQ3MK0XLmDfRX9hm09aZoqzScnoszOBgcWfldYcYD/RcHHZPs
Z3Lpi3wV450nDk1wKBKJU0XTQuly/LcauNX1gVRke23QvOf39mAiVAebz5ofi5e5
ue7gVmTpW7Uu79oZQf+vz3eWowTpGbQEecQDC9zF876uSL+JOZZg6/lqDLhbpf6c
I2WQ8czzxvc+RYoN3MRpVJSkV4sIbZYh0rO/T4Gt/hty6QBAdcKFMy3wgSXZ4TvB
3VU8B2rcFwNdi3bjgUyi/ICd7I//iiDIEq1f4B48PfN1zlKa1UI=
=Knx9
-----END PGP SIGNATURE-----

--ZiReLyznSM3ThwxX--
