Return-Path: <linux-i2c+bounces-11007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6BAABA90A
	for <lists+linux-i2c@lfdr.de>; Sat, 17 May 2025 11:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 826289E4603
	for <lists+linux-i2c@lfdr.de>; Sat, 17 May 2025 09:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013B31D5AD4;
	Sat, 17 May 2025 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7JqNIua"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF74220330;
	Sat, 17 May 2025 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747472570; cv=none; b=NtT/+2mDPWl5KXSWXUn7QuKv08F40DL2s+hb4UGMONVO/HEKwnXU/gkFGR1D9D+Up7nXjnXPsS07Dtyo57j801LVM2hbUO1oNJF8RX5MDWZ4B49ZHjAeAZP2TD/XFhjnVIOmBLFpHA1KMPvnxKiHmqRyAEt1ot2MdaGI+IfnSSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747472570; c=relaxed/simple;
	bh=oFRZs3vh1KIpraHwVfAmLwSR8tJ4ihC+6TTHYLWB6A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTB32ktFUsT3usLL21vOYa5L7FQDhkf3Ul8gN3wdHjMXqf1vt5LXFpyWluKnUHlerD3KlVWcw9R0i4mQcl8dOQCYDJ3G2ZIONR81+zwQwCYvG6Tv0Y2ZiQRAUimvxfstiidmro7B6X7SFtP1azoTZbv/f+hhQaFK3ZVwA9WAbRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7JqNIua; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C65C4CEE3;
	Sat, 17 May 2025 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747472570;
	bh=oFRZs3vh1KIpraHwVfAmLwSR8tJ4ihC+6TTHYLWB6A0=;
	h=Date:From:To:Cc:Subject:From;
	b=B7JqNIuayfXnGNUTtM20u2uRBZpSx2SgXAVICc9NfwaDBOGaniO7KBAOEhRu6+Tf2
	 quwyYcRrsOhAeZ7fVL8en8fWPs/GmkmS5NZXSpX1c0ETj77ccaqpypy4vIrRdbrbDk
	 IZlc5jzkhVrVZQ/UylbCoPHi0NoDbIy+njhp+gWhO3ETENqjfq1C95AJcnZPFsC5lN
	 hgX6m2Iye5rUkRJbKnAaJcjAFRKOA9LGKWmO7B1AMS80GDplXx1H/rvckmYdNWEnVy
	 HHesy3rVjAzNsFumbPOQBBtNjDiOVGUwYjfJMK6ZqqVnqMd/05TRkJTpjupj2qz2sb
	 +Ozy2ax9Ztmpw==
Date: Sat, 17 May 2025 11:02:46 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.15-rc7
Message-ID: <aChQtvRgPB1q4gKg@shikoro>
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
	protocol="application/pgp-signature"; boundary="kJXrdRYYD1+/CqeD"
Content-Disposition: inline


--kJXrdRYYD1+/CqeD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc7

for you to fetch changes up to 6c72fc56ab2bb7e0c327a6d42d02164c0dee9696:

  Merge tag 'i2c-host-fixes-6.15-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-05-17 10:22:34 +0200)

----------------------------------------------------------------
i2c-for-6.15-rc7

- designware: cleanup properly on probe failure

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: designware: Fix an error handling path in i2c_dw_pci_probe()

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.15-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

 drivers/i2c/busses/i2c-designware-pcidrv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--kJXrdRYYD1+/CqeD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgoULYACgkQFA3kzBSg
KbZpaw//Rw4lFmJUF8W+KTU24tAqasRonUknkZ3A/7Si+q9Ly3BIhzNNI5CaDgzf
SbSe3U8AXsY01IR+n8L7cB+ucWOrjImuELNb5WAut9upSSX/wTKw1TZr4jNBGOiQ
CVvBM0k3mpFnJ4rk0r8b9es2ijMygp9f155g5qXIq8RT0uCCTurJus/J4h95NdL4
LjsVPICSXooQmEmYZ8o+7ri7xx7Kg6OYWn1vj1qmBYLgTye4WPXwPzGXq1cArZBn
/FxYkyBQ9nfoMeeGSSQXF55PQpaKjJ8gadk0eOhGNYPC+5LTYOAwZyzdJ5H6Mmm+
6fyUHmIMmRHFi9s1IX7pQ8jwlV89lTuHMCkEMu/okv8Kb0+Y9G5aE1OppVc1OI7w
EkVkKUTyk9l0JQGLuCNqiB5yISKIJWTluu1tb04lZwc9c52lTDhGideTf79V8NgC
4Fez1pxHImFk7RZTN3JUYTpcOTJU25kbjmj0Ogj4XVl/7CX9eVXZ5HTAG9wsj16y
gilv5jOyoBvP6kg7kqzXiuLQ/aK/pzMvAcWLTppISGjrUu92AYwLLsSXu9q5dXLI
EyR+N2FXfrNephKMN7LGUjzYBLZqw+XOZBAckvphGkC/dAJnAE2CZDGRsfpCUJLN
B2rxBpez6aGbOwr/TT/IEV1Pyz44VYEL45KtM9mQqvMEnxcFpfw=
=Y+ZL
-----END PGP SIGNATURE-----

--kJXrdRYYD1+/CqeD--

