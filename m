Return-Path: <linux-i2c+bounces-6600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD57975FA7
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 05:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E834283C01
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 03:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4708B126C16;
	Thu, 12 Sep 2024 03:26:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC07581A;
	Thu, 12 Sep 2024 03:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726111562; cv=none; b=CBMTYBJ1+mDisJ0q9mg+mCq1qtvEaZfrSJwbjgGXvY6sL7lOC2hWE/TTXXHVemAl9v4ltw1lT7+Zd8LDYp2v0oRfG81hyfnyDXFDHzmBwSN+D9ls39k2pYuyW18/kT/SswFtrREs4rUdAr0Keh/WKjDkuvhmhv2dpSJs9CHc+iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726111562; c=relaxed/simple;
	bh=OTm/auh62y9B1A4Dktt7dWG7QxZAxzF1ypO8gGdo2io=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j3q7Oq2gUSAUco6ZBTSpqdo+GfOE7kexB8r6sWoK8BF+ca+gSbJN8GQjuvsm9z75AH5gaCVGFWrrrh7jsiDYkKD9tnS6X34svCe6IKNN9XtsZPyPpbBiZRzIDc+SKLMXNQob4Okm7bAdY4wcl3h+2xbOsY74hJBSaeik9kGpu4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X42rK3qFtz1j8H1;
	Thu, 12 Sep 2024 11:25:21 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 8DC1A1401F1;
	Thu, 12 Sep 2024 11:25:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Sep
 2024 11:25:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <andi.shyti@kernel.org>, <swboyd@chromium.org>, <wsa@kernel.org>,
	<sdharia@codeaurora.org>, <girishm@codeaurora.org>, <dianders@chromium.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Thu, 12 Sep 2024 11:34:59 +0800
Message-ID: <20240912033459.3013904-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable when request IRQ.

Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 06e836e3e877..4c9050a4d58e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -818,15 +818,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
-	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
+	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
 			       dev_name(dev), gi2c);
 	if (ret) {
 		dev_err(dev, "Request_irq failed:%d: err:%d\n",
 			gi2c->irq, ret);
 		return ret;
 	}
-	/* Disable the interrupt so that the system can enter low-power mode */
-	disable_irq(gi2c->irq);
 	i2c_set_adapdata(&gi2c->adap, gi2c);
 	gi2c->adap.dev.parent = dev;
 	gi2c->adap.dev.of_node = dev->of_node;
-- 
2.34.1


