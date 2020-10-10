Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7247228A33E
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Oct 2020 01:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730297AbgJJW5T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Oct 2020 18:57:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730440AbgJJS5W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Oct 2020 14:57:22 -0400
Received: from localhost (p5486c996.dip0.t-ipconnect.de [84.134.201.150])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D99AA224D3;
        Sat, 10 Oct 2020 18:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602354536;
        bh=ekvI9z3HqHdOghafJ/d1GNBYegDks0JWZF++0k1+fMQ=;
        h=Date:From:To:Cc:Subject:From;
        b=LBrIBTQ/kkMuoxgqjS11tWNhaKAQMevFvr1S7Mu+f+kQPitkP18pkruE/aexwdcLf
         TyXNUIPvh4UYbhxY3I/al4mW1svWxatOnwX3je+fTSrPrNhJwaCAtZenSZCiEPSwfw
         pEgpNfK+wbbXHFG2m42hdfmMd7oObt7q3V9X2L6E=
Date:   Sat, 10 Oct 2020 20:28:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.9
Message-ID: <20201010182852.GA16937@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here a some more driver bugfixes for I2C. Including a revert - the
updated series for it will come during the next merge window.

Please pull.

Thanks,

   Wolfram


The following changes since commit 549738f15da0e5a00275977623be199fbbf7df50:

  Linux 5.9-rc8 (2020-10-04 16:04:34 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to f5b3f433641c543ebe5171285a42aa6adcdb2d22:

  i2c: owl: Clear NACK and BUS error bits (2020-10-10 13:15:46 +0200)

----------------------------------------------------------------
Christian Eggers (1):
      i2c: imx: Fix reset of I2SR_IAL flag

Cristian Ciocaltea (1):
      i2c: owl: Clear NACK and BUS error bits

Jerome Brunet (2):
      i2c: meson: fix clock setting overwrite
      i2c: meson: keep peripheral clock enabled

Nicolas Belin (1):
      i2c: meson: fixup rate calculation with filter delay

Wolfram Sang (1):
      Revert "i2c: imx: Fix reset of I2SR_IAL flag"

 drivers/i2c/busses/i2c-meson.c | 52 +++++++++++++++++++++++++++---------------
 drivers/i2c/busses/i2c-owl.c   |  6 +++++
 2 files changed, 39 insertions(+), 19 deletions(-)

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+B/V8ACgkQFA3kzBSg
KbYAOxAAo9tuYit8uWqWZBINf/ofPyfk3MMkL1z7hkT4n+aGqXhIEfHOWlxMsws0
lBlWov/0ElrBtJAGu7F0IVldf2WoUHKGSWNgN7hGvQss5KSdFxhaIsEwnnZBVo74
tIT5WKxNG7ZvNEeth9pj7wzstfso0zmiWcUCat2b5aLsE/DAVXoTX3f1VkC78UoL
T/GqkPHuAPo1BHGH2r3on/M1wkNCOlUxvUCG8hqdgzXjqiQT1BwkMwMCX5ybLLrP
zCdlcD5CBS84t6+bp03UtqvW8DPBrIOEYmH7KUYt7RY5I2mjcvtiurp4ssb/v+3Z
LACFt+FUJ547W1t8y3iJENQ8tReaHdB0DkufeeuLUIFFugVVPUCzmrmJeHPsgKMH
itx9C7oQfZs5rb0BPJJVUvB/BL4mNYQl2XcsHi86hNU4CmfXdTGDAvtHcEBBxn8x
LzMVrOENHm46qfssAiLJUYuvT3b7XmLdT5QyaDOz+wWoz1nlhBJpIL5ytxp6cUXQ
lrqCpvlM+De5llQGPhOHL7FjQzYhYOgOeTotfUQfgjoGkT/fHMJjiaQRCafLCHG4
3kic79BoUjp7A7S1LckkFpgOJgPdgXn0yG8urxxxohGXglCds/fvYGv5tiZ+qvH0
cUleH7cYBriMktvPE45gH8NITdl+s1+D5hHuNLTX8w+uSSNYhcI=
=FB5Z
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
