Return-Path: <linux-i2c+bounces-13277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8598BABF2E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Sep 2025 10:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 477C11920088
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Sep 2025 08:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFE42F3621;
	Tue, 30 Sep 2025 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/ujWrZ0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182AD24167A;
	Tue, 30 Sep 2025 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759219509; cv=none; b=Sofx+49M9om2V7YIFGQ5mXYZpO3yLq+r08y5n7bBelWGIFGgLjU8xo+sGAjfnpqq9HeXq3Hi49lxZr9gaU2HZ3cnIpXL6z+QEJtBhcxlsja26P96D/WcOq6VyhRj+FcTUBVxxQFopeGgtcyvTVBxgqWYdVqTL6O3hp4sj1Q40XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759219509; c=relaxed/simple;
	bh=4oQ1xzodR7GzcP5eBrGpfQr/k8de3TQl+VDbg0+sOTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DfW4Pwb/m71WPSP8dV7q2xYz/U/i2Ya3dqmqzWf7KE2JG5g1/XKcsDvMY9jwN3cqoA/4ZH2KmxpIbtD8P6jHd/DInMS8epgn5CxMZfjpXEmRRxWEVyoRy5azdz+OBLzYcLXkrisb5hM3t288WclnGFeLIVxQbi5UcEFTDmYuCZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/ujWrZ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0416DC4CEF0;
	Tue, 30 Sep 2025 08:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759219508;
	bh=4oQ1xzodR7GzcP5eBrGpfQr/k8de3TQl+VDbg0+sOTs=;
	h=Date:From:To:Cc:Subject:From;
	b=Q/ujWrZ0y9AQdNxKdK5UWdjTD+/pZicqMcFjftw6/H0/vddPUHUCs9cfKhevubtVu
	 zsN3cscKCWVbU9rk+jDriy593brqRsfLCg5JFfDDeYVsG/ZqKUo+ZHgiOpnQfdGFSl
	 EFphkPFvkfoM7cJkO6sy7yYgCIPTPavzyMuhDkxcFtxAnlXb+PH94+MLVArf9mRuDX
	 rP6uPrRkxcyz4t1+OP9tgqfrk1/r2EeGxsP01ryzSDNEhUiCIAbYG6bsQSH08E1mcq
	 eUHsJiJgRH54uoWQ+WW2ic6PAimdpaEWmbZnjgGjkDCU2pN7LiMwmVgst/tvlNox+x
	 acj3Nq5HMVljg==
Date: Tue, 30 Sep 2025 10:05:05 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.18-rc1
Message-ID: <aNuPMdKKx6CpBifi@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SZbxrp08UX8fUzFz"
Content-Disposition: inline


--SZbxrp08UX8fUzFz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0615f:

  Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.18-rc1

for you to fetch changes up to cb3005d4c490fe2489accd5408592683d705b455:

  i2c: i801: Add support for Intel Wildcat Lake-U (2025-09-28 00:45:53 +020=
0)

----------------------------------------------------------------
i2c-for-6.18-rc1

Mostly DT bindings additions this time because Andi was super busy and I
also could only partly cover it.

- new ids for qcom-cci, mt65xx, exynos5, apple, tegra20, k1, i801
- drop support for already removed S3C2410
- introduce and use fwnode_for_each_child_node_scoped()
- mmt65xx: improve write-then-read transactions
- k1: various fixes around bus errors and resets
- usual share of cleanups, minor improvements, PM fixes...

at24 updates

- add the compatible for Giantec GT24C256C to the device-tree bindings

----------------------------------------------------------------
Akhil R (2):
      dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256 I2C compatible
      i2c: tegra: Add Tegra256 support

AngeloGioacchino Del Regno (1):
      dt-bindings: i2c: i2c-mt65xx: Add MediaTek MT8196/6991 compatibles

Beno=C3=AEt Monin (2):
      i2c: designware: convert to dev_err_probe() on request IRQ error
      i2c: designware: use dev_err_probe() when probing platform device

Claudiu Beznea (1):
      i2c: core: Drop dev_pm_domain_detach() call

Denzeel Oliva (1):
      dt-bindings: i2c: exynos5: Add exynos990-hsi2c compatible

