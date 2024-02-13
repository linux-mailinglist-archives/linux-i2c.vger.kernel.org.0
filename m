Return-Path: <linux-i2c+bounces-1699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE8C8530E2
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 13:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 930221C20F68
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 12:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F131242077;
	Tue, 13 Feb 2024 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axIMhbmy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE042074
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828548; cv=none; b=nTMkek6nKJhdVsT18+3qeCy+HnD4asFvzOz9K45jKegJnssS0nv+crCgKmepT5urQVbtAha5WNYU/5Yy+WtskGoWzFWih923fWkEslxQJGRnzv/0jmG6NySO3awUIKkGDHKqjHcoIBuHoqOZ86V5OM8kDa4PyLzNvkAdzHBb4pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828548; c=relaxed/simple;
	bh=1aKDNz7zbM0I5hek9PLCcgd8MCkmbiz3Mn3zShsxDso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxr1MS0rHeauHv7riAykXIOEjvgQhFcgMUwHbgzVXRfic5PTeKwQtYOI389OExpRUXV7DJCIjdrtLrVaIjLz9r4fvXJEe4sh+iaNoo43YjpUAGVh1bErDTDEySHh1d9LnXVGjRts0GkAc74eVointfd89Z9KYNTPoudRZdTTrEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axIMhbmy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707828547; x=1739364547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1aKDNz7zbM0I5hek9PLCcgd8MCkmbiz3Mn3zShsxDso=;
  b=axIMhbmy1/cu96M5WrjS3AXt1GGpjeU9hfml4MALCINayUlnsEtG/UNw
   L0pXh1mS91d8wWaEXMFy4WD2uJhUDPPpVrXvqsvrf4DWEQrTZR3eUsBll
   Cd/Ivz/mkvbzIdVvU0eWUtCByEt11D+XKKpIi37c1HfklT8+byH85nVbF
   7tLh6SPeNdjUj8Ryb92nEH2v/djt2ZJ8l+1Gg45LCcAsJbQNm+u5BrMyN
   Y2QG1jYWoC1HwnZ9nUxMC89FZnVO990/ZOfBaIPicLmIeYYSgoi32X7dx
   W255rrlROFJwmjUXrohJSt29bjJW4bI5SDwR9+lbGnrx5hxS3oJwTZeYb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12467258"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12467258"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 04:49:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7486710"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2024 04:49:04 -0800
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
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 5/6] i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
Date: Tue, 13 Feb 2024 14:48:46 +0200
Message-ID: <20240213124847.672084-6-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
References: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I believe RX FIFO depth define 0 is incorrect on Wangxun 10Gb NIC. It
must be at least 1 since code is able to read received data from the
DW_IC_DATA_CMD register.

For now this define is irrelevant since the txgbe_i2c_dw_xfer_quirk()
doesn't use the rx_fifo_depth member variable of struct dw_i2c_dev but
is needed when converting code into generic polling mode implementation.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 4d277ebcca92..bf8f140dc113 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -319,7 +319,7 @@ struct dw_i2c_dev {
 #define AMD_UCSI_INTR_EN			0xd
 
 #define TXGBE_TX_FIFO_DEPTH			4
-#define TXGBE_RX_FIFO_DEPTH			0
+#define TXGBE_RX_FIFO_DEPTH			1
 
 struct i2c_dw_semaphore_callbacks {
 	int	(*probe)(struct dw_i2c_dev *dev);
-- 
2.43.0


