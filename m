Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793C873D066
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Jun 2023 13:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjFYLXR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Jun 2023 07:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbjFYLXP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Jun 2023 07:23:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A89133;
        Sun, 25 Jun 2023 04:23:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E4B560BAF;
        Sun, 25 Jun 2023 11:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E43EC433C0;
        Sun, 25 Jun 2023 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687692193;
        bh=1MeKyPZTwUPOeHRX2s/4oRDIL12xjFvKee/Z39b7lSI=;
        h=Date:From:To:Cc:Subject:From;
        b=lk05HdoLyE47oU94/t/25s7ER5wIDmoVi7etCnFI+HjrpCnSv/eCmrmerWbn16DlS
         7cbWaLUI2mjGGogARMON0y0S8OYxMQyn/kZ2I+TopSKhWZJMaxLv7+shDzGGi/FTo9
         EjAaGdCRe+EAD6Ccwc6kgT/qmlYTI3Oo9i+PrAi1W2bgZrqbjYiEu2KnDWCeDb17kI
         wKSjrp3IpvGbvBxfAS0OH22domBWQcRUJLVEHe6kWG6CEfzlgkjpjQ7pThaRN1SV52
         RcY3NfcMT06k2h+ZP9y1hgI8PZt+8sBoLRvojxk020VnpATJxLphroh7otf6+khr5T
         tVNX7X5+VVMTg==
Date:   Sun, 25 Jun 2023 13:23:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.4-rc8
Message-ID: <ZJgjl6fXM50EofPk@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rXq8BR6M/AsINGwJ"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rXq8BR6M/AsINGwJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 45a3e24f65e90a047bef86f927ebdc4c710edaa1:

  Linux 6.4-rc7 (2023-06-18 14:06:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.4-rc8

for you to fetch changes up to e69b9bc170c6d93ee375a5cbfd15f74c0fb59bdd:

  i2c: imx-lpi2c: fix type char overflow issue when calculating the clock cycle (2023-06-23 12:58:24 +0200)

----------------------------------------------------------------
Nothing fancy. Two driver and one DT binding fix.

----------------------------------------------------------------
Clark Wang (1):
      i2c: imx-lpi2c: fix type char overflow issue when calculating the clock cycle

Rob Herring (1):
      dt-bindings: i2c: opencores: Add missing type for "regstep"

Shuai Jiang (1):
      i2c: qup: Add missing unwind goto in qup_i2c_probe()


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (2):
      (Rev.) i2c: imx-lpi2c: fix type char overflow issue when calculating the clock cycle
      (Rev.) i2c: qup: Add missing unwind goto in qup_i2c_probe()

Andrew Lunn (1):
      (Rev.) dt-bindings: i2c: opencores: Add missing type for "regstep"

Conor Dooley (1):
      (Rev.) dt-bindings: i2c: opencores: Add missing type for "regstep"

Dongliang Mu (1):
      (Rev.) i2c: qup: Add missing unwind goto in qup_i2c_probe()

Peter Korsgaard (1):
      (Rev.) dt-bindings: i2c: opencores: Add missing type for "regstep"

 .../bindings/i2c/opencores,i2c-ocores.yaml          |  1 +
 drivers/i2c/busses/i2c-imx-lpi2c.c                  |  4 ++--
 drivers/i2c/busses/i2c-qup.c                        | 21 ++++++++++++++-------
 3 files changed, 17 insertions(+), 9 deletions(-)

--rXq8BR6M/AsINGwJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSYI5cACgkQFA3kzBSg
KbYNsQ//VufkLRPTyxTCN4zd4kcTuHSOj1EQcdf5fuzGmria9L93BZR8W7udP9yq
VDvFExVTa4/Twc5l9JOzC1HTyJK2x1DLFNTTc/Y5ytdiNNPvVuWiwVYqEJHOlOjl
oMQODp18OSloB1oWIwiWC8nspWu97yJbOU2lU6CvxNO7P7jxdfdsJGwky5ZM1u66
pBKz+gRcttfbNRskVAMU5FTNkOosCfiF0EwEUpnLbiFunnl1TtXA/yn2AXq9bktE
Ca5WtZw4QlJk6vLjmrY2A7vx74zooHDSV+RIDGesL+qVZdrwJBX7rrwDQCp3Y+Ft
Df8JcZMnwndxIl7VV2FzRTBFYXHZg2mUbuY2nvfAJ8tnrdvBh/2gIjG5zdj5oH0A
oEBVIbQ8FrDcA4r1jMwM+3lNqTW+HTma1ibALwn/5n6cz/onAf5mblh/g5Dv21lJ
piEYMT5JeskAkHiO683TDBAISU5AUGPUGvyjcmui2px59Ya5UZCc9UYjNFb7D2Wr
jrHSWdxKWbjkCGml6cNhHpF7HGuLUnKTDyUaOErX03DLVmRHsc8Pi7RRDgK1Xk+Q
p3tgOqnVX/t13oB8me+U/bO6yxN4bWQ58qA+C97s1zw1I9TAXw3ncEHKzfS04X/B
/OmQT1OV+inD6mPTbZVyAEaWvoZxtchbM+x5AaMleZ4SkQCjB1Q=
=GQPz
-----END PGP SIGNATURE-----

--rXq8BR6M/AsINGwJ--
