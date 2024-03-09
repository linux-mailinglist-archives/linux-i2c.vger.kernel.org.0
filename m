Return-Path: <linux-i2c+bounces-2308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA887726C
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Mar 2024 18:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D81D1C211E1
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Mar 2024 17:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8B420DF1;
	Sat,  9 Mar 2024 17:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bP1M/C3s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9781C15BE;
	Sat,  9 Mar 2024 17:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710004607; cv=none; b=YDqoRzSk9Mz6hlqlelZaemLquwBD8Pa0aXq+Sdc+poA614r1D1swZsDd6KLP/ClLelWbT3dcZK7yaQw1SQIK3W3JlLLl3c0ix48HzVAA8BMtwVeEuDsC/RLx2eJ6CWkiM6Kib8BlP8wIjPKMc/WUsVJuvm4inTPOnUEfC0JZZJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710004607; c=relaxed/simple;
	bh=Gbz+cxLuyOtnA+RIxFo50o+nglcJ03qORgDy6B41CsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=plkKTY8q2FTw6+8NKKq13MgrxJeN/2wXrw2n44BpiKVohM5Xsu8viBqy8EdZ3J+auThOVbuOZhx8vLg5XYIOKWLfqJEqVEaTCUVNMmBboocMUfts3Z4nHVOm/AAbV3rznkp4vx2dqfIwgVsM6eBWhwsjo3tWsSoiJemXKzcBKho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bP1M/C3s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2C9C433C7;
	Sat,  9 Mar 2024 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710004607;
	bh=Gbz+cxLuyOtnA+RIxFo50o+nglcJ03qORgDy6B41CsE=;
	h=Date:From:To:Cc:Subject:From;
	b=bP1M/C3sr0wdbazaRUOtMJU7109XabI42RxgLXSvy/MvUBWuBTwODDn8y8GA9Tfi3
	 2VK8nyWk1SBhjoCDDgWP66w6T5Kpj1VC8d8w6RR1OiohDy6qc1e5i9wnxpR/PaGsZ0
	 twZy6zwVTXyHUFQboeGRwr41PxgDBMsWLcjC7AsDCiimEhBUYTzNKFMuomMioAY+GK
	 vv/kokUcpryQRcXpZ9u1qFiB6vTLP9rl75+9gRoVaelYd4//RmLjWASX5BKATHon1P
	 MdAV36qNW7FB5XOJjgvbxXG7S1/0d/Ky9BLuAAJlPf9u9WhjnbgdaE/7bZYgbldhv/
	 HfH3gYdW3z7Tw==
Date: Sat, 9 Mar 2024 18:16:43 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.8-rc8
Message-ID: <ZeyZe92K9AnHD1SI@shikoro>
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
	protocol="application/pgp-signature"; boundary="oTHSrGHp0gzkTZwr"
Content-Disposition: inline


--oTHSrGHp0gzkTZwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 90d35da658da8cff0d4ecbb5113f5fac9d00eb72:

  Linux 6.8-rc7 (2024-03-03 13:02:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc8

for you to fetch changes up to ac168d6770aa12ee201c7474e1361810d5fc723a:

  i2c: aspeed: Fix the dummy irq expected print (2024-03-08 10:10:27 +0100)

----------------------------------------------------------------
Two patches from Heiner for the i801 are targeting muxes
discovered while working on some other features. Essentially,
there is a reordering when adding optional slaves and proper
cleanup upon registering a mux device.

Christophe fixes the exit path in the wmt driver that was leaving
the clocks hanging, and the last fix from Tommy avoids false
error reports in IRQ.

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: wmt: Fix an error handling path in wmt_i2c_probe()

Heiner Kallweit (2):
      i2c: i801: Fix using mux_pdev before it's set
      i2c: i801: Avoid potential double call to gpiod_remove_lookup_table

Tommy Huang (1):
      i2c: aspeed: Fix the dummy irq expected print


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (2):
      (Rev.) i2c: i801: Avoid potential double call to gpiod_remove_lookup_table
      (Rev.) i2c: i801: Fix using mux_pdev before it's set

Linus Walleij (1):
      (Rev.) i2c: i801: Avoid potential double call to gpiod_remove_lookup_table

 drivers/i2c/busses/i2c-aspeed.c | 1 +
 drivers/i2c/busses/i2c-i801.c   | 6 ++++--
 drivers/i2c/busses/i2c-wmt.c    | 6 +++++-
 3 files changed, 10 insertions(+), 3 deletions(-)

--oTHSrGHp0gzkTZwr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXsmXsACgkQFA3kzBSg
KbYTgRAAqfVpsh99g6hzvKGcCEFKx/jE0E3gbowBnO9WdgFBLws6vKmr7ek/iJSg
IDac7EsdTstmtzug+ox6k0Xpxl5nSSHPZ4PWK0sWUBrIuR0UgSZ6BD1qRwD4NsYx
kHgeSbyYjmtZWPrAL3G5TNx97/Z6yRg57fCgs1vDJP1TMXFpGpwdJ6sOLA3hT+Ps
pkf7xKYNG4Eq/j36N6SnKdkNIt/RnzhMqe6LNna96smUCmE9Kb+6xV21U7GhlX/p
daL49YhNRmlRPeIfFxj9zNQsDujBl2z33DrqsvPD/DLoAUzB2lZybhmvfc0rStIZ
pTdov/V+PHns+ybp6x1UTME1TWTcSByt91TxlGCsg/LLzEnwfD8/XEHvwOfvoAoV
qpm5XeAEhlYYfklmplw8XPJJjyKreSQf2WwJe38vWyJVo/ZoE14uTxBr3ELO512V
LynZ8Y/epJQeReLqeh70Q2g8fAk8ABqu4uvcNVukVQI6uJDlTJXZfOo52/NgbLOX
Lm0NU1Vh2SJAgXHlNnWTAjU9Ivel7rypnWNqKxvwTLolQl+eop778/9ICiTyBd9t
w4BaEFVbSGmsTF3oPrDNi7m0PRUs9vKbLqQFBN9kWKez6aeh41bXt5AA4rLBowF0
0XZixS5BO3lFYUcJg7IZR7khj2mU+bbCVzvxk65NLoVQeLJIbhw=
=2wB2
-----END PGP SIGNATURE-----

--oTHSrGHp0gzkTZwr--

