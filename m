Return-Path: <linux-i2c+bounces-215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6417EFC66
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 01:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C8EE1C20929
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 00:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2B97E4;
	Sat, 18 Nov 2023 00:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GerSS6DN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E63162F
	for <linux-i2c@vger.kernel.org>; Sat, 18 Nov 2023 00:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE40FC433C8;
	Sat, 18 Nov 2023 00:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700265899;
	bh=eU7pWfXkgBvwAmZrRDoiJ4H3YjL2nwJyHUyzgk2bKag=;
	h=Date:From:To:Cc:Subject:From;
	b=GerSS6DN//mPm6zym/8Rkwr8vndxo2+k0YtJP9JCGdlvfCkx+Jp2zhUlE/fd1nJ+s
	 DaVo12Q97IMAxnCC01BnwIbFte2EqCTfdfq1CKrzdWIy3wdUjR6dytaCaRPl0kylrT
	 5mQTVKWSRnExUFU35Clq0IlbqK3b/sMkTJJpjFh9tro3heTrDW68cQjvWImsuNprv/
	 UAEqei/ku4THbf8BDrJrMdzDrviMPxL8pMBxK7dpYwA0eBv7XrUl3ZfYoSQn/DB68c
	 DyiC/Z/Adj9cn4+2NAU2MlL7g5dYctimleqQ88g2XfqGGV03IjC3cydia8piK5RMYL
	 X1xjXWrntJIhw==
Date: Fri, 17 Nov 2023 19:04:54 -0500
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.7-rc2
Message-ID: <ZVf/pqw5YcF7sldg@shikoro>
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
	protocol="application/pgp-signature"; boundary="7M+Pchu/CDK0TST7"
Content-Disposition: inline


--7M+Pchu/CDK0TST7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-rc2

for you to fetch changes up to 382561d16854a747e6df71034da08d20d6013dfe:

  i2c: ocores: Move system PM hooks to the NOIRQ phase (2023-11-13 12:43:42 -0500)

----------------------------------------------------------------
Revert a not-working conversion to generic recovery for PXA, use proper
IO accessors for designware, and use proper PM level for ocores to allow
accessing interrupt providers late.

----------------------------------------------------------------
Jan Bottorff (1):
      i2c: designware: Fix corrupted memory seen in the ISR

Robert Marko (1):
      Revert "i2c: pxa: move to generic GPIO recovery"

Samuel Holland (1):
      i2c: ocores: Move system PM hooks to the NOIRQ phase


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (1):
      (Rev.) i2c: ocores: Move system PM hooks to the NOIRQ phase

Serge Semin (2):
      (Test) i2c: designware: Fix corrupted memory seen in the ISR
      (Rev.) i2c: designware: Fix corrupted memory seen in the ISR

 drivers/i2c/busses/i2c-designware-common.c | 16 +++----
 drivers/i2c/busses/i2c-ocores.c            |  4 +-
 drivers/i2c/busses/i2c-pxa.c               | 76 ++++++++++++++++++++++++++----
 3 files changed, 78 insertions(+), 18 deletions(-)

--7M+Pchu/CDK0TST7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVX/6YACgkQFA3kzBSg
KbZKRw//RonMaoOG2/FmNtzPbHWDM3vvK+8mOh7K9enoIADkP3jyJZ9PSzT9DJTS
0j4ensmlFFXEgxp0X1FtBgzLt9Jk9X24YAjxinXbw+o7GeINqf/htFoQEUdVoP6J
62vlCbXRKuGvnoAwxrlNFYgJquWXiqr7cqX+kX06+Xwd3t2QI9QfoReYtxsfVpyc
cpQLx+miwKZYILmcxIVQo5E7EzfcsMV/TZLUd9K3hEn0YblUmceHcp8zFn3lHk9a
2IIvHYCGnsO3IZb8VlDyENL3LkEMzT5EgGfTRrZpF83kgQsh64HFNHuGEER5MZCv
sK8pz8juTyPNIeQ4KB817JnNO1dofosqfwzX00uaLEIy5NBsMoy+kq4HgEcfWJSG
lmsZes/O+DyYLxc95LBvik95er7U8Sas/yWvRYyRrwwy+SuMAQz0wgmsbq7G+M71
dcK+bb7jX6MmtU0X8OLxP9zXdPbmr86eC7d+wPuMGJLEDj7oWx7UdsQ3cQOig0A5
2twErI5QUaWW42rOGq/0fB9pO0TqAk+oLkzh7rrWXpFo7DzLs+Yqksz4quDJ/grt
wtj43QUXIlgxtMOHsAgyj1uqz3PuAL0kfAbLc1/iqTXYEDnF4XkbAtHXYcfAn9++
csWerX7ApeHj+4ZO2VNrFD37VbQ3AulYCHf3o6nIL7PGm+bX68U=
=uemA
-----END PGP SIGNATURE-----

--7M+Pchu/CDK0TST7--

