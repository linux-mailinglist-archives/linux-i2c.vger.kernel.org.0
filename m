Return-Path: <linux-i2c+bounces-11163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF57AC9156
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F9511C057F6
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C538F22FF2E;
	Fri, 30 May 2025 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfUPmghU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0423522F16C;
	Fri, 30 May 2025 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614674; cv=none; b=FstjnAfcPED1P6ogtdSfDYTfjT6PB8ix/QWT/rLxlRjx6CUgXYgO/J/qzQQw94AXqtBeWfiIuVBSipFdDbDV4/jWMt4czFyPjX1bccW0fCZIXvmnKWKxvLcOIMnF4z0EmA9aDL8pyh/1WB/UhohcXjOFK1pUEf/cx+cX1UXOfZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614674; c=relaxed/simple;
	bh=XhnVt0QnfEI5gIUVP3wWJDi899FVeshy3p4Ui1JgNmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6nJOGkFrrS/vOpNLHiqfcrAH71L5IWxDa22sXbrKpfOfsW4BX7C/vkZ4i8iDEqvxIyc5ErjvzXDyFlHalOGyTOh7tRckfywcfNCwdqlVL2QRvmbZ2r8htAEM8AqGFhAnMS66c05bUVii00eWVJG3oKRS5syipVZWIolKvSYepg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfUPmghU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748614670; x=1780150670;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XhnVt0QnfEI5gIUVP3wWJDi899FVeshy3p4Ui1JgNmA=;
  b=cfUPmghUj8zobHkiS3OWIaew+hWPZrgBbMxX0s9TAV5LU0bGrtJtt2cg
   Xr3YmbEZiUHx5yqPIQrXRNgf76gg9OgWwdBTbqjrbO85PWcoOPsVM0Waq
   xSUMQj3SDJ9d++VCu5J1wV0WuFvjW2N6arsJTtIbO2X7TMbiVfEXdVJdr
   Hp1BLyWFnyk6Zo2ACViWhg88zZAyX6QXa8DJ8JWClyR99yCHJPY3dVRCp
   KZ2DJYNoyzXhOpzHHUUEVYBQbOFQ7Py5ZlphPawmWR9py8A+YjMDXjKD9
   SZyfDBuoyEph9UdE1hzZcBLvhJk3IU8C638YAIJEqU91JCVut2NoQjw1Z
   g==;
X-CSE-ConnectionGUID: 1qz+MbXsQfusX9KWglJgFw==
X-CSE-MsgGUID: ztdfuPZHQEyHcsZmlmWpYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="53339229"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="53339229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 07:17:49 -0700
X-CSE-ConnectionGUID: 6uoBg92/RW+QSNuKEY3qAg==
X-CSE-MsgGUID: fQMZyfYTQym9V3XRiV1JZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144222531"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 30 May 2025 07:17:45 -0700
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
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] drm/xe: i2c support
Date: Fri, 30 May 2025 17:17:42 +0300
Message-ID: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Some of the future "data center GPUs" will provide access to the
on-board Synopsys DesignWare I2C host adapter. The i2c is used to
connect various microcontrollers. The initially supported
microcontroller unit is called Add-In Management Controller (AMC).

Thanks,

Heikki Krogerus (2):
  i2c: designware: Add quirk for Intel Xe
  drm/xe: Support for I2C attached MCUs

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h       |  16 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h       |   1 +
 drivers/gpu/drm/xe/xe_device.c              |   3 +
 drivers/gpu/drm/xe/xe_device_types.h        |   4 +
 drivers/gpu/drm/xe/xe_i2c.c                 | 270 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h                 |  60 +++++
 drivers/gpu/drm/xe/xe_irq.c                 |   2 +
 drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
 9 files changed, 369 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

-- 
2.47.2


