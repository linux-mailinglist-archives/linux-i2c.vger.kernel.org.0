Return-Path: <linux-i2c+bounces-9538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F1DA40EC3
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Feb 2025 13:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 864C91897D32
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Feb 2025 12:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6191B204F66;
	Sun, 23 Feb 2025 12:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIAypmjN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59C1C860A;
	Sun, 23 Feb 2025 12:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740312448; cv=none; b=FYnnxTnc5DBrEpgxPQ8mVGRJXdLgvy13Ha+zSM3RvTqk0E8f/zd3etUnUCHsO7oYWu2h5J3l7q82qYb4hRcQnyJRF1qSo6LPocqHh6lpJxyYgJxwjxIfU09fnGAjgVeADSGJ5LJ/aY4+Np/oxmlcOPtZ7AsNxko/1VMxzP+KDzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740312448; c=relaxed/simple;
	bh=Sm+mRekMzUNTulNeP4v+I6Npn9Dw9WcZsjSEZZcv2EE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EfCHO8WNSTm4AZlHglyHuE50RSo+leh0QK00YZ8CshsFuee0c8MYgCUaDgfnOoqvSDskb8BHi5AsUMB/c3oUe2FuXVsbLe1LmGXegJgGu0ZHSfTVkY0w4BWiZxwRoAbDi8/smr/ymF3EErdJkWxdmi4dqUGppIq/fh1mdSCiK/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIAypmjN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A92C4CEDD;
	Sun, 23 Feb 2025 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740312447;
	bh=Sm+mRekMzUNTulNeP4v+I6Npn9Dw9WcZsjSEZZcv2EE=;
	h=Date:From:To:Cc:Subject:From;
	b=vIAypmjN5R1Ttb3QZypNq3IyIMO7V+xSVdpwOq+igljr2/oJWSkBTlSvKLGfvgJ1j
	 lSG0XTgOGKGt3zWSNyJN+0Q6xNm5Y0NbBaAmW6/qeIs3rovziU67t+F4KoRg1ttkDH
	 gokwJfoxvYWqZXh27V/I95uhgo3oQOwnx29VsXDhcyXXDWh54aMCUvMkWCR2JcIQ7c
	 hUriy7nIbubcUCswPrL+CGL23yWQhZA1C7m0Ky9yOuZbGyJ/ojPUTDcj0v6P1Hgbs8
	 +JtTetjXRlDayMzMvA1q3+Fwtuns6u91PH5seeUCLvH/qA/BG6V5pNSwkRI5HrO3qi
	 n2uXKDPYDzkoA==
Date: Sun, 23 Feb 2025 13:07:24 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.14-rc4
Message-ID: <Z7sPfKmfDJzXOPrs@shikoro>
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
	protocol="application/pgp-signature"; boundary="U0vdQbNUIwWVkzvD"
Content-Disposition: inline


--U0vdQbNUIwWVkzvD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc4

for you to fetch changes up to 781813db7909d945c33d3b035822225f3598774d:

  i2c: core: Allocate temporary client dynamically (2025-02-22 10:27:37 +0100)

----------------------------------------------------------------
i2c-for-6.14-rc4

Revert one cleanup which turned out to eat too much stack space

----------------------------------------------------------------
Geert Uytterhoeven (1):
      i2c: core: Allocate temporary client dynamically


with much appreciated quality assurance from
----------------------------------------------------------------
Guenter Roeck (1):
      (Rev.) i2c: core: Allocate temporary client dynamically

Su Hui (1):
      (Rev.) i2c: core: Allocate temporary client dynamically

 drivers/i2c/i2c-core-base.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

--U0vdQbNUIwWVkzvD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAme7D3sACgkQFA3kzBSg
KbYXkA//UAVOW6SZfLaTuqt9jMkq1mINn8pM454BD4AQBJi4/Z9zoh7EWSnuZUK1
yZtsScp1Qv7lN2QmcSih8ttAd7ASRduHAqgQ9mN8I0k4pbQBV9l+2AXCyisjQA8Y
oCQOVDSAkk9OXUTHNKb8UqnIyQ/RsBoQlGBf72Re70ZAA/5HygsN9wrnZ9DBjQgT
C2mqYsfO2dwYCzGUU5yHc2AGaKpHAM1u9QzHZzmdNrXeYMnDgTgvA2LhzBOjbOKe
fqDfP4gRyU4MZIAKLousWZFC5ziOOQY+fpmAOMuQHWSkMNqs0Pj63KJeWjZyS0j/
4ig2FnviIKKx7ZJKSdQcg3QR/VWX6bEfP7x7tLKHEzDMA4oWqEmjrdedLWYDBwDB
z+tb3FaYoHl3OB1GO58SIccO8SMQwof2hdbdyht2ohxtQ6jf08m7YExi3iBXB6FW
6iiEZTeZmVsnu9HncQN9vPdK7KNUcyJ9LKh/vcE7EHGl8e4pUK8N8pilSXmGDB0g
IiPmbIKJnzgpGcjvL5CbYFeBUtIYXQsVoGBrQDu1oGQ63v12sjRqIvibUuH/ESy2
RRa1R1aa3+9iJyZnMsLnaPVS+/J/TEQ1GtYuksashkg9X42KMP/pMpNoW2+/NLF5
SQ8f69+4SIVGJ/ZbeGk4h6LLXCdW5c4HqebLgH61oL80vTx40kY=
=WuEZ
-----END PGP SIGNATURE-----

--U0vdQbNUIwWVkzvD--

