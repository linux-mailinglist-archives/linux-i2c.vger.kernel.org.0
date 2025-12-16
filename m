Return-Path: <linux-i2c+bounces-14573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9331CC3399
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 14:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAE9930B8E2C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BFB382577;
	Tue, 16 Dec 2025 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IuXlYXQ1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6030237A3E8;
	Tue, 16 Dec 2025 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890887; cv=none; b=DESici0emlif+6PlvadYu1pArggcjBjpW10LFXxoUxD9wBDnaM0pESHQRgVLfIQA1D7EnLZnIEi+xu7r0XsPlnJlxCZhu3ZQqsmqurHYcpDanfIn1RnQ7K1rp8lDhz/U0kw82yhjDnwtfPC9Y1gvoTI5CC6VcvfnzXx6tOnJEXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890887; c=relaxed/simple;
	bh=sxKNMc8f6wC938bRvv4zHOFJLqTs6byHPL2W5YURLUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzGrRoI9LUr+nuXHhb/MhEKDwNUDK9VtFBei8R78RJ4NJHvglvfkhyh7NH1pUBxtMf/ihjthfF8fYUcNMEyoaUTbETHHooDZHTcXowsElKABSE4EkdMeyMQEEyErSwvYSQ0528GVsn5osG7KnIYy8vPu/pzIDdNjvx2WIuAyk4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IuXlYXQ1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765890885; x=1797426885;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sxKNMc8f6wC938bRvv4zHOFJLqTs6byHPL2W5YURLUs=;
  b=IuXlYXQ1bCLZR8nRVS2YWWmIft1l2Il5nCFiS5mjnQ+s8G2zIHyYr1cA
   Bfsz94U8Is8EVtzAJQQuPYnktqW1NER2n0ZHluBJuWb4UqNYEtcP0oyPA
   /E+15y7XpaVuLxOc1qw4Ayt+iEgiu/hgC2lDAtwdR0pDB9tmB/N8+xZUL
   51PotXWwGtWcnDMfOQw+cN3KKFoLCNModSz+60VRImebXgXUgCCUFyLsx
   hhmBOXVsHaGFdNumQd2Vf1o8OWYT4C9WCHtS38xkRu0j4Aglri+VJkQm3
   dkj45cAh24aogMMbDkIkOoszTvhOpMVgJ2I7HTkh33QoXVDU7uhEdVBsJ
   w==;
X-CSE-ConnectionGUID: b5OpmgS+QjWrsvC8FarIOQ==
X-CSE-MsgGUID: UTe8QcReRzu6Qoy611QJIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78444881"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78444881"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:14:45 -0800
X-CSE-ConnectionGUID: irA0YG0rT/mpLc2d5H4zZA==
X-CSE-MsgGUID: wlxGlNt6SlWY2VRNCQYDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198274400"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2025 05:14:43 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/6] i2c: designware: Enable mode swapping
Date: Tue, 16 Dec 2025 14:14:35 +0100
Message-ID: <20251216131442.8464-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

It's currently not possible to support MCTP or any other protocol that
requires support for both modes with the DesignWare I2C because the
driver can only be used in one mode. I'm assuming that the driver was
designed this way because the DesignWare I2C can not be operated as
I2C master and I2C slave simultaneously, however, that does not
actually mean both modes could not be supported at the same time. See
the patch 5/6 for more detailed explanation.

This series will enable support for both modes in the driver by
utilising a simple mode swap method, and that way make it possible to
support MCTP, IPMI, SMBus Host Notification Protocol, and any other
protocol requires the support for both modes with the DesignWare I2C.

I've prepared these on top of Andi's i2c-host branch.

thanks,

Heikki Krogerus (6):
  i2c: designware: Remove useless driver specific option for I2C target
  i2c: designware: Remove unnecessary function exports
  i2c: designware: Combine some of the common functions
  i2c: designware: Combine the init functions
  i2c: designware: Enable mode swapping
  i2c: designware: Remove an unnecessary condition

 drivers/i2c/busses/Kconfig                 |  10 +-
 drivers/i2c/busses/Makefile                |   2 +-
 drivers/i2c/busses/i2c-designware-common.c | 210 +++++++++++++++++++--
 drivers/i2c/busses/i2c-designware-core.h   |  25 +--
 drivers/i2c/busses/i2c-designware-master.c | 174 ++---------------
 drivers/i2c/busses/i2c-designware-slave.c  | 125 ++----------
 6 files changed, 249 insertions(+), 297 deletions(-)

-- 
2.50.1


