Return-Path: <linux-i2c+bounces-1550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8CE84419F
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 15:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 228C11F21781
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 14:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6EA80BFD;
	Wed, 31 Jan 2024 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsxI40cT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EB9762DD
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706710621; cv=none; b=Joau/LD+I8Tfaj77RjwKKThYPwcxsWlPk30kY7h6XuAY3PyEEtQRtlWAKaCCt5qEWhaiZDIxgOboWYEiDQMkjq1h58zZqM1BWwFwDyZj0IAWHdY9xy/bcFq6EZ2DTrIwPewN9Wz4J/EqkLDeB1I7y781i+iEFqxtS8/yaF9/KjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706710621; c=relaxed/simple;
	bh=tU9/SHGk2ZDMt/a8WPPR470tVOmWwuUydl3yAKHd9nM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UMViDBxIup9yhTIQlBrZbsv82nUeREAnoyDnJao3qfs3Z98ufgJnVIPWkomwHZONVRwxI7a8pVSftoNpdbji/kmuPMQdSPacVx20z/aj1xXaMUxuaI1iCG4R5tMYTAlPoNv28VavPdAngTLOCaMKwt3GWMh1u9bQVljh167MvRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsxI40cT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706710621; x=1738246621;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tU9/SHGk2ZDMt/a8WPPR470tVOmWwuUydl3yAKHd9nM=;
  b=OsxI40cTmm9hlfL1pX8Hb+LpveHyomux7OquJlDSv2oMplDfHziU9pTs
   AunEtUVMyiEiIgDYtQVg2bBDvWuVP/jdCRFQfK/HTSz2aGubjJVttQ3a0
   pVlEmv4jjK1Vi8me9kw6W9iHlOsNaNtJ2+J6FXLaCg9mnXV2dd7ZkrL7z
   ZjUuEelHkKmUxgFVBDDDb1AmA27Q5kO06BDHjCsZESHm2q9jT2Hz1V9Fp
   +lkwkqAVLZdr1sCaiovENUvyYihUTinJpvK82oqeYGavFMOXQldKigpqI
   6COv1PXVOQL7qOvWbO4hNTYTCN/N3NyHvd3RNcTshOTij7d+01itkJVik
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3460418"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3460418"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 06:17:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788591835"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="788591835"
Received: from unknown (HELO mylly.fi.intel.com.) ([10.237.72.79])
  by orsmga002.jf.intel.com with ESMTP; 31 Jan 2024 06:16:55 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Ruhl@web.codeaurora.org, Michael J <michael.j.ruhl@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 0/6] i2c: designware: Generic polling mode code
Date: Wed, 31 Jan 2024 16:16:46 +0200
Message-ID: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jiawen, Sanket and Basavaraj

Could you test on your Wangxun 10Gb NIC and AMD NAVI GPU harware this
patchset since it's touching both.

For the AMD NAVI GPU and changes are less but for the Wangxun 10Gb NIC
patchset replaces the txgbe_i2c_dw_xfer_quirk() with generic polling mode
code.

I've been testing this on our HW which all have interrupt connected and
tried to cover also FIFO depth defines for Wangxun 10Gb NIC. Obviously I
would like to know how this set works on your real HW.

Jarkko Nikula (6):
  i2c: designware: Uniform initialization flow for polling mode
  i2c: designware: Do not enable interrupts shortly in polling mode
  i2c: designware: Use accessors to DW_IC_INTR_MASK register
  i2c: designware: Move interrupt handling functions before
    i2c_dw_xfer()
  i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
  i2c: designware: Implement generic polling mode code for Wangxun 10Gb
    NIC

 drivers/i2c/busses/i2c-designware-common.c  |   2 +-
 drivers/i2c/busses/i2c-designware-core.h    |  23 +-
 drivers/i2c/busses/i2c-designware-master.c  | 417 +++++++++-----------
 drivers/i2c/busses/i2c-designware-pcidrv.c  |   2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |   2 +-
 5 files changed, 208 insertions(+), 238 deletions(-)

-- 
2.43.0


