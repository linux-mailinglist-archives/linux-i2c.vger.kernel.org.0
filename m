Return-Path: <linux-i2c+bounces-14408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3111CA5B1E
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 00:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C22BB309DF0C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 23:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDF71A9FAF;
	Thu,  4 Dec 2025 23:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqxJIHBr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426BC4A32;
	Thu,  4 Dec 2025 23:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764891362; cv=none; b=mK4nfQTqtMEbROJEyXaSXhnAeCvwtbHhzeK+mb+WABPTWqiUfUwPGgES+3HUlDD3BHW70X9l3pRxBaor9zd2REneXtnc4Pd7rEWwRBmlJfNytysoG9S3+sKf2tQjt6JRIt1hLBkdIbCQ+TFGc7/dyTUmJ2L2rVnF7Las7pXksK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764891362; c=relaxed/simple;
	bh=b74pXgNzZn9zE7QB0zAZNdhThx4g3GyKfQZGYLNmCVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTwuUQgnHYk8Q2O+LZ8q2B1bh5x/WnIeWJ8qlgeUpNLpY6fF4RSoVslDTrhsuwyTNKU9YHzDHM/Uv1Q57c/TSuz5avuumPyubHmXKe2cz0amHqmq4wQG+llhyWM7zUEn5YXLO3PVUcVmf5LjpBe5Jb1RyXVTT8bdIn1a0iMEk9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqxJIHBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45486C4CEFB;
	Thu,  4 Dec 2025 23:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764891361;
	bh=b74pXgNzZn9zE7QB0zAZNdhThx4g3GyKfQZGYLNmCVE=;
	h=Date:From:To:Cc:Subject:From;
	b=BqxJIHBr3h+KKbJWS4XIm0xkIlGFF5dIgn2+FrXqBRCleYzewEGcTwJu0ttBtPQSh
	 QdpauWXSnRtUuSACtfkdciryEpm2cVzynGyO2ZTK3gGZuA972S0MKrKZhs4NUwqwEE
	 UWMvUgupuvjtqjob6nce8vH0C1IBh601ky5MWTENrnyFlnl23Xe7pUEs8MngCq5dRU
	 /EnMPGxf8eRhNZ3Je2d1A97nRpgb6sOtCabExy8EGEf0ccDl8krD+Phk9lzXnShHTi
	 adyvD67SW5w3Eylc2OQMxu3n61LPLtsq1+Zsl3GIyuNhpivG60hOKv1zRCvVxVUxmF
	 JdmH1YbodJxUw==
Date: Fri, 5 Dec 2025 00:35:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: i2c-host for v6.18
Message-ID: <zzuyemsikzpbntvmgxm2fu7p4vs7uwkawyd5rd732p5ralx2fg@wnqvjg2mi7vu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

here is the pull request for this cycle. I was hoping it would be
more substantial, but I ran into a nasty issue with my gpg setup
that blocked me from pushing to kernel.org for several weeks. The
kernel.org helpdesk helped me sort it out, but unfortunately a
bit too late, so this is all I managed to gather in time.

I am sorry for the disruption. I will set up a backup solution so
that I can avoid this problem in the future.

Thanks and I wish you a great weekend,
Andi

The following changes since commit 7d0a66e4bb9081d75c82ec4957c50034cb0ea449:

  Linux 6.18 (2025-11-30 14:42:10 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.19

for you to fetch changes up to 362e391005a98827a2d98b63f1e9001dd592bc63:

  dt-bindings: i2c: qcom-cci: Document SM8750 compatible (2025-12-03 21:50:26 +0100)

----------------------------------------------------------------
i2c-host for v6.19

- general cleanups in bcmi2835, designware, pcf8584 and stm32
- amd-mp2: fix device refcount
- bcm, pxa, rcar: fix void-pointer-to-enum-cast warning
- designware: avoid interrupt storms caused by bad firmware
- designware: use dedicated xfer function for AMD NAVI
- i801: fix supported features
- spacemit: fix device detection failures

New device support:
- Intel Diamond Rapids and Nova Lake-S (i801)
- Mobileye
- Rockchip RK3506
- Qualcomm Kaanapali, MSM8953 and SM8750

----------------------------------------------------------------
Benoît Monin (4):
      dt-bindings: i2c: dw: Add Mobileye I2C controllers
      i2c: designware: Optimize flag reading in i2c_dw_read()
      i2c: designware: Sort compatible strings in alphabetical order
      i2c: designware: Add dedicated algorithm for AMD NAVI

Brian Masney (1):
      i2c: busses: bcm2835: convert from round_rate() to determine_rate()

Cezar Chiru (5):
      i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
      i2c: pcf8584: Fix do not use assignment inside if conditional
      i2c: pcf8584: Move 'ret' variable inside for loop, goto out if ret < 0.
      i2c: pcf8584: Make pcf_doAddress() function void
      i2c: pcf8584: Change pcf_doAdress() to pcf_send_address()

Hangxiang Ma (2):
      dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
      dt-bindings: i2c: qcom-cci: Document SM8750 compatible

Heikki Krogerus (1):
      i2c: i801: Fix the Intel Diamond Rapids features

Heiko Stuebner (1):
      dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3506

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Nova Lake-S

Jinhui Guo (1):
      i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware

Krzysztof Kozlowski (3):
      i2c: bcm-iproc: Fix Wvoid-pointer-to-enum-cast warning
      i2c: pxa: Fix Wvoid-pointer-to-enum-cast warning
      i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning

Luca Weiss (1):
      dt-bindings: i2c: qcom-cci: Document msm8953 compatible

Ma Ke (1):
      i2c: fix reference leak in MP2 PCI device

Markus Elfring (2):
      i2c: designware: Omit a variable reassignment in dw_i2c_plat_probe()
      i2c: stm32: Omit two variable reassignments in stm32_i2c_dma_request()

Nathan Chancellor (1):
      i2c: designware: Remove i2c_dw_remove_lock_support()

Troy Mitchell (1):
      i2c: spacemit: fix detect issue

Zeng Guang (1):
      i2c: i801: Add support for Intel Diamond Rapids

 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml            |   1 +
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml        |   6 ++++
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml |   7 +++++
 Documentation/i2c/busses/i2c-i801.rst                          |   2 ++
 drivers/i2c/algos/i2c-algo-pcf.c                               | 105 +++++++++++++++++----------------------------------------------------
 drivers/i2c/busses/Kconfig                                     |   2 ++
 drivers/i2c/busses/i2c-amd-mp2-pci.c                           |   5 +++-
 drivers/i2c/busses/i2c-bcm-iproc.c                             |   3 +-
 drivers/i2c/busses/i2c-bcm2835.c                               |  12 ++++----
 drivers/i2c/busses/i2c-designware-core.h                       |   2 +-
 drivers/i2c/busses/i2c-designware-master.c                     |  34 +++++++++++++++--------
 drivers/i2c/busses/i2c-designware-platdrv.c                    |  17 ++----------
 drivers/i2c/busses/i2c-i801.c                                  |   6 ++++
 drivers/i2c/busses/i2c-k1.c                                    |  19 +++++++++----
 drivers/i2c/busses/i2c-pxa.c                                   |   2 +-
 drivers/i2c/busses/i2c-rcar.c                                  |   2 +-
 drivers/i2c/busses/i2c-stm32.c                                 |   7 ++---
 17 files changed, 105 insertions(+), 127 deletions(-)

