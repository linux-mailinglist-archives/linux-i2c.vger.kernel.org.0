Return-Path: <linux-i2c+bounces-12391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 609EFB32F09
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 12:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AD95189AD48
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 10:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5273B272E61;
	Sun, 24 Aug 2025 10:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Km7D03JA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDB61D555;
	Sun, 24 Aug 2025 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756031807; cv=none; b=W9Mhw3zQlgDtIjeHYhmDJbsGg9SdhLon9OLsyQivcerHsA47j50Ym5BmEXMlZhg09iEmHz+CHzxsMfVmu9N0i6fsGZ93ppbXCnwQLzlTOY4Jor7VEb2CkNrqNYzTEshyCE73zbTm3rsvbstQc+cT1hjQPZCYuMi+5dGENv+0PL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756031807; c=relaxed/simple;
	bh=q07eis8daTy3KXxvN35MWdYrk0ktQhtspvcKpN/0VFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJCfjrpHXnByG5eJEBngS9jpFu80AM3x1ox8GadPPHAYJbZntJEudAa0iiS3kK+nzykmqJx+j4C3yyXAJ4p5SzlDnD2s4IFz4t2fF9KOOYyfhxBap4AfBxfBQ1QjYlclfoQqHkn1koIqgIhvawjtNhljzZjihS1lbuaN2bmUpOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Km7D03JA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E079EC4CEEB;
	Sun, 24 Aug 2025 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756031806;
	bh=q07eis8daTy3KXxvN35MWdYrk0ktQhtspvcKpN/0VFE=;
	h=Date:From:To:Cc:Subject:From;
	b=Km7D03JAwMYslBJuEo/lDNO2rMqFWRabQdYkY71GY2SCT88EIRQ8QrjzgifefoMxi
	 rBGDOCeXI0jo2Zp5boFoGDHpvDsyid1qZpjU2lQrSWtaHoKzAvPGqbIHqzcO1luVnO
	 xqUxo8m/VUaTzYXYur56hyH8KXmIZEnkQXij4s+AEGyq82ZMZzapKoSPQl9vJvarA1
	 SVSN2Im0FnS3g5pO+8l1alw/aBYNMUdfrCQUgdpykxXEi+/nWTm5s+FUljExLyjWXK
	 tzwBwlRZ0XyD3gfQy57iUSPyhPiJqArZgsGQ9q7qHUfQ4LwtYDCUJtvVBr0bzPLlsZ
	 mEFgBvqSfC4xw==
Date: Sun, 24 Aug 2025 12:36:42 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.17-rc3
Message-ID: <aKrrOlgY5fXBEG9U@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="is7TnwDJyN2IjQWK"
Content-Disposition: inline


--is7TnwDJyN2IjQWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.17-rc3

for you to fetch changes up to 3dd22078026c7cad4d4a3f32c5dc5452c7180de8:

  Merge tag 'i2c-host-fixes-6.17-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-08-23 07:57:28 +0200)

----------------------------------------------------------------
i2c-for-6.17-rc3

- hisi: update maintainership
- rtl9300: fix several issues in xfer
  - check message length boundaries
  - correct multi-byte value composition on write
  - increase polling timeout
  - fix block transfer protocol

----------------------------------------------------------------
Alex Guo (1):
      i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer

Devyn Liu (1):
      MAINTAINERS: i2c: Update i2c_hisi entry

Harshal Gohel (1):
      i2c: rtl9300: Fix multi-byte I2C write

Sven Eckelmann (2):
      i2c: rtl9300: Increase timeout for transfer polling
      i2c: rtl9300: Add missing count byte for SMBus Block Ops

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.17-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Chris Packham (8):
      (Rev.) i2c: rtl9300: Add missing count byte for SMBus Block Ops
      (Test) i2c: rtl9300: Add missing count byte for SMBus Block Ops
      (Rev.) i2c: rtl9300: Increase timeout for transfer polling
      (Test) i2c: rtl9300: Increase timeout for transfer polling
      (Rev.) i2c: rtl9300: Fix multi-byte I2C write
      (Test) i2c: rtl9300: Fix multi-byte I2C write
      (Rev.) i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer
      (Test) i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer

Wolfram Sang (1):
      (Rev.) i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer

 MAINTAINERS                      |  2 +-
 drivers/i2c/busses/i2c-rtl9300.c | 20 ++++++++++++--------
 2 files changed, 13 insertions(+), 9 deletions(-)

--is7TnwDJyN2IjQWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiq6zoACgkQFA3kzBSg
KbaD5Q/8Dtr98kwEhLdQNRjn1yEczud1jrycreqw5ZZrvDbWi3dPD8NDQpbfjTvz
zJ7sVN/tknVKmDaLRbVZm4sYsKXBKSNM5yrse/tsDPS3ovoIHq8VfN74RKdbfhWN
VRXgp284ToblODYr1E1MsFKOihMHx+CdgkHNrZf5fCRShwWfhUiX/vNf5j1st7YR
w8iIsHV/J4loi2jw1TotwVQrtYa9OUvWlxtB6FzS7iFqGSUktDlwYNWoJq1lL7MN
zJuFV8zopfo9HBWSaPGxTCq43WtzICSD2KQ10m8A6V8nRK0PWso1Ob5xoKaFmFaH
4dgl5mW099+FV869vaISxzCj604A1fA96DFMgexcT/2flzC2x4wkEezX0VRp1nh2
bTOMNyAUnQe0mubCI04MRk+t5p8+CYo+DsRmzCQv5kK4DjiE9ok+IT+g/pYGGND/
8Pl+3Ts4yz2BGAg+HC/j40taCs8MYsfBiisGF7hL0qM/PpiqpC3dfSatfY9FGST7
3a0Q6LgyEdIF+TJy2GSCPEFcFD4/Dmeva6mgI/uWCm5DcPxp52JpxUdSHc4zPa9h
qox1eXP8K08Xq+y2pvQvbQkyNPqZsbWUcdemUAdfSgMHlb5tvMRfJAvotZd9e1iW
O9Jdt5CzN1snKmykn8oKpG8QCLkOubGyscZGB8sR/j51r5LbgBs=
=R8bd
-----END PGP SIGNATURE-----

--is7TnwDJyN2IjQWK--

