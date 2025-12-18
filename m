Return-Path: <linux-i2c+bounces-14642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F4CCC6C5
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 16:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D06DA3019A71
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 15:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C9D34B697;
	Thu, 18 Dec 2025 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilVaSuLA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47F82FE577;
	Thu, 18 Dec 2025 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070919; cv=none; b=Ze0kl7L6Qm/3OBF0UpU4Yc3VXhkOmLGzARI0HCyNDUFdsxjUZDY2LpnF8WRYocf/iDoTCkBROG2OeULm3IgcvD6pWkePRcfJn50wFTA4VOqa9/t1Jy/G7xxXmJJ/gRjgLqlQEyOFvtAg7eN30A8oJ+GK0yu2ijs97pkq7J/OqHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070919; c=relaxed/simple;
	bh=PuJLndowc/hK58TiZrjdEvwzZaiPo6HM9D7eBGkzLto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IoOQNvRJ2wIvL8qpnM4WPV6NkdNYqRfFV4qwSKeC5P3klkN2yepbiLFlNFV6LkXeTyddwAlC6QMjfbh3xo1QcF/TDWLR9tQwF3F0CHB0fHKbdJRqdpREk5wvQqrhjjBRZ8jz1Bv4BvruYkt1BrB7j9bmyk4dwwgojo7mC/7YXMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilVaSuLA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766070915; x=1797606915;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PuJLndowc/hK58TiZrjdEvwzZaiPo6HM9D7eBGkzLto=;
  b=ilVaSuLAzG4a7DmGNWyieWxYKaG8GXhE43DlO/HBHLUzUjjXyDHTahC3
   6I93OzGSuSdjLuNKf2C08saQyCVuq7OEAxiasSSLztczva4yZAqBBzhuw
   rl0b7kxHlxf1dRl7IsoXtxwvDWqU6KcaGPhzKqpxPirCzZYIE19TFqmH6
   Jt9ACSv7Lr0HanSAqQvey3nPdgxfxwqEP1urux/HLIxGTqb04nLCQpE/P
   dsuWIt1pRG2UIBNKkMvQfZORIKRPvDhjIWIBiXfTqet3nYd1ZwXgpeqBH
   wa40P/clS3CKzaBSQkZQDVa52A8sHgndNJygQCIC9QYVrSOiRAWU0AijN
   A==;
X-CSE-ConnectionGUID: 1w2jEnfkTH2Lb5yg0qYQgg==
X-CSE-MsgGUID: Zo+gJ0fKRkuzlmYm9DB0HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78739512"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="78739512"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 07:15:12 -0800
X-CSE-ConnectionGUID: zL08cNkwTKi8kggJvB4F+g==
X-CSE-MsgGUID: kPa1I07RSfSUHAvAcVgtag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="197857469"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 18 Dec 2025 07:15:11 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] i2c: designware: Enable mode swapping
Date: Thu, 18 Dec 2025 16:14:59 +0100
Message-ID: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changed since v1:
- The init cb is replaced with i2c_dw_init() also in i2c-designware-amdisp.c
- Checking I2C_FUNC_SLAVE in i2c_dw_reg_slave()

The original cover letter:

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
 drivers/i2c/busses/i2c-designware-amdisp.c |   4 +-
 drivers/i2c/busses/i2c-designware-common.c | 211 +++++++++++++++++++--
 drivers/i2c/busses/i2c-designware-core.h   |  25 +--
 drivers/i2c/busses/i2c-designware-master.c | 174 ++---------------
 drivers/i2c/busses/i2c-designware-slave.c  | 127 ++-----------
 7 files changed, 254 insertions(+), 299 deletions(-)

-- 
2.50.1


