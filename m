Return-Path: <linux-i2c+bounces-11889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFD2AFFAAD
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 09:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF42A3BC754
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 07:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9088B288C27;
	Thu, 10 Jul 2025 07:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6kZC78V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79478F5E;
	Thu, 10 Jul 2025 07:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752131981; cv=none; b=m6auedXwcjQQsy22rJ6dtDVWcepXhD/ilp++DzfQxLx1SmS/8SE05f41sF0gU01creQW600FVrl7CdkjGV0cBagKD+qX9N2uAA0R4jOQv6n+uYUUm/aLKIXLG318mXJ2E4KU+vFE6UG/2qtwY9aTrrLDn7zH9QoZICQJVePzNFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752131981; c=relaxed/simple;
	bh=sTj8F07ltYz+pOqSRXp3fqHxLiNdJSBXIcxMIWwOzZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G68pCgrkCwOtnKuQY15Jg/3lYzRGB2BulfP6Wyot8wNEQr+l8btCU13xscz9Q9vR63LzPZVl8wVRn2RcrRU75j3wF1feo8xbmglto1FvoULSnX0KTakQDqa3AQ5z58Co/KoMaoW/dLZzDL/AkeZhQvLI1yn+dWBfjPESwCROxCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6kZC78V; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752131980; x=1783667980;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sTj8F07ltYz+pOqSRXp3fqHxLiNdJSBXIcxMIWwOzZQ=;
  b=M6kZC78V/HyW/ewuIpsr6Sb7fAblmwGku4hd0QpFxLTd/NGzXyqRRr2C
   ZVsO1uXjjGu/NnPxpddl2ClbE3MT5+n0NS3I41n+BevYqPYr8QoGeX3Tb
   Ie7DhLzav4czUtOkqoa60nJWhAh7UIPR5XIOv+d4waO3DDXEbU3ORqVvV
   ckv2FEuBOwO6+SL9/T0RDXTuQWKVT9Dm9yll5AkOxXgZ13KM4gEXUxEBs
   NLXFRVz66BrqC8swBm8SS8Ic+n3USbU4guaatF6/R/125JEAB11/oaS1Y
   +1zL2CdkjD010ULB/0mLWx9+5yB9ewmNa87p2uw6VkuLa63495+xSh12n
   A==;
X-CSE-ConnectionGUID: 5ziamEVUQTKWcreo2QifkQ==
X-CSE-MsgGUID: EaLviHqRTg6o9ieH0ueMwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54256665"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54256665"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:19:39 -0700
X-CSE-ConnectionGUID: 680oKYe2TZiGAqUL3CWdPQ==
X-CSE-MsgGUID: DfopCRj9Qj6QmkluSWyU2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160323923"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 00:19:34 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: jarkko.nikula@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org,
	raag.jadav@intel.com,
	riana.tauro@intel.com,
	srinivasa.adatrao@intel.com,
	michael.j.ruhl@intel.com,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/5] drm/xe: i2c support
Date: Thu, 10 Jul 2025 12:46:07 +0530
Message-Id: <20250710071612.2714990-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On behalf of Heikki, since he's on vacation.

Changed since v6:
- Fix SPDX checkpatch warning.

Changed since v5:
- The modification to the dw_i2c_plat_probe() is split into its own
  patch as proposed by Andi.
- I removed completely the comment from the last patch in the series
  ("drm/xe/xe_i2c: Add support for i2c in survivability mode").

Changed since v4:
- Cleanups requested by Andy.
- Casting the PCI power modes to make sparse happy - Raag.
- Limiting the use of this thing to Battlemage again. But I'm not sure
  if this is the correct thing to do.

Changed since v3:
- Cleanups as requested by Rodrigo.
- The licence is now changed, but still need confirmation for it!

Changed since v2:
- Added dependency on regmap when i2c is enabled.

Changed since v1:
- Now rebased on top of drm-tip.
- No longer ignoring errors from xe_i2c_probe().
- Cleanups pointed out by Lucas.

I've also included followup patches from Raag and Riana to this
series.

Original cover letter:

Some of the future GPUs will provide access to the on-board Synopsys
DesignWare I2C host adapter. The i2c is used to connect various
microcontrollers. The initially supported microcontroller unit is
called Add-In Management Controller (AMC).

Thanks,

Heikki Krogerus (3):
  i2c: designware: Use polling by default when there is no irq resource
  i2c: designware: Add quirk for Intel Xe
  drm/xe: Support for I2C attached MCUs

Raag Jadav (1):
  drm/xe/pm: Wire up suspend/resume for I2C controller

Riana Tauro (1):
  drm/xe/xe_i2c: Add support for i2c in survivability mode

 drivers/gpu/drm/xe/Kconfig                  |   1 +
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h       |  20 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h       |   1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h            |   2 +-
 drivers/gpu/drm/xe/regs/xe_regs.h           |   2 +
 drivers/gpu/drm/xe/xe_device.c              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |   4 +
 drivers/gpu/drm/xe/xe_i2c.c                 | 329 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h                 |  62 ++++
 drivers/gpu/drm/xe/xe_irq.c                 |   2 +
 drivers/gpu/drm/xe/xe_pm.c                  |   9 +
 drivers/gpu/drm/xe/xe_survivability_mode.c  |  19 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
 14 files changed, 460 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

-- 
2.34.1


