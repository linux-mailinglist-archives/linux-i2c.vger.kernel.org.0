Return-Path: <linux-i2c+bounces-5471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B36955979
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2024 21:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 666A61F21DF5
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2024 19:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5A0140E37;
	Sat, 17 Aug 2024 19:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gC/nnu7M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DE7646;
	Sat, 17 Aug 2024 19:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723924702; cv=none; b=CUtrPDOm5Q1qsmGb+a3y7Qd9Q6aSWnHH92gk0m/PR7lp9kbNoLfyy3gZZGGysSVtwUegSQs6WvfGllwimwkxrs3XTZyR4QFLILs5Hpf+kdSEE40RadFn+qiUhwXD8P2WBRt9SeqD3U5QdFB2HH3YdRmTaDMUkIRZ/03pAwTp2So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723924702; c=relaxed/simple;
	bh=nsBtUaVNqz8BztyQu7LhFBI0CLrd00qX8ELuGWKRIcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9kslH9KgNjGQcZ9l3tSUGquK/oPxWX8ftGrHFLLEKlaQIXN8p2oZl2nDB8IBaPXgI29020eEz05KsOtbn8NvnKnMXMyYgLvJpymbPjGIyCSo3H/QAEeFoJIpuCgYkKUlK8oaDkRWM7Ku3BBTR+xdz4R3BQ/FWIFH8qC+wIRvGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gC/nnu7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A376AC116B1;
	Sat, 17 Aug 2024 19:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723924702;
	bh=nsBtUaVNqz8BztyQu7LhFBI0CLrd00qX8ELuGWKRIcI=;
	h=Date:From:To:Cc:Subject:From;
	b=gC/nnu7M/xCiluApsQdsGInEx2ZczEfg5MYXu87YC5268oIMrJ53FGcGaCh2Eh6ED
	 U79auSs2V1rIXI80LOVLNslgOxtOWaGFdanwMsYcZhFSLpvnT4Ug0Kr5/kwHEUJz3L
	 hroVs/r+IMss6/35vw8KB+d9yqiQhsx0OyU3cYByfXell0VU/x5mNvSnF1/1V0qJoT
	 mxkAEx9f8IwpydH834QxQ3yo43Kpt5OxRwfKDQ0mNkKN/Ec97uJd950AFm6x/XPMwG
	 0Cn/z5/mvZx6BDpcJU0hMBnneLyEIIv4ikgz3RMjlLeSDoh3sUuaCgUHpjx4pZ4HvU
	 tHJgtUMbKehow==
Date: Sat, 17 Aug 2024 21:58:18 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.11-rc4
Message-ID: <ZsEA2hE5048Dt5Vq@shikoro>
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
	protocol="application/pgp-signature"; boundary="Fqxl5XGXrXGJL2Ev"
Content-Disposition: inline


--Fqxl5XGXrXGJL2Ev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 7c626ce4bae1ac14f60076d00eafe71af30450ba:

  Linux 6.11-rc3 (2024-08-11 14:27:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-rc4

for you to fetch changes up to 87cea484951eba1d0342033241f80e49303d802c:

  Merge tag 'i2c-host-fixes-6.11-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-08-16 16:23:51 +0200)

----------------------------------------------------------------
i2c-for-6.11-rc4

I2C core needs to fix a fix from rc3 by replacing IS_ENABLED() with
IS_REACHABLE().

For host drivers, there are two fixes in this update:

Tegra I2C Controller: Addresses a potential double-locking issue
during probe. ACPI devices are not IRQ-safe when invoking runtime
suspend and resume functions, so the irq_safe flag should not be
set.

Qualcomm GENI I2C Controller: Fixes an oversight in the exit path
of the runtime_resume() function, which was missed in the
previous release.

----------------------------------------------------------------
Andi Shyti (1):
      i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume

Breno Leitao (1):
      i2c: tegra: Do not mark ACPI devices as irq safe

Richard Fitzgerald (1):
      i2c: Use IS_REACHABLE() for substituting empty ACPI functions

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.11-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: tegra: Do not mark ACPI devices as irq safe

Dmitry Osipenko (1):
      (Rev.) i2c: tegra: Do not mark ACPI devices as irq safe

Takashi Iwai (1):
      (Rev.) i2c: Use IS_REACHABLE() for substituting empty ACPI functions

 drivers/i2c/busses/i2c-qcom-geni.c | 4 +++-
 drivers/i2c/busses/i2c-tegra.c     | 4 ++--
 include/linux/i2c.h                | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

--Fqxl5XGXrXGJL2Ev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbBANoACgkQFA3kzBSg
Kba75xAAsdvJUuhdJC5axRPfKSe32Fekh5m+Psby1Rn6zWEecXDj1jXBv1+AFmhq
XprjfoURtZd0LuyF5Q9yXxeEYKJl8t6GAvtjbIY8Q89zZki8Z5tkRRqeXOCIV/FL
5wk9i6LO6kHJ7aFp7zqRYQPWcYS+sC5G53ZCU8p7lVhsZiEEASLJ4Cj26X2nIgMA
8p+X4T2noUKF0MWW0lCjU0FpxNSdl6F2oesIyezV6FDhzAWy8hKWoubgTSo5Rq0k
FfWaEpo7zo53tSQA7O5OizKubrj2PihvK9xA38o+hswGz6tjA/qfF5fZERpXrZSJ
PntFfgO3Xv3mFUqFVnttzpLEK9scd4DdmS19pdS067YLRWEsWHLT/Eh5NyJSrml8
nNF3Pv1Bc1g/5VLkZ49DfB2b4+mdWYWhuS/1wRzWqpCL1hh/8pwqcKfL34hLCEzh
PoW5qdrt0O2W1PP/43Qj8GcZ4+YVQkBQhB+y0QZ34ahIkFlMcQciVeEUnTEp7Qhe
W4jP3MdNdQI+quflcgAPquhuJuRXwEw8boZUPOkTgTfRdUuk6f0VAn0ma8iqkjLO
4Sq8RVTUHT/ghcKV7V1DW3dXH7PlKEB0uac9gSRxD95l4sqQSk8NIsqVgfuDlr3w
Ji2M/DTPIzbENlGvpECHWvcZT6qtASAbPe21cTOELjNspYpvF6U=
=kxDV
-----END PGP SIGNATURE-----

--Fqxl5XGXrXGJL2Ev--

