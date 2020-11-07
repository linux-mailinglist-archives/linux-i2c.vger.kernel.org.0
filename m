Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE8F2AA76F
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Nov 2020 19:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgKGSkF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Nov 2020 13:40:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:38246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbgKGSkE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 7 Nov 2020 13:40:04 -0500
Received: from localhost (p5486c6ae.dip0.t-ipconnect.de [84.134.198.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D0C920888;
        Sat,  7 Nov 2020 18:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604774403;
        bh=0zuYtCeeGOx5wLLWbUWoxVdWVw4Fb2d7Wc72KWwrVPk=;
        h=Date:From:To:Cc:Subject:From;
        b=Y4hBFg1Qe9ypBhdEeJgVljbKHZWLHUxdVmm1+KhBC2/MXTd28Gr9eRbOujwMJUg2L
         6krt8flgKXYExMBDgkJE0ITUIGgCBgEnxTtfGclPAcNUDS9MJLg/qHnHO1agk34pCf
         4Hx61E5s27/GgIkoh5S2RlbkxU7u7+gNIXWFCXUc=
Date:   Sat, 7 Nov 2020 19:39:57 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.10
Message-ID: <20201107183957.GA1095@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here are driver bugfixes for I2C. Most of them are for the new mlxbf
driver which got more exposure after rc1. The sh_mobile patch should
already have reached you during the merge window, but I accidently
dropped it. However, since it fixes a problem with rebooting, I think it
is still fine for rc3.

Please pull.

Thanks,

   Wolfram


The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 3b5f7f10ff6e6b66f553e12cc50d9bb751ce60ad:

  i2c: designware: slave should do WRITE_REQUESTED before WRITE_RECEIVED (2020-11-06 16:02:00 +0100)

----------------------------------------------------------------
Geert Uytterhoeven (1):
      i2c: mlxbf: I2C_MLXBF should depend on MELLANOX_PLATFORM

Khalil Blaiech (5):
      i2c: mlxbf: Add CONFIG_ACPI to guard ACPI function call
      i2c: mlxbf: Fix resrticted cast warning of sparse
      i2c: mlxbf: Remove unecessary wrapper functions
      i2c: mlxbf: Update reference clock frequency
      i2c: mlxbf: Update author and maintainer email info

Michael Wu (2):
      i2c: designware: call i2c_dw_read_clear_intrbits_slave() once
      i2c: designware: slave should do WRITE_REQUESTED before WRITE_RECEIVED

Qii Wang (1):
      i2c: mediatek: move dma reset before i2c reset

Ulrich Hecht (1):
      i2c: sh_mobile: implement atomic transfers

 MAINTAINERS                               |   2 +-
 drivers/i2c/busses/Kconfig                |   2 +-
 drivers/i2c/busses/i2c-designware-slave.c |  52 +++-----
 drivers/i2c/busses/i2c-mlxbf.c            | 204 +++++++++++++-----------------
 drivers/i2c/busses/i2c-mt65xx.c           |   8 +-
 drivers/i2c/busses/i2c-sh_mobile.c        |  86 ++++++++++---
 6 files changed, 177 insertions(+), 177 deletions(-)

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+m6fkACgkQFA3kzBSg
KbbeUQ//Y42n8Ri5l0KEAh7f4eQi+ekrmAp972Jo3nIBoAYvg2S67j3WjsJlE/Mc
PTCFlD0uRLJFQzAdE8y2TyiLoDglkmad8ySSO65EU5n9EnfFlr9L0wnnu5S0dgPe
pNggA8NHBmOBMkVlpdfPi1qOX9wRBqQ++XnbMRmI/FA+8hhELHmUi2LrPErIi0qe
WW9lo2ocQVdRV+sjJqkcUDpoq1E8yDRyMbHrDNzQYQvhs1MZ8h9/JFKmUZk9/8k1
ibK1/f06jOCZ/XmKe9qsulQXGYGwrasoXNetGMA1WxvAkd+s3RMODzeARxVqv51D
R4LhWwDhsyCwQyK5zQ0/Pl9zR7ijnqQHLwMJaSJsJ+Oy7y5FL2QYjHb4eXPEACsG
fiSyh6YHUiAv1Sd4oxT2MAAmGIx0FAvsnPHrhdPvwrC2iyR9RsJqi6FhjXV1bl2p
dEM0rOQKOkIhAEVlEmsA1SYS6sKg/+Bjl4D1kjkk2XH8FO9ssT2a5TO9DqHz34nn
NygnUoFCKGusvP/v1MxLFX9BFcaxSqb0YZOA9lFJqHXNDSCY5dih2Eiss+r/uj+p
7d5wFZJJibAh5+qpS5D6Y/tl0nWllqWPQ/BzSmbboyUvftUvzj0S94CLsr2HMx/f
px0R7DEL4zyc9q0iqBsvlh3wcOIkznKkA3pNF8+SM1354g48JlE=
=WjIg
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
