Return-Path: <linux-i2c+bounces-7674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4FD9B780C
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 10:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B165B264F9
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 09:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DBF198A03;
	Thu, 31 Oct 2024 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="wNc2oz50"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3D197A88;
	Thu, 31 Oct 2024 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730368431; cv=none; b=LW5c5KfVhXbjJsShgy66nbJlJoZ75YpscA9V0wjicDlf3jDZwdASH0wY+Oc6fPyx3kTPDGHFd/LMoSagZonUF6eMrANROs35qAN0VVCaynqQpIj8tZrvhmz/cK+pKK6aRVaYDP9VI0zcuhiERDoo6DeY/Wn8C+MuyFWr6/3efws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730368431; c=relaxed/simple;
	bh=0hAbibYw78eyW0WaronR6Y5IkKbyRWlHtxwEtsfgzp4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=siJE5nEM+PyBoBXXPfzOb1KNjccZIDNO219pnH86o8qq4UaIYchLZ2Y26kBPJ4YkvC69vRRhljBsZZbuia5wx3+dHCG1LWBK4zxw0U5+4v5Dg9TgurJVY3eHmrrIYvz6e0ggssnxEnJ4XdGLEm2IN4zhX9aiH9TrTtYZdFG6Wlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=wNc2oz50; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730368424; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=/gxQun8NBH4VD5+YnEd6wm/9+HC+j8hN3k/sDGJrzAg=;
	b=wNc2oz50ajeFPL1omzTE28pd7OCdWhBcsG3FAT4afnMSoJAV6/rZMo+OJaf1+aEW5hLLP0V9hoaIoPsf2wHnPMNkY9Y/rqu7uARbRziOtuA6dHTowhKguCsHj8A3jdmJmIWWNnyt+VkIsA6Q/sXMglli2Zv+5vpDzNqLGd3ESmw=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WII0kr8_1730368419 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 31 Oct 2024 17:53:44 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: loic.poulain@linaro.org
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH v3 -next] i2c: qcom-cci: Remove the unused variable cci_clk_rate
Date: Thu, 31 Oct 2024 17:53:39 +0800
Message-Id: <20241031095339.76535-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Variable cci_clk_rate is not effectively used, so delete it.

drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
Fixes: 823dfb7bdb21 ("i2c: qcom-cci: Stop complaining about DT set clock rate")
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v3:
  -Modify the commit message.

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


