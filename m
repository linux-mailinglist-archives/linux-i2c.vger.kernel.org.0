Return-Path: <linux-i2c+bounces-10829-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A092AAC50B
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 15:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2CFD52442C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 13:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF36127FD67;
	Tue,  6 May 2025 13:02:18 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354026B08C
	for <linux-i2c@vger.kernel.org>; Tue,  6 May 2025 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536538; cv=none; b=nt6Ra/dQuidyMM6UPN0oDxIRSZ9ml3dTHfFy9kWWU2fmQn7JIEglAyS6+L6Qey8uTLJXLCrZld2BzuQitmSvGVnwWH4gjewR/SWpuufroie6AvgdgcMaTPAGBg7KNHawsgeN8aAHvn3TKFREUhF3h7OR/F1nyk3DxeT7dYfA078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536538; c=relaxed/simple;
	bh=qoz+Wgd3VMX13u5K7HiRc9FbP5MkFBF3SNSVx3IwBrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gLbAgwd61dy2IBlDoSpOTTxaprvUOi6EC7F8jQVc/YsVbIStNpFNuFiEIsCOmaSQhu0Ny00sW7hhqixaHoFDTZgVF3orqppBcxKguHRAn0X5UI/4iy+bV7bcqRUq2DZh5GyRAtzIRHywgHmxuJNvuJYLwrtGy0Lr8Usm8YfHvN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ed69:3ad8:f2dc:ba56])
	by baptiste.telenet-ops.be with cmsmtp
	id lp282E00F2coBU201p280g; Tue, 06 May 2025 15:02:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uCHvu-00000000qog-1PHp;
	Tue, 06 May 2025 15:02:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uCHw0-00000001dbt-1K6z;
	Tue, 06 May 2025 15:02:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andi Shyti <andi.shyti@kernel.org>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	Bin Du <bin.du@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Venkata Narendra Kumar Gutta <vengutta@amd.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: I2C_DESIGNWARE_AMDISP should depend on DRM_AMD_ISP
Date: Tue,  6 May 2025 15:02:06 +0200
Message-ID: <3888f892b8c4d8c8acd17e56581e726ace7f7092.1746536495.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AMD Image Signal Processor I2C functionality is only present on AMD
platforms with ISP support, and its platform device is instantiated by
the AMD ISP driver.  Hence add a dependency on DRM_AMD_ISP, to prevent
asking the user about this driver when configuring a kernel that does
not support the AMD ISP.

Fixes: 63f0545cb1bf0840 ("i2c: amd-isp: Add ISP i2c-designware driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 865b760866ef42ba..7c348491e1bbac7c 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -594,6 +594,7 @@ config I2C_DESIGNWARE_PLATFORM
 
 config I2C_DESIGNWARE_AMDISP
 	tristate "Synopsys DesignWare Platform for AMDISP"
+	depends on DRM_AMD_ISP || COMPILE_TEST
 	depends on I2C_DESIGNWARE_CORE
 	help
 	  If you say yes to this option, support will be included for the
-- 
2.43.0


