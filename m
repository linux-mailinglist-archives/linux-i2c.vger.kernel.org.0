Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 896C05303CF
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 17:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245221AbiEVPX7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 11:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiEVPX6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 11:23:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EF12A240;
        Sun, 22 May 2022 08:23:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 99488B80ABE;
        Sun, 22 May 2022 15:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F56C385AA;
        Sun, 22 May 2022 15:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653233034;
        bh=/dRB9ARQoycZM8OhCD/nxLnWWI+qtkJfGJrWisUvU+c=;
        h=Date:From:To:Cc:Subject:From;
        b=oaeWJAPNlK3v/gWH0TB+aDd2xBsEUYincWjW3ddFm2m1kJ+Kh0WVcQCEsjy6w2bn0
         MzjvfLEoKp2X2JLIfSqA5fujfGAHZpM7QrqxDLWnL2YFbpAHJ4Q/6m8hVkz4uOHXvF
         qHcR0Be2lxEvLEZB1UKv3LIDrDNXSgAJXCCFx0r+zEd8X8WjoSlkSRChDYVKOYGYZQ
         Y8t0GPfR05gXs2yAIHb4+7Digz9WlUM/y9tr2JNgOKUA0ixFeptIhDJgIXCus1D7Gv
         02jV3mDSNAnj4I9mMTz6SurA+utlBwqsNd68vFivu2wr8cEc9rtk2Jp/EOogVu2ARi
         hm4x1mwVw4x/A==
Date:   Sun, 22 May 2022 17:23:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.18
Message-ID: <YopVgt6ACGuAQfR0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YnArdn3qbQ9VtP5L"
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


--YnArdn3qbQ9VtP5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here are some I2C driver bugfixes for 5.18. Nothing spectacular but
worth fixing.

Next pull request will be sigend, promised!

Thanks,

   Wolfram


The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c:

  Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 03a35bc856ddc09f2cc1f4701adecfbf3b464cb3:

  drivers: i2c: thunderx: Allow driver to work with ACPI defined TWSI controllers (2022-05-21 13:41:28 +0200)

----------------------------------------------------------------
Mika Westerberg (1):
      i2c: ismt: Provide a DMA buffer for Interrupt Cause Logging

Piyush Malgujar (1):
      drivers: i2c: thunderx: Allow driver to work with ACPI defined TWSI controllers

Yang Yingliang (1):
      i2c: mt7621: fix missing clk_disable_unprepare() on error in mtk_i2c_probe()


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: ismt: Provide a DMA buffer for Interrupt Cause Logging

Stefan Roese (1):
      (Rev.) i2c: mt7621: fix missing clk_disable_unprepare() on error in mtk_i2c_probe()

 drivers/i2c/busses/i2c-ismt.c            | 14 ++++++++++++++
 drivers/i2c/busses/i2c-mt7621.c          | 10 ++++++++--
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

--YnArdn3qbQ9VtP5L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKKVX4ACgkQFA3kzBSg
KbbTRA//ewi8DxYoCjv64/4n9TIJDJ+G35lguuamnZEkQoT6DoiaY01i0g9go4hp
6F+wNu5HJJczjxpXjUQvHotmWyrVFj1bLLsRwAtHYJiccKo+0P/Slp/9Y21/qbWu
N+WAufddcxOkKIGKX09OhDhkfDuRfEnAvL/sJdqYOTEGnsMQHzXByvbzLAiRNDNL
t9CpKy1LXKnR0Zi/HGuY80M7v8DEmtacqvJDMW724KUQd6kQINB/0S1XYyBWqv8q
XO49gxyx5lWBICKNb/Pna8adJ0bNyb2BzAoJOBaNbXXPm6T2E9xoc8FcWYHXTm/h
+YFBWQScFD5lhTCN3Q58crloXYtl1+lhYWz2D4r20YY3FBTs3GNOVmL8dksVUuT7
e+U+9aWNgMTcldwVVV28NiYtVd5dCv29UhBlfBC2MlFuvBRDKB6l0McXF/g2zONA
6WyQpyXP7GPM1NI2YchUDm7kO3CczZ13Du79wAHVKaD76eSGJaV6ingusidwn5Im
lvzkpgRtyfIO9nqfdp4hMN96jiGwLa4v9iocogbZaNgBEPYPYZLdR73ZJ3fsjwKD
gIQbHXlWBxnVRvyplhqlTsk1nyxUREcNqJ1G8Jyost49NDReJ7347Aia1e/sf6ut
OZPLJ6684254ztOkG0v70gCZewk0YGR/3vbusIOkgE2Bv2bghwE=
=5Hsz
-----END PGP SIGNATURE-----

--YnArdn3qbQ9VtP5L--
