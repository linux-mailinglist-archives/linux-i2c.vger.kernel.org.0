Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACBD174928
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Feb 2020 21:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbgB2URw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Feb 2020 15:17:52 -0500
Received: from sauhun.de ([88.99.104.3]:44686 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727170AbgB2URv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Feb 2020 15:17:51 -0500
Received: from localhost (p5486C81B.dip0.t-ipconnect.de [84.134.200.27])
        by pokefinder.org (Postfix) with ESMTPSA id BF0F92C1E9E;
        Sat, 29 Feb 2020 21:17:48 +0100 (CET)
Date:   Sat, 29 Feb 2020 21:17:45 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.6
Message-ID: <20200229201726.GA2089@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has three driver bugfixes for you. We agreed on the Mac regression
to go in via I2C. A last minute fix in the branch was from me when I
discovered that I accidenlty signed the last patch twice. No further
changes in the patch itself.

Please pull.

Thanks,

   Wolfram


The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

for you to fetch changes up to 38b17afb0ebb9ecd41418d3c08bcf9198af4349d:

  macintosh: therm_windtunnel: fix regression when instantiating devices (2020-02-29 21:13:22 +0100)

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      i2c: altera: Fix potential integer overflow

Wolfram Sang (2):
      i2c: jz4780: silence log flood on txabrt
      macintosh: therm_windtunnel: fix regression when instantiating devices


with much appreciated quality assurance from
----------------------------------------------------------------
Erhard Furtner (1):
      (Test) macintosh: therm_windtunnel: fix regression when instantiating devices

H. Nikolaus Schaller (1):
      (Test) i2c: jz4780: silence log flood on txabrt

Thor Thayer (1):
      (Rev.) i2c: altera: Fix potential integer overflow

 drivers/i2c/busses/i2c-altera.c      |  2 +-
 drivers/i2c/busses/i2c-jz4780.c      | 36 ++-----------------------
 drivers/macintosh/therm_windtunnel.c | 52 +++++++++++++++++++++---------------
 3 files changed, 34 insertions(+), 56 deletions(-)

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5axtIACgkQFA3kzBSg
Kbah7g//TWyDLJmCl1z3qDSuXuHrHtZTAv/7VcVtNdoKXncHpPUBghWUrmG7kgOi
l7Li/Go3CSaPO7GfcLhtQZtik57yfjeI7mNf5aJ/tY+K+R+40UrKMP0jAgEkxy4M
T+L1JR+j6tWJrCMcoutHOBL7HLazJmvB/Bv6RYH4nzUzupvVPKFC8HsUqSw6mrIb
XGlunX26gbuXYusNZ+wFBHsx6n6b48VmAnsFSuP6pyIWWHwt6s15X+l5yR7SJbjR
RJPyU5ApRUcYdCWkBGhmdRhwdUR2/VEJBJctmjEza41IZWsUsn+Wd6exEH0NHxjx
GWFSju2R64TSgblLT8XC2OPE1/FhLvNic9UuPHH4dbw1KnpakafI9mSXBx5YVKyr
3ZUyQrXGYDDYXun+aSchv+Qy6szSnqFMtbhkfDN3EjypnQo2v22qJiGEXOZCC6LD
5RkHTu9NE05WjTZa5/5YvzW3nFc3nX+4GXoEvvF5ZUPGTxPmmMESNwdD35Z4rOec
/pTKOPjvBA//+KbO2//2d7+Re/E/BBp1If1a32ZbJcR3pD/B786LH4+LARLvecQR
pA/YpmapqiA1PgUhEB384t3oAp+yv9FhsOEiXuACiOXLlmKnO4c3gLXbndBjjNYt
zQ0MOaU+KrUvKxEJSZubGEzv+RoVgYSRP1NyErwD77nfRNxsWDI=
=iyKy
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
