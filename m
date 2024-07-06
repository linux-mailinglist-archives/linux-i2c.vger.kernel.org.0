Return-Path: <linux-i2c+bounces-4729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B99293BD
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 15:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48A72B21D98
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F60D61FCE;
	Sat,  6 Jul 2024 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auu5pH2j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998520310;
	Sat,  6 Jul 2024 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720272008; cv=none; b=DDF0JLTBDr3nK3GPQhA/+VXYwlyimn/G38trcxsVUG5brD4hIVfXcwnwEnS54NJ3VA74qS7Bwtek9hLx7megtp29L0lBIim+8TEavhN6fwe6HrPTPfGZ2vA+AOf/TLjXsDaMGw+zI+Gi1JGDMfamD7/eUEkUl2amt1VRmwCzFmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720272008; c=relaxed/simple;
	bh=00wVXN6YqZ9RBRgNtXKe7jf8xE6Yk1q+OFE7F8SzS/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ovo34QCw+rtcgmoYwb/tjDKy+aw7cXh4wAOTT4hW1rO7mayfUq5Ewol5oel9QGWib6WjvmCC6Cmsi5qMVB7q7YNssaoBtlrLWELb8XgMEy1VtILGu62n7MQ/LFHCMn2Pz22BOXwo0HCS6L/mONXF78Ng3s7RCCXHJgXBLpaHJ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auu5pH2j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD01C2BD10;
	Sat,  6 Jul 2024 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720272007;
	bh=00wVXN6YqZ9RBRgNtXKe7jf8xE6Yk1q+OFE7F8SzS/E=;
	h=Date:From:To:Cc:Subject:From;
	b=auu5pH2j+VLw3CSQ5KtkOaoHMVt9jaMp3mM+CNsDPd+aWDFK2WV1PQUM7RinsRB13
	 xLpPUjg/yD5VZT0QfnkR7cZtEDPd0tDdQFGIBfrrbHk9tTX9FbPkJg2SRrLtMathlO
	 LWJw+lMQjCqtjf64/7vQfMkiZHFvfhMzNoBdkJ676ryfdfKRpYfCtPz7AdC7XWaxxe
	 2DSIXaGjpaBmhD2mFOkuG44W6V9/NBXR5fUo/fLMTvdjtcuFbwxovBFW42h2Kt9+zT
	 KocV7H9g24Sj91HSb2jRO8sZNvq/o2/tioNaKPDI/VDlOO69dobH/sRhGc3nSuREYq
	 SQljuWyxS9JCw==
Date: Sat, 6 Jul 2024 15:20:02 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.10-rc7
Message-ID: <ZolEgp8R-JPRLYDB@shikoro>
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
	protocol="application/pgp-signature"; boundary="w4BAlaxAov1f3nQ1"
Content-Disposition: inline


--w4BAlaxAov1f3nQ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc7

for you to fetch changes up to b46803320c6ee2251de72d68f576a41aadbba17d:

  Merge tag 'i2c-host-fixes-6.10-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-07-05 16:08:55 +0200)

----------------------------------------------------------------
Passing through an I2C driver fix

----------------------------------------------------------------
Piotr Wojtaszczyk (1):
      i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.10-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

 drivers/i2c/busses/i2c-pnx.c | 48 +++++++++-----------------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

--w4BAlaxAov1f3nQ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaJRIEACgkQFA3kzBSg
KbYdgQ//dTOrvDZKsPtk3r/imD65FyPOZKX+rIPiuHBJLLVjnwTaJaqM+kUd6061
PZqwNhPQVD6/9AuiGRw6NtSIhfnUKHimI2wUFX1twOY2issqYckT3jjqZ6iQHENP
fsP1C3HQN/qLBtdwwOYX72AIQJWkgfipUWr1guk45B+vbOGd4LDgJBlGnoyDzeHI
tlH0sLf7TTW5CttzPssPLOJZlJtJ2F6zUSbiGSWJqGdJ5WMZdEe4xQmUH28f5Tx9
T5A2TbSidx7+dCuKMxSBGYtS+2vOUsVApgQN04NzhJ20JXWTuF/BWIFSHSyatzex
skamGlazj93ECz+3KshH3sZyMO57h+FVf3aorSPwV7HYNA4gwtbG4nyYEXBFFc+F
SXfux7u9pYsXqKMEPsa7NqRhKhXhAityFvAPNKQXWwXiTeuVijRXpjDzF2BWxoLx
3vXev9BdnCHtJr5TE5ULwdG5owMbs4/aKYcz3v+j7ApIgS/i9kTPYqga6of5E4eG
LPaC/hipDYK+uLRM8BQcThOLcg73wFSq8OTf8EMx3EEevZPsycL9GJ3qjsKw9lJy
zyKy+xniwq7n0exkfwLS2ocCy9LUIFHwyFZyf/OgXG+bJquamxEQxJykLaDyY24V
3hCD6jnz4/N7ND2ZdV5wIFPxdMpiaZkBaIAuaXN3KByyhCniwWY=
=USBK
-----END PGP SIGNATURE-----

--w4BAlaxAov1f3nQ1--

