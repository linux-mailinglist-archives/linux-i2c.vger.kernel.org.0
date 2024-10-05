Return-Path: <linux-i2c+bounces-7229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1D1991514
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Oct 2024 09:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 940E41C21BD6
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Oct 2024 07:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C56784A2F;
	Sat,  5 Oct 2024 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSnL0W+I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B6F56B8C;
	Sat,  5 Oct 2024 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728113445; cv=none; b=ek+PQ+Rh/NzsBUEJCDm5MvomxDtZ5S4dbL0LR8x5V9aBzNeAWxoUnSo7waHXorO4C4HcgkJRODmSkvXO0ek/6ye/ZmJiByBOdxWp5fpD1zMOHcqckopTsGLwXcG+ceP91tAPspNJUyCdyEn4eTyUO7zcciIXJWh7A1xgDakbYkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728113445; c=relaxed/simple;
	bh=IaRodO8zs1D5uZKeUKOqrdSbOZfR7VBTuCIDdSro5y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UOtFpbWwe/NHfyqArz6wRSJez3T76J4bWxfjLcuBLOLETTFmiGoZ6jHphB+R24SN9MyJhlNV+haEFpKjtUsx+nQ96g2EyHHoBv2R8OhBibA6VffocpnZ8vBALK+my+2/Tn48RX2st6Htw1KtJFDH4n0rjnXtUhiJFP73tAR3GdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSnL0W+I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04039C4CECC;
	Sat,  5 Oct 2024 07:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728113444;
	bh=IaRodO8zs1D5uZKeUKOqrdSbOZfR7VBTuCIDdSro5y4=;
	h=Date:From:To:Cc:Subject:From;
	b=SSnL0W+I0bvEfGGTh7oTm/ScD+STK03FsB9tenD/E0umI10iG079ogJUkUFZCVs2l
	 BLvVNE9AtwRZRUq8ARIESW7YDs+YCVCmm5bKuw/zgQGpXVIQJT7ncfel/qM+KrvFtn
	 lV/Xq2eBpBMRMIbs7uO3cIgy4qy8rXQfHouhhWedpOMf2ijDb6R3sZHAvbCeMKW8+8
	 MRdAd4TfsgwubpWk7nUeVNALpX74vvIZ6/NlPd5wwhjNeb/kU/iq7PMn4ua9ALQiWb
	 GoHFZl57cbYfldHwM2hdtEp39s49ovLSOS3dyZZl/c8N05dEdAEgSWghDbJiqN4LZM
	 VEgw+PxZEVn+w==
Date: Sat, 5 Oct 2024 09:30:34 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.12-rc2
Message-ID: <ZwDrGmD29b0rTCZL@shikoro>
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
	protocol="application/pgp-signature"; boundary="jxLvZZtAFkkwsH5/"
Content-Disposition: inline


--jxLvZZtAFkkwsH5/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc2

for you to fetch changes up to 3689245dedfd6157bb6060b62e523a68f1d674b2:

  Merge tag 'i2c-host-fixes-6.12-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-10-04 18:30:37 +0200)

----------------------------------------------------------------
i2c-for-6.12-rc2

i2c-host fixes (from Andi)

In the stm32f7 a potential deadlock is fixed during runtime
suspend and resume.

----------------------------------------------------------------
Marek Vasut (1):
      i2c: stm32f7: Do not prepare/unprepare clock during runtime suspend/resume

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.12-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

 drivers/i2c/busses/i2c-stm32f7.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--jxLvZZtAFkkwsH5/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcA6xkACgkQFA3kzBSg
KbYlXhAArVFbPtxpjupyRtxZ1rB5yTM2f+4zfONLGuOv2cqbG8gA1t4ya3okbJea
OdKwTXP61B2qTIE0lgmcKruFLGDFyYOElOOiK/27q1bms/9AICeM2QhlYGqzMAxO
dUa6GOnUBef+ssTfXNoMIYXTN4TqUiiPMnx4BjPQ3ebxX22Lr27++vpzb86Mdpul
91JWyTh5QOFNkLjWBukD2kzDia9YvFXa2BEUejGJO8YpXgTBnq5drF5d69yFxv/N
XTFCxqz9siqiQE1FdlAKCOAgMoYDxTYK8I9w9p1OEo4uMsG0MycwMwHHL2jKBIgz
v1wOZj1R5SeyflzgbcQOP0MexwZYAceowc1gUQm3yg5l1s2bFW6wqxfBh+PLZweQ
azmRApflZBzLOJqflCyWh6Hs5jtLGJvcEEXbGZEBS+JUSlf/vCT88So988mmOIH2
Lbsu789+h3ZhQr+P4a2qpda5YddeqrBd3G9sVMTcbjAAQyj21tOiQlOhWm+yRD10
wPMbdHduSl0Qvwwch/EFcsZO9gPDeYQf7ttjl5YdQYm1O62PI7vjq5xtWmBXv53w
Q+VVRGRUye7DjsQNgZeKaXgCZ0L248cBxlKsV4UZN2EO8hJuvGhzidaTJ9BltPyZ
4vpws5Xo6UPweiCvgGOD9U35HYoAlr8pRN+KcJTrmCpKvtzK7DI=
=Ni74
-----END PGP SIGNATURE-----

--jxLvZZtAFkkwsH5/--

