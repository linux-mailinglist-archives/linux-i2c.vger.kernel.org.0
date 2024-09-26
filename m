Return-Path: <linux-i2c+bounces-7010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEFC986B95
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 05:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 537D71C21CE7
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 03:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8312317B4FA;
	Thu, 26 Sep 2024 03:57:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m25469.xmail.ntesmail.com (mail-m25469.xmail.ntesmail.com [103.129.254.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6061741C6;
	Thu, 26 Sep 2024 03:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.129.254.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727323042; cv=none; b=HHmN5HGwybN4y/ejSbN4eTVc5hQfRZnNRhqecaQ37Thycvnyuw32mdao5b+4Scij6pgsHQhc3VfiLdKzOLPwN3t8Cf/8BSdpkLQtrFPrS7bjhB2Q8dA9tWP7SQIjTKJwb2lSu7xpyg3+K2pcPaLCM4GNlpyVJTvrZnNwGsp3VRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727323042; c=relaxed/simple;
	bh=V0JFYi9U6QidxdrHMIZRS6VMouX3/XuddqONInh2HC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWQ7OmYv1C7JsYa42m+LAUXHeBpYK3u6cD7FLcYiCVpk6GJYq5L5k6RLpDKPi9J5wtYmhsPX1P2AAsJH/QkFux2ytHbKDkjrhM9Rcz+sjeQXqQxBLRLmuaJ5jrTgIP0LL/To7gQ2PULS+40PoDUdPWyPxEdnwSSEFzWx+q8yHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=103.129.254.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from KP920.lan (unknown [101.71.201.83])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 61E921A02B7;
	Thu, 26 Sep 2024 10:40:35 +0800 (CST)
From: "hunter.yu" <hunter.yu@hj-micro.com>
To: andriy.shevchenko@linux.intel.com,
	jarkko.nikula@linux.intel.com,
	lenb@kernel.org,
	rafael@kernel.org,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	andy.xu@hj-micro.com,
	peter.du@hj-micro.com,
	hunter.yu@hj-micro.com
Subject: [PATCH v2 1/2] ACPI: APD: Add clock frequency for HJMC01 I2C controller
Date: Thu, 26 Sep 2024 10:40:05 +0800
Message-ID: <20240926024026.2539-2-hunter.yu@hj-micro.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240926024026.2539-1-hunter.yu@hj-micro.com>
References: <20240926024026.2539-1-hunter.yu@hj-micro.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSU0dVh9DTUsZTEpDGUtJH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0pVTEpVSUtKVUNIWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1
	VLWQY+
X-HM-Tid: 0a922c33a7fc03abkunm61e921a02b7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KxA6Azo*NTIfOjMeOUwWCEoh
	Tg4KFEtVSlVKTElMSEpDT0hNTUpKVTMWGhIXVRMOFQ8eCVUCDjsTEVYWEhgJFFUYFBZFWVdZEgtZ
	QVlKS0pVTEpVSUtKVUNIWVdZCAFZQUlIS0M3Bg++

I2C clock frequency for HJMC01 is 200M, define a new ACPI
HID for it.

Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
---
 drivers/acpi/acpi_apd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index 800f97868448..229e80a19664 100644
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
@@ -251,6 +256,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "HISI02A2", APD_ADDR(hip08_i2c_desc) },
 	{ "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
 	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
+	{ "HJMC3001", APD_ADDR(hjmc_i2c_desc) },
 	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
 #endif
 	{ }
-- 
2.43.5


