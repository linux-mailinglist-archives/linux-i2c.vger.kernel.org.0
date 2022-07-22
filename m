Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B46B57E6FD
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jul 2022 21:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236047AbiGVTFh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jul 2022 15:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbiGVTFd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jul 2022 15:05:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8A123176;
        Fri, 22 Jul 2022 12:05:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 67A64B829D9;
        Fri, 22 Jul 2022 19:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0BBC341C6;
        Fri, 22 Jul 2022 19:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658516730;
        bh=BcYlBmHpFAfaJKaeLyB1SeFxMDCNn/CWCGkkHpq+7ZM=;
        h=Date:From:To:Cc:Subject:From;
        b=WC+kd93S/DIU2dDixNQ8lmwuoZzHA7u+FDJHfL/DPb5b9hcG9OlPJvpJ/mVYFhz4R
         s0w5XmWqXrr4djavNg+H7Hm00US97vcK52m5a4WKPq8X8Ri+eOHrGN8/k15fOwepnL
         8mnCPK5VNfjMXkm4FB782IiPoA8CIsm3oaMXhII03YRpU4gCX4/oYgG+TW8YD2LCmS
         q4KwhQMPY6Oqf77krHHx6Wx/2L6/13OPkaI35aSYivGStzcfbIq74ueS+d94nQmqnZ
         7tS6zJEnxGHMr8E360XxCXt46AYNDYA7QfJ63X10hX5S2yB8RAjZAF3mmfV+T52rBS
         9O1Y2wbdn/E7g==
Date:   Fri, 22 Jul 2022 21:05:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-5.19-rc8
Message-ID: <Ytr09aZMfeDU6M24@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m98DaZT1dZ1LiDWw"
Content-Disposition: inline
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--m98DaZT1dZ1LiDWw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 32346491ddf24599decca06190ebca03ff9de7f8:

  Linux 5.19-rc6 (2022-07-10 14:40:51 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19-rc8

for you to fetch changes up to 4ca8ca873d454635c20d508261bfc0081af75cf8:

  i2c: cadence: Change large transfer count reset logic to be unconditional (2022-07-16 14:44:12 +0200)

----------------------------------------------------------------
Two driver bugfixes and a typo fix

----------------------------------------------------------------
Flavio Suligoi (1):
      i2c: imx: fix typo in comment

Robert Hancock (1):
      i2c: cadence: Change large transfer count reset logic to be unconditional

Vadim Pasternak (1):
      i2c: mlxcpld: Fix register setting for 400KHz frequency


with much appreciated quality assurance from
----------------------------------------------------------------
Shubhrajyoti Datta (1):
      (Rev.) i2c: cadence: Change large transfer count reset logic to be unconditional

 drivers/i2c/busses/i2c-cadence.c | 30 +++++-------------------------
 drivers/i2c/busses/i2c-imx.c     |  2 +-
 drivers/i2c/busses/i2c-mlxcpld.c |  2 +-
 3 files changed, 7 insertions(+), 27 deletions(-)

--m98DaZT1dZ1LiDWw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLa9PUACgkQFA3kzBSg
Kba3Iw//cfOWzDMluynuNwyniNBDMKTtEFLqCHz35q4en1RHCKOC+glkZTklFn4T
09IWJyxYB4s39fWEE54jhYE973BpZJZG04FRhTtxd158OAz35euASytOv/n190hP
w+Eq9jkTCDxCDslm6cunTV/RLeWHzukNyQc0yLiBd83P4bA55azAMuSfypC7haRZ
N5aftRhJ9O1BI+2GY7SBek6Q/DgZIXliHUdwwEg6haAjAhgcbUyGm9EKuHK1Ruj1
iTJ5ZzHa0lsNB1PQHIZXHaJdXjMFKJPgzToHVxcpBrSUZzSPrCSVglYrMLrZPXw2
8XG40xPd4zKUw126W0h5sOagSo8++8SnpfIJpitkvaDoQro/q++9oGawWtP8slMn
eWsqqIj8q1Xm3TEg/UZgFFEpcQSoAwoxLlYVOPy31OvSpvhP2P+qlmHiGm6FxZ26
MklUts9qtMI1Bt7oVc5h5g1nuri6ZjdmoK7Foj/h3HnoHzVcUw9jEKlbpnVDGnZd
FUpOcnLnBDJSUjybgPLv80KcPsk3ltLaCVBrOKGwe9fQ2hh3O54csxwg8WxHp1iW
qXGG6DKj1dOhQ3JNeYf37HVfOnp6Whl0p2ORBGx6EfN2CFeQcseDlk8ZVSmUNwgc
8gfVao1VM8obL6GlYLnjfnbYmJFs1gTNtYxZh4t6GsPka0sO3ew=
=c1k1
-----END PGP SIGNATURE-----

--m98DaZT1dZ1LiDWw--
