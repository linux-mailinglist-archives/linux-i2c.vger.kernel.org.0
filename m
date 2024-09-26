Return-Path: <linux-i2c+bounces-7033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A041098764C
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 17:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7247B28246
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53E314A615;
	Thu, 26 Sep 2024 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nV3t44+6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D08B84E1C;
	Thu, 26 Sep 2024 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727363665; cv=none; b=QojsTmRKz6CcCIYqrwTMNkktEoCReAPFofFGCbd29PZ3NHfIm/4S6A0I5BqiZg10L+SKk+nvmbMHEmZvjfV+Ttk/aKNw8uWmwZp907QKhqjEl4mjrVi+YXjaG9McHWWTScYmttQJALp3Q0gsk6aRzZPIGYKl6wkKPxjiewss5v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727363665; c=relaxed/simple;
	bh=K4Ck3/3H7GUOTDxuXeFb1Uy+98T6H3v+HFtsZoxtqQw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MBWu6XRC+tvuOAL7voU7B9SsoARPlqNzNbdqL06D9YPJbP+9T4BfY6hDFrXDU3X5T7ZxAHXwZxPmhjDK3GtKlmoHBnhaI/7JzBks39xo4Y5jmRFzbxG74MymH5EdhqGBSBJiJhgFixF5IHdNBBX9zeemGrdm4VJxl/BOFyiLLUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nV3t44+6; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Hi5iQ
	TtGMlHc6GO5z4LjPJGmuS455m+Uc6ctvW1h9hI=; b=nV3t44+6qqOHUlhbLkbj7
	gwOHg1T1vPqjLGc0HBaX+PpbrbkjiujiTPGFPOMZ6LsOv0NiXzft6912VxxHxVOw
	T0dQS2dT/IIlsz7/kk10jv3QLB9ngIiUbmG8l22zKwLpudF0RZ/2wIPFlZ+UpPJX
	Es+5XdLifdHCSUVRl7imv0=
Received: from iZbp1asjb3cy8ks0srf007Z.. (unknown [120.26.85.94])
	by gzga-smtp-mta-g2-0 (Coremail) with SMTP id _____wAX+h0wevVmIl2GGA--.31714S2;
	Thu, 26 Sep 2024 23:13:53 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: andi.shyti@kernel.org
Cc: shyam-sundar.s-k@amd.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qianqiang Liu <qianqiang.liu@163.com>
Subject: [PATCH] i2c: amd-asf: Fix uninitialized variables issue in amd_asf_process_target
Date: Thu, 26 Sep 2024 23:13:48 +0800
Message-Id: <20240926151348.71206-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAX+h0wevVmIl2GGA--.31714S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF1ktw1kXFykuF1rKF4rKrg_yoW3ZFcEk3
	Z5Wa17Wrs0krn5Xr1YqFs8ZrW0gr1qgr1xu3WFyFW5CryY9w4xWFyqv3s3ArsrWrsrKF1a
	9w1UWF4xCFsxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbUKs5UUUUU==
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLx1mamb1VC9cDgADsH

The len variable is not initialized, which may cause the for loop to
behave unexpectedly.

Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 47e0c90341aed..ba47df5370c72 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -61,7 +61,7 @@ static void amd_asf_process_target(struct work_struct *work)
 	unsigned short piix4_smba = dev->port_addr->start;
 	u8 data[ASF_BLOCK_MAX_BYTES];
 	u8 bank, reg, cmd;
-	u8 len, idx, val;
+	u8 len = 0, idx, val;
 
 	/* Read target status register */
 	reg = inb_p(ASFSLVSTA);
-- 
2.39.5