Heiner Kallweit (1):
      i2c: boardinfo: Annotate code used in init phase only

I Viswanath (1):
      i2c: mux: Simplify boolean assignment in i2c_mux_alloc

Igor Belwon (1):
      dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878 I2C

Ivaylo Ivanov (1):
      dt-bindings: i2c: exynos5: add samsung,exynos8890-hsi2c compatible

Janne Grunau (1):
      dt-bindings: i2c: apple,i2c: Add apple,t6020-i2c compatible

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Wildcat Lake-U

Jean-Fran=C3=A7ois Lessard (2):
      device property: Add scoped fwnode child node iterators
      i2c: core: Use fwnode_for_each_child_node_scoped()

Krzysztof Kozlowski (3):
      dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace cleanup in example
      i2c: s3c2410: Drop S3C2410 OF support
      dt-bindings: i2c: samsung,s3c2410-i2c: Drop S3C2410

Kunihiko Hayashi (2):
      i2c: designware: Fix clock issue when PM is disabled
      i2c: designware: Add disabling clocks when probe fails

Leilk.Liu (1):
      i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD

Loic Poulain (1):
      dt-bindings: i2c: qcom-cci: Document QCM2290 compatible

Manikanta Guntupalli (1):
      i2c: mux: pca9541: Use I2C adapter timeout value for arbitration time=
out

Troy Mitchell (5):
      i2c: spacemit: ensure bus release check runs when wait_bus_idle() fai=
ls
      i2c: spacemit: remove stop function to avoid bus error
      i2c: spacemit: disable SDA glitch fix to avoid restart delay
      i2c: spacemit: check SDA instead of SCL after bus reset
      i2c: spacemit: ensure SDA is released after bus reset

Wasim Nazir (1):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24C256C

Wenmeng Liu (1):
      dt-bindings: i2c: qcom-cci: Document sa8775p compatible

Wojciech Siudy (2):
      i2c: muxes: pca954x: Use reset controller only
      i2c: muxes: pca954x: Reset if (de)select fails

Wolfram Sang (3):
      Merge tag 'at24-updates-for-v6.18-rc1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/brgl/linux into i2c/for-mergewindow
      Merge branch 'i2c/immutable/scoped_fwnode_child' into i2c/for-mergewi=
ndow
      Merge tag 'i2c-host-6.18' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/andi.shyti/linux into i2c/for-mergewindow

Xichao Zhao (1):
      i2c: busses: Fix some spelling errors


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (2):
      (Rev.) dt-bindings: i2c: samsung,s3c2410-i2c: Drop S3C2410
      (Rev.) i2c: s3c2410: Drop S3C2410 OF support

Andy Shevchenko (4):
      (Rev.) i2c: designware: use dev_err_probe() when probing platform dev=
ice
      (Rev.) i2c: designware: convert to dev_err_probe() on request IRQ err=
or
      (Rev.) i2c: core: Use fwnode_for_each_child_node_scoped()
      (Rev.) device property: Add scoped fwnode child node iterators

AngeloGioacchino Del Regno (1):
      (Rev.) dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878 I2C

Aurelien Jarno (5):
      (Rev.) i2c: spacemit: ensure SDA is released after bus reset
      (Rev.) i2c: spacemit: check SDA instead of SCL after bus reset
      (Rev.) i2c: spacemit: disable SDA glitch fix to avoid restart delay
      (Rev.) i2c: spacemit: remove stop function to avoid bus error
      (Rev.) i2c: spacemit: ensure bus release check runs when wait_bus_idl=
e() fails

Bjorn Andersson (1):
      (Rev.) dt-bindings: i2c: qcom-cci: Document QCM2290 compatible

Bryan O'Donoghue (1):
      (Rev.) dt-bindings: i2c: qcom-cci: Document sa8775p compatible

Chen-Yu Tsai (1):
      (Rev.) i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD

Jarkko Nikula (1):
      (Test) i2c: designware: Fix clock issue when PM is disabled

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: exynos5: Add exynos990-hsi2c compatible
      (Rev.) dt-bindings: i2c: qcom-cci: Document QCM2290 compatible

