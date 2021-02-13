Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA4A31AAE8
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Feb 2021 11:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhBMKmv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Feb 2021 05:42:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:48836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229475AbhBMKmu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 13 Feb 2021 05:42:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B47B64DA5;
        Sat, 13 Feb 2021 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613212929;
        bh=GF8gT1WEVAStIkSxxcU0OS1EW6hMHU/IQd7Bg7fg/fw=;
        h=Date:From:To:Cc:Subject:From;
        b=g/eOjzAVARLSm6zNCckBT9LYS+PknVoALlDpYitwRDknUVsthwJXFzcOhvE8luy0p
         lFuzw0n8sIjfhO+ibmcjK7CIN3dBZSEnDf1T7e1ZOaFTPAMy2ud1KNkFAurJ3fj/PS
         3WLI9UwQf/02UdsPI8kAXGT2jvy/WMOfy8bUjLAApA3LOCGCqC22IPpvWRvWTF244C
         Qxo03hEgXXpf0jQp3kxeobOMgJ+sBFe61X7QiQ/c9+fUFK5LPMYOx35SD4W2QQSsoH
         zcBlVfCy7n8rLaq4HB6E1XT/uCLiWrNKcCqpdsaLxGcXNINzaz8gx2EYuT83E1hFuN
         LyDIrK3YMQUoQ==
Date:   Sat, 13 Feb 2021 11:42:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.11
Message-ID: <20210213104200.GA4086@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here is one more I2C driver bugfix. Please pull.

Thanks,

   Wolfram


The following changes since commit 92bf22614b21a2706f4993b278017e437f7785b3:

  Linux 5.11-rc7 (2021-02-07 13:57:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 3d6a3d3a2a7a3a60a824e7c04e95fd50dec57812:

  i2c: stm32f7: fix configuration of the digital filter (2021-02-12 11:36:40 +0100)

----------------------------------------------------------------
Alain Volmat (1):
      i2c: stm32f7: fix configuration of the digital filter

 drivers/i2c/busses/i2c-stm32f7.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAnrPMACgkQFA3kzBSg
KbaaUA/+OmDHhFC4dHIPBYbLtQTqMs6jHLri7Dos0mufF6ZYneZF9C7TH2+QNaJE
de2PIfZsGEcyX1hmjZAgVHRiATFyb1jug+XUxIFPhvh2QwOp75t6iyWa/KPXozY/
x4Kw9skpvM/QUlOMPrNq3nINsj0VuIGchTeY80QjUhjTAYTh2x9TNUAirll4NUUW
G9y2UZaq8NMHNAYbu8hxhbzo32yg4i4heca+Y+mEKp7ueweYrTcZYJP0ZM4l6jLH
jUHcdiGe+lBYsNBElFs8R3YAJ3zN/J0fv534JaIdoRoNwINHa671PS/mJuFnZ37W
muNegFd4vTYMNIk13au4t5GVSp3aSb9e2CukGqeDaqSrOcSyux0/jgvcsMJbMJ1d
iOrQLYCOczzTEAHz5E4T+FICDZKn5f90YPD79IPu/NcXu5HXTgCRyhx2uS8eiUBh
L+i9Gcn1u8NI6iQwgN1QEkw5uFXXNcZKfnDrbnnEYb0eQoWAYWm+tlOM9GUIYfrf
ZUnsI5S2ZkfcwB4jhZFNkT6WhlmH1R9xL/FpcFyFPmG8o5cRvzZOWRESdJPbN6UT
DcJq5sfxJ2Nq3QSF485WYLLAHLWBAE32ROSs2PbWyAy/Y1Xk88zVWB5nEpBxRHQ7
n7qOdfe4p6+Da5zABlh/Brsb9st2lVU4ND9emiA2h38HSs3+moo=
=H0Jb
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
