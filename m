Return-Path: <linux-i2c+bounces-14470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92340CABDA6
	for <lists+linux-i2c@lfdr.de>; Mon, 08 Dec 2025 03:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B45253003F87
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Dec 2025 02:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B0E23E346;
	Mon,  8 Dec 2025 02:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIwDSLfW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF58B1DFF0;
	Mon,  8 Dec 2025 02:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765161182; cv=none; b=b4UvmYbLSzOQ38YIVvfDb2ayB6xKMfz4vRr+wKpG3qr6uxVfx6OalVyTGPsPu4yWLj/3Cc2PBxORLEkE+Dqi2N+hIGtotsqWGyuaYZvXQC2akNcMGRjjo9CdokpC5LgtFpLWR7FHhbyjDBXQlszTlH2yRlnVKGDvq7OovB6Urhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765161182; c=relaxed/simple;
	bh=t6IxQskNZsQUWl+3k+rBKd03DLAz8nw5rjgEHaSd7RE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i+e12w10t3rAAAMok8WDVxIK4oF0TN2vvuO29BvlUg4mX54Xn8TWEifCEVRKc/6EVbqEwsPA92HsIm0y5V+zLuqC6mmYbVEU5jyydfX03nxTvEddKWejaVkBy8CTcnynVAGi8sO2GK7M1nWLBuQwnbnYFkp2k3r9FU5+rTX13zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIwDSLfW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7EFC4CEFB;
	Mon,  8 Dec 2025 02:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765161181;
	bh=t6IxQskNZsQUWl+3k+rBKd03DLAz8nw5rjgEHaSd7RE=;
	h=Date:From:To:Cc:Subject:From;
	b=mIwDSLfWTJwoBYQsTNWCz7UVWgMGWe+sAReHc9k0HWTqRrbOUtEswU4DcQCP2Ktjb
	 7O3R+iGKZW9YM2B9tf3bsTWuH1O+acTJBiucL03zNux8O/X6SiizCJ8UOFL7pT9rO1
	 XykgiIN+hOvsBeDR9H1jEJxbsI8U2ZsB1WxLAYoJtasCxRr8E7QC+kYctFNSouHhbI
	 g3gRkO1uUhQuxHbUeXmhKfozIGRCEha7iLNivHgRfpDmfW4dkvpk4R2nvhmnZ6//YP
	 uDM0c5qvavhXxkat0V2cUcSo9FnLPaYlwkSPnYUQmLTzYAPJmCrS7GbPInOQFpFOIX
	 V9xjK8MnzZBXQ==
Date: Mon, 8 Dec 2025 03:32:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL v2] i2c-host for v6.19
Message-ID: <7cpbbfziaj7ez2yi7n2xs6jzyj6w52yp274x5xd742ww3clpov@3mkcm4lmozhy>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

as you requested, I restored from my original reflog the state
prior to the rebase on top of v6.18.

I therefore removed the patches I applied last week, except for
two fixes that I cherry-picked. The one from Ma Ke, with a tiny
change in the commit title in this version, has been in my fixes
branch since rc3. The one from Troy was applied last week last
Wednesday.

If you are still available for a part 2, I already have something
ready to be pulled.

Thank you, and sorry for this messy request,
Andi

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.19-v2

for you to fetch changes up to 25faa5364638b86ec0d0edb4486daa9d40a0be8f:

  i2c: spacemit: fix detect issue (2025-12-08 03:11:57 +0100)

----------------------------------------------------------------
i2c-host for v6.19

- general cleanups in bcm2835, designware, pcf8584, and stm32
- amd-mp2: fix device refcount
- designware: avoid interrupt storms caused by bad firmware
- i801: fix supported features
- spacemit: fix device detection failures

New device support:
- Intel Diamond Rapids
- Rockchip RK3506
- Qualcomm Kaanapali, MSM8953

----------------------------------------------------------------
Brian Masney (1):
      i2c: busses: bcm2835: convert from round_rate() to determine_rate()

Cezar Chiru (5):
      i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
      i2c: pcf8584: Fix do not use assignment inside if conditional
      i2c: pcf8584: Move 'ret' variable inside for loop, goto out if ret < 0.
      i2c: pcf8584: Make pcf_doAddress() function void
      i2c: pcf8584: Change pcf_doAdress() to pcf_send_address()

Hangxiang Ma (1):
      dt-bindings: i2c: qcom-cci: Document Kaanapali compatible

Heikki Krogerus (1):
      i2c: i801: Fix the Intel Diamond Rapids features

Heiko Stuebner (1):
      dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3506

Jinhui Guo (1):
      i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware

Luca Weiss (1):
      dt-bindings: i2c: qcom-cci: Document msm8953 compatible

Ma Ke (1):
      i2c: amd-mp2: fix reference leak in MP2 PCI device

Markus Elfring (2):
      i2c: designware: Omit a variable reassignment in dw_i2c_plat_probe()
      i2c: stm32: Omit two variable reassignments in stm32_i2c_dma_request()

Nathan Chancellor (1):
      i2c: designware: Remove i2c_dw_remove_lock_support()

Troy Mitchell (1):
      i2c: spacemit: fix detect issue

Zeng Guang (1):
      i2c: i801: Add support for Intel Diamond Rapids

 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml     |   1 +
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml |   4 +++
 Documentation/i2c/busses/i2c-i801.rst                   |   1 +
 drivers/i2c/algos/i2c-algo-pcf.c                        | 105 ++++++++++++++++++----------------------------------------------------------
 drivers/i2c/busses/Kconfig                              |   1 +
 drivers/i2c/busses/i2c-amd-mp2-pci.c                    |   5 +++-
 drivers/i2c/busses/i2c-bcm2835.c                        |  12 +++++----
 drivers/i2c/busses/i2c-designware-core.h                |   2 +-
 drivers/i2c/busses/i2c-designware-master.c              |   7 ++++++
 drivers/i2c/busses/i2c-designware-platdrv.c             |  13 +---------
 drivers/i2c/busses/i2c-i801.c                           |   3 +++
 drivers/i2c/busses/i2c-k1.c                             |  19 +++++++++-----
 drivers/i2c/busses/i2c-stm32.c                          |   7 +++---
 13 files changed, 71 insertions(+), 109 deletions(-)

