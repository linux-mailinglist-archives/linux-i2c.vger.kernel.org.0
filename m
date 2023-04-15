Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B296E3019
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Apr 2023 11:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjDOJdq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Apr 2023 05:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjDOJdp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Apr 2023 05:33:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F5B1BE4;
        Sat, 15 Apr 2023 02:33:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7255B60A51;
        Sat, 15 Apr 2023 09:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5B2C433D2;
        Sat, 15 Apr 2023 09:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681551221;
        bh=/UzeVtaHJfUN6UpTwCEr/HMGM0EcHNAX80284645RSY=;
        h=Date:From:To:Cc:Subject:From;
        b=FplwyjYa0i4Oka6LJMEu9onR6CgkbfbRW779jA2nBjLTC/WBm/7pzF3FiU6lBl+H7
         M7InySQCY2YnDgubZvazD9p0fBFV9G4nEbmqqW2EXA211+N3Bw0XHJD1MsBh9oTXJP
         +dyqlzFLq2GtQ3SDJTbk95G09WxdC0KMRbnwPDJ0AQvqkV/82Wh/W9H3+jC2aee1vf
         bSAdiRau/2vYHtqa+h9efMjupQ8e/264BFwGTy87guxuRjCU5+zDVnd3gOHJVWn9ys
         HPX8IZVFWCoZj5QRQpz1yfzdYSPR+eVKCvU12i0p4sbSBu077RTaL1JBQReK34TU5l
         JyciWooxqEBew==
Date:   Sat, 15 Apr 2023 11:33:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.3-rc7
Message-ID: <ZDpvcE2jMBPqlxgF@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XKVvgIsd51l6uQA2"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XKVvgIsd51l6uQA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 197b6b60ae7bc51dd0814953c562833143b292aa:

  Linux 6.3-rc4 (2023-03-26 14:40:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc7

for you to fetch changes up to f8160d3b35fc94491bb0cb974dbda310ef96c0e2:

  i2c: ocores: generate stop condition after timeout in polling mode (2023-04-13 18:29:29 +0200)

----------------------------------------------------------------
just two driver fixes

----------------------------------------------------------------
Gregor Herburger (1):
      i2c: ocores: generate stop condition after timeout in polling mode

Tharun Kumar P (1):
      i2c: mchp-pci1xxxx: Update Timing registers


with much appreciated quality assurance from
----------------------------------------------------------------
Andrew Lunn (1):
      (Rev.) i2c: ocores: generate stop condition after timeout in polling mode

Andy Shevchenko (1):
      (Rev.) i2c: mchp-pci1xxxx: Update Timing registers

Federico Vaga (1):
      (Rev.) i2c: ocores: generate stop condition after timeout in polling mode

 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 60 +++++++++++++++++-----------------
 drivers/i2c/busses/i2c-ocores.c        | 35 +++++++++++---------
 2 files changed, 49 insertions(+), 46 deletions(-)

--XKVvgIsd51l6uQA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ6b28ACgkQFA3kzBSg
KbaqQA//VtA3nuI7sITivfBCRDqj+WZizg1lJd7dgkxYj/nwj3WxGROG2aDX4em9
KGniTgHNcWe4CAcAqudEqoFJU4gv3W/yL8I62nYp9EFjT88Opz4Xpjcy1OFkQkub
tZGJKaoRU7jaIxKoYsvMyvA8CeCy+j1Xgr539aAd7vEa3DeYlRS5bgyvHGHW+Idq
ImItOdyaPun0U0ONf05qiKlM1Tg18jsFxFe7LKe2Ett+p3cf3mVlcdS88oE/bD55
56T8zZTuezavTOdFbPd21ZlwoATsXHjzeLPxZheyF9UZmCCmq5P0TVeUJtzpXluG
ACkG/qI6DW3tONe98NvYRGBma/0nNQfQvX3O6z2mZYP47exRBxlIF/Rw8Qycdg+T
uWFk3RJM2zNlX5vOIkoAeltuCkVFGyp2TXoMi+xE+MmPtEwSUYgoihAwYnpU9xzP
7OllBjM6TGIoV0TnXA5aeSPnHM3hTY7O3ZBMXKvbodHz3IHuszdfTuCal9DzYEZO
LsiMkWWM/2lDS5Rag8MOCQ9aGMbNUV9I9LXQzGPTtfaMd4+yk/UUCZJcC0sdLcF7
VogAA87DaMEM+F+srnWOv2UBB6PC5Eos1pfA7l01/FXY5zQEien9dg3hoq7gP634
0mmgt+lgLUxZcB4JKTuqck4AbmuJ775Cucys8wA3RH7klQymPzQ=
=OttL
-----END PGP SIGNATURE-----

--XKVvgIsd51l6uQA2--
