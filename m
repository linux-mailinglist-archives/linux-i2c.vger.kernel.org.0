Return-Path: <linux-i2c+bounces-5515-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2199B9569BD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D465C283EA3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A32116C6AA;
	Mon, 19 Aug 2024 11:47:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CEE167DAC;
	Mon, 19 Aug 2024 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068034; cv=none; b=e8ZAH74c9MrsSf9Mp+F7Zf3hFLMxbDvy0BMltjHFEyv57nM5sRxiWpf1l9BwXztyqsHT1nAvkWjPzYoHp9zKMH4wfDaHC2OspJ6wocw9B/EaTmCC/FDsOn+hJzi0JS1ncJR8G3hcB/xHJY0E3j9MWr28QaddAGMDvRwmTcS61ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068034; c=relaxed/simple;
	bh=2DzJEJobRuCU+qAeOZkjOt2NBFe7XbkCNaEoOgV/D00=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nuic4MXoHvxVqLyZPYe8RWEoBW81eH+v00NSpQWY/1xz2m7AdVtX1yC69NXBwGhUBA5Png5ShONmN455WycamrTeA4H66OqydJ7KRD4HmYqT+06LTpkLOpBVLGM5f22jfcTBS4gqbU1WGA+d0YFjQA5QzKgOsyHHSrqV8SyHZ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WnW0g1TZ3z1S8DR;
	Mon, 19 Aug 2024 19:42:11 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 028DF14022E;
	Mon, 19 Aug 2024 19:47:10 +0800 (CST)
Received: from huawei.com (10.67.174.76) by kwepemg500010.china.huawei.com
 (7.202.181.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Aug
 2024 19:47:08 +0800
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
Subject: [PATCH -next 5/9] mpc85xx_edac: fix module autoloading
Date: Mon, 19 Aug 2024 11:38:51 +0000
Message-ID: <20240819113855.787149-6-liuyuntao12@huawei.com>
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
 drivers/edac/mpc85xx_edac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index d0266cbcbeda..c8b94aab9819 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -320,6 +320,7 @@ static const struct platform_device_id mpc85xx_pci_err_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(platform, mpc85xx_pci_err_match);
 
 static struct platform_driver mpc85xx_pci_err_driver = {
 	.probe = mpc85xx_pci_err_probe,
-- 
2.34.1


