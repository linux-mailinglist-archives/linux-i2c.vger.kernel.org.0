Return-Path: <linux-i2c+bounces-10921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7C4AB2345
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 12:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 352F14A74A5
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 10:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1323322157B;
	Sat, 10 May 2025 10:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWJv9tFZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03982222BB;
	Sat, 10 May 2025 10:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746871934; cv=none; b=uejqGZM1dEWRMoWQlI32q20aTZMrkG28+BNGDc4cI0Vu0+CLJOy9ekWMrRXSN3yW0g6rHXYIIuXKWJs6vDa4YHd7lyrfHd4qGglPr2sLkntMR4FiIaV7NlACwq3P/QfR7jk5qDKCVHf9JfPmIEQ6FdxztrEHnCl4NKJ+VrzPDpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746871934; c=relaxed/simple;
	bh=Pg4V0meN3L3Yz//A/BdYQj6sOEw4qJtZuQhEeL7Cnvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EiXiJKwji6k4Q+4LG536F1hF0T1PJWfDcULmzJEw/Yu8UYFGyhm72A9xJvs3gfmGQd7YHTEhBnxui83ldIDBJncHAY8i2Lmv1LsqZKQzkuYo84q5JEBay0tpzEL33mSu+sO1Oh/NJb7X+VGwJz+MUWAFGeATShwndoxpRNCTgRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWJv9tFZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C86C4CEE2;
	Sat, 10 May 2025 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746871934;
	bh=Pg4V0meN3L3Yz//A/BdYQj6sOEw4qJtZuQhEeL7Cnvw=;
	h=Date:From:To:Cc:Subject:From;
	b=LWJv9tFZ2gs0umparpARp9quhqRJm0hB09VmLrv3SBSA/LOBSM54rq5D/+/3QzhZ6
	 ADl0D/dOb1QrakOHTo0WVpGzVqx4OXL6zyF1d5KeuFff+EtBFaPVjFOEEbiuIrSOX2
	 cHCbZgoexQiLwZoH05uLLuNVGUtspfSY0ShOjFXOYjmaUNIGGGIRCEHK2yqX2qXBCJ
	 kyYNBPTmzO9uqJyac1Gfs6TgAz6mvAU6bVj5x12Q4x7LHaS/bmJfwO/sHL0MqF0xUa
	 ayCkh7B5NbttoUqSuJIOEljeclcsBE1U/MHslmip2PrR2T67EkHzck2t8gPVg8BJGV
	 cj6nM3c4GiM2w==
Date: Sat, 10 May 2025 12:12:10 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.15-rc6
Message-ID: <aB8memMatOtJhqDr@shikoro>
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
	protocol="application/pgp-signature"; boundary="NfGmAbLQGMTFTJUc"
Content-Disposition: inline


--NfGmAbLQGMTFTJUc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc6

for you to fetch changes up to b6c08bcddb2af9ea6d1846bcd36a35371e249003:

  Merge tag 'i2c-host-fixes-6.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-05-10 11:41:13 +0200)

----------------------------------------------------------------
i2c-for-6.15-rc6

- omap: use correct function to read from device tree
- MAINTAINERS: remove Seth from ISMT maintainership

----------------------------------------------------------------
Andi Shyti (1):
      MAINTAINERS: Remove entry for Seth Heasley

Johan Hovold (1):
      i2c: omap: fix deprecated of_property_read_bool() use

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

 MAINTAINERS                   | 1 -
 drivers/i2c/busses/i2c-omap.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

--NfGmAbLQGMTFTJUc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgfJnoACgkQFA3kzBSg
KbZKsA//eOzw+wsiW58Lj8W+AF5M+VDkfxYdaPI50tDCfcJP7RkQRScI9SVnnYHo
xMXrhR3ZI5X+sF3e8w4vVAUZpTGo5dAqacyqmH7IEX4iGAJY12QW6QCYpE+68rY1
Ks3iKUKzOrzsXxbzjouWkoKOhcSNMjwMbTdizKCDsOPq0llJ6D5W8mPIf3SuBIxV
qld4PvSzRGna/Ic7Cc59bi0l7FWOUC1qM6tZPGh/5MaY65LsQXB9Qx3pGoPPJAYJ
GGZmyEG1LgFto3z/lD4XonBfOTHBpaDQOo6fZ9bAVqTQBK7VDztJo9RALTwz+DNX
E3K3+TfXX0diAaPoz8i2rq6GHiBJDxYKWgiJ+fVJOg6M8cH1kZfMDVPYI3KQ3zJ1
VQWeoqrUqo3vQ9Ij/+EesH8HYTiITiq+AqnSc607ZW0dbXCnoiPD+iCN2h5EJ0bk
w8caKMdJXzaQY2s6HCHm3JH7MGv13jgUM39c4jMHBJXr7Iqq58kiOzk7x2hcFcr0
aWmKBZnPYTgJzBP3LCRCpgkz78K9pftdDxvwv579cwCbkcULVFDoXLDnZSbpbzu4
wL9bJBdAY2GgbvufZPvQlOamX4W6AQ42FFB+XAP0ypW+lQ+wtCOJqNXAElG6Zr1p
DQIE4s6iWH9VNFEGT8tvYSnpPKV9i6SmjvKCf/x+uhJUJF8Ree0=
=i4R4
-----END PGP SIGNATURE-----

--NfGmAbLQGMTFTJUc--

