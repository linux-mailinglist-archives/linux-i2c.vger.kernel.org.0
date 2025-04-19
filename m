Return-Path: <linux-i2c+bounces-10496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9443DA9456F
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 22:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D8418907E2
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 20:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B321DE8BF;
	Sat, 19 Apr 2025 20:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+SzztX3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D513C3F2;
	Sat, 19 Apr 2025 20:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745095662; cv=none; b=d7ymr+cE9zAzJfvMSyZebq97Si+oy8UTADiTEguxqoOIMIkPdbbTr4D1Huf4UvF3yNJLmAZnDaq42W9x6nDj+ic+VWAGZtrHbmv35eRCUbldLyGOgzVQXuux6A74jxiaCakSkIKLjCQ9sqWF5+PzKwfU30l598i4phtBcgBq6Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745095662; c=relaxed/simple;
	bh=L7wbbmUudesySBzYWEN17MSY5fsw9GvTv1EHU1kWjyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7pagJrsCyu71zAGDasWrKZV72Ld8oubiKUSa4bSmd9v12tiCu66xyWiRYeUpXFqQZa4erKznuEZFTvnl+Oe35pzTiKSjWmmzcfNQgVoHhc/qyw23huJGYdWmIi2RUk0GZfp1wcnyhorl4FB+z8h34OiJLjdhVoB7+O9bQ0vV50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+SzztX3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E8DC4CEE7;
	Sat, 19 Apr 2025 20:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745095661;
	bh=L7wbbmUudesySBzYWEN17MSY5fsw9GvTv1EHU1kWjyg=;
	h=Date:From:To:Cc:Subject:From;
	b=k+SzztX3YTfIkuIRFy1QeoRT/Xmib911FQwXiMJU31QpWqElpb4NypnVvzSEiBtOn
	 PGMGu1Zq/19VQBnXhehfhMRLaFW1Gj8jScyC0H7a7d/a6EFSGNFPCHPF7iTp8r9kdI
	 z+3V9zIoSQz/VNYqr3H8bG7ylJXrQRcdslEIm17xqpY34T4FTbyOap1zpgKiERlf7s
	 Z81xy05s1AjUnu7mTm/ao533M+ch3RM3bjZGkOou/4yhjUVxnQ53E9EA/mizQMOgkb
	 m+dE4G33dkvIEhPPsqYTyDQuaMfS2XbL73awC7K8ztZmFhiDAxSLHwOQaFLg347CY/
	 04XfpKamyxBUw==
Date: Sat, 19 Apr 2025 22:47:38 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.15-rc3
Message-ID: <aAQL6l45c77VG4Vv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YitJUgNAYnWmcv5l"
Content-Disposition: inline


--YitJUgNAYnWmcv5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc3

for you to fetch changes up to 24aaced72a686fb1dd8c3477987e1eaad76230a2:

  Merge tag 'i2c-host-fixes-6.15-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-04-18 23:42:56 +0200)

----------------------------------------------------------------
i2c-for-6.15-rc3

- Address translator: fix wrong include
- ChromeOS EC tunnel: fix potential NULL pointer dereference

----------------------------------------------------------------
Andy Shevchenko (1):
      i2c: atr: Fix wrong include

Thadeu Lima de Souza Cascardo (1):
      i2c: cros-ec-tunnel: defer probe if parent EC is not present

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.15-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Luca Ceresoli (1):
      (Rev.) i2c: atr: Fix wrong include

Tomi Valkeinen (1):
      (Rev.) i2c: atr: Fix wrong include

 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 3 +++
 drivers/i2c/i2c-atr.c                   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

--YitJUgNAYnWmcv5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgEC+oACgkQFA3kzBSg
Kbamvw/8CLRirbxmvXw/k6YfBXPrrBo2VeUYB13aqf983Tm9iQlX9AcGPGFyMK7U
nv2Uza7NE9JFpUw1r3bk0AnXOdoqHOCmrk6ay8GufL6EuwVYD7KPTI45fwQJWp9X
wgzbLSp9MOLFueIeDzaeamr3T+I8wcRjw4n/4obhnEk4RlijYrCJwOIhXVgn8iFs
iDd9Dyr+AvL705OTBuxMKJahy2beHvsPJlfwR657IJ4aQgS3CwvxnmQg71dBMMNd
85WfQwzCcd6TVj/SMC09aTQCH21xHXPabYyKYYl5VKzYFjpBRo6mdrZptYJdmtEW
vBxXbaEBRZZa+DmQOqYfuB1VQ8uDxHjMNhYn/t8kRJxJyQbwGzXvPewuHvts41ow
CkeGC7LEB87oZyYTP2sSSpZyVZbckzsRjB23z4p5docBCQX2STnqypR93fvnzl4F
wlE7nwUrqfvsSS++d6/tthSl6kdZrR8OHcIQszsfSpr17wKOwUucLldXtV9NkZ0f
fHq4RpjJzmoq9yjfUKCm6E3z8APSgYUIcrK9/IRuWNMQUY/sYcZhTxWoR0w3uJ3T
FcGtBRj+NuO0rl2EsEhPVhwEmVhh8t5K3OCqq+qweYAOk34keljTKXRMgceZf5F6
WUKymUhTSIA61cqoPd/i6ZBajr8oZno3yyEldTUiVvewcXxAhyE=
=Kkib
-----END PGP SIGNATURE-----

--YitJUgNAYnWmcv5l--

