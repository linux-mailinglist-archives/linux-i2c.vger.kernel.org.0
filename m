Return-Path: <linux-i2c+bounces-1944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5786120F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 13:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB03EB25CE2
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 12:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF787EEFF;
	Fri, 23 Feb 2024 12:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="DTByYQtY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5147E567;
	Fri, 23 Feb 2024 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708693081; cv=none; b=UaOL1v+lwQJFQWeGO8ead8Cc4kyUySRtMYRrzf3SwDD5gn8mKlQbM9bzVl4AB+OfAdEMsv5Bu5KFM5V7tOUTRR8PP8Ib2bdeZ/E6nsMQmiaMGNyewJ1O7rBFVjs7kjqZxMB8Rg8MnX8PJCjxJF2vyripXlX1Yv95yY7reoByuUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708693081; c=relaxed/simple;
	bh=Iv4SmMizPp3DiNnX4FIfIVMQO/eRWjMBWUQIGci4l9Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmHkHMtOeHDhHqn5G3vVmRbQuastgHQxvLTT6x5mxvC0ZP4/DuQn8xFfLsL9GL2Ct41ena7s+PcOAE4cPc6QosWR3IZmEsXEX9gE+1ZPlBpDoRzQ78fuqmcFV4ksUI/fpGjYnQ/D5O1nST5283LxwzFCF04W9DC67zKR6nws3Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=DTByYQtY; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N1rS0S005281;
	Fri, 23 Feb 2024 04:57:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=9QciEZuCj1+ay5xI5Bbrb9HOFRQAoH+hyypmQtVuH50=; b=DTB
	yYQtYpteFzqPGkkhFssI0BxRjh3oOluQpt3toXxCFK2RrUkOSI5xGiOKFfUQPFgw
	M6/3IHILXVulKGVqKvBkbaJCtCD71rr/+2hzQO8DuQsdcjlKI0qCeQyRDAmvASCu
	8ofz6rHun8e+1qM1s7Rvf0GkK4GmtbsNNo9+sAd+XHfx1vNJUZkYw2EP8/oN5cFp
	MNhC+//1K5PdONHRNvLy+XssEKp/xd36646bO8LHms7okr+Eh5ytLGOirfuDyoJc
	rO83h7lrPBDsbcph/JYRSBmKOph1jLVmDakj9H1xSuLUL8mhP6EcfXAVyDZz8kH+
	2h0Y/HJcgbGJBSNjSJA==
Received: from dc5-exch02.marvell.com ([199.233.59.182])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3wej3j9rum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 04:57:58 -0800 (PST)
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 23 Feb
 2024 04:57:56 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Fri, 23 Feb 2024 04:57:56 -0800
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 1EA623F70D0;
	Fri, 23 Feb 2024 04:57:56 -0800 (PST)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andi.shyti@kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v4 4/4] i2c: thunderx: Adding ioclk support
Date: Fri, 23 Feb 2024 04:57:25 -0800
Message-ID: <20240223125725.1709624-5-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223125725.1709624-1-pmalgujar@marvell.com>
References: <20240223125725.1709624-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4-W_6GDdFVoqOB5KAuBJn9BzOhHEpWrU
X-Proofpoint-ORIG-GUID: 4-W_6GDdFVoqOB5KAuBJn9BzOhHEpWrU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02

Read the ioclk property as reference clock if sclk not
present in acpi table to make it SOC agnostic.
In case, it's not populated from dts/acpi table, use 800MHz
as default clock.

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
2.43.0


