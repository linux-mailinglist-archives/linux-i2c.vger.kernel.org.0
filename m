Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB6577E6413
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 07:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbjKIG7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 01:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjKIG7e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 01:59:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAC52D4F;
        Wed,  8 Nov 2023 22:59:32 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1FCC433C8;
        Thu,  9 Nov 2023 06:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699513171;
        bh=h9kDV3dysZgpe/2x0AsOul6LLidhINT+Wclj38jsZEI=;
        h=Date:From:To:Cc:Subject:From;
        b=cnNqZ8GLiC5K9PXNw+fsLnYWsEMdQ8aHvMfnLvyKKnwxohYK029iHYC/zfU4JgOBt
         pHqWca7lNzWQRKMmsaI4uyoj5+uJhXTbwr/LoHt3oxpcpDfkefwXKgUdmkdlHpxasb
         5SlySvTmtpMCKbCGRKVuqilN3V8uK4S1cMdw1q7/wdDQg+JEHQCnoBPteP8h5C8EL1
         Moi9rgDsfaw/X+87YrBC1x6EQ5Zn0AkN/TdCbn6vkrDU8umkFVz90Aw+0BZLHV0hZT
         G8ZTsbzw3w4h9HYuJHXtjo+lR+fXnGfutBHUZrkTgs1Cxna+0eiR1STVMcfupUjkSK
         tqjTNjSPTTFBQ==
Date:   Thu, 9 Nov 2023 07:59:25 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] for-6.7-rc1-part2
Message-ID: <ZUyDTXUSNgMQFNAh@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u4kCAQQpSN6EeeWl"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u4kCAQQpSN6EeeWl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 305230142ae0637213bf6e04f6d9f10bbcb74af8:

  Merge tag 'pm-6.7-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git=
/rafael/linux-pm (2023-11-07 17:16:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/for-6.7-=
rc1-part2

for you to fetch changes up to bdba49cbba41f0bea54fc93529bbef4d6ceaa3cd:

  i2c: cp2615: Fix 'assignment to __be16' warning (2023-11-08 10:27:17 +010=
0)

----------------------------------------------------------------
The second I2C pull request for 6.7-rc1 contains one patch which slipped
through the cracks (iproc), a core sanitizing improvement as the new
memdup_array_user() helper went upstream (i2c-dev), and two driver
bugfixes (designware, cp2615).

----------------------------------------------------------------
Bence Cs=C3=B3k=C3=A1s (1):
      i2c: cp2615: Fix 'assignment to __be16' warning

Philipp Stanner (1):
      i2c: dev: copy userspace array safely

Roman Bacik (1):
      i2c: iproc: handle invalid slave state

Tam Nguyen (1):
      i2c: designware: Disable TX_EMPTY irq while waiting for block length =
byte


with much appreciated quality assurance from
----------------------------------------------------------------
Serge Semin (1):
      (Rev.) i2c: designware: Disable TX_EMPTY irq while waiting for block =
length byte

 drivers/i2c/busses/i2c-bcm-iproc.c         | 133 ++++++++++++++++---------=
----
 drivers/i2c/busses/i2c-cp2615.c            |   2 +-
 drivers/i2c/busses/i2c-designware-master.c |  19 ++++-
 drivers/i2c/i2c-dev.c                      |   4 +-
 4 files changed, 94 insertions(+), 64 deletions(-)

--u4kCAQQpSN6EeeWl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVMg00ACgkQFA3kzBSg
Kba91Q/+MdRuLy8yd4gT2wXMDvy5WzqBpSxOaJfXao7ZMDA8nxgc0B8hx63mXZ45
q6SR69ZuU0bV5/0ttx+mseZawlq+st/WexWKTFBN/FtKk7VR1Bv9RoFAaxYj2RGz
YXMWC6syhxQwLf/vUTcm1fYbi4P9GfdHpLsrA3V69D07XjhttVMv4s36FbeHA3wi
iec373VVcpWasgKAAPvJpx4pIkvl6end5kRUcoOPrzDwB4jMgQ0lEO3kMW0+EkUW
6fznmdLhTrRZzgKp3ugv0p6yVflR8RhQNrdk84aGeASvGmCMR3lnRoeNXfxwJw6y
43CYNDUDTfvq7FcApfcAuITC9aiWK2/FpssHiME0t5IL83q7lRBEAkr2T3sJQSah
daU1PObLxG2Dc/pBRBxnb9lQQhFmaMi8OsXi9PwHRhKxzdziSdKCNbOyiRj2CLdE
pv8aeuyrMqI8MVOLJ/o0RKybjrWubu3vUW1s/bU0nFZHjQATHwGxAh4lSGN6VDdn
YK+G6NgIYIh+q7n5yS6fwGuAytTFT6UNvNeGHZYmH0W0OfbEzdGONuJSSMF3FO1J
1zn8s9dfZEKBosLF3Gpt+rziXqc2PTJV1i0L3VjYmWQehWU9MLmTyo10RlWhUF4N
TCzfNRjNWLHFWgaXjGJ8+rmZsHbE2nBsmY41vzHzKEE1jTOCiL8=
=gbw7
-----END PGP SIGNATURE-----

--u4kCAQQpSN6EeeWl--
