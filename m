Return-Path: <linux-i2c+bounces-1429-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8008083887A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 09:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F4D2840BA
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 08:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E38D5731C;
	Tue, 23 Jan 2024 08:06:32 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146F57316
	for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 08:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705997192; cv=none; b=OYRygFKJprIeK2zQteh1gpSbAyLjiA0GaS870sTMLJodRCjKm0rMnodu5FxbW4DSLuDcas3js6/2u7zfMl8jnTTJgxn6PpHsSRJ5/hdDvPezZ+lvu9qLzr44SnBZ20i0HcPmAfGaXnT4in1Wxxf7hMtQd5Mql88nMQIj8Nsfm7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705997192; c=relaxed/simple;
	bh=1TVbFpb2qzCl2NEaUM5NvTtzbQL4H6HFaoyz8fyLNc8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kbgY7NqG16jeW5JH1pcfYp61NvWlEoAuN4l4fy6H+EcldQeQop8D+NvNljqswaPiyXnbzDHWBBVldbWBHU3hGEvmwT4GYSnVTp5mFMx8kzJXeaXMOtTfxssIQPCAxQVGNOShgHNRuckRBwILzE51qJ0xqoThL6Vtms2LiWWUS60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4TK04x6Dkcz1Q87p;
	Tue, 23 Jan 2024 16:05:21 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (unknown [7.193.23.29])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A68118005E;
	Tue, 23 Jan 2024 16:06:23 +0800 (CST)
Received: from localhost.localdomain (10.67.165.2) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 16:06:22 +0800
From: Devyn Liu <liudingyuan@huawei.com>
To: <andi.shyti@kernel.org>
CC: <yangyicong@hisilicon.com>, <f.fangjian@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-i2c@vger.kernel.org>,
	<liudingyuan@huawei.com>
Subject: [PATCH 2/2] i2c: hisi: Add clearing tx aempty interrupt operation
Date: Tue, 23 Jan 2024 16:02:22 +0800
Message-ID: <20240123080222.1512009-3-liudingyuan@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20240123080222.1512009-1-liudingyuan@huawei.com>
References: <20240123080222.1512009-1-liudingyuan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600002.china.huawei.com (7.193.23.29)

The driver receives the tx fifo almost empty(aempty) interrupt and
reads the tx_aempty_int_mstat to start a round of data transfer.
The operation of clearing the TX aempty interrupt after completing
a write cycle is added to ensure that the FIFO is truly at almost
empty status when an aempty interrupt is received.
The threshold for fifo almost empty interrupt is defined as 1.

Signed-off-by: Devyn Liu <liudingyuan@huawei.com>
---
 drivers/i2c/busses/i2c-hisi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index 82a0c739aae4..08f6f97722a8 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -57,6 +57,8 @@
 #define   HISI_I2C_FS_SPK_LEN_CNT	GENMASK(7, 0)
 #define HISI_I2C_HS_SPK_LEN		0x003c
 #define   HISI_I2C_HS_SPK_LEN_CNT	GENMASK(7, 0)
+#define HISI_I2C_TX_INT_CLR		0x0040
+#define   HISI_I2C_TX_AEMPTY_INT		BIT(0)
 #define HISI_I2C_INT_MSTAT		0x0044
 #define HISI_I2C_INT_CLR		0x0048
 #define HISI_I2C_INT_MASK		0x004C
@@ -124,6 +126,11 @@ static void hisi_i2c_clear_int(struct hisi_i2c_controller *ctlr, u32 mask)
 	writel_relaxed(mask, ctlr->iobase + HISI_I2C_INT_CLR);
 }
 
+static void hisi_i2c_clear_tx_int(struct hisi_i2c_controller *ctlr, u32 mask)
+{
+	writel_relaxed(mask, ctlr->iobase + HISI_I2C_TX_INT_CLR);
+}
+
 static void hisi_i2c_handle_errors(struct hisi_i2c_controller *ctlr)
 {
 	u32 int_err = ctlr->xfer_err, reg;
@@ -168,6 +175,7 @@ static int hisi_i2c_start_xfer(struct hisi_i2c_controller *ctlr)
 	writel(reg, ctlr->iobase + HISI_I2C_FIFO_CTRL);
 
 	hisi_i2c_clear_int(ctlr, HISI_I2C_INT_ALL);
+	hisi_i2c_clear_tx_int(ctlr, HISI_I2C_TX_AEMPTY_INT);
 	hisi_i2c_enable_int(ctlr, HISI_I2C_INT_ALL);
 
 	return 0;
@@ -323,6 +331,8 @@ static void hisi_i2c_xfer_msg(struct hisi_i2c_controller *ctlr)
 	 */
 	if (ctlr->msg_tx_idx == ctlr->msg_num)
 		hisi_i2c_disable_int(ctlr, HISI_I2C_INT_TX_EMPTY);
+
+	hisi_i2c_clear_tx_int(ctlr, HISI_I2C_TX_AEMPTY_INT);
 }
 
 static irqreturn_t hisi_i2c_irq(int irq, void *context)
@@ -363,6 +373,7 @@ static irqreturn_t hisi_i2c_irq(int irq, void *context)
 	if (int_stat & HISI_I2C_INT_TRANS_CPLT) {
 		hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
 		hisi_i2c_clear_int(ctlr, HISI_I2C_INT_ALL);
+		hisi_i2c_clear_tx_int(ctlr, HISI_I2C_TX_AEMPTY_INT);
 		complete(ctlr->completion);
 	}
 
-- 
2.30.0


