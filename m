Return-Path: <linux-i2c+bounces-1571-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E0845153
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 07:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0877B288B97
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 06:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E07634FF;
	Thu,  1 Feb 2024 06:17:56 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238B986ADB
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706768276; cv=none; b=s6/99x1OBCFUIuXYWLZtyEKCj7ydE1BfnEFZYJHvKM2je67yl0E4FuU4cQwIp7hUBA6kpElpgA5RdWXbLnGtI0VpJByJzTn5l+E+1ICHiLZQRNadLTvnK1xBC27uNJ7l+oRx9sOAjzweYUm8456ygYQ/Fbv9v8uPPx7biHB4Uns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706768276; c=relaxed/simple;
	bh=m6UQU0p5vuahi+wb5trnZi6E8jgi6e2HKgEb3NV9pZk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FaqmwhximDogwMIY2ccqIWwLuyyXOWhQ7O9yVOYO7Nru3PJzeGdT7YK05IlNLJH3frlKA0/o0MFtJYicVxk/xzIlrNhGtjZUnb2i2M114VkN+CLf8EhGCle3khNdPN00EMsLbRXf5c4c3QExI4NZcnEMd9XpGBmNNYHkLyV8/r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TQT9W4N1gz1FK4q;
	Thu,  1 Feb 2024 14:13:19 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (unknown [7.193.23.29])
	by mail.maildlp.com (Postfix) with ESMTPS id 8993E14040F;
	Thu,  1 Feb 2024 14:17:49 +0800 (CST)
Received: from localhost.localdomain (10.67.165.2) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 14:17:49 +0800
From: Devyn Liu <liudingyuan@huawei.com>
To: <andi.shyti@kernel.org>
CC: <yangyicong@hisilicon.com>, <f.fangjian@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-i2c@vger.kernel.org>,
	<liudingyuan@huawei.com>
Subject: [PATCH v2 1/2] i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth - 1
Date: Thu, 1 Feb 2024 14:13:44 +0800
Message-ID: <20240201061345.3111600-2-liudingyuan@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20240201061345.3111600-1-liudingyuan@huawei.com>
References: <20240201061345.3111600-1-liudingyuan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600002.china.huawei.com (7.193.23.29)

The driver finishs a write cycle by read the fifo tx full status
or write limit decrease to 0. The driver starts to write data to
the FIFO after the I2C FIFO almost empty interrupt is reported.
The threshold for FIFO almost empty interrupt is that the amount
of data in the FIFO is less than or equal to 1.
Reduce write maxwrite to the fifo depth - aempty interrupt
threshold. Limiting the number of data to be written at a time
to remaining fifo capacity.

Signed-off-by: Devyn Liu <liudingyuan@huawei.com>
---
 drivers/i2c/busses/i2c-hisi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index dfad5bad5075..cd37053362ee 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -266,7 +266,7 @@ static int hisi_i2c_read_rx_fifo(struct hisi_i2c_controller *ctlr)
 
 static void hisi_i2c_xfer_msg(struct hisi_i2c_controller *ctlr)
 {
-	int max_write = HISI_I2C_TX_FIFO_DEPTH;
+	int max_write = HISI_I2C_TX_FIFO_DEPTH - HISI_I2C_TX_F_AE_THRESH;
 	bool need_restart = false, last_msg;
 	struct i2c_msg *cur_msg;
 	u32 cmd, fifo_state;
-- 
2.30.0


