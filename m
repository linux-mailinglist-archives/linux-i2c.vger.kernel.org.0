Return-Path: <linux-i2c+bounces-11977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B9B0B796
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jul 2025 20:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B74881895DC4
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jul 2025 18:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46BA221F20;
	Sun, 20 Jul 2025 18:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0wwwGmG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7179D221DAC;
	Sun, 20 Jul 2025 18:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753035043; cv=none; b=HJplEpQd4BGA2RnxVntH/zpot/rMBuwf+cFWMyH6NKaXrockB82c4joKqmRB4Y6huC/84jwH53l8XpM7Bvh3dmjsfvpdl7NBshSJ8OH5bO/0WLCEJ0t9OUnBNpMpRbrW/dXiPrem97tfisw3KMsrsgAddPFR/D6WGqY9e9JeQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753035043; c=relaxed/simple;
	bh=P+luYzC2dcfctjyQIlw5xneVeK/BoyN1PEwtW+8VHzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INTJvXFo3CNhyJqmWy34XUM94yre3PmFdVD5Mg1lKk1qb6LNBQEZI2ZuR6KivuNNXusc43++Wy1dhgNKdtecneE1jJqtggM1ihWf07KztnImYO90JVdrdu3gZXxvhxlHC+jpX8z3IYT/al9vc07rW4v6Bm05RDpHDCGu9K6C2IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0wwwGmG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A406C4CEE7;
	Sun, 20 Jul 2025 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753035043;
	bh=P+luYzC2dcfctjyQIlw5xneVeK/BoyN1PEwtW+8VHzg=;
	h=Date:From:To:Cc:Subject:From;
	b=k0wwwGmGWxMeDcIc4UXX8W8coODGSFf/+LKCBAaJnBIlAmreQFDHvzumDvGT8V341
	 mDmZrFpY/xoAygh56JCeyPAcFG0lU2Ao6goCnGZb8n9vUGRHIv7x+lt9+rY0M0ZjNb
	 fRimT9HTJgk8q5kYw2BH0gdzZ2P/6qKTGAzrh77a5zU7HvdPtOEsV9PpIfE8gUhKXx
	 eb/PhAa14K6Z85dSEEnSf9wufX++hnLknaPdUcYhblp4pkunWONVmjxHRuPpY4+DtV
	 pZtbG/EVtzPgucLl1n31M7DIbODZ0Y8On/P1ZUDwiqxA9GSyBQHhO8kD++p6mxKaS0
	 oqUXc2/WcrkDg==
Date: Sun, 20 Jul 2025 20:10:39 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.16-rc7
Message-ID: <aH0xH_gZRIVQurDP@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GCx5R8UtXrHlobKT"
Content-Disposition: inline


--GCx5R8UtXrHlobKT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit d7b8f8e20813f0179d8ef519541a3527e7661d3a:

  Linux 6.16-rc5 (2025-07-06 14:10:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.16-rc7

for you to fetch changes up to a8780906ca2604c9d5128507e34285043b943410:

  Merge tag 'i2c-host-fixes-6.16-rc6' of git://git.kernel.org/pub/scm/linux=
/kernel/git/andi.shyti/linux into i2c/for-current (2025-07-14 09:02:25 +020=
0)

----------------------------------------------------------------
i2c-for-6.16-rc7

omap: add missing error check and fix PM disable in probe error
path.

stm32: unmap DMA buffer on transfer failure and use correct
device when mapping and unmapping during transfers.

----------------------------------------------------------------
Christophe JAILLET (2):
      i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe()
      i2c: omap: Fix an error handling path in omap_i2c_probe()

Cl=C3=A9ment Le Goffic (2):
      i2c: stm32: fix the device used for the DMA map
      i2c: stm32f7: unmap DMA mapped buffer

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.16-rc6' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/andi.shyti/linux into i2c/for-current

 drivers/i2c/busses/i2c-omap.c    |  7 +++++--
 drivers/i2c/busses/i2c-stm32.c   |  8 +++-----
 drivers/i2c/busses/i2c-stm32f7.c | 24 +++++++++---------------
 3 files changed, 17 insertions(+), 22 deletions(-)

--GCx5R8UtXrHlobKT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmh9MR8ACgkQFA3kzBSg
KbYSuxAAozrdjF/cO1gpltJ00fcncHGSi4WDiEnxmaBcF9S/rajRWIKdhI26nnyS
ermHqDEEjelQChBkHcgnkpwjF/Hn5SB8qrc2dWwS54Rtf+d8XUtXNb6aFaZzPSio
NA4RDCtuzdJup8tEN0wSpLrN2sDYawP+EKo6txFmID4idoY7NJYPksIRyG7pdgsQ
4CpoJzQ4Wx+j8wRb1UJjZkIbRHHMF0kgOSf2wxmoofehd30xGEm/GkiYnR1n5nmY
Yzk2thgFNUSbk6IqrqHBd7m8tQdchmX2TpdZwoxfoZe6gXrSoqIJVsGi019A0Ytl
i9Pi6yjlnKz6ISm/xuuvueyJ3Ryxm9rDs6erpYR5m+hsvpBoAOBN+DKYMUQhFbNC
AI0CcG/jLWfT0MFQq3dyNmHRDtUPdQt7UNEu/La43kMkGVsc1PEp71QAoXGtEIi2
ZdcLLgX4KJ7Mi0gk7eCvpLNcjygUl3JlexT5++RdinimaMjqes8MkOPbT2uYK6cY
MYPYIIHVNtKnGeIm3PWTCuJQSPRNWpV6nhwgUiSOvsJUfmmGTV0DwLTPzahoWXCP
LNuqkTMlJc6cF9Yqa1IiyDhVvdwY9j6q5XM0Xq2cp4dNolgDjLVoMEQI2jq2NBFb
A//6wkkorCEMFHP2VN4g9/Arxp9EcTVfyoJWWp1V/eLGgxEELjk=
=b+g/
-----END PGP SIGNATURE-----

--GCx5R8UtXrHlobKT--

