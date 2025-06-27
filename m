Return-Path: <linux-i2c+bounces-11662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61887AEB946
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 15:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 596011C4376E
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 13:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7543298997;
	Fri, 27 Jun 2025 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwo+nJFa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B818460;
	Fri, 27 Jun 2025 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032402; cv=none; b=WDy6z+9Q+6dgTB10K3ZEbRQXKcjsgIbYnNJMWSHzvSBc8/VXIzEJWS73heVqw1u5yz76vFYIJEZh1PgY1uypCDu9V7EkM4a576EARJuIdwPXA5Rz8h6q6wzF78a3RJ8LQOAjNIbIXgAryQsCZIfUY4Fr9g2KZ9+ii0yjJIZ5iZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032402; c=relaxed/simple;
	bh=hIfCzA9LPCdKztOP9omnMm8C39mc1mYxnlPAo8Dw8k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=emSRvlq2uSwI4DtbJzoK5n4j30uIT8ek/5UOF+pF4EMALgksRc2MSaUKOeqpqiy7PV0os+SfM4S8zh9uEVllcN0H1yRh/gMQF0SL8+RFWSArH5UaNJ0H+F4lNXw9vgjYIE3S3E+08CdKyO18jJ1RFEh7eV2kHuOdsUbP1gVUQpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwo+nJFa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751032401; x=1782568401;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hIfCzA9LPCdKztOP9omnMm8C39mc1mYxnlPAo8Dw8k0=;
  b=cwo+nJFa3OywmPTDIKYa/tM/Bh62D4y5ybXBudlcohn77yQw2/OSjMfI
   qJly0CexhUcNy+OBlLo9A6GmGlvDUW6eTqG8Pbi8w6D3NQY+VWcb+4Gkw
   Mg2pJe3DQjJ4+K7Wd4mKmuldsHLCpzAbjoYZQyq2CM79gVi96ZvZsZY1f
   ++T5FKMo3VJNelNoTJVrtJzzOa4H+yie07Ksku8mNKSZ0G+paNdDyC1pw
   ljVERH50IZZPuXPB30KmvE+v3ZGhG2J1P4plvvXy10vxTZu1LTtNG4dKO
   AbFjNkpTFGfw4NYMsZTwDvusV1dZAbv3DzgGpHObKTz6Vw0o0lOU2oo0e
   w==;
X-CSE-ConnectionGUID: CDXX5aeLR1WlcFzMT9ID2g==
X-CSE-MsgGUID: cvVI9nrSQzKusQpUnroKBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53207612"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53207612"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:53:20 -0700
X-CSE-ConnectionGUID: KjP8+POqTkybbQfFTT6QiQ==
X-CSE-MsgGUID: e5NaADACQ72ospIbDiFFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183708811"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 06:53:16 -0700
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
Subject: [PATCH v5 0/4] drm/xe: i2c support
Date: Fri, 27 Jun 2025 16:53:10 +0300
Message-ID: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

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
 drivers/gpu/drm/xe/xe_i2c.c                 | 329 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h                 |  62 ++++
 drivers/gpu/drm/xe/xe_irq.c                 |   2 +
 drivers/gpu/drm/xe/xe_pm.c                  |   9 +
 drivers/gpu/drm/xe/xe_survivability_mode.c  |  23 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
 14 files changed, 464 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

-- 
2.47.2


