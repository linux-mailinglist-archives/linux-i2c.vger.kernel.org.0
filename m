Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A492D266915
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Sep 2020 21:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgIKTnl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 15:43:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:40760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgIKTnk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Sep 2020 15:43:40 -0400
Received: from localhost (p54b331d7.dip0.t-ipconnect.de [84.179.49.215])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8518921D6C;
        Fri, 11 Sep 2020 19:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599853420;
        bh=2fV5YPRAOsv2GDWDbhx3RjScHFIk8rHvyfwRHv5CKIQ=;
        h=Date:From:To:Cc:Subject:From;
        b=EhL38Cr0cMvh+csxo8gz5+VHg8Vc+7P+i1OPJimC2lnlmluD0Jjm/jqgbq2s3TYDS
         QKH3u50sKTDqM0pPtf8JPwZoyEqCJtBtc3kBsB2Nf7EIHmkGNYrQvxKOXVUjxo9oJe
         00R7UGUICw7hNarJstPdcBIngxtybFPf5rhW6ebA=
Date:   Fri, 11 Sep 2020 21:43:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.9
Message-ID: <20200911194333.GA2270@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here are some "usual" driver bugfixes for the I2C subsystem.

Please pull.

Thanks,

   Wolfram


The following changes since commit f4d51dffc6c01a9e94650d95ce0104964f8ae822:

  Linux 5.9-rc4 (2020-09-06 17:11:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 0a355aeb24081e4538d4d424cd189f16c0bbd983:

  i2c: algo: pca: Reapply i2c bus settings after reset (2020-09-09 10:22:40 +0200)

----------------------------------------------------------------
Evan Nimmo (1):
      i2c: algo: pca: Reapply i2c bus settings after reset

Tali Perry (1):
      i2c: npcm7xx: Fix timeout calculation

Vadym Kochan (1):
      misc: eeprom: at24: register nvmem only after eeprom is ready to use

Wolfram Sang (1):
      Merge tag 'at24-fixes-for-v5.9-rc5' of git://git.kernel.org/.../brgl/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Alex Qiu (1):
      (Rev.) i2c: npcm7xx: Fix timeout calculation

Andy Shevchenko (1):
      (Rev.) i2c: algo: pca: Reapply i2c bus settings after reset

Avi Fishman (1):
      (Rev.) i2c: npcm7xx: Fix timeout calculation

Chris Packham (1):
      (Rev.) i2c: algo: pca: Reapply i2c bus settings after reset

Joel Stanley (1):
      (Rev.) i2c: npcm7xx: Fix timeout calculation

 drivers/i2c/algos/i2c-algo-pca.c | 35 +++++++++++++++++++++++------------
 drivers/i2c/busses/i2c-npcm7xx.c |  8 ++++++--
 drivers/misc/eeprom/at24.c       | 11 +++++++----
 include/linux/i2c-algo-pca.h     | 15 +++++++++++++++
 4 files changed, 51 insertions(+), 18 deletions(-)

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9b02AACgkQFA3kzBSg
KbYNchAAre/GnSj7dj3q8R7u/Dcp0nrqO2FGlr+IJu8kWa6+NX+PwQceNBYcUHgY
nLaRUjnEyHW8skOoXPI7ruj0eYE0h1a3k0Ka5q7dSa+jcZg9/BQ0eWjLApK7Zoy2
7SNZonDAJxWO7Mqe9Vi69e6Cu0ofd2NyXTVv71SIbwhOQkipWRcQ8fZaOEZTo5p8
uPL/yLlzeyki5hQTtK9vfYxdENidMkGtYuahBc0ONPs61zeeR0IKD31IX99HFSDi
HC2F+2qb35ezM8UKI4PLBKqD3msQkaoUXjvhmOW6DOwluG22vxsq4LK47QqA3IbB
oZV9EpKpPgYnqhHmP5+P6Al1E5EZpBkM9r6V5Nt9AoCWLsy2jfGwFil9/I6nklwy
2FO+8Iv9Ql73CaPyZwTnenPpZ1Jd6JNVLDbQEUYwHdEQSdy8+vlKUyacba9Y8u00
Yisdi6Uyd+73lpf89SFJ147GVRSrBqEhhnkK7HL0tOUGeH90yMr73wfC3LYpq4jT
eLmn7NmA01aMchDsNSX/nZjIh/oDcOuAjByz38a3ZAE4n/G4pHhp6IChSDrzcu+B
kQokZ/sTkZbTl0wu8HamkqdKzgo4gVuEHXt3nGSHm8jtFUD4ht7SsSAFsrWV2pQc
0A5vxsTZzNOlWpR94/hsNNugBYK5Q3CB1jULbPRQPyCXLwktjyk=
=FNUA
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
