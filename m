Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3C01C18C3
	for <lists+linux-i2c@lfdr.de>; Fri,  1 May 2020 16:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgEAOuV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 May 2020 10:50:21 -0400
Received: from sauhun.de ([88.99.104.3]:36084 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728737AbgEAOuV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 1 May 2020 10:50:21 -0400
Received: from localhost (p5486CE11.dip0.t-ipconnect.de [84.134.206.17])
        by pokefinder.org (Postfix) with ESMTPSA id B4CEC2C1EC4;
        Fri,  1 May 2020 16:50:18 +0200 (CEST)
Date:   Fri, 1 May 2020 16:50:18 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.7
Message-ID: <20200501145014.GA24395@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has three driver bugfixes this time, and two reverts because the
original patches revealed underlying problems which the Tegra guys are
now working on.

Please pull.

Thanks,

   Wolfram


The following changes since commit 6a8b55ed4056ea5559ebe4f6a4b247f627870d4c:

  Linux 5.7-rc3 (2020-04-26 13:51:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

for you to fetch changes up to c926c87b8e36dcc0ea5c2a0a0227ed4f32d0516a:

  i2c: aspeed: Avoid i2c interrupt status clear race condition. (2020-04-30 16:12:33 +0200)

----------------------------------------------------------------
Dan Carpenter (1):
      i2c: amd-mp2-pci: Fix Oops in amd_mp2_pci_init() error handling

Rayagonda Kokatanur (1):
      i2c: iproc: generate stop event for slave writes

Wolfram Sang (2):
      Revert "i2c: tegra: Synchronize DMA before termination"
      Revert "i2c: tegra: Better handle case where CPU0 is busy for a long time"

ryan_chen (1):
      i2c: aspeed: Avoid i2c interrupt status clear race condition.

 drivers/i2c/busses/i2c-amd-mp2-pci.c |  2 +-
 drivers/i2c/busses/i2c-aspeed.c      |  5 ++++-
 drivers/i2c/busses/i2c-bcm-iproc.c   |  3 +++
 drivers/i2c/busses/i2c-tegra.c       | 36 ++++++++++++------------------------
 4 files changed, 20 insertions(+), 26 deletions(-)

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6sNyIACgkQFA3kzBSg
KbavUw//aoMIcqOloHs5DFPahlp5mPAHKmyshtsyXMPo9qUkk5qrjjqQiAhJoA6f
2Uc2FsY7trL3KOfJBjpsVShcoozGmlgtXlpq3wnMrujFNl6l8k5vagsgvgbuJUwl
YCgCA1e0lXRELURhWcNX8Splc6xERwR7qpsK5jBzz/Ly2aocU27pzN/TWFiE+Jk3
r3o716nVqt5fwbiGwseC+lbfF4n6vOQlF1mSkty4QMxxMglgFBJKpX5c3u4KxmlX
HSHgYeLkV56PR/ysNey3zW8x6SWg4LvgDQOZ36reZP5ICDcjXmC2Q+B6B75g+tAo
bgHDmW+RDC66LgbUwo51z4h7WqpWeCQriJ3Y27XUnSsbvyymxs5FUHjbg+wP1Cwf
0mgonT46C6hvUgnf/NvwjG9ueYrt3HaiLXn0dUgypMRLtckZX4xR/0qEtS2gUDua
RiUOY4zyOBxNZkNt2wAeQ+/SD5ZsRrYc6yMLpxBh3gbbtxnnwrPrbavZ3WQ3B3fZ
aIGZ3NhtSxbB8FLt/yi9NmMIybNcSlUDh7IvmlCg3Db24yBS+ZawUeB9jU6OMxPN
bouYzDrhVQN70LxBVkoxsu+KJYGD8x7EmDQ8U0Anfgrv7zpqMjPL92h0UsLE5/ca
HpompTh5AHAKxreS2aNs/DS4Oe4ZOyUSgdxBHs+jarwy+VLmlJk=
=oh0R
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
