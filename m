Return-Path: <linux-i2c+bounces-7077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0020E9893D4
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 10:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21D611C222B0
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 08:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8322A13D606;
	Sun, 29 Sep 2024 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3hzBYOk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDEB13D28A;
	Sun, 29 Sep 2024 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727599475; cv=none; b=uYaMwtziO1sYJlPQZZ/HiakWrmMWuuQmSYue+Atx6UC/DDuZIKU0oRLwCNtwGwNftF+74R5CZTIuLpMw/yJzseYGcP/TXGSyfldOGYcqP4zPiSPH6F/LlMu4zceRbPrXVlKmmZzjXg4o1h1myIeJiZ362JorJmS/CkBM2hRNE9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727599475; c=relaxed/simple;
	bh=1AA3bzisj6AuxlJtNNAx4S2dLOKZ0dWWhphc7AI7EjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fBTMFSD0YtI+1P0dOU6PPU2zNNwzwCGCwdw+H2q01HmNyo72hOyOLWhpkZ4Sm6OU9stgmVQrDyTyVhqA/guKU7vRvOpy2NWq7oLXSO48fplbuEwXcPkpjoqSIam+n36TB2n0amAonx8xRVmldsovPzjd9mTFTWBSAHXxt6FvwvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3hzBYOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1EDC4CEC5;
	Sun, 29 Sep 2024 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727599474;
	bh=1AA3bzisj6AuxlJtNNAx4S2dLOKZ0dWWhphc7AI7EjQ=;
	h=Date:From:To:Cc:Subject:From;
	b=S3hzBYOk4YqddmvtCqujRj0E9lwf0oKN9CFRxi1eh2C13XIb6JLaNLoHgLmRWbOva
	 LwTelOEsw/YrQevFjBFHrnQWYKgNnPNZFgnJjN4gbOmwMXRHIsojedO0+n8b9QFD4t
	 K6VpBSY3M1bK/zQvKZIjxXMHxHJCvig97vxAerAvC56bQ2M2hZhRRQ+KHkp6PlbHVn
	 k665DtxvUzqIjgw5jq5COOpoqgliTM96HwFVakUcSuRs6FG1XDHHcgXSITWBqcag8W
	 trcrkF232vpvCbxll36rkZKgIb7D6bnptaQZ65UHxJjXGtZH30xe1uAi7rqR2JHcBh
	 1YgfjQFD23AMA==
Date: Sun, 29 Sep 2024 10:44:31 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.12-rc1-additional_fixes
Message-ID: <ZvkTb8esQeCOCJ3j@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ixYYEIN7qsywhsyG"
Content-Disposition: inline


--ixYYEIN7qsywhsyG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 075dbe9f6e3c21596c5245826a4ee1f1c1676eb8:

  Merge tag 'soc-ep93xx-dt-6.12' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc (2024-09-26 12:00:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc1-additional_fixes

for you to fetch changes up to 26de8614d83f1f1a0b0b0a300e3be40a95b9a340:

  Merge tag 'i2c-host-fixes-6.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-09-27 18:57:38 +0200)

----------------------------------------------------------------
i2c-for-6.12-rc1-additional_fixes

I2C host fixes for v6.12-rc1 (from Andi)

The DesignWare driver now has the correct ENABLE-ABORT sequence,
ensuring ABORT can always be sent when needed.

In the SynQuacer controller we now check for PCLK as an optional
clock, allowing ACPI to directly provide the clock rate.

The recent KEBA driver required a dependency fix in Kconfig.

The XIIC driver now has a corrected power suspend sequence.

----------------------------------------------------------------
Ard Biesheuvel (1):
      i2c: synquacer: Deal with optional PCLK correctly

Geert Uytterhoeven (1):
      i2c: keba: I2C_KEBA should depend on KEBA_CP500

Jinjie Ruan (1):
      i2c: xiic: Fix pm_runtime_set_suspended() with runtime pm enabled

Kimriver Liu (1):
      i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled

Gerhard Engleder (1):
      (Rev.) i2c: keba: I2C_KEBA should depend on KEBA_CP500

Mika Westerberg (1):
      (Rev.) i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled

 drivers/i2c/busses/Kconfig                 |  1 +
 drivers/i2c/busses/i2c-designware-common.c | 14 +++++++++++
 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c | 38 ++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-synquacer.c         |  5 ++--
 drivers/i2c/busses/i2c-xiic.c              |  2 +-
 6 files changed, 58 insertions(+), 3 deletions(-)

--ixYYEIN7qsywhsyG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb5E24ACgkQFA3kzBSg
KbYA2g//XMI9Rcw76mDDHyiXQ/e+h4j25fD5YKIsYPTIIpa1lbDP7j6ED4G/SPMb
d28XWNFk5HWtEDi19jNDX1ldKPyc80FMKwB8GL3GkkxjFiwwnRebK13aTVm1elA5
ELUXaYbqqwUZgPZPd6+5PP0iGRQWkj9CBoVmQ/IdDK5W01x8F+2usjdxQZxg/Zpi
UECELMMK4W/WqQENuila7yYc7UOrfZjU5E+O+EUTu/tyXgjeIJKcC1tyH4vkCi8i
BWS1MxdaFEvzhgtL1z5xpau/Jia+ptz2OGdtamCNkN2LfOvWuWaYltXg9jNCuHl2
rcE86qacvDphiffo4dEsRbdjZ/qaIyUe2OfZ0HeDTAZycAe4USAipBaL0Dr8Bv9j
JRlAj9hPQcWSttNw5CtXSDxo8GecELrEPJL593t6nWOCiOzxHEY4L4pNi/Tk30GK
KXz4LgT7RIO1AAVp2GgTipltSuv/p1cZ8aDyMz8+eddTJTenz1xle15TK13S7DjZ
TVwCviR0QGxQys769OhoUm0cjxbMFkPv8cJrMlXGgxYsJQR97JIX5/SNfOGc/qXT
/JeaWP4pAP3ZupjExE3wGUdLKOvrdzbdUosvGQu2OsIX22pHyl/x/KGpPGhxb9Dc
T++l6Evzf0FMSrRDT5joJXH/TIrMRR7trH2nnlC1j80Ot1Akvc8=
=neJS
-----END PGP SIGNATURE-----

--ixYYEIN7qsywhsyG--

