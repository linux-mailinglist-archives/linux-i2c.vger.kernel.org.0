Return-Path: <linux-i2c+bounces-2683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8478A892B9A
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Mar 2024 15:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B33FB1C20FCB
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Mar 2024 14:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A0336AE4;
	Sat, 30 Mar 2024 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRvNFnu7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8831C0DEF;
	Sat, 30 Mar 2024 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711810258; cv=none; b=p0K0ttGcUaDR+lwFuLMps6IJo3ry/M/CJOLM3obJh0UOoIX7Eg097GZxGHPpAy/iRObOIekErBJABHs9F6qFKhyK5HNBeVrrzoxl0L2RhPWYUMGiPCp7iEmxPhkN0ALrulkJntYqWyadVAiukqPyjquqclVkClPq5AWSGSD+B+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711810258; c=relaxed/simple;
	bh=MeEZw/Ldm2s+576nBu6ncN7GhPDT9rZgYMIfiLGH3U0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hc5e3yXFahyfYaJjvnhJqY5YFvz5Av2ij3scJ7xfvFW8lILXBWW0QgRktpggVFuUh0nve2Cjo7rfRQ/I9q8QPcwFFgJ/g5h/ZMDn+anIYtiDqwPZIPS3whbYgBaBH8X54qMTcaRn20KMfbl1d/UmFfxmhx+n9ppB+DGl4aNIR6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRvNFnu7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6ACC433C7;
	Sat, 30 Mar 2024 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711810257;
	bh=MeEZw/Ldm2s+576nBu6ncN7GhPDT9rZgYMIfiLGH3U0=;
	h=Date:From:To:Cc:Subject:From;
	b=rRvNFnu79TmXxWpFkKIGFhIqK3SF0gtN7EErylwezS6EzQYEOUBf9FkXWW44GH3bF
	 TkafGWPO7z4pRGgfySzpBaZBpHwiJLM/9anu1Z99wJMS1w+lIm488nczspuk0EGPL1
	 3kvMKb1tt8IP6vupfZyLIuUOVJ+IBbH7yQAql+e4kDM6cGi8YC6PiIhnjeUab02hjU
	 FNbfULPANQSjoPgu5I4FICILiDV6C6vWjDAxUmLO1dBHWwOe+R2UqHH91AjiG/Z1A2
	 IML/MgdeK0lC8wS4TkJ22oDLvKb5FEzZ7fO59pLuA1iYjE1xPW15S6FSzHTNe5Uu2o
	 R5qSbfAM0AQzA==
Date: Sat, 30 Mar 2024 15:50:54 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.9-rc2
Message-ID: <ZggmzvmHwewWq14U@shikoro>
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
	protocol="application/pgp-signature"; boundary="7aJqlnfEG0i9RKQt"
Content-Disposition: inline


--7aJqlnfEG0i9RKQt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.9-rc2

for you to fetch changes up to 2953eb02875b42c96e5ecb2d1061d0a2c1f9972b:

  Merge tag 'i2c-host-fixes-6.9-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-03-30 15:37:54 +0100)

----------------------------------------------------------------
Passing through a fix from Andi for I2C host drivers

----------------------------------------------------------------
Maxim Levitsky (1):
      i2c: i801: Fix a refactoring that broke a touchpad on Lenovo P1

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.9-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Heiner Kallweit (1):
      (Rev.) i2c: i801: Fix a refactoring that broke a touchpad on Lenovo P1

 drivers/i2c/busses/i2c-i801.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--7aJqlnfEG0i9RKQt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYIJs0ACgkQFA3kzBSg
KbZqVg//T+7bSD0l5m1Tf8hoBjJE2N945FslRD+KjmYaqXDcwOl4y/5rhaOzZno0
1Flt3DQXx5qaEA1oSL7ZQGNzTNT3yIZe+UP0pWdtCL4idtWeTE/NUbbaNr0hxmS0
gChia+urmT5POU8obXpK3JDIS8zTS5wMttxYBNIX7I8W/TBAZD/4a22dsl+fKB2n
vmaD2AetC86+zXKnhdwmo6iu61XN5lpfgw8Vwp42XiDNvURAzm0N/BtZWu13lkkJ
/RejdWJ94DQXhobHCRTV8Wjt3zBf/DQUff/OeFZqitbNta26OWF4qh79PLuvKCwc
ovI4dDZotvFLu5bpeGwMREpFMOJWdYIkW1HJ0c8ptJsVVYSQo67NeYsJfbRaacH4
bveqJG6G4Nk6wD734V3oBhtyTEA/rpcMpPPlesmJ8pksSWNahM5BmMVXmTn/ht1g
IVkpj/pvVlDHmSv9Uep5EdZNowhAxDq+J6+Fkjvg1cEmyij+r8y3/yQZqz814far
4fIovVdOvVJNFMAbvyB33+Uwix2UUMhFMEcMmA94yrMr/ua4rcj46jd+C/dlYDNH
j8uf+Ql9UBok2u5RJ/daaKosHkVjkYyO4Dgrm3ptxhKzSHG/fViI6vLxvkml8zgD
NpPFhtMavmgSNbEK3eC6uQhSXHXxj1XETjPe/zjNgYQRAI+yj38=
=C3g8
-----END PGP SIGNATURE-----

--7aJqlnfEG0i9RKQt--

