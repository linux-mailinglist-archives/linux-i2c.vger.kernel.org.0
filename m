Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1BC301541
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Jan 2021 13:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbhAWMoR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Jan 2021 07:44:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:42494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725287AbhAWMoQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 23 Jan 2021 07:44:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EC6022C7B;
        Sat, 23 Jan 2021 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611405815;
        bh=01gZ53GBqiUt+IiEuvd5X0QNVosvh/YFuM1nYBjKZwI=;
        h=Date:From:To:Cc:Subject:From;
        b=KwDlQbEyB2bXJuWcxD84rMXrwAoN7pvkAZ5Q3S4jVtLTBGmj0wUN4bw4ACmu6bB6u
         vToYFQ87WqEImZuDbow9Akc7ShuP1c3a/wW4C1dgVFJV7uyF8VMhgc4bcvVJ8EGGJP
         Wg3VQNVShWRxFwox1Qv5mf9cPqlyzqJA+vpKTbZc1syTIUQaNgjUIpfh5B6ynKvtRN
         jJ3FfeqR0JpFQ/AuHY/yko8eXlpvj2F6f26orxC3dMGHi+mo3wGDOPB03w+h5c2+r9
         kSa+vsINdnoJCeYIj5MVJybW7ei+OqkEJSmAH1YHVYIVV0aG+iQ90ZWABah0YVlZU9
         YIlSJTVz/5avQ==
Date:   Sat, 23 Jan 2021 13:43:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.11
Message-ID: <20210123124329.GA1022@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has another bunch  of driver fixes. Please pull.

Thanks,

   Wolfram


The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 9ecd1d2b302b600351fac50779f43fcb680c1a16:

  i2c: sprd: depend on COMMON_CLK to fix compile tests (2021-01-22 10:13:33 +0100)

----------------------------------------------------------------
Fabio Estevam (1):
      Revert "i2c: imx: Remove unused .id_table support"

Krzysztof Kozlowski (1):
      i2c: sprd: depend on COMMON_CLK to fix compile tests

Mikko Perttunen (2):
      i2c: tegra: Wait for config load atomically while in ISR
      i2c: bpmp-tegra: Ignore unknown I2C_M flags

Sowjanya Komatineni (1):
      i2c: tegra: Create i2c_writesl_vi() to use with VI I2C for filling TX FIFO

Wolfram Sang (1):
      i2c: octeon: check correct size of maximum RECV_LEN packet


with much appreciated quality assurance from
----------------------------------------------------------------
Baolin Wang (1):
      (Rev.) i2c: sprd: depend on COMMON_CLK to fix compile tests

Dmitry Osipenko (2):
      (Rev.) i2c: tegra: Create i2c_writesl_vi() to use with VI I2C for filling TX FIFO
      (Rev.) i2c: tegra: Wait for config load atomically while in ISR

Robert Richter (1):
      (Rev.) i2c: octeon: check correct size of maximum RECV_LEN packet

 drivers/i2c/busses/Kconfig           |  1 +
 drivers/i2c/busses/i2c-imx.c         | 20 +++++++++++++++++++-
 drivers/i2c/busses/i2c-octeon-core.c |  2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c  |  2 +-
 drivers/i2c/busses/i2c-tegra.c       | 24 ++++++++++++++++++++++--
 5 files changed, 44 insertions(+), 5 deletions(-)

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAMGewACgkQFA3kzBSg
KbajYA/8D/2QXHxS5V2YtysGGgX/aKo/Cgf4FSub9mIitjhzU+6CjJlHcqzvZJT7
BYGwfoIHqUSZiZNxQj9rE8upxrpJgEAMeu/0VHb1e/BE7PqUj7tt/Qq+2AYjFEe4
zAK8ExtqyU82gWfqlLTkU0wrdsqK4C2J574yJaae49O4w35TPCoZYEMJgwEbyBTB
aP23xaIwmc/CkIGllSzXFRGaZAu0WqG7ZD/U0zKpkqbooH4f4gzC/9GP6C3/nA9u
Ehg+/SbxSzsmV4kLtELiUutEhYQQHqYQr8AXTZWlDSVx3mZwqGMdM/dotT9K25sl
+xcOqakZm1FYoSM3f+ireeXUH5HsmS4Gqe1xfI1ceitpJx2CmsE3BE2VuzxSc6rn
p+Rml7AKfhKfI18Mro56I/dHGe6Zrq9M4QyppAcaQJHsC/CWaRZfuDN8oyTfdARh
Tv2u4udkNytgsYFBcPBf4qFQlkVfLidl8AVP97wozYjULRuwni4S6r8IOzSCVzdW
HWKIgpftleDsXPrUUZUKbwWAgahnTtwyBsgMqo9hTE6VOUJOV1JiMrqVdX4st6PF
wh76k7oo2V5v0c4pGDNAozeGnI5zaq87HUpV/hTCtfwEFBuMaIYjeojuk6Wz0shg
q5ahiN6zAStHFGEMlxbarYF4+rDrOcNDkG9FTLlKTdqhl9NwW78=
=KuVi
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
