Return-Path: <linux-i2c+bounces-12712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C1B47A8F
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 12:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949DE17C723
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 10:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859F325B1D2;
	Sun,  7 Sep 2025 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IE0EmkfQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429C922C339;
	Sun,  7 Sep 2025 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757242628; cv=none; b=QFgAasZ5Vor/YjUlBBQ0cfFaLWCGnI8RBRBxrNWdNwIOgSkBbG49AhQKH6kY/AslYlxrrOMytboin4/gn+IDGsMVg3TmwFn+mdNjWQRB6dS5w7nm4EJ7p4YSzlDom/UxF3+jJw5CH4vkdLJQc/Rcto9p+KqXoQnaCF8fF5yqVBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757242628; c=relaxed/simple;
	bh=0bTidbw5nA2a03ZH7VdTr5JoBhXdmwIUfnihBPnQy/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUUpiCFTAV0fzmoljtIU2QY6+3Y8wWgTy3d+Jwvtsld2LuUWI1d1I+hTcqTx7IoJPv30mBHqMlymGasGDbPJR0VbuiT9kHfIeH5Tl8YofT4tnAfNK+5ntbaLpo28pxYcTV+FGKYJ1ZmZu6eXT/LqNOE+GqeCAgSxD+wJaFF+NhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IE0EmkfQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529E9C4CEF0;
	Sun,  7 Sep 2025 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757242627;
	bh=0bTidbw5nA2a03ZH7VdTr5JoBhXdmwIUfnihBPnQy/M=;
	h=Date:From:To:Cc:Subject:From;
	b=IE0EmkfQrmvGWQuJ08DPdDPv9pPZ7nF9mAFH+AVMZBnD5Tv/rU7HRWBcb9JOT0Sd6
	 bpoGAS5tureyccfRaGXd0a0C9II2eXa8011dPsI1sgteIk1sOoy7Z71y0FlsZTyktB
	 6ygN6+59b6euPKsB22a7wQZqMrs0eI3p2/6p0z0AHcFJUt7lRPbyPZRxuXUa27IyAA
	 B0DOTIW6NMjRlEUFNkXccID1eQgji61O8Mtb096oXeYdkZrUrz5S/eDPXf6IK4Zf6g
	 ooDIQeZ3DR3s46GtzleaGVRo2/OCn5a6qPeQhKP27a2Kxn+xG1C0905/qzoHCwCS7T
	 /UtilIPEpkAQw==
Date: Sun, 7 Sep 2025 12:57:04 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.17-rc5
Message-ID: <aL1lACUHl9td3dtH@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6Cd4VSEnCDVVGApV"
Content-Disposition: inline


--6Cd4VSEnCDVVGApV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc5

for you to fetch changes up to d035b4baebfc5112b128b66cafd45d2522a9c8f1:

  Merge tag 'i2c-host-fixes-6.17-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-09-06 10:17:35 +0200)

----------------------------------------------------------------
i2c-for-6.17-rc5

- i801: drop superfluous WDT entry for Birch
- rtl9300:
  - fix channel number check in probe
  - check data length boundaries in xfer
  - drop broken SMBus quick operation

----------------------------------------------------------------
Chiasheng Lee (1):
      i2c: i801: Hide Intel Birch Stream SoC TCO WDT

Jonas Jelonek (3):
      i2c: rtl9300: fix channel number bound check
      i2c: rtl9300: ensure data length is within supported range
      i2c: rtl9300: remove broken SMBus Quick operation support

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.17-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Chris Packham (6):
      (Rev.) i2c: rtl9300: remove broken SMBus Quick operation support
      (Test) i2c: rtl9300: remove broken SMBus Quick operation support
      (Rev.) i2c: rtl9300: ensure data length is within supported range
      (Test) i2c: rtl9300: ensure data length is within supported range
      (Rev.) i2c: rtl9300: fix channel number bound check
      (Test) i2c: rtl9300: fix channel number bound check

Jarkko Nikula (1):
      (Rev.) i2c: i801: Hide Intel Birch Stream SoC TCO WDT

Markus Stockhausen (3):
      (Test) i2c: rtl9300: remove broken SMBus Quick operation support
      (Test) i2c: rtl9300: ensure data length is within supported range
      (Test) i2c: rtl9300: fix channel number bound check

Mika Westerberg (1):
      (Rev.) i2c: i801: Hide Intel Birch Stream SoC TCO WDT

Sven Eckelmann (3):
      (Test) i2c: rtl9300: remove broken SMBus Quick operation support
      (Test) i2c: rtl9300: ensure data length is within supported range
      (Test) i2c: rtl9300: fix channel number bound check

 drivers/i2c/busses/i2c-i801.c    |  2 +-
 drivers/i2c/busses/i2c-rtl9300.c | 22 ++++++++--------------
 2 files changed, 9 insertions(+), 15 deletions(-)

--6Cd4VSEnCDVVGApV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmi9ZP8ACgkQFA3kzBSg
KbZ7qBAAmrpi2bptRxtJzobl22uShR5zzlRjg4qUUeaoEq+qkkudXrd8e7wxkDY9
auM8e7QbhprNSroUKAhkQWEv/g/GCMd57kTJAylCGXKGPCmtT94Ru8z65WuhVfYb
xz00qrMj5Gws9d9mAeSCFwGUuU0bG3rFGr9SWLuEoq6KN68o/Iq+mvyukTn4BQ5k
k7NBF58QlbMbxaN7b7MGM8aJ0HFQNFMGH+smmQocRP9HJYiA6yOf2eOM+IZV/Jy4
XvBcxg5POj31Wne+w8gJPq9k4yUUqHQ6jV/CdukOp+EIEc2IZ69V5gJVN3/24KrY
pa37KP6BeUSkIOY2kD/pyFf44yUWohh5xrIabzUuUkLej/foz2hAmFa0NVacEItx
VdlW+nXzUfnE5wM8ElPIS+Zby9NT/w7c53aZ67lCDZwueDtGOI78Do6+prvSZO6N
OpqurDMu7q/Sk1hQzd2jIv3DKWWws9ieaGGHCcfWoQCIAmDzE+vflVU0yEkm1xk3
NlQWyzxl48Et0F+Ly3uIBEUu5eDCw27P6tz+pcKBqJw7vxRUDdAZOIr/VrvoXbuM
CYW8ea/Usjl+7jbU756jQLEoiX4sjwYj+sKnABxLM9T2xILE/AJR1uqLiEeng2n7
L0xam5E5NyR/9YdZF1iQ1lp0lvUznp5sQo6+2H5gbcGyfGT7X6A=
=xF4z
-----END PGP SIGNATURE-----

--6Cd4VSEnCDVVGApV--

