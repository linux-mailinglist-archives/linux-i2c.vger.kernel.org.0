Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA89807F4
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Aug 2019 21:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbfHCTCM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Aug 2019 15:02:12 -0400
Received: from sauhun.de ([88.99.104.3]:52058 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728759AbfHCTCM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 3 Aug 2019 15:02:12 -0400
Received: from localhost (p54B338D8.dip0.t-ipconnect.de [84.179.56.216])
        by pokefinder.org (Postfix) with ESMTPSA id C3E952C311C;
        Sat,  3 Aug 2019 21:02:09 +0200 (CEST)
Date:   Sat, 3 Aug 2019 21:02:06 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.3
Message-ID: <20190803190200.GA1126@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here is a set of drivers fixes for the I2C subsystem.

Please pull.

Thanks,

   Wolfram


The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

for you to fetch changes up to 8eb9a2dff019055e4ff307bb7f8c64a7a20e79c8:

  i2c: s3c2410: Mark expected switch fall-through (2019-08-01 22:24:16 +0200)

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      i2c: s3c2410: Mark expected switch fall-through

Jean Delvare (1):
      eeprom: at24: make spd world-readable again

Micha?? Miros??aw (2):
      i2c: at91: disable TXRDY interrupt after sending data
      i2c: at91: fix clk_offset for sama5d2

Rayagonda Kokatanur (1):
      i2c: iproc: Fix i2c master read more than 63 bytes

Wolfram Sang (1):
      Merge tag 'at24-v5.3-rc3-fixes-for-wolfram' of git://git.kernel.org/.../brgl/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Kees Cook (1):
      (Rev.) i2c: s3c2410: Mark expected switch fall-through

Raag Jadav (1):
      (Test) i2c: at91: disable TXRDY interrupt after sending data

Ray Jui (1):
      (Rev.) i2c: iproc: Fix i2c master read more than 63 bytes

 drivers/i2c/busses/i2c-at91-core.c   |  2 +-
 drivers/i2c/busses/i2c-at91-master.c |  9 +++++----
 drivers/i2c/busses/i2c-bcm-iproc.c   | 10 ++++++----
 drivers/i2c/busses/i2c-s3c2410.c     |  1 +
 drivers/misc/eeprom/at24.c           |  2 +-
 5 files changed, 14 insertions(+), 10 deletions(-)

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1F2iQACgkQFA3kzBSg
Kbb1Kg//RcE4r4w2O9BSIjkUP9yUu4bTRVynvypME3yhxVYzT79kZ/EnmNFrwuoD
YmoQgGFBt4EhGaxC9RoBMqa9SHoz8F0+HyiOJdQlm6i4Ump5fowpu5yKy8jk6SK5
7QQWgKTZGYedL0rUa16rroekZq5qO5di5Dn6Ye1Tj5xtbpM8//zm01eK971u64sP
kbU3wYn7N4q5rXYslSRWbkwFA+pRx9PNBiNd6rbf02QJoe1ckKV9KeSw7SKlRH0F
d5NJYLWSBPKM8xut2AuQG/eVjfBCg4EYJVScc+ijq6Lxoi0F1+wb5alJnVFmuFRZ
vvPOFve8N4TBCIDP47IiLZX+u7nfqa8mDilVoGvYObh1vca71Six2Map/aZAk9jd
MmDPMo0csLBcNiS0xeH8+c2Oe65dI+/0ympEq4RzpNrlHzhnxDGmbRMPPCA9OI4J
VjNysy3SX/28jxREzy+ALm9udjunvNiw+LVjD1sBdETtzZalWhBR66zcmzIaI1hb
eVarj0E1haOaPxltCnZekmrxQvZknnfkqiW4rXjVrBQoJ4iLdrL6ltqwUEEBh5rg
1O+g1Ubd3umIydVEgk4FAgY0equUzik/dJBO07Nbu5Fsy+tVvekmZ2YtjxJV9ko2
Wo07gefspUBlFnhWFH2E9NkSZech2sywlKIQWSd/2+qW8M9n2bA=
=S8jj
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
