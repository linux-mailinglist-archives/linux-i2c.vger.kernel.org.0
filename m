Return-Path: <linux-i2c+bounces-9981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E53A6CB41
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Mar 2025 16:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F7383A9CA5
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Mar 2025 15:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D577722A7E5;
	Sat, 22 Mar 2025 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mii7skaf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9128D42AB0;
	Sat, 22 Mar 2025 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742658320; cv=none; b=gCslY7sfH5BvlimUVF8vKFAFmQ9dWnrPvqmlcNmfqIi9hps+bfmYIyuLOOVa59aswKnkOsCzAfKKOoUdZJDXrbqzGzOEatEt9xdsEEmBwFrZTvNegJT6ln1xjTNmwkBixMouJx5O8cusZqjA3nNwEgbOrnpcjudRKYvjUztZWrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742658320; c=relaxed/simple;
	bh=rPhaAjrBVProX/Tp/3Q2wlMXbD6mPQ7JXg38zxTuaZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aZeURKNSXVJtXJYbDIdd/k/Cg6KmdEIQcKCARe8BcfnrR6iPzWB38V6a09zbsIUkbWeezB1Ld3vozA90PfIWT4A7ckPRbzzt58I2HzLtvoVCqYZFVkEy1yU7tL9w/6Mn4csH2G3YeSCYf3JhSbAz5PFuazwWlbUG+sGnpAZN88I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mii7skaf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D801EC4CEDD;
	Sat, 22 Mar 2025 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742658320;
	bh=rPhaAjrBVProX/Tp/3Q2wlMXbD6mPQ7JXg38zxTuaZg=;
	h=Date:From:To:Cc:Subject:From;
	b=Mii7skafZE12e2B2qidoWzFkkspsz5OU3RyCHSayCJwKYTKjWXOUEUk6VJe2+K697
	 RD4gyThWjFj11AvBrQPwRsgIv+OGy7sUG2mrJ+LTb8+uRtkhMxhQJr6wje5KmFMtBi
	 EeNqTtUBeIm3iPPH88Xfo2why1JCtfY0/S2pzb/qT0YE1svg5FOGIemts/SO/pw6Fa
	 fx1cct6nYpKprhgqb8mrVej2dhRWTBLkpddmkGMuduTmjRIkMQEmBficGvhJ8ejLUB
	 Av2TU4H7hBqhsaVIEn065OkMXppRcNkDpBospjJqPCW3EucsX2IDJDWnhdRLdVbWFr
	 lQbA6HuujPddA==
Date: Sat, 22 Mar 2025 16:45:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host for v6.15
Message-ID: <u2isvs32qv53rrkmhwqfex25zeegyb4slbelxk42hpfkun2ruv@274wvt44675k>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Here we go with the pull request for the merge window.

It's not a huge batch in terms of patch count, but a few pieces
of long standing work finally reached the finish line.

Some patches are refreshed from the past, something I plan to do
more often going forward.

One new driver was added: Spacemit K1.

Andy has also been very active, contributing the new
i2c_10bit_addr_*_from_msg() helper, which is now being adopted
across several drivers.

I don't think I've missed anything from the recent submissions,
and I'm happy to have caught up with the pending work. So I
don't expect the need for a part 2 pull request next week.

Thanks, and I wish you a great weekend!
Andi

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.15

for you to fetch changes up to 39f8d63804505222dccf265797c2d03de7f2d5b3:

  i2c: iproc: Refactor prototype and remove redundant error checks (2025-03-22 13:11:53 +0100)

----------------------------------------------------------------
i2c-host updates for v6.15

Refactoring and cleanups
 - octeon, cadence, i801, pasemi, mlxbf, bcm-iproc: general
   refactorings
 - octeon: remove 10-bit address support

Improvements
 - amd-asf: improved error handling
 - designware: use guard(mutex)
 - amd-asf, designware: update naming to follow latest specs
 - cadence: fix cleanup path in probe
 - i801: use MMIO and I/O mapping helpers to access registers
 - pxa: handle error after clk_prepare_enable

New features
 - added i2c_10bit_addr_*_from_msg() and updated multiple drivers
 - omap: added multiplexer state handling
 - qcom-geni: update frequency configuration
 - qup: introduce DMA usage policy

New hardware support
 - exynos: add support for Samsung exynos7870
 - k1: add support for spacemit k1 (new driver)
 - imx: add support for i.mx94 lpi2c
 - rk3x: add support for rk3562

Multiplexers
 - ltc4306, reg: fix assignment in platform_driver structure

----------------------------------------------------------------
Andi Shyti (1):
      i2c: k1: Initialize variable before use

Andy Shevchenko (11):
      i2c: Introduce i2c_10bit_addr_*_from_msg() helpers
      i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers
      i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers
      i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers
      i2c: mlxbf: Use readl_poll_timeout_atomic() for polling

