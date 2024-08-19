Return-Path: <linux-i2c+bounces-5518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 014469569CD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 344CD1C22314
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7575B16D4C6;
	Mon, 19 Aug 2024 11:47:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CF816D314;
	Mon, 19 Aug 2024 11:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068040; cv=none; b=dY4O+FX2FNLh/A7m/b9eA/DtDTzgjy2gbaqtRudnRmNPHjV2W0p0ktQxw8fffeQc3fj8cWu4dVKE9kIC+QfKBBerDPVuD/B+NaAKxMx+jIKkWos6FP+wBkcENzPqaDWAd6MF+ZfHj6z+3APHMMWYot9CcXClUQ/ZyqUXpRxMAtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068040; c=relaxed/simple;
	bh=FxkusQMvUe5wYHmZFBlnjdm/rzus8nNbq0ATgyGnGJk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AWuGkC56wl5XCe/CkIWKvKbwh6usafnlt7ocQdIq3AUzDAmHKqoajVeUTISl71tbBGqW7QzZCqPLNSw7OnVWko5Wi3zVzT8gfttIbHiS7rdyDGSGXJM+bOYk9UBrZUBwtlkiEVIdaR0Y2iqYnPRkPPgIy5R6WoaQSlj3MPkDkAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WnW0n6XCnz2Cmxf;
	Mon, 19 Aug 2024 19:42:17 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 61F561A016C;
	Mon, 19 Aug 2024 19:47:16 +0800 (CST)
Received: from huawei.com (10.67.174.76) by kwepemg500010.china.huawei.com
 (7.202.181.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Aug
 2024 19:47:15 +0800
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
Subject: [PATCH -next 9/9] ipmi: ipmi_ssif: fix module autoloading
Date: Mon, 19 Aug 2024 11:38:55 +0000
Message-ID: <20240819113855.787149-10-liuyuntao12@huawei.com>
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
 drivers/char/ipmi/ipmi_ssif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index 96ad571d041a..e8e7b832c060 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -2085,6 +2085,7 @@ static const struct platform_device_id ssif_plat_ids[] = {
     { "dmi-ipmi-ssif", 0 },
     { }
 };
+MODULE_DEVICE_TABLE(platform, ssif_plat_ids);
 
 static struct platform_driver ipmi_driver = {
 	.driver = {
-- 
2.34.1


