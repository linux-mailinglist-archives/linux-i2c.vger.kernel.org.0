Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A286C7868
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 08:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjCXHHC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 03:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCXHHB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 03:07:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6925F133;
        Fri, 24 Mar 2023 00:07:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0FE6CB822B5;
        Fri, 24 Mar 2023 07:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D20C433D2;
        Fri, 24 Mar 2023 07:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679641617;
        bh=xa2eNmFWlrxdCJd6KG+ulsuJ2CTY7BiQa67Rp7lKcOA=;
        h=Date:From:To:Cc:Subject:From;
        b=EycP0j3JUOQqoZQId36jbba/Z+4akkSb9XDx2Tl+FApgCDLJOzFYTOZrZybNylXKK
         OjOkHaptusdf88v7abQJU560fbORqLrgzpLs4srecB0Q1c9M+LqeXOvNj3dnGHiqTJ
         hoFQATO3yUKzx73tlRCxDIrbOuOSQfrxjqlINsrl5b0yQkF1cCp9za7DIt3bD1Ngks
         AV4y8zs+xyLByqiiN8y9YaptvjpX7JCcPsCFbHN3CqyfvepQfUYUVH+u8wpTc0jZby
         Poj2mH/9Tsr54HoVmmaHuX1u1arD1zUM6+Kiz5xc9OSCpZgaIA12QzVB2dlvs2UHO3
         K3DtAsEo59FqA==
Date:   Fri, 24 Mar 2023 08:06:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.3-rc4
Message-ID: <ZB1MCGRYs+W1cwG8@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UhYuCbGSzcaRCueC"
Content-Disposition: inline
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UhYuCbGSzcaRCueC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc4

for you to fetch changes up to 92fbb6d1296f81f41f65effd7f5f8c0f74943d15:

  i2c: xgene-slimpro: Fix out-of-bounds bug in xgene_slimpro_i2c_xfer() (2023-03-16 21:15:43 +0100)

----------------------------------------------------------------
A set of regular driver fixes

----------------------------------------------------------------
Alexander Stein (2):
      i2c: imx-lpi2c: clean rx/tx buffers upon new message
      i2c: imx-lpi2c: check only for enabled interrupt flags

Matthias Schiffer (1):
      i2c: mxs: ensure that DMA buffers are safe for DMA

Wei Chen (1):
      i2c: xgene-slimpro: Fix out-of-bounds bug in xgene_slimpro_i2c_xfer()

Yicong Yang (2):
      i2c: hisi: Avoid redundant interrupts
      i2c: hisi: Only use the completion interrupt to finish the transfer


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (1):
      (Rev.) i2c: xgene-slimpro: Fix out-of-bounds bug in xgene_slimpro_i2c_xfer()

Emanuele Ghidoli (2):
      (Test) i2c: imx-lpi2c: check only for enabled interrupt flags
      (Test) i2c: imx-lpi2c: clean rx/tx buffers upon new message

 drivers/i2c/busses/i2c-hisi.c          | 13 ++++++++++++-
 drivers/i2c/busses/i2c-imx-lpi2c.c     |  6 ++++++
 drivers/i2c/busses/i2c-mxs.c           | 18 +++++++++++++-----
 drivers/i2c/busses/i2c-xgene-slimpro.c |  3 +++
 4 files changed, 34 insertions(+), 6 deletions(-)

--UhYuCbGSzcaRCueC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQdTAgACgkQFA3kzBSg
KbZsyQ//R3FvRapjAT3CSJbgsRoQFr+TEusUI9DenVgmvzBykQQdgs+mjHK67xVp
8ycjOhlHYNZN1adDAJjFnlFFGIW1dICxJLkV1A6MOLxbdERVHUuA4ajio3Pxvbcp
b5oELGkw27JF5WpiHprj/70tcq2AuA/rG/ECvoRx5Xsjpk09P2dA+nEEOpxU58Ff
Sg2o77fDbtO9OqA2VKSTw6qG08ud2BBw7K7nW2alX7NcfSs4+l1u1Tyipdr5+8Ki
a+06HSI/dforBhWU9m551wK+OrYBdLlIFb8QnS3pxT9rrZ6Br3qQhPSJfIhgWfhf
inhCmRzIaYR9k+hQTzpnSzeIQZ76hp98cs8EsU4eRYAGOiMcNOQ3oOO1Qf5mgLdY
dt2GWKm2eESVvPXa0pi6nA11f1dWh67mEWhVSLSsCLiLyIM0aJCo7+k5FE1rJhnC
so+WGZHJW3ul6a0gCdPCBXM8892PcDswogTwaj2YCRbtGDmdqL1Bfk47JIU3zOBl
jvUfuwmsE0kRTugIvT1a14eyBWV5L2RXM9SYuCCeJQcI0ZB4f1csObfOyVIhnuS/
aQ1wcle3upMGhypb9k476jbDj8IfO7zUgdcWsk1bqLGo+eTXSj4onzFfa9Per+sd
JDxAS7+sKvPLasKcl6YjKzQspe0iRn43Y97SaTe86kDUOnZXUnE=
=Ofkh
-----END PGP SIGNATURE-----

--UhYuCbGSzcaRCueC--
