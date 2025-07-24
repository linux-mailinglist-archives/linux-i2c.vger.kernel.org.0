Return-Path: <linux-i2c+bounces-12015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97355B0FEB0
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 04:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7514F4E63D9
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 02:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FB31A23BB;
	Thu, 24 Jul 2025 02:14:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68672E3710;
	Thu, 24 Jul 2025 02:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753323287; cv=none; b=awsw5CwHFWBuAzT9Up31pGoId1e1fbC82HXCBExccoiAOLuVM/4UhedgP3hUOkesqlWdD3Yop8wkwXBCK6AVYMGBdgbCGrN3g7IdwgyxTQH5c6x49YwusKZrKJ3/itTWdSHXI3a311C+f1wCEUkQVeJ7L5bPHBiFCnjFi7pxoPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753323287; c=relaxed/simple;
	bh=qg8UyGQ6iCG3NVkjOLLI6cpGcc9u0YGv87oALU69qM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZUsepg848rQrlnXNaMZ/eMBTiu8XrMKMm5K+HsrHwjSOVrVOfjh4DGCeqV9w0I/zQwFtHW+gPQsaluuRS9ytV9p+umBxlmM332+EFHZSyyDVyO08d4/uroprYe26e/Q04a5mMsqnmy3RhqcliBXZIxCKbFPc0MNRSGTosBKf/Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 24 Jul 2025 11:13:35 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 10F952069FF1;
	Thu, 24 Jul 2025 11:13:35 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Thu, 24 Jul 2025 11:13:35 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id AF9DC1C5A;
	Thu, 24 Jul 2025 11:13:34 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Kohei Ito <ito.kohei@socionext.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 1/2] i2c: designware: Fix clock issue when PM is disabled
Date: Thu, 24 Jul 2025 11:13:16 +0900
Message-Id: <20250724021317.2116943-2-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724021317.2116943-1-hayashi.kunihiko@socionext.com>
References: <20250724021317.2116943-1-hayashi.kunihiko@socionext.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When removing the driver, enable the clocks once by calling
pm_runtime_get_sync(), and call pm_runtime_put_sync() to disable
the clocks.

If CONFIG_PM=y, clocks for this controller are disabled when it's in
the idle state. So the clocks are properly disabled when the driver
exits.

Othewise, the clocks are always enabled and the PM functions have
no effect. Therefore, the driver exits without disabling the clocks.

    # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
    18
    # echo 1214a000.i2c > /sys/bus/platform/drivers/i2c_designware/bind
    # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
    20
    # echo 1214a000.i2c > /sys/bus/platform/drivers/i2c_designware/unbind
    # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
    20

To ensure that the clocks can be disabled correctly even without
CONFIG_PM=y, should add the following fixes:

- Replace with pm_runtime_put_noidle(), which only decrements the clock
  count.
- Call i2c_dw_prepare_clk(false) to explicitly disable the clocks.

Fixes: 7272194ed391f ("i2c-designware: add minimal support for runtime PM")
Co-developed-by: Kohei Ito <ito.kohei@socionext.com>
Signed-off-by: Kohei Ito <ito.kohei@socionext.com>
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index d6e1ee935399..edaebfb165f9 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -325,9 +325,11 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 	i2c_dw_disable(dev);
 
 	pm_runtime_dont_use_autosuspend(device);
-	pm_runtime_put_sync(device);
+	pm_runtime_put_noidle(device);
 	dw_i2c_plat_pm_cleanup(dev);
 
+	i2c_dw_prepare_clk(dev, false);
+
 	i2c_dw_remove_lock_support(dev);
 
 	reset_control_assert(dev->rst);
-- 
2.34.1


