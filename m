Return-Path: <linux-i2c+bounces-5510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B89569A0
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 837012812A1
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0156166F3B;
	Mon, 19 Aug 2024 11:47:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101DA15DBAB;
	Mon, 19 Aug 2024 11:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068022; cv=none; b=bWDGfHVCra+uY+kU7Dji9tKgU4wUCOudliPwWrmJXBQ9IRIGTn6vAB7AuaVs2ZXUMNBngr+B3L06/DCsTbe4a9ELzR0QGzR3xqxYFVpOV6KbAA6Ry7MQMJpzXMlF7ktcayH0jktyFSyQnWALMSrhCKu4LkkvKV4RIGKdASnKvK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068022; c=relaxed/simple;
	bh=t1TFW9cxO9uIT0QFXqimGrlIZRzQeJwX2dY2EUYNaKk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VF9pcVpOCZ9mKpGvj4V0UVzJF6hyHmugV/nKtHZW8NbSuNMnXWEJ8ckPgfRtMJbFBki5r3AvCGn5hmQtU46MZQZ6oTip92OOErusFphP3OY0Ue8JwXK1BtVac7XxwF9ahrkjZgbbIrlCyeElSkRUNm8sjLkorIfOMo48dBUiIa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WnW3r1hlNzfbZf;
	Mon, 19 Aug 2024 19:44:56 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D088C1400CD;
	Mon, 19 Aug 2024 19:46:55 +0800 (CST)
Received: from huawei.com (10.67.174.76) by kwepemg500010.china.huawei.com
 (7.202.181.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Aug
 2024 19:46:54 +0800
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
Subject: [PATCH -next 0/9] drivers: fix some module autoloading
Date: Mon, 19 Aug 2024 11:38:46 +0000
Message-ID: <20240819113855.787149-1-liuyuntao12@huawei.com>
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
based on the alias from platform_device_id table.

Yuntao Liu (9):
  usb: ehci-mv: fix module autoloading
  soc: pxa: ssp: fix module autoloading
  misc: atmel-ssc: fix module autoloading
  i2c: at91: fix module autoloading
  mpc85xx_edac: fix module autoloading
  dmaengine: pxa: fix module autoloading
  dmaengine: mmp_pdma: fix module autoloading
  dmaengine: at_hdmac: fix module autoloading
  ipmi: ipmi_ssif: fix module autoloading

 drivers/char/ipmi/ipmi_ssif.c      | 1 +
 drivers/dma/at_hdmac.c             | 1 +
 drivers/dma/mmp_pdma.c             | 1 +
 drivers/dma/pxa_dma.c              | 1 +
 drivers/edac/mpc85xx_edac.c        | 1 +
 drivers/i2c/busses/i2c-at91-core.c | 1 +
 drivers/misc/atmel-ssc.c           | 1 +
 drivers/soc/pxa/ssp.c              | 1 +
 drivers/usb/host/ehci-mv.c         | 1 +
 9 files changed, 9 insertions(+)

-- 
2.34.1


