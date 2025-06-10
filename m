Return-Path: <linux-i2c+bounces-11331-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1029AD3316
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 12:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D49FE18970F9
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 10:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067D528C5BC;
	Tue, 10 Jun 2025 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7YgoP1N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B628BAAC;
	Tue, 10 Jun 2025 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549798; cv=none; b=T9u7+6rSlrMq+k/8SoGR5nukRe2qDJEig/l0jJfXn88Us/bUGlhUxPRyS6PEoHERAc1qdQzaEk0PVclZzTlTvvZkb0XTmniCTF8TB3sFIomquP/fA3eeZgSqwW44g20LtIOXuJ5WTFR1t2E2QRf9U09yZsI3o0DruDO+9jGuDxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549798; c=relaxed/simple;
	bh=HAvFHEOvispX8DPp6QtygWA8UYJ0ghJPEtONhp225LE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hihv75dF9LF8j6Tq3QpjJih/+oa2fs6nMBt4lOfhcYtntqavItasr/nYWWOAwvq5Oc830d/oLBeSeIC//HuThOuNur1BrMsla7fGEeeQoL3ZhttW3WvRuYDe8L94K9oq2ouzUW8qPgy6rw0hRX2z8ZKOGrnLwoP1c/atbSHa9uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7YgoP1N; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749549797; x=1781085797;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HAvFHEOvispX8DPp6QtygWA8UYJ0ghJPEtONhp225LE=;
  b=F7YgoP1N4GiFC9bLaWxImg83AabzOaJ2+nmQxluhzaZa0UWHV0JQwxCM
   fd/dTKDPQ8stcuK2h312yTASZncUBUz4vVBoXB/0Aeq04ZTo8vNhRKoxZ
   rf78+0uvqnmeaug2kmUhi64dK92q8dDRuoQQ+zVrOWMoDl5j8GiNheZoc
   uApH1n1QGkCoBwINr3EHyJjPheyibgA0nHchjPYCm1pBZy6J/anGQP4CJ
   Qsve5uQ5zXgvPt3zRLYgzUKzwxGPGk0si3Y8BHvKgv1LHIHOJbWCOajB5
   Eso+Klpwq6LhWc0yd2KEydyT4vVpRG3x4S/ko89O3kovMTzzn3H8SUxWm
   A==;
X-CSE-ConnectionGUID: pJQsOXcgRCW2YTSAfqk+xg==
X-CSE-MsgGUID: CkDKd4HmRxqUmP0D0m9HVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69094507"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="69094507"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 03:03:16 -0700
X-CSE-ConnectionGUID: FTkkf9a7QRCvoGx9uHvArw==
X-CSE-MsgGUID: QROu3LpsR8KY0r0eyt2ypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147295260"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jun 2025 03:03:12 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>,
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
Subject: [PATCH v2 0/4] drm/xe: i2c support
Date: Tue, 10 Jun 2025 13:03:06 +0300
Message-ID: <20250610100311.2245871-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

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

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h       |  20 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h       |   1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h            |   2 +-
 drivers/gpu/drm/xe/regs/xe_regs.h           |   2 +
 drivers/gpu/drm/xe/xe_device.c              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |   4 +
 drivers/gpu/drm/xe/xe_i2c.c                 | 299 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h                 |  62 ++++
 drivers/gpu/drm/xe/xe_irq.c                 |   2 +
 drivers/gpu/drm/xe/xe_pm.c                  |   9 +
 drivers/gpu/drm/xe/xe_survivability_mode.c  |  23 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
 13 files changed, 433 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

-- 
2.47.2


