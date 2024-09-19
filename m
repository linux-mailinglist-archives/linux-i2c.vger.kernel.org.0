Return-Path: <linux-i2c+bounces-6865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D497C652
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 10:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35544282CA5
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 08:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971E11991C6;
	Thu, 19 Sep 2024 08:56:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m127216.xmail.ntesmail.com (mail-m127216.xmail.ntesmail.com [115.236.127.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF11957E7;
	Thu, 19 Sep 2024 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726736183; cv=none; b=iAzCnFropVjiPJdP8e1MrweJC+fHmpIAZ0FJXqDLeumj8xEqFPDZXt8f26pn7E0mzMkJpZ5zvcL2978ufRp/iUc96GBlvClu2DOI6iYfXpn1VcO/IfgKk8ha9Gcds+v+GjvzSqAWkZ6ptS6BLQJOsrKsOUyzNy75fxZfdDFI/1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726736183; c=relaxed/simple;
	bh=/ixGIeAgu4kH+iosDw5OZDaR7cm/8EdtfaIqfr9QDRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=La5E3R/qWCPpIHi2F0+C6AJDaSg/I0B4ztJ7tGRRMA3Aj967M8TtcZmJ6iqrG5346yqtgwvwxtl+HXGfqnpGcTGRu9itVKJfHXSCs6n+jTyQLqONxG5ObSdGRYRZPQkpSyjPpgavbRnENeNNv8Hvr6H0RNLJH+L53MKffBovAR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=115.236.127.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 0E1F13808E3;
	Thu, 19 Sep 2024 14:30:17 +0800 (CST)
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
Subject: [PATCH 1/2] ACPI: APD: Add clock frequency for HJMC01 I2C controller
Date: Thu, 19 Sep 2024 14:29:42 +0800
Message-Id: <20240919062943.1551197-2-hunter.yu@hj-micro.com>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSxhMVhlPTk9CSRhMTR1ITlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a9208f96e6509cdkunm0e1f13808e3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjY6OAw5HzI5Pw0zCE0jAx8f
	LUswFCpVSlVKTElNTElMT0pDSkJLVTMWGhIXVRMOFQ8eCVUCDjsTEVYWEhgJFFUYFBZFWVdZEgtZ
	QVlKSUlVSUlPVUpPTFVKTkNZV1kIAVlBSUlMSTcG

From: "hunter.yu" <hunter.yu@hj-micro.com>

I2C clock frequency for HJMC01 is 200M, define a new ACPI
HID for it.

Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
---
 drivers/acpi/acpi_apd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index 800f97868448..bc271d1cb31b 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -181,6 +181,11 @@ static const struct apd_device_desc hip08_spi_desc = {
 	.setup = acpi_apd_setup,
 	.fixed_clk_rate = 250000000,
 };
+
+static const struct apd_device_desc hjmc_i2c_desc = {
+	.setup = acpi_apd_setup,
+	.fixed_clk_rate = 200000000,
+};
 #endif /* CONFIG_ARM64 */
 
 #endif
@@ -252,6 +257,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
 	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
 	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
+	{ "HJMC3001", APD_ADDR(hjmc_i2c_desc) },
 #endif
 	{ }
 };
-- 
2.27.0


