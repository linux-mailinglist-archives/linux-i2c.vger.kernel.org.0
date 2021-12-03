Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5F3467BB7
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 17:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358415AbhLCQs5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 11:48:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245669AbhLCQs5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 11:48:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99A7C061751;
        Fri,  3 Dec 2021 08:45:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 533F1B82811;
        Fri,  3 Dec 2021 16:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4062BC53FCD;
        Fri,  3 Dec 2021 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638549930;
        bh=dlQFnWAWScmGhAzXlgxUvY3JJrU5NPxB6eivDwDO6Aw=;
        h=Date:From:To:Cc:Subject:From;
        b=buD0p2vFUp4Fs9JvMEgwI0/9H36GAAndUmN41l9zhrV7S4TVQnPoANPi81TY54Gfp
         ve/yFsmFIuIbWpRMQ2COoElfqp1L7m5vV1c1IBocY4lIQo2YVZMAMdkP/qmIxCX0IX
         oinizqNBKN+LmkWO6OmlIwErd19ze7tFlBlUdhX2QB4/qd8EopnKwTAAoEZdf5Ef4t
         41LnOUpUZvrtCHOBXdu8CNW6c6Rk1j0OJ4QcDrxV83ROBM2GFQ5K9g5gpq8ifHa1FE
         YCr38Ks89ZbUNLTj83cG8j3WoqS/t+q3BS0j9G+K4svFPg/bC6RTdyvEyT9nia/J6u
         lXmN57jkR4QJA==
Date:   Fri, 3 Dec 2021 17:45:26 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.16
Message-ID: <YapJpi/BNwQ3VOR/@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nhwc2DWm9j9tULw9"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nhwc2DWm9j9tULw9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has another set of driver bugfixes, mostly for the stm32f7 driver.

Please pull.

Thanks,

   Wolfram


The following changes since commit d58071a8a76d779eedab38033ae4c821c30295a5:

  Linux 5.16-rc3 (2021-11-28 14:09:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 02fe0fbd8a21e183687925c3a266ae27dda9840f:

  i2c: rk3x: Handle a spurious start completion interrupt flag (2021-11-30 22:38:15 +0100)

----------------------------------------------------------------
Aaro Koskinen (1):
      i2c: cbus-gpio: set atomic transfer callback

Alain Volmat (4):
      i2c: stm32f7: flush TX FIFO upon transfer errors
      i2c: stm32f7: recover the bus on access timeout
      i2c: stm32f7: stop dma transfer in case of NACK
      i2c: stm32f7: use proper DMAENGINE API for termination

Ondrej Jirman (1):
      i2c: rk3x: Handle a spurious start completion interrupt flag


with much appreciated quality assurance from
----------------------------------------------------------------
John Keeping (1):
      (Rev.) i2c: rk3x: Handle a spurious start completion interrupt flag

Pierre-Yves MORDRET (4):
      (Rev.) i2c: stm32f7: use proper DMAENGINE API for termination
      (Rev.) i2c: stm32f7: stop dma transfer in case of NACK
      (Rev.) i2c: stm32f7: recover the bus on access timeout
      (Rev.) i2c: stm32f7: flush TX FIFO upon transfer errors

 drivers/i2c/busses/i2c-cbus-gpio.c |  5 +++--
 drivers/i2c/busses/i2c-rk3x.c      |  4 ++--
 drivers/i2c/busses/i2c-stm32f7.c   | 45 ++++++++++++++++++++++++++++++++------
 3 files changed, 43 insertions(+), 11 deletions(-)

--nhwc2DWm9j9tULw9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGqSaYACgkQFA3kzBSg
KbZz+A/6A/P5MqPXuGY8v3xeaLVWps2MgUshJCVG9Ncxinz+Vzq4NkLrpfaASjvY
Dl/D7G5lVb+OvAi2z6PNC8Zneu8lEE5icGS0bibn4YQBrjB7Pa06p60MRZGYcgB8
gV6fSARCJPCXbXx0tcwIInUyTZtKPFcYKazpvgclamj8CBo+KwY6/HzoziZSMa3n
LQV+hy3iwK7Y/IWPjJZaoydutYSWiC7VdcpXJAf4/lKe6ZdbAs5ePeF/EXMJ1KDc
THdzlmnDo1So5+trksDPgf20EPRdk+QijOC9ZhW3YOuHlmyONj5byL0NW7Yrbf3c
5l7ZHacCGV1yQRpMK9Zkgc/Cy4WftIlirvSHAuUzddkgjfSxI3sWrfcVOeCClJ4J
rDQXzSnXhkJEQEvENBvzduapbItxqIuQJ1bTD5TaBu+sX/PwGMWfB1aG9GZlY9c8
9cwUvl1uEu3FeTx52D2Yqa4ddfXSrnPh8J1fYyyPEXlL5GL1gxEZPGv4Z9ex6z86
b//ZuZFWUIBqtWEhhA9A0ZXMt8FIOXB0GU5KGF1XDn+CJ1nwNitbZUwcc7SnztnB
j2gdGZM+K5SrNpn9amVa1hlBPs9/rfnGXEsSzII7VPKXPyw54Pk7toLWu0k1KEeW
d9xh9NkoY7QVqzPfK4Ds0lSZcSytmKiOZsgUIs/n37dMcDBlfHg=
=iqgw
-----END PGP SIGNATURE-----

--nhwc2DWm9j9tULw9--
