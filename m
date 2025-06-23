Return-Path: <linux-i2c+bounces-11555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F70DAE4541
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jun 2025 15:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A40521886F24
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jun 2025 13:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A3B2550D3;
	Mon, 23 Jun 2025 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfRqoInp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B68A250C06;
	Mon, 23 Jun 2025 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686331; cv=none; b=fyyndAQsJWcnoI5Tk2rEsV8fjOrbYbK2xCXm89A/s0zy0qzcoMVNSgR27Ip+kWeqKKrpdyy79oG1h8s6AsucPPXVg+iqHOZ9Jame4/vK+F353Ykpi/rEZTf+CIyvOQaT/marH6k624RXrmudpWB0nbvWtNgxQXI2Levxc7oBSIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686331; c=relaxed/simple;
	bh=cRXDOmdhqPhgJle2dQbSYvXJTReLYwhaFxGY9pmm6Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEv1Av2Ke3T+X3Zbm8ZHD7aMkkaLcdqV3MYAfr5CxwYIkMTmecrNlO2ZGKQmUtbq9h68hMg3fse+0wEqbunKBvvg4Di21+afqqGRS3SY9njwQwKMgkEdhL9CrCFyfA9BAVAtavGtTEbSeZRb+nKWUya0uOHLLuzOv1wf5cT66P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfRqoInp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750686330; x=1782222330;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cRXDOmdhqPhgJle2dQbSYvXJTReLYwhaFxGY9pmm6Zk=;
  b=jfRqoInpadg9yrR+OKw8fYb63zv8zTtTP+/9Vx3BVh3G0SiFcF519PzA
   Id4dcPD4z55K+Co48ujglyqkGffay44e/nuTO63LTeIrWyQ/kikAjruwo
   Gk378Ye1CuAf4G81PN/ai31woskbplVrMU5JaBth2fH8hBYe23ELRaiG5
   4OaBVcjN+Cw2c25MlpI7APBsv5iHhqKYyQvv5el5gnbekvCNmxo89voCU
   tNOr9gauyGXjSZTHVH1zbDf1xDK+eVe/S5WV3jw0iPFsZQpn9n4129eaS
   JFw+Ds5Nm5PLIqGvQKoiQdCntz0nQ2yqWNQwTctE6cVv6FJXq2s+h+0L+
   w==;
X-CSE-ConnectionGUID: tfeMo5TWSjWWlD+bBwvw/w==
X-CSE-MsgGUID: XJCIXu8AQ/Sm4pKslPL0TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70320908"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="70320908"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:45:29 -0700
X-CSE-ConnectionGUID: +TTq4MkgRFqkYtHF9GUaGQ==
X-CSE-MsgGUID: /0j1rY1/Rly7nyaDIPOgbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="182651859"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2025 06:45:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9CD23108; Mon, 23 Jun 2025 16:45:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Randolph Ha <rha051117@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH v1 1/1] i2c: acpi: Replace custom code with device_match_acpi_handle()
Date: Mon, 23 Jun 2025 16:45:21 +0300
Message-ID: <20250623134521.158447-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since driver core provides a generic device_match_acpi_handle()
we may replace the custom code with it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index d2499f302b50..3445cc3b476b 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -250,7 +250,7 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 
 	if (adapter) {
 		/* The adapter must match the one in I2cSerialBus() connector */
-		if (ACPI_HANDLE(&adapter->dev) != lookup.adapter_handle)
+		if (!device_match_acpi_handle(&adapter->dev, lookup.adapter_handle))
 			return -ENODEV;
 	} else {
 		struct acpi_device *adapter_adev;
-- 
2.47.2


