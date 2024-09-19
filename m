Return-Path: <linux-i2c+bounces-6866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D497C722
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 11:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C5F71F2382A
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 09:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF362199389;
	Thu, 19 Sep 2024 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9bb98nG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37031DA23;
	Thu, 19 Sep 2024 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726738300; cv=none; b=aT2WOfcLRpM/41hMV0XNN+nsR1WpJUBYZujFYdlw+1FGrQyzMPaWQV/zlJGzbwFCR6u+MFVBT4VBzY385xkNDrmF2RBH9BTV7SqMGT7W0afziwjLcPBQ/B+Jwa34JwsOrqTHYpWS8hM37tFHxTl9vl8hWqRN+fHkbl/Pigoi53c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726738300; c=relaxed/simple;
	bh=Vn6J6AI434FtwrwKdYgEf25rwvP7VugwRdrFZznXxKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pk8I0SAApOiZNLCJIA0fYwEJ2uXx3tYKTAetTdWH0jlZIRdd05bj7oh74zg6Dgrd5s4t2yr4PpVjhZnCyzKQoYPKomRr7SPlihs9eL8ZZd6rGzgU4ZelDrgqZR6yN2+YrxSKaofaJNGUaudblTP+1EqBbEh+Bclxt9FdG7XwT6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9bb98nG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88ED1C4CEC4;
	Thu, 19 Sep 2024 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726738300;
	bh=Vn6J6AI434FtwrwKdYgEf25rwvP7VugwRdrFZznXxKQ=;
	h=Date:From:To:Cc:Subject:From;
	b=f9bb98nGGQVMMKr0OePZRGoI3EtaaUD2FMl1ZH3/arLzhdrhGYnQ5ZDb4FNmG0CCT
	 4Ol7fi7kev4spRVvRDC1zMxj9h/lMHkFPQDvfM2NHBHeGNV08U47qrnubiPe3cXpNr
	 RRaEjFCYv3FyWU877rOhZZlYIDfZvzrymE8g34ukMawg/4kaDJm4whA0/FUNwda8lh
	 i0guD7iKfN49F6Fp0QoqGq1w12kTkX19cBZV/dzOSYeZwTmsZDALC+z7LGEkCN9Kl5
	 Ut2B7E22zxG2SsoHeH1ywIUtM19rVZrdXcB77n+cE5BMFCWiWG7Vy0tAjY7k10MB85
	 M6bvqo4RJLYtQ==
Date: Thu, 19 Sep 2024 11:31:35 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.11-final-but-missed-it
Message-ID: <Zuvvd4kJRv8XGQPT@shikoro>
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
	protocol="application/pgp-signature"; boundary="1hPKzSjkPqTv1RD6"
Content-Disposition: inline


--1hPKzSjkPqTv1RD6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b63:

  Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-final-but-missed-it

for you to fetch changes up to e03ad65cea610b24c6991aebf432d5c6824cd002:

  Merge tag 'i2c-host-fixes-6.11-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-09-16 14:06:04 +0200)

----------------------------------------------------------------
i2c-for-6.11-final-but-missed-it

These are only fixes originally meant for 6.11 final. Because of serious
travel problems, I could not send them in time and so this is my first
PR for 6.12.

The Aspeed driver tracks the controller's state (stop, pending,
start, etc.). Previously, when the stop command was sent, the
state was not updated. The fix in this pull request ensures the
driver's state is aligned with the device status.

The Intel SCH driver receives a new look, and among the cleanups,
there is a fix where, due to an oversight, an if/else statement
was missing the else, causing it to move forward instead of
exiting the function in case of an error.

The Qualcomm GENI I2C driver adds the IRQF_NO_AUTOEN flag to the
IRQ setup to prevent unwanted interrupts during probe.

The Xilinx XPS controller fixes TX FIFO handling to avoid missed
NAKs. Another fix ensures the controller is reinitialized when
the bus appears busy.

----------------------------------------------------------------
Andy Shevchenko (1):
      i2c: isch: Add missed 'else'

Jinjie Ruan (1):
      i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()

Robert Hancock (2):
      i2c: xiic: Wait for TX empty to avoid missed TX NAKs
      i2c: xiic: Try re-initialization on bus busy timeout

Tommy Huang (1):
      i2c: aspeed: Update the stop sw state when the bus recovery occurs

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.11-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Manikanta Guntupalli (2):
      (Rev.) i2c: xiic: Try re-initialization on bus busy timeout
      (Rev.) i2c: xiic: Wait for TX empty to avoid missed TX NAKs

Vladimir Zapolskiy (1):
      (Rev.) i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()

 drivers/i2c/busses/i2c-aspeed.c    | 16 +++++-----
 drivers/i2c/busses/i2c-isch.c      |  3 +-
 drivers/i2c/busses/i2c-qcom-geni.c |  4 +--
 drivers/i2c/busses/i2c-xiic.c      | 60 ++++++++++++++++++++++----------------
 4 files changed, 45 insertions(+), 38 deletions(-)

--1hPKzSjkPqTv1RD6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbr73cACgkQFA3kzBSg
KbZeCw/+MxNvxS23CC3geCrlDklBymA1G+kvwpBtqwMumCjvTQQsGxNjUcKVYKPR
LgyVdubPsT1gtlX8vL28AyyDeK147tTj5K4Q2WP47TdJnOitAuQUO9gronzJ3q5M
2J38ueOyFpcsEFOKBWeo+CWu6VWX3vivWuBtpKLwT+ajM5uU+H9Mb/MWmPAK9zdw
lBJI+81/us2qZ0CYJTrr5VJ4uXaC7KetTWPFGbN9XQ1rG84FgKqyr/11SaI/Hg/V
7cjkJcNtJ+ELzaLd+cNtc4pgXSPwwMq9Ffgq6jr3IDih/4BiDvZhzHaASigyP/u2
nKt04o99wxmIHYtjUeIBs8NBROPdvm70shsHbJS2Ft0ZIW6FH5Ezi9/Wu4IfMfRr
xqseLN1o5j2Si5h4Tr6Wr69somKqUXmg+Qb/gofVtnQ6G+2+vSkqRWp9joHGA3E3
AbWf5UK/jRhhzE8NyiG4TbRg1DAN+kQiffjJPzxK3PEdEd6kbwTQsIxDJwdMf09d
5G03QdMhwUlFMoE1N1Eh5B0eafGrJtPtcvJffstbiDRmjLfBJ1+mP4DHbMcauAUA
Sw10VarZylqT32j1yLQWJq1DPb2G8bSqxu5A+D3oyo+1gd78BWicMOMAj8QdAD/M
vit3YH1bLiI2up6UNfetrEWmABJaFbYKgZawzKoH0WxXtb97LTU=
=8hRB
-----END PGP SIGNATURE-----

--1hPKzSjkPqTv1RD6--

