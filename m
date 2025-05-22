Return-Path: <linux-i2c+bounces-11116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D90AC1146
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 18:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2B961673B4
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 16:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD3629AAE8;
	Thu, 22 May 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MrA6cTl+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309B381741;
	Thu, 22 May 2025 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931925; cv=none; b=Z1vHXbdwsWYh+5VwCM5YVbBdMCsvcG32ZFFLX8LO+bSpTLuDjK6kzlpWLbPvpu06V8q8IkCNI+ToA9feUYNLGaCglDW1D3fAaRat/ABBkF24DPZXGTDQVGOQmmNBYP8x4nReGr3URu7K+hjMahOkiP3+0xxGpjsgoPzyv+w3q8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931925; c=relaxed/simple;
	bh=BNpi2nFBQAFV/WMKJHvYLfcwSSej3dZ3v1djNDve9jk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rrj6Ad5mjOZwcBZGRJkJKXqoaxfkaqS5gci64wruAgziQ10Dj6WKF+tiwyNyi7FSQzl0GuTWcv/XnGR5FH7/t5rTlupf1AllRmqGG9NgSDnBJYerYblN7+2coSAZuXnOGpoAMwfB37GGIMaClecW77hFPcA0w5qZLSk6EoenIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MrA6cTl+; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=x3
	IEnvTJUGCZMysuw/nTm9ZVJwxYs3uYCivFSvi4Vsk=; b=MrA6cTl+mJySoMZcWx
	j6w+aEuPXz08+r6Dm7n0uzPxuzv+gugAm9t//DkukYhCpFixbQgl67RfZZm+Jlwr
	gMQuGsqUMZ/RfZ8q9sR5o9WN9TlkGZa57rbasDZi522+xSWj4LISC0VeqTxuuHw5
	Cr3ziAwV6OLGzYNPU+s2eq8U8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAHCmX6Ui9ohoENBg--.33019S2;
	Fri, 23 May 2025 00:38:20 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: ldewangan@nvidia.com,
	andi.shyti@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: digetx@gmail.com,
	linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hans.zhang@cixtech.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH] i2c: tegra: Add missing kernel-doc for dma_dev member
Date: Fri, 23 May 2025 00:38:14 +0800
Message-Id: <20250522163814.399630-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgAHCmX6Ui9ohoENBg--.33019S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr45Kry3trWDZw1rury7trb_yoWkXrgEvF
	n7WF47tr1q9rnIyF13WF4fXryjkrWYgF1ktas7t39aka4qqw15GF1DZrWfCrW8X3ZrtFsr
	Wr1DtFWIyrnxAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREqXdUUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDxtVo2gvSyDDsAAAs9

Fix the kernel-doc warning by describing the 'dma_dev' member in
the tegra_i2c_dev struct.  This resolves the compilation warning:

drivers/i2c/busses/i2c-tegra.c:297: warning: Function parameter or struct member 'dma_dev' not described in 'tegra_i2c_dev'

Fixes: cdbf26251d3b ("i2c: tegra: Allocate DMA memory for DMA engine")
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/i2c/busses/i2c-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d0..07bb1e7e84cc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -253,6 +253,7 @@ struct tegra_i2c_hw_feature {
  * @dma_phys: handle to DMA resources
  * @dma_buf: pointer to allocated DMA buffer
  * @dma_buf_size: DMA buffer size
+ * @dma_dev: DMA device used for transfers
  * @dma_mode: indicates active DMA transfer
  * @dma_complete: DMA completion notifier
  * @atomic_mode: indicates active atomic transfer

base-commit: fee3e843b309444f48157e2188efa6818bae85cf
-- 
2.25.1


