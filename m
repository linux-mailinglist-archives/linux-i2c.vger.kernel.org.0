Return-Path: <linux-i2c+bounces-1639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9CE84B41D
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 13:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29D921F25392
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 12:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEC5132468;
	Tue,  6 Feb 2024 11:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="bJfVVmN2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CADF132C2B;
	Tue,  6 Feb 2024 11:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707219921; cv=none; b=kszi8mhfZlftwtHdFn4OlizFdmy4h2R4j9vsGfpqCORhFrP6QYp1tS09TJBChT+43FIq1m2dX3pNHfW3CFE6VQ5YEVA5utCKQd78wloUqBj1ukrcWrOrQDhiJc4vWwIfpWRnpZntok1CJHellmTAvbWwEMaINI7pitjQir9Fni0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707219921; c=relaxed/simple;
	bh=CvtzeV3LJoPwbA5d/XDUSj8ICkXD0P1E718iT2JTfg8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OxMRgoA1XutswAHQg1g/VuPAnfaMqvfB4O7uT8q0Uxt4wHkO+74/fYdwa9KHasMsuNAMFET/zy5gfl1HfYoVVcrG/J5XlI7OjbmRrRnbV2aB6vj/6i7Yc9wMxINhPmz217XAwqhzqPcLgd4Tof0ST2RCxs5hUv27EI0pSXOO+d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=bJfVVmN2; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 416B5pjH027405;
	Tue, 6 Feb 2024 03:45:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=I7YJVFpHyhttKaVQSn+im9bTu9lSBp0OqXLztLyaCtY=; b=bJf
	VVmN27517dICSL874oGjKtDHMq5puiyUCjqonmrgFWzrxh8rcXSKH10NZ1PeW1lf
	40izrpQFdeNKO7bdFeHCvt6/+32X9Cn10uCu+jzQwu9Ud73evXKFpf1jM1BsUWMA
	P3Edr9NICGZ3OWjWtTOOwdUpeNWku7zfLB/Qkt1K/pjpO6eI1WV3SHolB4ZQqPZN
	rA4vY9UkCJi+J0N8iep5An+O2au0AuaAgS2fEurOUPrFUFDeLIgLtnN8tvKkoE1H
	2PULZ/q4R2j1bq93/Ge8701F6AzVFXVdvQYo0ph2O6cMf3EyEjNn668uqysxL/kf
	Ep+C9bJRHF+IzCjpgiw==
Received: from dc5-exch01.marvell.com ([199.233.59.181])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3w38u81xvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 03:45:16 -0800 (PST)
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 6 Feb
 2024 03:45:14 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Tue, 6 Feb 2024 03:45:14 -0800
Received: from localhost.localdomain (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 0E5723F7088;
	Tue,  6 Feb 2024 03:45:14 -0800 (PST)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v3 4/4] i2c: thunderx: Adding ioclk support
Date: Tue, 6 Feb 2024 03:43:49 -0800
Message-ID: <20240206114349.32197-5-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240206114349.32197-1-pmalgujar@marvell.com>
References: <20240206114349.32197-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: z5SwNWQCHvtpq0aAnR00QFbgnzIt3PiB
X-Proofpoint-GUID: z5SwNWQCHvtpq0aAnR00QFbgnzIt3PiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_04,2024-01-31_01,2023-05-22_02

Adding support to use ioclk as reference clock if sclk not
present to make it SOC agnostic.
In case, it's not defined in dts/acpi table, use 800MHz as
default clock.

Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 31f11b77ab663626967c86086a03213876bf4a07..15cf794a776533d1b0dbb08597fc0d9acf791b44 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -27,7 +27,7 @@
 
 #define PCI_DEVICE_ID_THUNDER_TWSI	0xa012
 
-#define SYS_FREQ_DEFAULT		700000000
+#define SYS_FREQ_DEFAULT		800000000
 #define OTX2_REF_FREQ_DEFAULT		100000000
 
 #define TWSI_INT_ENA_W1C		0x1028
@@ -100,7 +100,8 @@ static void thunder_i2c_clock_enable(struct device *dev, struct octeon_i2c *i2c)
 		i2c->sys_freq = clk_get_rate(i2c->clk);
 	} else {
 		/* ACPI */
-		device_property_read_u32(dev, "sclk", &i2c->sys_freq);
+		if (device_property_read_u32(dev, "sclk", &i2c->sys_freq))
+			device_property_read_u32(dev, "ioclk", &i2c->sys_freq);
 	}
 
 skip:
@@ -182,7 +183,6 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	if (!i2c->twsi_base)
 		return -EINVAL;
 
-	thunder_i2c_clock_enable(dev, i2c);
 	ret = device_property_read_u32(dev, "clock-frequency", &i2c->twsi_freq);
 	if (ret)
 		i2c->twsi_freq = I2C_MAX_STANDARD_MODE_FREQ;
@@ -196,12 +196,12 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 
 	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	ret = devm_request_irq(dev, pci_irq_vector(pdev, 0), octeon_i2c_isr, 0,
 			       DRV_NAME, i2c);
 	if (ret)
-		goto error;
+		return ret;
 
 	ret = octeon_i2c_init_lowlevel(i2c);
 	if (ret)
@@ -213,6 +213,9 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	 */
 	if (octeon_i2c_is_otx2(pdev) && IS_LS_FREQ(i2c->twsi_freq))
 		i2c->sys_freq = OTX2_REF_FREQ_DEFAULT;
+	else
+		thunder_i2c_clock_enable(dev, i2c);
+
 	octeon_i2c_set_clock(i2c);
 
 	i2c->adap = thunderx_i2c_ops;
@@ -240,6 +243,8 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 
 error:
 	thunder_i2c_clock_disable(dev, i2c->clk);
+	if (!IS_LS_FREQ(i2c->twsi_freq))
+		thunder_i2c_clock_disable(dev, i2c->clk);
 	return ret;
 }
 
-- 
2.42.0


