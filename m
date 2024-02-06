Return-Path: <linux-i2c+bounces-1640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E664A84B868
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1F19285E35
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 14:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282BD132C03;
	Tue,  6 Feb 2024 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VARhIllL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDD8132C35
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231126; cv=none; b=prdYUQ5rqKKfBGveqzAtuC+k0QicOyTH+cEqX8PZp10xr07JxDWaxyeHYUMdSgBGPQbAnKLYez2xNisN5ygm2tWfe0uOyMq5xIsYvFS2kwDFM0rHKI1OWuFX2qVohzuVdosYBceQrCN3Ry/vrC3MW+2ngxA9RXrDXZ2xVNnof0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231126; c=relaxed/simple;
	bh=08SGlZZyuJVAV8BD3ZNbuScuN/UMeRKLCJk+Qhd/shk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qu4EptGeuoXsgrRwktaO27hZi44Leq9xoDkQsOzCdSVrA6kfTEnvAcrRS4rnCA6sBWHyr6xZf0dDGzFBkh1HGOhPhc8PXWJ1P2MX719DnVi/bv2qDorvgD4b9chPzII1JH2UkIcXMvPiv+kljqp/gpvYBSRVOU2ymoONNumfDPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VARhIllL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707231125; x=1738767125;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=08SGlZZyuJVAV8BD3ZNbuScuN/UMeRKLCJk+Qhd/shk=;
  b=VARhIllLbLB9W5s3nYC3uk0HVp27aC6GoNTEm81j1mQ7MJ+fZeZxK/40
   q5h1D6IcyHzG5eSSI3UBTAKRAM6NFpIw1vfYuQdOxxxDXoga6SY0v/VSV
   CnghlxCLWktiOF+0tcdy0h+pKjlZToB2dSj89Sj0HpIsq7AeTwlZEm/f+
   hD+w132+sID/OwtuTtwXe2pJtq9QYE26sPut2In+93hKQDHCtp/0DtcPn
   m5pNIHrhBEq3XTC908jCwmjPpzWoWWCoMo2umkx9b6rG+KDFp8zJbsAdY
   9/1eyXzPsPYgnOQ39p9QjMdn6mb//iOnWPJaNJByGmncUrFlWZvijp2pA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26206556"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26206556"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:52:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933481869"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933481869"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 06:52:00 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com,
	Hans de Goede <hdegoede@redhat.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 0/9] i2c: designware: Generic polling mode code
Date: Tue,  6 Feb 2024 16:51:49 +0200
Message-ID: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi

This is mostly the same than the first version implementing generic
polling mode code for the i2c-designware except three more patches added
before them.

Andy had an idea we should have more consistency to platform flags naming
and the first three patches are around that. Michael started the
conversion so I took his patch from an internal set and put first. Since
this version touches Intel PUNIT semaphore code I Cc'ed Hans.

Andy and Andi had comments to "Uniform initialization flow for polling
mode" but I decided to not implement a separate helpter function for
interrupt request as it in my opinnion does not make code any easier to
read.

I also wanted to retain single return point in the
i2c_dw_wait_transfer() implemented by the last patch since I had some
debug code there when doing the first version.

v1:
https://lore.kernel.org/linux-i2c/20240131141653.2689260-1-jarkko.nikula@linux.intel.com/

Jarkko Nikula (8):
  i2c: designware: Convert arbitration semaphore flag as semaphore type
  i2c: designware: Convert shared_with_punit boolean as semaphore type
  i2c: designware: Uniform initialization flow for polling mode
  i2c: designware: Do not enable interrupts shortly in polling mode
  i2c: designware: Use accessors to DW_IC_INTR_MASK register
  i2c: designware: Move interrupt handling functions before
    i2c_dw_xfer()
  i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
  i2c: designware: Implement generic polling mode code for Wangxun 10Gb
    NIC

Michael J. Ruhl (1):
  i2c: designware: Add some flexiblity to the model info

 drivers/i2c/busses/i2c-designware-amdpsp.c   |   2 +-
 drivers/i2c/busses/i2c-designware-baytrail.c |   2 +-
 drivers/i2c/busses/i2c-designware-common.c   |   2 +-
 drivers/i2c/busses/i2c-designware-core.h     |  38 +-
 drivers/i2c/busses/i2c-designware-master.c   | 417 ++++++++-----------
 drivers/i2c/busses/i2c-designware-pcidrv.c   |   2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c  |  12 +-
 7 files changed, 223 insertions(+), 252 deletions(-)

-- 
2.43.0


