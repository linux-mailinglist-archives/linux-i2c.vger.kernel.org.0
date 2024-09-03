Return-Path: <linux-i2c+bounces-6028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9396A05C
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11A5DB24A7E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 14:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D3D13D245;
	Tue,  3 Sep 2024 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CleTK0i1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7B57581A;
	Tue,  3 Sep 2024 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373517; cv=none; b=CZ/HeLu91iutTiu1Bvl1bYbo3+LVI0W5s+WfNj4MXcoeYC0rj6iH08PqWcaZnttbi3zzSPjf4LH/krgl6xILlFQTPS7axEdO3j1uVjgCJARq9CwMG0otuEo47Lx4iDR2E5s+crJj2GAyAgsqBPZ25rHcDRF9E/vp5AMInuXc6dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373517; c=relaxed/simple;
	bh=8oF38+wcTyCFFLJNltFe9UX5N5NexPR+hPC1BNLasBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SfDfIgHte1kDPJyjutcng91fhjtLjPDDBdd6A5T6f7mCZmeB44yk5DzTvlGErOJN26JiLYLT+DLxKpu4iMVu3SRY3w4343k3NW8YIRM4rQUdGn57vCgCtEueVCFVvH+wFkRI4yVFSbnPS5b86wkX0kwhe3l/59dHYkVVJ7YSIKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CleTK0i1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373515; x=1756909515;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8oF38+wcTyCFFLJNltFe9UX5N5NexPR+hPC1BNLasBQ=;
  b=CleTK0i1pwGISF7KsbHEH/bGdmO51AvQNELxQ5AL0XaJFJd1GTIbIByn
   CtFhQzWUpmUG43tGhulsoAjEcOjEV+Jrc8fE9kenpnuV/VSciYMTV/HNI
   c5NnNyPig5iORBFc/KirsxhIkzvmur/6m6Ce2AiRgveoEly6U90ftLiod
   v+1BuLCZv8kjdcG/n3GOyeObOIdd2/zZzD0U8LCbHmP9fL0HIawg5TXGo
   sUz58gvBj7rvFhcVA7X0Q44sn3W9Tz/Bf691NNoBKJHR+cpJG7Ze7UCaa
   lEzfvMgyLQXPg5O4VVvGY/1rnz/xel8d5yX7OrgayXJw/l5nTbS2S1lSp
   g==;
X-CSE-ConnectionGUID: O5lyGBRKQMCfAxlmyXSdwQ==
X-CSE-MsgGUID: 9pW7PLqHRCyvZnkmhAwMNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541263"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541263"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:14 -0700
X-CSE-ConnectionGUID: rb+5gYZhQFG9CNAs2BREDQ==
X-CSE-MsgGUID: 3n4/huujQW21hYevl0+/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658762"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:07 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	UNGLinuxDriver@microchip.com,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v2 0/7] i2c: designware: Group all DesignWare drivers under a single option
Date: Tue,  3 Sep 2024 17:24:59 +0300
Message-ID: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi guys,

This is a proposal for Kconfig improvement regarding the Synopsys
DesignWare I2C adapter driver.

Changes since v1:

There was one driver that selects I2C_DESIGNWARE_PLATFORM in its
Kconfig which causes an error because I2C_DESIGNWARE_CORE is not
selected.

The drivers Kconfig I'm proposing that we fix by using "depends on"
instead of "select". There are also a number of defconfigs that enable
I2C_DESIGNWARE_PLATFORM that now need to enable I2C_DESIGNWARE_CORE.

The original patch:
https://lore.kernel.org/linux-i2c/20240830111222.2131172-1-heikki.krogerus@linux.intel.com/

thanks,

Heikki Krogerus (7):
  ARC: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
  ARM: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
  arm64: defconfig: enable I2C_DESIGNWARE_CORE with
    I2C_DESIGNWARE_PLATFORM
  mips: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
  RISC-V: configs: enable I2C_DESIGNWARE_CORE with
    I2C_DESIGNWARE_PLATFORM
  net: txgbe: Fix I2C Kconfig dependencies
  i2c: designware: Group all DesignWare drivers under a single option

 arch/arc/configs/axs101_defconfig             |  1 +
 arch/arc/configs/axs103_defconfig             |  1 +
 arch/arc/configs/axs103_smp_defconfig         |  1 +
 arch/arc/configs/tb10x_defconfig              |  1 +
 arch/arm/configs/hisi_defconfig               |  1 +
 arch/arm/configs/multi_v7_defconfig           |  1 +
 arch/arm/configs/pxa_defconfig                |  1 +
 arch/arm/configs/socfpga_defconfig            |  1 +
 arch/arm/configs/spear13xx_defconfig          |  1 +
 arch/arm/configs/spear3xx_defconfig           |  1 +
 arch/arm/configs/spear6xx_defconfig           |  1 +
 arch/arm64/configs/defconfig                  |  1 +
 arch/mips/configs/generic/board-ocelot.config |  1 +
 arch/riscv/configs/defconfig                  |  1 +
 arch/riscv/configs/nommu_k210_defconfig       |  1 +
 .../riscv/configs/nommu_k210_sdcard_defconfig |  1 +
 drivers/i2c/busses/Kconfig                    | 29 ++++++++++++-------
 drivers/net/ethernet/wangxun/Kconfig          |  3 +-
 18 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.45.2


