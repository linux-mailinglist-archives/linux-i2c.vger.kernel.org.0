Return-Path: <linux-i2c+bounces-6867-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0590897C7B2
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 12:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6A7228EC64
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 10:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68680198E6C;
	Thu, 19 Sep 2024 10:06:21 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m103.netease.com (mail-m103.netease.com [154.81.10.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A75194AF3;
	Thu, 19 Sep 2024 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726740381; cv=none; b=X+CJwc6MyDRCiwpVAHrVEIeEHaLoakaSZBE5IR43k8wb7HAem0CN7JnSgBDO3eGwFVPBcUxGu9Pee5mM0EDbOOWDIDkz/Uky8+/iWTsl3y9fwwCED2pI+B02KjqQDsuuwNPJL8uOn7yCe7TgE+s2KS6cX9kUJD54sMj3BFSBQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726740381; c=relaxed/simple;
	bh=ej88sRnXdnb3kp37itE2k6jAkSH6fe9ggZ7aix7doy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z5fJcHt637kcD0qtRazMJfInEa7wexewUdxzPWrSEc5BEkcZ1+MBovsSZT79lDMQ0BcXgC3r1mp+myM8ctCxw5YFnpJ8TYBp4Fr8hOwmhsbB76pea09i8hpTWUodf/Mmdgup+34J+z1oaS7v9nONg7y9ckLlrJdMnjk/b4duWMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=154.81.10.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 415EE3808D2;
	Thu, 19 Sep 2024 14:30:18 +0800 (CST)
From: hunter.yu@hj-micro.com
To: rafael@kernel.org,
	lenb@kernel.org,
	jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	hunter.yu@hj-micro.com
Subject: [PATCH 2/2] i2c: designware: Add a new ACPI HID for HJMC01 I2C controller
Date: Thu, 19 Sep 2024 14:29:43 +0800
Message-Id: <20240919062943.1551197-3-hunter.yu@hj-micro.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240919062943.1551197-1-hunter.yu@hj-micro.com>
References: <20240919062943.1551197-1-hunter.yu@hj-micro.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTxkfVhhOHxpPSR5NSENLH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a9208f9732309cdkunm415ee3808d2
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxg6Aww*EDI0AQ0SCEIfAx09
	DBFPCgJVSlVKTElNTElMT0pCSEhKVTMWGhIXVRMOFQ8eCVUCDjsTEVYWEhgJFFUYFBZFWVdZEgtZ
	QVlKSUlVSUlPVUpPTFVKTkNZV1kIAVlBSkJDQjcG

From: "hunter.yu" <hunter.yu@hj-micro.com>

Define a new ACPI HID for HJMC01

Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index df3dc1e8093e..06dcefa3b103 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -58,6 +58,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "HISI02A2", 0 },
 	{ "HISI02A3", 0 },
 	{ "HYGO0010", ACCESS_INTR_MASK },
+	{ "HJMC3001", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
-- 
2.27.0