Sakari Ailus (2):
      (Rev.) i2c: core: Use fwnode_for_each_child_node_scoped()
      (Rev.) device property: Add scoped fwnode child node iterators

Troy Mitchell (1):
      (Rev.) dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace cleanup in=
 example

Ulf Hansson (1):
      (Rev.) i2c: core: Drop dev_pm_domain_detach() call

 Documentation/devicetree/bindings/eeprom/at24.yaml |  1 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         | 27 ++++----
 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |  5 ++
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml        |  6 ++
 .../bindings/i2c/nvidia,tegra20-i2c.yaml           |  6 ++
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 24 +++++++-
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |  2 -
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  2 +-
 Documentation/i2c/busses/i2c-i801.rst              |  1 +
 drivers/i2c/busses/Kconfig                         |  1 +
 drivers/i2c/busses/i2c-designware-master.c         |  9 ++-
 drivers/i2c/busses/i2c-designware-platdrv.c        | 15 +++--
 drivers/i2c/busses/i2c-designware-slave.c          |  9 ++-
 drivers/i2c/busses/i2c-hix5hd2.c                   |  2 +-
 drivers/i2c/busses/i2c-i801.c                      |  3 +
 drivers/i2c/busses/i2c-k1.c                        | 71 ++++++++++++++----=
----
 drivers/i2c/busses/i2c-mt65xx.c                    | 17 +++---
 drivers/i2c/busses/i2c-s3c2410.c                   |  1 -
 drivers/i2c/busses/i2c-sprd.c                      |  2 +-
 drivers/i2c/busses/i2c-st.c                        |  2 +-
 drivers/i2c/busses/i2c-tegra.c                     | 26 ++++++++
 drivers/i2c/busses/i2c-viperboard.c                |  2 +-
 drivers/i2c/i2c-boardinfo.c                        |  4 +-
 drivers/i2c/i2c-core-base.c                        |  9 +--
 drivers/i2c/i2c-core-slave.c                       |  3 +-
 drivers/i2c/i2c-mux.c                              |  9 +--
 drivers/i2c/muxes/i2c-mux-pca9541.c                | 12 ++--
 drivers/i2c/muxes/i2c-mux-pca954x.c                | 50 ++++++++-------
 include/linux/i2c.h                                |  2 +-
 include/linux/property.h                           | 10 +++
 30 files changed, 218 insertions(+), 115 deletions(-)

--SZbxrp08UX8fUzFz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjbjzEACgkQFA3kzBSg
KbZ3Rw//YpmpW/xEJ6/UpHqGOwsZO1Gxh41p0r/0aTQ4cHWfeW1Z+vHRKvCGZf60
UcgblmuNhCubw68MNTuejNgU/yPNwHP+t8tQ96PzVenQ0zUgGC7vtA3cM5GNPJGb
j/0ic0tOkN7HibDpQshd1cG2WievRSC1R+ShKgknz/uDzKSzOQ3+YeaH3RUYIVtx
yhgOo9zevBO2jPJjKDBWN3Da06S9F3qvfsL7mQROhm6IQk9LDBx1it9WUQyyc04L
iHO8bTl1Kbi5EiJ4pjr6UOrURBkUq05YkXvtdW87MS4/phSlyzh62aDygVuUSnTa
dbqdsfvaCypcGIXeDNG60Zezo1pcxuKkFR8yGZajeA9KM/4EIXT2Qucn3DkG56LX
Q2lACeQbufRCxOWiG7ZGbhERuWtfbIf8VNV8QHClNwptSX7327cgyYqqv4TFJ/4h
yKspzHG9ktyBt7vWljOnszOoV4N9gbcyrAE22MYNH5F/MEbQCSG6awtFdjcyvPOB
29xR4292xCNh+TybPZoE7CuhxpMed/R3rEiMdNsyzTnnWDEF1Nas3In9AVg6VAq9
w7Z2UVpYOnqa/i24esJl3SMq6fOg5t1VyFRp6qTe1TpzjL8XbDSQIZLi+bNYWnxp
92qCo4gvC4496kzFTyA9IZcdMIXxgqTj8tQbbHUt2OTMN0Qg7Bs=
=1qXX
-----END PGP SIGNATURE-----

--SZbxrp08UX8fUzFz--

