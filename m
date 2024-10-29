Return-Path: <linux-i2c+bounces-7641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4D9B4028
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 03:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 818FB282774
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 02:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9464313CFA6;
	Tue, 29 Oct 2024 02:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uLK5GKVf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E68BE8;
	Tue, 29 Oct 2024 02:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730167789; cv=none; b=P7tE8aR39zdDMPYUv9u+GH9TcO/IpR0y2g3sUOybENOPNM7a3JLrM8Fdi5gdiNlwySqqcHEXfjogjZcOvOhCKTelaxtC5bssjHOUpLv53/5B/OBQX7WNcCQ8Hk9Ho6yxyVpq6+5q1HLJKc20fgRsS5up6Q2B85jaXmJa1XSCA8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730167789; c=relaxed/simple;
	bh=XHhfaqqMiTpKWA1JbdNg5fGXzoeVnAuiHLtBpbjUa/8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HvhmX/OJbQPLE11zMudK8fLjGq4ax+r+6FqNyaklFKIBTDoXNtHufK95fNgP2d9y8P/7rjzUq14J1/Qzyu0neegtL/D0qKmks+0JmUltuss+2eekWg26+Nu0DhIpY8LcxT4pFnbBtWAdUpI0g0QSyzeQ1MQfJZre6a4KBQ8vBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=uLK5GKVf; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730167778; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=UZQ4vTEAFGdHKT4zvnIqMlcj0U5DV0sNZfjPCj5XolQ=;
	b=uLK5GKVfLVhHe65nGU6i0FRdHZOuv2FSyIC3NUA1r+w59Fc6Wa/96UZM0qXhM3J/VoVeDDZoSfcb39y6RDYWst4gJ94lknLJmpGreIBNCl9DA2oYKE4zNUhpxXl4hLrd0qVDDlQVgL/Jo/EdobUhGjmZHAO95HXw9yMF+suszZs=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WI8QfWi_1730167772 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Oct 2024 10:09:38 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: loic.poulain@linaro.org
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH v2 -next] i2c: qcom-cci: Remove the unused variable cci_clk_rate
Date: Tue, 29 Oct 2024 10:09:31 +0800
Message-Id: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Variable ret is not effectively used, so delete it.

drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -Remove redundant code.

 drivers/i2c/busses/i2c-qcom-cci.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 5cc791b3b57d..a0ef43e99751 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -523,7 +523,6 @@ static const struct dev_pm_ops qcom_cci_pm = {
 static int cci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	unsigned long cci_clk_rate = 0;
 	struct device_node *child;
 	struct resource *r;
 	struct cci *cci;
@@ -594,14 +593,6 @@ static int cci_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
 	cci->nclocks = ret;
 
-	/* Retrieve CCI clock rate */
-	for (i = 0; i < cci->nclocks; i++) {
-		if (!strcmp(cci->clocks[i].id, "cci")) {
-			cci_clk_rate = clk_get_rate(cci->clocks[i].clk);
-			break;
-		}
-	}
-
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;
-- 
2.32.0.3.g01195cf9f


