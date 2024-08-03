Return-Path: <linux-i2c+bounces-5121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0789467FC
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Aug 2024 08:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59DA11F21E30
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Aug 2024 06:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C59B14D2B8;
	Sat,  3 Aug 2024 06:10:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED814D718;
	Sat,  3 Aug 2024 06:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722665448; cv=none; b=lft4X7TQUsUFEe5xSDoopjkbLBI+pNud2N4rC3rOlghIVfBXWPP7VjqjdfitdIpw5pKft6R0MG7EKk2NsbZEaOnGQwAZ/l79VSz3JofDHInRYNTeZ0ypdaYTOEOJOXVKzScHCb7CTPU3cZTBehuNwQgYLjleT/qLiW8DO8bK8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722665448; c=relaxed/simple;
	bh=kZL3Q7hJY189a9LoExdpoJ/+VniR4S7cXNeX7NA5MUg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QKZWehI1O7/paWCP19MYHbivKQw4yJfk4K+P7JPK2s1XXiYVurWPETUkuEuK1yjmjfhnOwczWfhf/GhopY4ZbhyOy6ghyzomNiUDZev0FZ+oUzY5uCNy2FKy4J0WxEupl5DdlaHAWYXkeZ4ZfmqiQqvu07g/gdZoRxW281ucIwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WbXNL5sSdznbYF;
	Sat,  3 Aug 2024 14:09:38 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A2D118007C;
	Sat,  3 Aug 2024 14:10:42 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 3 Aug 2024 14:10:42 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <andi.shyti@kernel.org>, <cuigaosheng1@huawei.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH -next] i2c: qcom-geni: Add missing clk_disable_unprepare in geni_i2c_runti
Date: Sat, 3 Aug 2024 14:10:41 +0800
Message-ID: <20240803061041.283940-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200011.china.huawei.com (7.221.188.251)

Add the missing clk_disable_unprepare() before return in
geni_i2c_runti().

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 0a8b95ce35f7..78f43648e9f3 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -990,8 +990,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 		return ret;
 
 	ret = geni_se_resources_on(&gi2c->se);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(gi2c->core_clk);
 		return ret;
+	}
 
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
-- 
2.25.1


