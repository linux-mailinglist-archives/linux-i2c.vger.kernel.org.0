Return-Path: <linux-i2c+bounces-1618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351F8488B1
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 21:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 735001C224BB
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 20:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAD55FDD9;
	Sat,  3 Feb 2024 20:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wq+53ulz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A35FDC2;
	Sat,  3 Feb 2024 20:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706991924; cv=none; b=uRcvuaIcbsRBAJLprjiSFs0mHHNpleiaY3Kj09kxr61IWpuCDHlP2p5xP9iRk+yPODoE5XJpA4XzuvlB41ovYZhvsHIdQmKxBhSvl7lCG42ji0zS1wGin50GETcouoCjW7exuG95glIi4xQF3NguqqNGzdK2HHnzL2F7j5IiUwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706991924; c=relaxed/simple;
	bh=k7NIOS1DcnTVJO0uygdkTIocsC0gBoCtay10wjeP79o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b+u9b2v1R9t2xvoCM92B9f9Y2J47cDGPi/HJT4czuac2BY6Hip7kprMRsoXMdEJMLA2CQVemc84tE7YQvUH3iXA+Gl2RCB57UiyPNhJx37PAg6k8nbbHvOG7cIx0Hnc9D69WwCfoGz8ibLCyk+gAT/nX7kM208tQzagN0s71Dmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wq+53ulz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F1FC433F1;
	Sat,  3 Feb 2024 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706991924;
	bh=k7NIOS1DcnTVJO0uygdkTIocsC0gBoCtay10wjeP79o=;
	h=Date:From:To:Cc:Subject:From;
	b=Wq+53ulzyXqSQngi6UC9I24oYaDhkCEkSxz7PDszzeC+S76PPLHk3uGOL1LrZCa1v
	 2Inwx79cQ+YwINNg4pSG/xg2iFWKLkzSgXVteAFILicpZKYan5K0o1ef0ZpTKdtW/A
	 jJpOxwqImbnOSKYjIlafeQ/4c9CTGw9loAS4ZUQhVk7HEdp012Jjtb7bHgNjubodJc
	 oWjWzYAU/v7kWgj/9a0S+UvBvzoejv2Ql0a163bU0haDPINQH4ueL33fvep+2sIM7q
	 v/n3ZbWLYscyJP+yqvl1wsI5E5x1uJiMNHH38aKTf1c1OXkn8ZK50m2cG5Frw6LPrg
	 ZxRIt/L1ZUS0g==
Date: Sat, 3 Feb 2024 21:25:19 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.8-rc3
Message-ID: <Zb6hL2HnnifdTgd-@shikoro>
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
	protocol="application/pgp-signature"; boundary="iMBy2BA+gaJ7FFuH"
Content-Disposition: inline


--iMBy2BA+gaJ7FFuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

  Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc3

for you to fetch changes up to 957bd221ac7b2b56cbdf56739e3a94d4f479209e:

  Merge tag 'i2c-host-fixes-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-02-03 19:23:41 +0100)

----------------------------------------------------------------
MAINTAINERS update to point people to the new tree for i2c host driver
changes

----------------------------------------------------------------
Andi Shyti (1):
      MAINTAINERS: Update i2c host drivers repository

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--iMBy2BA+gaJ7FFuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+oS8ACgkQFA3kzBSg
Kbb81g//Z6Vza34rbC9pZmUUSTXAQ8T/arY4UDMYjYt0JC/oeM2ghidFrj9IPYHT
pZDIH6+1s0GYGnBy1QQMiWuNXuHaySB3ykzocaNyd5TaE8KlIF8k8fimehywNHRI
LGhKm73Aoy2eo2edr2pUyOTkagDVTVO8+BHOdLG+dnBOCFM5qu0kh9jKdvS7Ah5j
qbfMIM2CkrXNuReR/k6tJy4TC3PuzxIB/Mo4/72lT3u7v+Rt940wV085/o0Cu9Ug
KLSDrkHBHA5p/xVU21lnZH9GpTS9ZoN7CYZGwVXxHArGtZBSi+2E2CflI8PlkLUD
cRQVpAcXgdLEr+nQlAe56DK+76vvTC3GEH8vsVdmECvJ6DKM1MNa7ckQaRyyK8Qt
Ng6EynWQWoz9AlT0VtcG0QJ+Wkv1HJkCcUDoEwG+eI/xpGgxe/5gRoNAr6XdyRBT
fdj3Sjf9J5Rh1tgkfpU9/Z0IAncggCR06RA+5UayopdJLe5/CWWsckJY4GA+N3ng
KTcP3eqnP2jEm5QQGstAJ/vnw6B3ZbY6yuGS/LjYefWrTOqPWEm/E6vsx0tGfZIB
dTw+fSQxcHod5/C6FDq8NuzLAiIVV+y6lD9lClCemMTBoN3bx049XRkJICYk2YWI
asCb5Xsg83L9EWHmiVsMzent+6HsDgm2ex5A+lRX4CR++JnnEYk=
=max1
-----END PGP SIGNATURE-----

--iMBy2BA+gaJ7FFuH--

