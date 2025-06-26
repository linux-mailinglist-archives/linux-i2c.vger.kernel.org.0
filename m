Return-Path: <linux-i2c+bounces-11607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D9AE9F79
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 15:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A4F73A1ED4
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 13:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E392E718D;
	Thu, 26 Jun 2025 13:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6yVnnDu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06D328ECC0;
	Thu, 26 Jun 2025 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946177; cv=none; b=F6nBex3EM9Ael8iCV7Ge3aMoaijCgOQ39UoygHz1zvK18MiNvU7Y7LmsK//e0abe7J4eJ3FkesjrbFh6WPaPPYh2t0OUIQk58Z6DipMufyWFTVwmH17lbze0pcUrUZGED3RFLqMXMZKfZfkIR+2xeJurizC2wgQ/bb0T2wrVWn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946177; c=relaxed/simple;
	bh=4bTe33HNwDNdpF7xZ6t6fopoHMncX06V4KSWqXqFCtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bWvhNOMBbUtjRhnmmElAle3MgXZ2qQyjqC0WC7I891Eu0ioEIKHSLDHRKiz6KxcLLOm35EjyTl8xlQuyMLJSNHj5Wn2IxScinP+KC/YgwBUxtufRszoHpDBd786vumLmHjA8cWYAiWk+7/LPbr4tZ04cN0LhsqpI549v25R1zfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6yVnnDu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750946176; x=1782482176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4bTe33HNwDNdpF7xZ6t6fopoHMncX06V4KSWqXqFCtA=;
  b=g6yVnnDu5WsfHpxH90VqjdUweoBXlO/7TVT9UsYAG8fbsJXP9cTRkVTD
   lBrRL5A5yR6d2OS/VV88ZY/EOygrk8h0Tef1wJb1UDXwGRIZt+Lfg6q5s
   yYNy0Ds7R0c/RHVFlvuaoiRZ/d2FWiYx6EaWIf0seAGfzeaOTAVum/n3K
   PASmqR93ZmCIPmSkoB2h5yr2FmnWcfx+PoFfB+QJhg/3ofw3MN1gzzxIf
   WOHe6ssrun5xosnelDjIumXIQP2GYa7obH62hgeEFedMZL4N780ZJQEEf
   Jt1dBJ3PRtYUsFmA1BgDU77utbH17Upj+YSW2YyUsAXwtt/DlF1EhA2n7
   g==;
X-CSE-ConnectionGUID: X1bvFEkHS1SZOvzuU3yxHw==
X-CSE-MsgGUID: mT17RoKiSrSW3WGtwkuclg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53316380"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53316380"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:56:15 -0700
X-CSE-ConnectionGUID: E2+7CxyjRJebod23oDFikQ==
X-CSE-MsgGUID: z/osQlwIRCyQVaFcbklmiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152146945"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jun 2025 06:56:11 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] drm/xe: i2c support
Date: Thu, 26 Jun 2025 16:56:05 +0300
Message-ID: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

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

Heikki Krogerus (2):
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
 drivers/gpu/drm/xe/xe_i2c.c                 | 326 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h                 |  62 ++++
 drivers/gpu/drm/xe/xe_irq.c                 |   2 +
 drivers/gpu/drm/xe/xe_pm.c                  |   9 +
 drivers/gpu/drm/xe/xe_survivability_mode.c  |  23 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
 14 files changed, 461 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

-- 
2.47.2


