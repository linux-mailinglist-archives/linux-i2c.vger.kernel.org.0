Return-Path: <linux-i2c+bounces-11374-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6DDAD71E5
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 15:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 964ED3B7A67
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 13:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981C7248897;
	Thu, 12 Jun 2025 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X40HWt2T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE107248886;
	Thu, 12 Jun 2025 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734706; cv=none; b=kJ5t4cYmzdb5w0D+tbVVoTuOfmG4376Chp7oY36b7ciV+PXiMdaiHhKFZ4wCepvTUv1d4NAqTdG6Hai2vDyJ39naThnVLeeOBHJaWEPXI7tcRmA9P55vWZc1pDy0AFt3//skMJ+7hGIjWLD1nen7LJDZV+7fmL1VwnTZ4lxtpiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734706; c=relaxed/simple;
	bh=PE03ybUO1siwAH1xnzAolCmT6q0saDhmWXwQglTK9eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qS5Xtd41Jd4AcpIf0xwNib9UHcAmez/tsiQW4QXnzepXQNadlbhdMsFXDfUrZ3rTi/RQjwjSk9GgciPXi6KpxOW0g8sf13ZkByyDp2NCt+Lp6o9en8b38x6Z0rwNfXX0QxX+UX2tAHWWXO5gecKooJaq7um7+matvwqVgV511f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X40HWt2T; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749734705; x=1781270705;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PE03ybUO1siwAH1xnzAolCmT6q0saDhmWXwQglTK9eQ=;
  b=X40HWt2TISG42B35G2lIPBAJ4TQQIPj+q7TfmALRqKdIkpldIQ5Xxq9Z
   Kjf4+erI2WGhmA+BhNdTHH50g6pf6URmAlubNLeDHQzg9vIu+Ncewr+BY
   rkBbEOoJURv4LTx2Is5vR5xhm9Jh5EtdQZaTxZ14vmUBK80PRnFw09EPC
   Neq8Y7ljBT8s28daIlWnYqCAvC+pGI3Sl0Istv1Qvmguxj67T1xj2qe/M
   r9h4CHx9bCGGxcWxkaSoa9jTzKYxWt7cBZv5BpC+9PYawaT1p8Ak0kAv2
   jBKhD5SjGKrfhaSjxAtdrYZJ4RUqpx/x5ouV9ezRYE5pZZlyemG2O8QvB
   Q==;
X-CSE-ConnectionGUID: tu0CaEHWRtOhhKo02lwibg==
X-CSE-MsgGUID: tgRAB9XBSpqdJVzxfQckWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55588281"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="55588281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:24:57 -0700
X-CSE-ConnectionGUID: stVJxy4iRnumcrLTyc7oOA==
X-CSE-MsgGUID: qM/4mrX6R3WmoVSQ43q43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152509066"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Jun 2025 06:24:51 -0700
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
Subject: [PATCH v3 0/4] drm/xe: i2c support
Date: Thu, 12 Jun 2025 16:24:46 +0300
Message-ID: <20250612132450.3293248-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

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
 drivers/gpu/drm/xe/xe_i2c.c                 | 299 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h                 |  62 ++++
 drivers/gpu/drm/xe/xe_irq.c                 |   2 +
 drivers/gpu/drm/xe/xe_pm.c                  |   9 +
 drivers/gpu/drm/xe/xe_survivability_mode.c  |  23 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
 14 files changed, 434 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

-- 
2.47.2


