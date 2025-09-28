Return-Path: <linux-i2c+bounces-13269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7571BBA7657
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 20:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EECB3B83C1
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 18:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886D824DFF4;
	Sun, 28 Sep 2025 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aW7PybLs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4CA34BA24;
	Sun, 28 Sep 2025 18:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759085234; cv=none; b=Np+szGepWRncWYgZW/2gVplkl+8wCgihxRnuQEHxYIbeZxUTikIi/otNkpSeZs15p1kg5HPAyUnzQeTJ9TRtgiXz0ovyOarKrs61ZNDayP5JFMfy0ygt+V0+lwi8l5YQI+STjKoPQCxGetfU9Q9sZnlJi3g6ktV+/FV6wruF3CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759085234; c=relaxed/simple;
	bh=uJwBR3Z7bOnQ3VOMxIPlvTAZIE4kHYlVV6lMCZGK61w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYWGFUcKI7JY6g4/fF3FB977M1QZvxfH8G7x0mA4pJ26SxifzD2NYKNtP8G7UAAcRm8uSX9q5Rwof+dSNZHRQiVbs4b3RHpsTE7mVPFiLk3bse0/55BQXv3nTacsRc2ZdeSRv7a86VRym19k/UZL7GjZMxSlwBA9auFLZKTrHI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aW7PybLs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525FAC4CEF0;
	Sun, 28 Sep 2025 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759085233;
	bh=uJwBR3Z7bOnQ3VOMxIPlvTAZIE4kHYlVV6lMCZGK61w=;
	h=Date:From:To:Cc:Subject:From;
	b=aW7PybLsY/HecHuHCXXO4tKhSgQqt2jz9OlZeASsexlSnsV9RF2+f6HKuMTXyoNQ8
	 d4MPS/wag7ha45iboDgNQmanJOdk8ENINd0OoUCx/mAZlX+FntSQyKNFUYUgcKvSb3
	 o7kcJ2kzgnnlFZMTOFyK5U1BgWUvruY5nN6vfPKPmpouEv/Rmenqt61Z0hK79DwaEv
	 HU9m+gmsewt2Eoe+AQ39g8pJ4fOeg3u1gGL0hugr4uB9nGpH04VEJEHeqRsM5bp4RA
	 wfe17EW58ZAcOsFG+2x62gXIYAlE3VBTniE5+hx1qztq5Qpj2xRoCETdKsWHHJzURz
	 A86DVXiP6HNoQ==
Date: Sun, 28 Sep 2025 20:47:10 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.17-rc8
Message-ID: <aNmCrm5PXQBhTnak@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D6O0RzhHJnK/4x9z"
Content-Disposition: inline


--D6O0RzhHJnK/4x9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c:

  Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc8

for you to fetch changes up to 095530512152e6811278de9c30f170f0ac9705eb:

  i2c: rtl9300: Drop unsupported I2C_FUNC_SMBUS_I2C_BLOCK (2025-09-28 00:23:34 +0200)

----------------------------------------------------------------
i2c-for-6.17-rc8

MAINTAINERS: various updates
riic: fix an off-by-one error
k1: fix schema to allow validation
rtl9300: fix faulty merge conflict resolution

----------------------------------------------------------------
Claudiu Beznea (1):
      i2c: riic: Allow setting frequencies lower than 50KHz

Jarkko Nikula (1):
      MAINTAINERS: Remove myself as Synopsys DesignWare I2C maintainer

Mika Westerberg (1):
      MAINTAINERS: Add me as maintainer of Synopsys DesignWare I2C driver

Mukesh Kumar Savaliya (1):
      MAINTAINERS: Update email address for Qualcomm's I2C GENI maintainers

Sven Eckelmann (1):
      i2c: rtl9300: Drop unsupported I2C_FUNC_SMBUS_I2C_BLOCK

Troy Mitchell (1):
      MAINTAINERS: add entry for SpacemiT K1 I2C driver

Wolfram Sang (1):
      MAINTAINERS: delete email for Tharun Kumar P

Yixun Lan (1):
      dt-bindings: i2c: spacemit: extend and validate all properties


with much appreciated quality assurance from
----------------------------------------------------------------
Alex Elder (1):
      (Test) dt-bindings: i2c: spacemit: extend and validate all properties

Troy Mitchell (1):
      (Rev.) dt-bindings: i2c: spacemit: extend and validate all properties

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml          |  3 +++
 MAINTAINERS                                               | 15 +++++++++------
 drivers/i2c/busses/i2c-riic.c                             |  2 +-
 drivers/i2c/busses/i2c-rtl9300.c                          |  3 +--
 4 files changed, 14 insertions(+), 9 deletions(-)

--D6O0RzhHJnK/4x9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjZgq4ACgkQFA3kzBSg
KbatRA//WzEbLA14AKBMI/tUehfVxkgBDkt61bd7KQlaKKaxHma3h4YejR2hfvEr
OG1i5GxtpkXS2TiLYbMNBiUoBgYbax+6Q/u+zvcenn96yu3aoM6juyaTGuUkWqtC
V4g+vsNKKlGfXvbmrqQ89y2Q7pGpDcnvbZmrUg25ZBHmLNU2pPsTMBT7MmnI6Sg0
OdC3trxr5YYqnBuo3XKcRj1TxUZ0RnWnRZGRzH0BdU0tZCR187N4aqf4LMxVgZ0/
v6cFCa9mcTRJ9OtozLhvYSNJMbo1xBrUamBfZLpEOjb/uNY8W8YkuJm6U5rgiQwW
qEkc8vmpgWL5aNyCRwhGPiRAKOb741Suuzhy1gIncEgnsfGxAb7CmdahwgaY1NGl
Bz1gmOQvKD1Y0PUsi+ugA2yWfjpdUwZ3bw1+Boh6J/qo9M09sIvklD7DVkQPibg2
BcQKDlsVKXaPZUB2u+54yUpqqZMSIbj2tgCUHd9CHs8h5ORjqvrYosL7G19EfNhz
BmzWkC7bSZ5xpOL+7k1ZRrKw3Ve5mtJPrxezerfxemrYNUBWJpl+NLTGgEMNwDEg
zc68T+3s2suncZVYLGlFNfmfHIw7GmEcaErD3C0oRLF6gXI5+wrXfw/MFNEhT39m
KYulsZlNTV5us74pKLV2s5DPj+N+Rcc4AM/wci9CP7oKJHRN8eM=
=PaxC
-----END PGP SIGNATURE-----

--D6O0RzhHJnK/4x9z--

