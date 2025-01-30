Return-Path: <linux-i2c+bounces-9242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871EA236DE
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 22:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0FFA188678F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 21:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E581F131F;
	Thu, 30 Jan 2025 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3YV97O/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70B3B19A;
	Thu, 30 Jan 2025 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738273141; cv=none; b=LfGhOirnzRLscUvGqa1dOv8R0i5FCtfiMjuc8JcOoHJfwjTcPMcTw3qbWgYovAphvcJiCBEzOLSIccRe/vEfEm2kiUIzX5EoJ5beZM0t/a5c9lisAqdZ0Cejm2FoEoaO4riiPpvYmWsOxKw7iw0sBDgiBbuaaXYYGLj5rM/fdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738273141; c=relaxed/simple;
	bh=wc1tNpgJLpWggi8IlWrXWtLJ3zyOJ2kgWlb9ikLJCkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iIa0FOkfMUcaHZTkVej5GCrMbudqx6mgPMswI/A9RNKD1nIyeBC4yf4G+3+77dLQ9r4KqwJZjGIc5T3tf9qxUUnNiz2SVJnEWtpHWncmyyb4e1lQsDfcCf/I2zOIrHVwDcnF8Dw69BAuSAlSOXp8rm1sl66quGEYFH0+h+kAceQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3YV97O/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E44C4CED2;
	Thu, 30 Jan 2025 21:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738273141;
	bh=wc1tNpgJLpWggi8IlWrXWtLJ3zyOJ2kgWlb9ikLJCkQ=;
	h=Date:From:To:Cc:Subject:From;
	b=H3YV97O/LI6VBnVCz3iJJmvAzI9DBWVVLMbxwfLWaeRx+mi06tZzfvHD5AKpZytbX
	 XOzBntCV2NFiUI8AjymcPB/cjal1E0g18/C8T8+f20HWhe2ox3rPxPZc1BatWKfjZ8
	 54Lf12ohjWc5k2yCpwg3HitMQ0msqrpLcWeFkhZa+GkGWJ2gTdrIJfDEASMlq7XzCL
	 FyDt5AURSoqR41EvIvyiuy/4r4OV7fTu+YI+zX9vEBNQtDxR7/eKIQiUMt1MtxRiUt
	 DMOwZvnC3od1B3hip03FiFBM1eR5Pm5a89Ih/jEDMGOEGQ1rWCR7hCe/RLhgi4a9iu
	 Ys99BRrLacqZA==
Date: Thu, 30 Jan 2025 22:38:57 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.14-rc1-take2
Message-ID: <Z5vxcfD8RPYzfsCe@shikoro>
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
	protocol="application/pgp-signature"; boundary="sAwcvmC92/QKl4eh"
Content-Disposition: inline


--sAwcvmC92/QKl4eh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit d0d106a2bd21499901299160744e5fe9f4c83ddb:

  Merge tag 'bpf-next-6.14' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next (2025-01-23 08:04:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc1-take2

for you to fetch changes up to 6250ebe666e425e173df5e11e8a612d57921f48d:

  i2c: Fix core-managed per-client debugfs handling (2025-01-26 12:03:54 +0100)

----------------------------------------------------------------
i2c-for-6.14-rc1-take2

Fixes two issues introduced with the first pull request:

- add a missing Kconfig dependency for imx-lpi2c
- in the core, handle the new per-client debugfs directory during
  probe/remove, not during {un}register

----------------------------------------------------------------
Arnd Bergmann (1):
      i2c: imx-lpi2c: select CONFIG_I2C_SLAVE

Guenter Roeck (1):
      i2c: Fix core-managed per-client debugfs handling

 drivers/i2c/busses/Kconfig  | 1 +
 drivers/i2c/i2c-core-base.c | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

--sAwcvmC92/QKl4eh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeb8XEACgkQFA3kzBSg
Kbaz3hAAh0agosSwngsRzx8DViqXvFPzkOTAWe8vuu1AyxmRRVCsrFdiMcP1OUfY
qHdTZs6DuAlTMIcXsVk7JtdHT211glrL9tUfZUGgQAjt90IYcIUfZbshuu0543tN
uoJgAqmSbah1he0bay96iYxU95sDqadfuVekyJL+vOs1EYscIwo6YVDusl5rJpNI
jzsVsOvpH/DQIBAupmMDolDevBSP39HXDUKy8Apiabug+mQrEfVCvBhDAc3cTORb
oqjh0oyTueNVdbYjs5DslZJYDq5TW9MWmuNdUofQ4RaXsLbf1zPghFg0oxh90bag
MmdA1yyQsacRgwWxoNTjJCEbed+TwBTbo02NbSIncO3btZr85vx3Zo24j/z8Li7d
hJuOJ1D26Mz3QtBSj7FxI21Aa1uwUeJ0xalPFrY/kyC43IugReYOjZpFI2V+h7Vb
0JAhi+M5P5nxk5GwyhbzNlGIGgAUqTvaurf+lVC4i8Wfd4v7yophFpnkjDaHQTxA
lJXfkeOEqkhrXssxtk/3fKT39H43F89QEJgPlcY86yUUtM6FZ6cIYy8NuaeEWf28
5jySxjsQ7qnlEtpoZYwLz1/eH9Mm5ywgCW501vDgc5hIGBReE1vGVkhsueLSjBXw
MzdsM/vGqZTn72CkqJ8cPUm2jPHsl8FuQapUxI20fGxjf475wQE=
=FVV+
-----END PGP SIGNATURE-----

--sAwcvmC92/QKl4eh--

