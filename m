Return-Path: <linux-i2c+bounces-3804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418788FC461
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 09:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E7F6B2719E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 07:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE4D1922CF;
	Wed,  5 Jun 2024 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4pMKI30"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD601922CB;
	Wed,  5 Jun 2024 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717572001; cv=none; b=ALmGByL0PKXIk4lMQxxS+mqQ8zNMdV9h7WneCSxEGLzDtc4FBkL4JptCBeDsqWvmU08m3FT8nOUr59Gg6fNgqMYoW4eAq8YwK+DyOW6xfTdUrrfsyeTJIzk8OhF7MmqVEDCbCIuiSuoxAAQzSZtu24PrxmhP0cjHtuL+CRXfXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717572001; c=relaxed/simple;
	bh=QibHYSNqXBQZglXhuWn0/MB/qPRlK5YRrW3DPEoBJy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M0vre8s79rUMXuGod6SJiWE8D/UdqiSvf4Hcvi8Mi0CA9KsPmmBd/ZP2C9Vvz/pxFi2/G6+Pz5KrCNKwxOvMjyfCaZG6L8nQc0ptlcQKTps6u/mD15+OWz5FuzHGDR6R8XTFmJ7gZNeWmtz0QK+cds/UOCNpSzeQY9ungOkXNpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4pMKI30; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0048FC3277B;
	Wed,  5 Jun 2024 07:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717572000;
	bh=QibHYSNqXBQZglXhuWn0/MB/qPRlK5YRrW3DPEoBJy8=;
	h=Date:From:To:Cc:Subject:From;
	b=W4pMKI30CFYdy6cnB+KD1SY+qpgqKded4GSi3g6RYy2hreBQBhsCsltUmCOVERYfm
	 JOBL9hPTfKCI7gyyC/pkf5sQhOZl12eQYI39Gv5g9pViDDhxp2L7r8cMpmMfR/rUw7
	 RAXUrZVpHjZnCFV39cLmKdoBxuePPbf9U15AHSg+fo2HIpmwA/107YqCSKKb3UNjUc
	 1a56HzHBMt2OS2vCWTjPTsWQT54Bh6DbxW7TfKbGeuf9z/uedgu1bQ3QeLtpyioEXF
	 2OohA4eyyMdPx80ZVnIm7mux2s+zZwke4DBGbkmx1ky0Au6FfGFQQfAfT02LZ3fas5
	 klj9rrGFrsKoA==
Date: Wed, 5 Jun 2024 09:19:57 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.10-rc3
Message-ID: <ZmARnWliAuHLbwOy@shikoro>
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
	protocol="application/pgp-signature"; boundary="fcFIjSC+7WZBrfM+"
Content-Disposition: inline


--fcFIjSC+7WZBrfM+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

  Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc3

for you to fetch changes up to c4aff1d1ec90d9596c71b6f06b0bfab40a36a34a:

  Merge tag 'i2c-host-6.10-pt2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-06-03 08:51:53 +0200)

----------------------------------------------------------------
This should have been my second pull request during the merge window but
one dependency in the drm subsystem fell through the cracks and was only
applied for rc2. Now, we can finally remove I2C_CLASS_SPD.

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: synquacer: Remove a clk reference from struct synquacer_i2c

Heiner Kallweit (1):
      i2c: Remove I2C_CLASS_SPD

Wolfram Sang (1):
      Merge tag 'i2c-host-6.10-pt2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

 drivers/i2c/busses/i2c-synquacer.c | 11 +++++------
 include/linux/i2c.h                |  1 -
 2 files changed, 5 insertions(+), 7 deletions(-)

--fcFIjSC+7WZBrfM+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZgEZkACgkQFA3kzBSg
KbY2wg//e5sCOTOhmxwm8B/EvNU1NPIXz12/nw7MC1wBqzscAE9QPlH+g72XZ381
Er33VItKcZLByMybeBIH/+cXvtZQ368hJR5VSxNT8GUT4SPJbBmRK8HX2aCYPbAi
UXPOTrjfBNWSYRzvcn85PBNE3eyOZ083DWs79KBzO/Z6PjmJ1OX7HLm/zvRgue2b
qIK+bGsxeqNoW7C2u6+oUMuXZ8wuZk6zziHqiKWB+7I5YOqAr3nrVNbPpd6bpwHU
63InhB+Acl+xSjp4g1NYJhl/lrlUgVqW5MbngHIw/P34uDEL9lsOSJ1RCzTSqt4q
W3/pUfe+nTmBTT4QeetwjyTYhrWSUYH9nvy2ipsqZ3oi0iquz2vaE81xNoFeEio+
4Vy/KMEjktep9HRoEohrvi17WKmRjiWOllNLMLIDlJWfqBP+EPv/0mepNoWO9xvs
AG0QZCGO8w2HsoubMm+4m7ffXlu7dSGA60UZtvfADpl+2ppk4yo2mNBDwP/3SICi
c6a6ZQ7kK+FZH06rFisQ6BdEniSuBdNdYfKgqLlLvZ2b9YyJrZPLilxo7tT9efr4
ApMdKt9aIiXrGNzfFrfD0d/w1v+LT6VZSMvF6+gOH02b9ypO0Iyj88z2Y00U159h
X0U57GVjy5mlDPZ4hkIAhq0oN5Ag/frDS3ff06SWOiKolzRpI3k=
=RP3O
-----END PGP SIGNATURE-----

--fcFIjSC+7WZBrfM+--

