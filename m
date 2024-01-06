Return-Path: <linux-i2c+bounces-1174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED68825FA8
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 14:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4A5B1C2103A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 13:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DA87482;
	Sat,  6 Jan 2024 13:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paGwgqXz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E326F7460;
	Sat,  6 Jan 2024 13:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C1BC433C8;
	Sat,  6 Jan 2024 13:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704547453;
	bh=TlMHSqxHU37Zxw/t3TKF2WBr6mHeSCy9KXBlDmERdnk=;
	h=Date:From:To:Cc:Subject:From;
	b=paGwgqXzM6syGnihaK6y0SzCZpVqQd6fmrlC+lF4bwXikZlL+wwKFN2nSINPrk9Dz
	 iprVrFIEgOxafJ3W7yGiO38c/8qe3ktAUCvfaZQMK4IzoujltB9CnoE3M1oIx6Jc7h
	 MllwFCaAz5hTvrf9mai9FhKDKxVScIgbihkYOZLRx+Kh7MFzoq+GZq6ELDpVLQ5US2
	 xnfrXCez5laHrnsvGnGVTJL2nfcbu6LH/H8z8h637Oz3m9cj7tIbChU9kHYW5bOApq
	 u9YN8x1po9Tr09DFAw0CdPQHIhzYnNvZ5CsNRQrTRKtyytiUCS9fkzH9hrO8/+1/Ue
	 I7wvF/1VAGVug==
Date: Sat, 6 Jan 2024 14:24:10 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.7-final
Message-ID: <ZZlUemoyS-PDZc0q@ninjato>
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
	protocol="application/pgp-signature"; boundary="qO5l4UjlZX/eRPzZ"
Content-Disposition: inline


--qO5l4UjlZX/eRPzZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

this branch was tested by buildbots successfully in the last days.
Sadly, I had to rebase it a few minutes ago because I needed to fixup
the name of one author and also added a few Link:-tags for the crucial
commit here, so we have better documentation. So, no code changes, only
changes to the commit messages. Sorry for not catching this earlier!

All the best for 2024,

   Wolfram


The following changes since commit 861deac3b092f37b2c5e6871732f3e11486f7082:

  Linux 6.7-rc7 (2023-12-23 16:25:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-final

for you to fetch changes up to a3368e1186e3ce8e38f78cbca019622095b1f331:

  i2c: core: Fix atomic xfer check for non-preempt config (2024-01-06 14:10:10 +0100)

----------------------------------------------------------------
Improve the detection when to run atomic transfer handlers for kernels
with preemption disabled. This removes some false positive splats a
number of users were seeing if their driver didn't have support for
atomic transfers. Also, fix a typo in the docs while we are here.

----------------------------------------------------------------
Attreyee Mukherjee (1):
      Documentation/i2c: fix spelling error in i2c-address-translators

Benjamin Bara (1):
      i2c: core: Fix atomic xfer check for non-preempt config


with much appreciated quality assurance from
----------------------------------------------------------------
Michael Walle (1):
      (Test) i2c: core: Fix atomic xfer check for non-preempt config

Tor Vic (1):
      (Test) i2c: core: Fix atomic xfer check for non-preempt config

 Documentation/i2c/i2c-address-translators.rst | 2 +-
 drivers/i2c/i2c-core.h                        | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

--qO5l4UjlZX/eRPzZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWZVHkACgkQFA3kzBSg
KbaZWQ//Q3ygs6zzVgJpyYIXJ1XHQvqZ7oHO8CJJ88KDWOCosWKBhKdSkCZUO5TC
y9FxLSuRob8rWy9/Ps+mbSSWEVCR7tmwPcR+Mg24EfhAju6R/79DGycbCZg83aA5
CVqsVi2PZGA9reAkxIjvF4bh1A9ph0wh/2aUQkrO/Yf7DKqI0BuiYExe+woZg093
aEWs/toQba9wzfCpx8bceFSo2bp3XciVggMcyDlYl1fBjRaINQckLNnL2MdncwmO
lUQfW1AQ1Ou45Bs6l/BaFK8kVbBekuQgc7+MWMV51SN9D/xEGg93EsBaGPfEtvmA
NuopC9f/DT363vZxtdEqIei/fDMPLw5XRy6xv+otdoT+XxNvcoeZ+lUi6GkXsGTN
Ju5OrmR8CpcyGR4ARS45CCE+2Keb6nhlbX+2WU6jNh2RDzxE5k9MBWHYoELnZZzf
JMMWPGRuqX9Peo8lXRcekaVaBRHzPu2zqwA0VEh53ET5931OYj5wpDsDp1X94WQp
13Sx758jr632VSoH6Rhwqfu2EjQgJT1BFxq00KApolrFJ8uu2+6RRiiBVZfbhB7B
swp39mfXFVCVR4rVBju8MzlaflIqIbJKQb1dZBYZvBeGpdHUz0e56QhBcMjFjvvq
//PNkrHf1tPQAMR38EeoeEtd0kghSt1+hZBCL3jRcEJ6g/emrBQ=
=ar59
-----END PGP SIGNATURE-----

--qO5l4UjlZX/eRPzZ--