Anindya Sundar Gayen (1):
      i2c: i2c-exynos5: fixed a spelling error

Arnd Bergmann (1):
      i2c: mux: remove incorrect of_match_ptr annotations

Aryan Srivastava (3):
      i2c: octeon: refactor common i2c operations
      i2c: octeon: fix return commenting
      i2c: octeon: remove 10-bit addressing support

Frank Li (1):
      dt-bindings: i2c: imx-lpi2c: add i.MX94 LPI2C

Heiner Kallweit (5):
      i2c: i801: Cosmetic improvements
      i2c: i801: Move i801_wait_intr and i801_wait_byte_done in the code
      i2c: i801: Improve too small kill wait time in i801_check_post
      i2c: i801: Switch to iomapped register access
      i2c: i801: Use MMIO if available

Jayesh Choudhary (2):
      dt-bindings: i2c: omap: Add mux-states property
      i2c: omap: Add support for setting mux

Kaustabh Chakraborty (2):
      dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c compatible
      dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatible

Kever Yang (1):
      dt-bindings: i2c: i2c-rk3x: Add rk3562 support

Manikanta Guntupalli (1):
      i2c: cadence: Move reset_control_assert after pm_runtime_set_suspended in probe error path

Michal Simek (1):
      i2c: cadence: Simplify using devm_clk_get_enabled()

Mukesh Kumar Savaliya (1):
      i2c: qcom-geni: Update i2c frequency table to match hardware guidance

Shyam Sundar S K (4):
      i2c: amd: Switch to guard(mutex)
      i2c: dw: Update the master_xfer callback name
      i2c: amd-asf: Modify callbacks of i2c_algorithm to align with the latest revision
      i2c: amd-asf: Set cmd variable when encountering an error

Stephan Gerhold (3):
      dt-bindings: i2c: qcom,i2c-qup: Document power-domains
      dt-bindings: i2c: qup: Document interconnects
      i2c: qup: Vote for interconnect bandwidth to DRAM

Sven Peter (1):
      i2c: pasemi: Add registers bits and switch to BIT()

Troy Mitchell (2):
      dt-bindings: i2c: spacemit: add support for K1 SoC
      i2c: spacemit: add support for SpacemiT K1 SoC

Vitalii Mordan (1):
      i2c: pxa: fix call balance of i2c->clk handling routines

Wentao Liang (1):
      i2c: iproc: Refactor prototype and remove redundant error checks

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml         |   1 +
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml       |   1 +
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml            |   1 +
 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml        |  14 +
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml |   1 +
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml     |  61 ++++
 Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml        |   6 +
 drivers/i2c/busses/Kconfig                                     |  18 ++
 drivers/i2c/busses/Makefile                                    |   1 +
 drivers/i2c/busses/i2c-amd-asf-plat.c                          |   8 +-
 drivers/i2c/busses/i2c-axxia.c                                 |  21 +-
 drivers/i2c/busses/i2c-bcm-iproc.c                             |  13 +-
 drivers/i2c/busses/i2c-bcm-kona.c                              |   6 +-
 drivers/i2c/busses/i2c-brcmstb.c                               |  11 +-
 drivers/i2c/busses/i2c-cadence.c                               |  19 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c                     |  26 +-
 drivers/i2c/busses/i2c-designware-master.c                     |   2 +-
 drivers/i2c/busses/i2c-eg20t.c                                 |  28 +-
 drivers/i2c/busses/i2c-exynos5.c                               |   2 +-
 drivers/i2c/busses/i2c-i801.c                                  | 271 +++++++++--------
 drivers/i2c/busses/i2c-ibm_iic.c                               |  14 +-
 drivers/i2c/busses/i2c-k1.c                                    | 602 ++++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-kempld.c                                |  10 +-
 drivers/i2c/busses/i2c-mlxbf.c                                 | 106 ++-----
 drivers/i2c/busses/i2c-mt7621.c                                |  20 +-
 drivers/i2c/busses/i2c-mv64xxx.c                               |  12 +-
 drivers/i2c/busses/i2c-octeon-core.c                           | 111 ++++---
 drivers/i2c/busses/i2c-omap.c                                  |  22 ++
 drivers/i2c/busses/i2c-pasemi-core.c                           |  40 ++-
 drivers/i2c/busses/i2c-pxa.c                                   |   5 +-
 drivers/i2c/busses/i2c-qcom-geni.c                             |   6 +-
 drivers/i2c/busses/i2c-qup.c                                   |  36 +++
 drivers/i2c/busses/i2c-rzv2m.c                                 |  15 +-
 drivers/i2c/muxes/i2c-mux-ltc4306.c                            |   2 +-
 drivers/i2c/muxes/i2c-mux-reg.c                                |   2 +-
 include/linux/i2c.h                                            |  15 +
 36 files changed, 1090 insertions(+), 439 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-k1.c

