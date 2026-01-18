Return-Path: <linux-i2c+bounces-15249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 376BCD393EC
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 11:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9304030123CE
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 10:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543E62DB7A5;
	Sun, 18 Jan 2026 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5HlG0Gy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181872BE7C3;
	Sun, 18 Jan 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731370; cv=none; b=hBI/cCB4qErkLxWCiqHatihDPF45Jlrm+gB8vA3s5m/7dyCw5c/BGiUJlBk+apCrXSdxl2cehx0rnvh/UGY99VKDzakeT0H7zVJsMnI7Ouz/yTvnVmgnreMu8UJCf5/V0H7xVWjMwfaJvL4Mxjfxn9CLC1BaJ4n1wJR7xFXe7WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731370; c=relaxed/simple;
	bh=Ku2a2rtWk/ZJzSZT14kvzniT7ff6EEBgH0TYmkxnMws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qjv+lk3O957bqvntK44jLtcNRDRUwGKCuIilykPACgjB6eiMqXIOwRvYNmdzXyfrKw3/qneTdkbWEgOVLsQv7Dz6FhLcZxU8g2bG2e24xvWpt150blmt0nS14dT8BQJLeyW5j7wB29oWb5vn0BVyITK0hjTXk5uvg/Qf48N25Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5HlG0Gy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB1EC116D0;
	Sun, 18 Jan 2026 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731369;
	bh=Ku2a2rtWk/ZJzSZT14kvzniT7ff6EEBgH0TYmkxnMws=;
	h=Date:From:To:Cc:Subject:From;
	b=t5HlG0Gyw7Ol9acMPJZcCJXO2vfpVQC5NK00zZEXp4xjnOAWH7Gck3Y6dpCal/toG
	 yHPxZoiYRlfv8EfzhymScREvXbL5Yslux/OgzX0AmQC+xfdXXbC8m/3OPNukc5T8jp
	 bTjIrm5npY6FpqRDa4MTpg8+Ml1LtsP8ZLF8crRwaeeAb3zHyjILp+qYNXHPoty/gg
	 pwwSEc2w0SwvctyfL4KnPJ+1qAabxquPYD4JdoQwiszbR5vxHUBT/6YZ1QFqEaAw5j
	 d0/aDolEWVixFq9mAGa57Q7eA7LgXkUwJStkh12fHP+hcDPrUONUT5/zMbARJiK9Ho
	 PUz3/Y9PNihlQ==
Date: Sun, 18 Jan 2026 11:16:06 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.19-rc6
Message-ID: <aWyy5luqIRFzUma-@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PEsaICW8vSerFFLU"
Content-Disposition: inline


--PEsaICW8vSerFFLU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.19-rc6

for you to fetch changes up to f2a3f51365bf672dab4b58d1e8954926a9196b44:

  i2c: imx-lpi2c: change to PIO mode in system-wide suspend/resume progress (2026-01-14 12:58:26 +0100)

----------------------------------------------------------------
i2c-for-6.19-rc6

riic, imx-lpi2c: suspend/resume fixes
qcom-geni: DMA handling fix
iproc: correct DT binding description

----------------------------------------------------------------
Carlos Song (1):
      i2c: imx-lpi2c: change to PIO mode in system-wide suspend/resume progress

Neil Armstrong (1):
      i2c: qcom-geni: make sure I2C hub controllers can't use SE DMA

Rob Herring (Arm) (1):
      dt-bindings: i2c: brcm,iproc-i2c: Allow 2 reg entries for brcm,iproc-nic-i2c

Tommaso Merciai (1):
      i2c: riic: Move suspend handling to NOIRQ phase


with much appreciated quality assurance from
----------------------------------------------------------------
Biju Das (2):
      (Rev.) i2c: riic: Move suspend handling to NOIRQ phase
      (Test) i2c: riic: Move suspend handling to NOIRQ phase

Florian Fainelli (1):
      (Rev.) dt-bindings: i2c: brcm,iproc-i2c: Allow 2 reg entries for brcm,iproc-nic-i2c

Frank Li (1):
      (Rev.) i2c: imx-lpi2c: change to PIO mode in system-wide suspend/resume progress

Konrad Dybcio (1):
      (Rev.) i2c: qcom-geni: make sure I2C hub controllers can't use SE DMA

Mukesh Kumar Savaliya (1):
      (Rev.) i2c: qcom-geni: make sure I2C hub controllers can't use SE DMA

 .../devicetree/bindings/i2c/brcm,iproc-i2c.yaml    | 10 ++++-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |  7 ++++
 drivers/i2c/busses/i2c-qcom-geni.c                 | 11 ++++--
 drivers/i2c/busses/i2c-riic.c                      | 46 ++++++++++++++++++----
 4 files changed, 62 insertions(+), 12 deletions(-)

--PEsaICW8vSerFFLU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlssuYACgkQFA3kzBSg
KbZTcg//ViJ4rkxYBKY1owIirZR34JIHX5P/DwtZyV4h5FDrWg8RfPMqH30H/XXe
UpofMn+b27TiVfAuko0WbwjW23JXTe0iPijzy2/DERPYL1XJR26GCgGTYX0KeCWq
OmPoPgftNZZSW42iFMNCVejVfv01pNqwhPZUZnTp/tWhbf3NF/ifhfdSlBbD7O6G
hE0+/reoxA60eykk+yqmWTwX9RE8vvr3pjBPHOix2vSukJ71jaeUht/e9g8AzB7a
O1ItUHOU2OoREjT+HuG8o1/006EuHv/XLF82vekmmTIFKRH+XhyZmLBT+HLBR1fj
k6AcvvRa4kjzo4x7r/UJ/eQ0wUrKzkfePepBe2YfNXc0hhnk4a9OKj+vf81H2j/L
L9+10Bhz1Y11wVJJhM8lP6mrtd0E+yiLlKMXpgdF4pO3K69YWySiiZZKXJq26/+g
bTHjnF+0VoDx30M11woBMa5rVd8WUslM2O29HigfMlB7M0WdbDnUuC7gmDQajvJA
bKos4RIqrzZY2e/4GDcsvSKl48C41RbdjXtlIcg+XHd1UG4VVXu9ZKjdnhiBh/Dy
+eLz1koIPywIdThM1fwJiqY0W2CC5xb+wSFRMg6yg2G4PmEQOtDrHZ6sdn1jDm0s
2L+wGKP6pRjo8YHT333tT4O5GafiArDD32lu0ZeMLdo8JFUvVI0=
=zMKF
-----END PGP SIGNATURE-----

--PEsaICW8vSerFFLU--

