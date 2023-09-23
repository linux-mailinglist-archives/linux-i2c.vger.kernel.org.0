Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A36F87AC3B1
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Sep 2023 18:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjIWQc3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Sep 2023 12:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231853AbjIWQc3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Sep 2023 12:32:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACF9D3;
        Sat, 23 Sep 2023 09:32:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2E9C433C7;
        Sat, 23 Sep 2023 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695486742;
        bh=wGrh5m2KFThfYRApjwd8cwMRsCaSFWP9x70dbr76E/4=;
        h=Date:From:To:Cc:Subject:From;
        b=blGyQtb1u7hciF01UIGBmDL/ZcWAVc5wzrzSWsShSB2dSVYmECgdrot5Q5Zn9d3cK
         qrxsrnNvU6bxdy8nXzXlWEftjQ9ZB+gMRL9tRh/yJ75uERRQOL7BRP1mjg1+W6HIPf
         MC9KDHv8aKMPiJEhtYt70CdiUPOexr12hngonQAY/I5GTRW2WMcJBMd7CdUsEoQjsN
         tzTUDhdWRjjQbKm5J1Cw7pzlYM7s56QhfYgZN3AuHmaatAmk7kq90Gilfq/5+Oed4w
         BokKX6Hnc7fd5fBzmzpHQ8OY9jWbcFK9AaNtWkZkDq95OVv7r9ducX1ggM4xtLiQZO
         WVXRsGvJJJFLA==
Date:   Sat, 23 Sep 2023 18:32:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.6-rc3
Message-ID: <ZQ8TEfqhMnEqv6rA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g9vcFmfON0snxgas"
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


--g9vcFmfON0snxgas
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc3

for you to fetch changes up to 59851fb05d759f13662be143eff0aae605815b0e:

  i2c: xiic: Correct return value check for xiic_reinit() (2023-09-22 12:04:39 +0200)

----------------------------------------------------------------
A set of I2C driver fixes. Mostly fixing resource leaks or sanity
checks.

----------------------------------------------------------------
Daniel Scally (1):
      i2c: xiic: Correct return value check for xiic_reinit()

Heiner Kallweit (1):
      i2c: i801: unregister tco_pdev in i801_probe() error path

Liang He (1):
      i2c: mux: gpio: Add missing fwnode_handle_put()

Xiaoke Wang (1):
      i2c: mux: demux-pinctrl: check the return value of devm_kstrdup()

Yann Sionneau (1):
      i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (1):
      (Rev.) i2c: xiic: Correct return value check for xiic_reinit()

Jean Delvare (1):
      (Rev.) i2c: i801: unregister tco_pdev in i801_probe() error path

Mika Westerberg (1):
      (Rev.) i2c: i801: unregister tco_pdev in i801_probe() error path

 drivers/i2c/busses/i2c-designware-common.c | 17 +++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h   |  3 +++
 drivers/i2c/busses/i2c-i801.c              |  1 +
 drivers/i2c/busses/i2c-xiic.c              |  2 +-
 drivers/i2c/muxes/i2c-demux-pinctrl.c      |  4 ++++
 drivers/i2c/muxes/i2c-mux-gpio.c           |  4 +++-
 6 files changed, 29 insertions(+), 2 deletions(-)

--g9vcFmfON0snxgas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUPExEACgkQFA3kzBSg
KbZQHxAAkNvlEP2k0DHDVvU2TBN9L/Zh6ONlNpeyY/m/zYQJCsUQwa5pEl7EGNCp
TNIOsDlp0jK/zoH0fm5+UG/QRX+vwSdOtE0pLr+hmct//URUOrX0jgB+eB1D5YUE
WPyuhQaGAJiHZU3vvPKVVxiDGmkJacgz7/9yyoHjCS+/H108jp24XqAB63f42WDW
DYeZYzkO8CiAioG46A7lFBxOQum4ubucmfWWpnfx+TOTK4Sk+AtWtW0Wr75qiGkY
PDA3uZWNn9bcD7k1uIoku1BwSa54R0DileF1lOsv4fz/4oHBcjrtJSaWjhl6dp+N
VmbwxRfHMUUXPvdOAP0hCimougHxWqeQ8vmsv527Kscg0nsd9necHwilAmutiXja
aF7nTrva/N8O7+ymElF4o5FHPAEplvbiJzCPWRjCqSCVByr82N0w/MoN5jfoNo87
6sP3o8tpAf+1j6Vo8FnUmLEFxWM8QlNEj3n+DGfjLr2pRhsQbdUAbxP7fjthvmnG
BJctAdf77DSJbl3v22h7M1WGrFK8N5DjUBkCmSiEIAa6YhAHp9k+woS9csp+nqDf
buxVTEtJwfZI65Ahhp9m3RBTPqniFTgXK0056ke9mEuUuBL4ujHWJVIine4oasxS
rD3oS3NSEtOJe0cgBXmnMfGxxuE5eMvHT4YBmmV1z7FlzVXBN3k=
=fXGG
-----END PGP SIGNATURE-----

--g9vcFmfON0snxgas--
