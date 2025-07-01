Return-Path: <linux-i2c+bounces-11724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F7FAEF847
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 14:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A762B4447CE
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 12:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3898C275105;
	Tue,  1 Jul 2025 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5takPFd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E845C2750EF;
	Tue,  1 Jul 2025 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372580; cv=none; b=XgnTbPTttNPt3crD47cztw4AP6xdB31+VCCWisHFevOl+uAxGGFXQtAlPqJzlBopLcWFsXYM6C14SZ1Y/FTHq3ZIYddmzMxHJ+3mxdNb8H6rS4N97hU4XpW1hzkD9Aynkqi+TbaVha1/g9OTUBKFEHQDlzhWfwZ6vjsVKPYoMok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372580; c=relaxed/simple;
	bh=Pk8XTvC6m8aWy9SCNK/idClWZ2ydB+F9rftUq3vUTac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LkwCWXDsQ9ahgUT0cu1qbfTp8OYZ4R4krL702OtIVUVL1sLOeX3+6OxB5mwAlCWk5jAbrbIE4IEz8T+WKhQDW1L9Qd6BoX9WrDxuRm5DaAxdP2IvUGXIGIAEk8yEd9w6B+o85IxcXr5Qfv7XKTi2UFvAhP/nIZ4L1qKvXApZzHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5takPFd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751372579; x=1782908579;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pk8XTvC6m8aWy9SCNK/idClWZ2ydB+F9rftUq3vUTac=;
  b=k5takPFdbqVW63TY6sMhJEEFSUTqXBEMDVh9GmA3/g27kUO7LZ3HKcF+
   ltzSiJxpxn5/gJlKZWWObOiBbHT64yuzMYbykfweHSWtS9SAVEOaqJ93o
   cOailg2AwDuJzOZmX8iy7WgbBofsXikf7uC4a8L6X7uMQDCWCY/f2NQAU
   YiiLKXkA9tiEqJv2dVGGlunKJY9bTpTyK7iyuivyP9tKMw4fK/CtBaZNQ
   E/Z6mY4t3aefKKiV06ldd4OiYxntEMbkiJxX8GtsSfTUWk4ZVOQsWVyBS
   QgZXQjMTIFlohLkjh/rB/TlbVEdqgVe1C1pS0YL4Ibf9n5uBSFcsZ9vnl
   w==;
X-CSE-ConnectionGUID: mkQm+tMQSPaSRto8qfHZhw==
X-CSE-MsgGUID: 7G8wiciZSF2gswQWQyWd+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71196697"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="71196697"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:22:58 -0700
X-CSE-ConnectionGUID: KYIYoOxQQrq+i7lF1qP9xg==
X-CSE-MsgGUID: AZplPiDWRiK6z4C6CNyR0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153157359"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 05:22:53 -0700
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
Subject: [PATCH v6 0/5] drm/xe: i2c support
Date: Tue,  1 Jul 2025 15:22:47 +0300
Message-ID: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

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
2.47.2


