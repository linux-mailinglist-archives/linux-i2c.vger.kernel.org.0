Return-Path: <linux-i2c+bounces-5513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB59569B2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CE151F22895
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94D816B75B;
	Mon, 19 Aug 2024 11:47:12 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37F116B391;
	Mon, 19 Aug 2024 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068032; cv=none; b=nOFpHEAUPWNsAZ4Rmdv6J+VDiy9KxAe9+PS6iBtZdt4er0/HjX9Futn0xxagkVzotcSz94HkvPwhzVoqexOs4jrignIhHdtUVNDl0MBecESx0infxzPgd4EdCMo6H+6QhUm5cv14bRhN3TIEbWEU7aHdCrnuujvTIyYNwnDrWSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068032; c=relaxed/simple;
	bh=NpWHJAZzy6bihSil5yACIsY+bB4FoKp1cpzerLXIPJw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sgwm/ifJgDGs6BBaOToWz6126BB2uOhQ3qDw924mseFzGyKlnlRn7943kM3GOAeiuhVptERMQjx6uofPWYUi8eMlwh6YVE1tRgwgi0CvQaP8eN30u7FT4TM1gFNmBQmnEMwV/l9r1LOuQmJAk6MGLQgplYtgWJILq5IWm8gbMdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WnW0c1MBdz2Cn2S;
	Mon, 19 Aug 2024 19:42:08 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A0AE918001B;
	Mon, 19 Aug 2024 19:47:06 +0800 (CST)
Received: from huawei.com (10.67.174.76) by kwepemg500010.china.huawei.com
 (7.202.181.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Aug
 2024 19:47:05 +0800
From: Yuntao Liu <liuyuntao12@huawei.com>
To: <openipmi-developer@lists.sourceforge.net>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<dmaengine@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <minyard@acm.org>, <ludovic.desroches@microchip.com>, <vkoul@kernel.org>,
	<daniel@zonque.org>, <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
	<morbidrsa@gmail.com>, <bp@alien8.de>, <tony.luck@intel.com>,
	<james.morse@arm.com>, <mchehab@kernel.org>, <rric@kernel.org>,
	<codrin.ciubotariu@microchip.com>, <andi.shyti@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<stern@rowland.harvard.edu>, <u.kleine-koenig@pengutronix.de>,
	<duje.mihanovic@skole.hr>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <liuyuntao12@huawei.com>
Subject: [PATCH -next 3/9] misc: atmel-ssc: fix module autoloading
Date: Mon, 19 Aug 2024 11:38:49 +0000
Message-ID: <20240819113855.787149-4-liuyuntao12@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819113855.787149-1-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
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
based on the alias from platform_device_id table.

Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
---
 drivers/misc/atmel-ssc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
index 6eac0f335915..e7a87183bfbb 100644
--- a/drivers/misc/atmel-ssc.c
+++ b/drivers/misc/atmel-ssc.c
@@ -110,6 +110,7 @@ static const struct platform_device_id atmel_ssc_devtypes[] = {
 		/* sentinel */
 	}
 };
+MODULE_DEVICE_TABLE(platform, atmel_ssc_devtypes);
 
 #ifdef CONFIG_OF
 static const struct of_device_id atmel_ssc_dt_ids[] = {
-- 
2.34.1


