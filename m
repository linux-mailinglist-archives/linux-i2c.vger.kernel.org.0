Return-Path: <linux-i2c+bounces-1427-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5971838876
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 09:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F992282997
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 08:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDFD56777;
	Tue, 23 Jan 2024 08:06:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9A85675F
	for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705997187; cv=none; b=JPtVIHegYAn8EFyK9cbJv/hKL37xrBfRRE7uyLMGZsfv8eQajZ7mmuuoKYOcb2cheRj5nDvrGxUdoH8nq8iFXwAVYmLwh5wyL1p08WyEvnVEDcdGYm8kN5jstTSdAC4V7wrXAgLZniiaMcJsiqA8pwSdYJVpKvwqaDStYNSSRlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705997187; c=relaxed/simple;
	bh=E8ClC+xI68iVUZ3u5HFzj9otJkACKMdU2+GNl4rHwlU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbVpKlyGvSKTsOELLgHBi3dGQYR8aHbzYWMMQMZsYIA1LLGF9zs8xSxwY9/70N4e6U4p/IMFZE6ERei+VEOca/QySpLHd6WIaI06fOvLG96YD6wyimny33PJtm/pD/k6xiWon98lxQONcYawH3rWF41prsh/AK2BH6j03IOvkCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TK0474P6Nz1gxwh;
	Tue, 23 Jan 2024 16:04:39 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (unknown [7.193.23.29])
	by mail.maildlp.com (Postfix) with ESMTPS id B4A4A180030;
	Tue, 23 Jan 2024 16:06:22 +0800 (CST)
Received: from localhost.localdomain (10.67.165.2) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 16:06:22 +0800
From: Devyn Liu <liudingyuan@huawei.com>
To: <andi.shyti@kernel.org>
CC: <yangyicong@hisilicon.com>, <f.fangjian@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-i2c@vger.kernel.org>,
	<liudingyuan@huawei.com>
Subject: [PATCH 1/2] i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth - 1
Date: Tue, 23 Jan 2024 16:02:21 +0800
Message-ID: <20240123080222.1512009-2-liudingyuan@huawei.com>
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

The driver finishs a write cycle by read the fifo tx full status
or write limit decrease to 0. The driver starts to write data to
the FIFO after the I2C FIFO almost empty interrupt is reported.
The threshold for FIFO empty interrupt is that the amount of data in
the FIFO is less than or equal to 1.
Reduce write maxwrite to the fifo depth - 1. Limiting the number of
data to be written at a time to remaining fifo capacity.

Signed-off-by: Devyn Liu <liudingyuan@huawei.com>
---
 drivers/i2c/busses/i2c-hisi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index dfad5bad5075..82a0c739aae4 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -266,7 +266,7 @@ static int hisi_i2c_read_rx_fifo(struct hisi_i2c_controller *ctlr)
 
 static void hisi_i2c_xfer_msg(struct hisi_i2c_controller *ctlr)
 {
-	int max_write = HISI_I2C_TX_FIFO_DEPTH;
+	int max_write = HISI_I2C_TX_FIFO_DEPTH - 1;
 	bool need_restart = false, last_msg;
 	struct i2c_msg *cur_msg;
 	u32 cmd, fifo_state;
-- 
2.30.0


