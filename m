Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 655A556CB00
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jul 2022 20:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiGISEl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jul 2022 14:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiGISEl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Jul 2022 14:04:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0C415FC8;
        Sat,  9 Jul 2022 11:04:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EC716B802C8;
        Sat,  9 Jul 2022 18:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73BAC3411C;
        Sat,  9 Jul 2022 18:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657389877;
        bh=dmcRENbX3SD+tyNzNV8F9NilX0Wb2fPp67H8wEd2Wxw=;
        h=Date:From:To:Cc:Subject:From;
        b=BQDoG9rF23dTPGjI3CgLt4sEw+wyhJRSfWWwnWQa7yuJZkATa2BPI3L+V2GaKrhHz
         iaMgxhRXTzGWFGpoZCJnvmAi2EE8pMPXkB+aYkXFW1DluJ0ybW60jJF/Ju6OZlUIbb
         Ca8yTxMSmo9q4Y17ziEMTWFo1ZmO7q4o3C99NOFYMTqy0wpqJnoG2tD1DBqH0xV67q
         fTTvEE0b8rH/z8PBX3Zi9nHKV2nFFaL3FMp2jCXFWcZcInPMjIFh9Vik5FaZMm/snE
         v2udjIaBY62nkt3mSkU4v3C7maX1NjQR78J0Qwh0zkVtmFl9jxoH5GSWWdnVpsLwYY
         VtPe3Ae+Ypd2A==
Date:   Sat, 9 Jul 2022 20:04:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-5.19-rc6
Message-ID: <YsnDMSqbVygxidsL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qnaKXHxQagW37kkc"
Content-Disposition: inline
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qnaKXHxQagW37kkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19-rc6

for you to fetch changes up to 3501f0c663063513ad604fb1b3f06af637d3396d:

  i2c: cadence: Unregister the clk notifier in error path (2022-07-07 23:06:34 +0200)

----------------------------------------------------------------
Two I2C driver bugfixes preventing resource leaks

----------------------------------------------------------------
Jean Delvare (1):
      i2c: piix4: Fix a memory leak in the EFCH MMIO support

Satish Nagireddy (1):
      i2c: cadence: Unregister the clk notifier in error path


with much appreciated quality assurance from
----------------------------------------------------------------
Lars-Peter Clausen (1):
      (Test) i2c: cadence: Unregister the clk notifier in error path

Michal Simek (1):
      (Rev.) i2c: cadence: Unregister the clk notifier in error path

Terry Bowman (2):
      (Rev.) i2c: piix4: Fix a memory leak in the EFCH MMIO support
      (Test) i2c: piix4: Fix a memory leak in the EFCH MMIO support

Yi Zhang (1):
      (Test) i2c: piix4: Fix a memory leak in the EFCH MMIO support

 drivers/i2c/busses/i2c-cadence.c |  1 +
 drivers/i2c/busses/i2c-piix4.c   | 16 +++++++---------
 2 files changed, 8 insertions(+), 9 deletions(-)

--qnaKXHxQagW37kkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLJwzEACgkQFA3kzBSg
Kbb1TBAAsL4ACz9hRTZmbKQLNLPDMpZKLVUEiAgsJPsE7keIlbX9A2UBtw4SctCm
R4kHPR7woI4qwisx2cniOhwRRCS7TJhYBK+twAVPaqxRnabXwMISYXm1Rj+dIvmR
wtCHHmfd1uFycW52nq/BerH5uFKbgtQzxLnE7neWRw2aAjB1TALwYmLJG1eKNHQp
YM/3lWDbEWGk3R0R3G+bopZCqwzLY9a8ZUq5jBYCxegPesiu4jpVzyuJIGBiPBgG
U5RtwpFhLXjTuNyFymAgAGVFwSqvOac7M+nL1dU4XLqhXT/5OMGW5/lFnp4jSZt1
w1Ef1wxuIWomv9owpdYvfLIGmSAr9NXSxtCdslVBRhsbMxQsf+0RPi2DQcxyAqsN
qpa7biqi0eC4fQo0uv9qMbo3X6Ul5oAFicuRL35IG+WWoucmmZ6lsploSQMgbVb1
p3QtGsIzyPDvSIHC8Fwwy5nGQ4ogQaq3trg73WoByiUhNUWVeFUzhd5eTE+fZAfm
3owHEemRRg6IYVf7V4z+8UrIXzFPGjpt4ORdwSnQwB/OrDebCCSn/gVarKTwTc1w
trmRQBDdEDBhX6mg4202AUKwnPT4P/M8m/FSn/dF1rICCvBvkCUE8PaG0dOKzOnh
QuRqTjMN8ejNC12DTTEuw0p55ET8E4HeorWlM+DNtqLf5b8BAG0=
=xkY4
-----END PGP SIGNATURE-----

--qnaKXHxQagW37kkc--
