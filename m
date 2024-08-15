Return-Path: <linux-i2c+bounces-5416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78785952BF6
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 12:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 193B41F2456E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 10:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8699F1E673A;
	Thu, 15 Aug 2024 09:10:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8A81E4EF6;
	Thu, 15 Aug 2024 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723713001; cv=none; b=Qj/o12da1pAPbDhnbKwuTf0CfRsd6+ccACSIj7i9/ggeEWQMcNKeKujzB2h67Axctl+Cok5oSeIUiWaQP6gxj8ttAChWVCuANpK1ClHQu+oQEnOkEShPYzz0lbuQURderJ8ouAMXHTRICWpp6QHwf7hBMJ+5yIMQ/4uYMyZ1jsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723713001; c=relaxed/simple;
	bh=lHn3fEVCycgTvABI3HB4fI3oU0AS1hAXMund21/jUZE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rvtgp1QK6B+u8vogvLhRp+qDzkJqNhG6/SpBlG6spldI3FHthCf0oVC0wdgszV/gTAsJuXUhFsrIMckO5Wu0uyJlJHEoDH6ypBSsXaXTI0Jqyr4pRbl0jps0xXJsY439nzBOfM5X4XLVh8U1DU21CtKnSjTIVUrZYz9PkQL3bBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WkzlF2kffz1HGXm;
	Thu, 15 Aug 2024 17:06:49 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BEA4414011F;
	Thu, 15 Aug 2024 17:09:54 +0800 (CST)
Received: from huawei.com (10.67.174.76) by kwepemg500010.china.huawei.com
 (7.202.181.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 15 Aug
 2024 17:09:54 +0800
From: Yuntao Liu <liuyuntao12@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <david-b@pacbell.net>, <khali@linux-fr.org>,
	<wsa+renesas@sang-engineering.com>, <liuyuntao12@huawei.com>
Subject: [PATCH] i2c: fix module autoloading
Date: Thu, 15 Aug 2024 09:02:25 +0000
Message-ID: <20240815090225.756845-1-liuyuntao12@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemg500010.china.huawei.com (7.202.181.71)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from i2c_device_id table.

Fixes: e9f1373b64388 ("i2c: Add i2c_new_dummy() utility")
Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
---
 drivers/i2c/i2c-core-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b63f75e44296..82622ef71b41 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1070,6 +1070,7 @@ static const struct i2c_device_id dummy_id[] = {
 	{ "smbus_host_notify", },
 	{ },
 };
+MODULE_DEVICE_TABLE(i2c, dummy_id);
 
 static int dummy_probe(struct i2c_client *client)
 {
-- 
2.34.1


