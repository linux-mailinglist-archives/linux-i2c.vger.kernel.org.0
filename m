Return-Path: <linux-i2c+bounces-7008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB48986B91
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 05:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DA7DB222E2
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 03:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2818D178CDF;
	Thu, 26 Sep 2024 03:57:15 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m1022.netease.com (mail-m1022.netease.com [154.81.10.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7354C1741C6;
	Thu, 26 Sep 2024 03:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727323035; cv=none; b=Jr6sULFsHuv0lBwv+HTxsQTmfQMji2YkJBK7syXzjJUOOZP0D3x4I/5ixNhU3vzMBfu33elth5Z64PRUrNn5f8jvat5qqrEFyuib0OSXXWgoEt0Shm91GsEtuzPLFYFk3scljFg2upUrg4QcyrDWCDIxXif5/iAnM4y9tZ4FkAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727323035; c=relaxed/simple;
	bh=lGzGYKaNhOj4/1M392XejlF2uzhN3Bs/lRqcgzJJLYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BphCwq5RRcHPDgNH+n3h8hNfqBPJUbV/udjFNRHAJady6F7JjwpKuWsFHrIQFdXUc7tFEi4CT1fjYMu6dnqN+Tw9+ZW6Y/AsV+0SgLTMTQLSI2y3EHVaNFG7jCVxwIzOY8Z7/+Ee+NDlSNLWblyUMS1qmeEU9Q3OBMMhcrtQ0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=154.81.10.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from KP920.lan (unknown [101.71.201.83])
	by smtp.qiye.163.com (Hmail) with ESMTPA id A94591A02B6;
	Thu, 26 Sep 2024 10:40:36 +0800 (CST)
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
Subject: [PATCH v2 2/2] i2c: designware: Add a new ACPI HID for HJMC01 I2C controller
Date: Thu, 26 Sep 2024 10:40:06 +0800
Message-ID: <20240926024026.2539-3-hunter.yu@hj-micro.com>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSElDVklOH05IHxhOSU0eGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0pVTEpVSUtKVUNIWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a922c33ad0303abkunma94591a02b6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQw6NRw6CTIvCDM5OU09CFFL
	MyIaCzJVSlVKTElMSEpDT0hMQ0tCVTMWGhIXVRMOFQ8eCVUCDjsTEVYWEhgJFFUYFBZFWVdZEgtZ
	QVlKS0pVTEpVSUtKVUNIWVdZCAFZQUpCQko3Bg++

Define a new ACPI HID for HJMC01

Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 2d0c7348e491..701506e92380 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -354,6 +354,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "HISI02A1", 0 },
 	{ "HISI02A2", 0 },
 	{ "HISI02A3", 0 },
+	{ "HJMC3001", 0 },
 	{ "HYGO0010", ACCESS_INTR_MASK },
 	{ "INT33C2", 0 },
 	{ "INT33C3", 0 },
-- 
2.43.5


