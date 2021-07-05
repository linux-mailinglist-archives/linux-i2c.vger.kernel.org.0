Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56FAA3BBCC4
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 14:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhGEMUE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 08:20:04 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:63284 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhGEMUE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 08:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1625487447; x=1657023447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U8MCjRpKfvJOwyIa9fp84LUcaitYhKvbsbAJj9S0FwA=;
  b=PCQ+FwHTEC1ZIqQ6lfktQxflB+d7rVFOi8/js1OmgUieLn0orcEiiMUK
   afYt6Gmx+EXpSEOreHf9F2GlwjapiQR1QIo8z4cMJI8LCMmoohf2b5FNj
   60E+vZWpwCydGel1sQaZrk1mh7ePjUJYEQkvSZhK6tIAxA1aLq3mGBbSl
   DxiSGih6fnrgAqmyl+hyD6kILLCSy57ZOlNFJBHErw96lear+KexPORQw
   vePwIZbJsb5HIgYWk/X6gLqWTIFFQbbqkm3PpqQF+vS2jNNrPq+Zpbr8P
   fcXzP6WeH8Z8ogNhDYydYYlX3nMZx2LifZkfNOGJOSDBfWpRkuaD0Qbb6
   w==;
IronPort-SDR: DQh6J9QGBj0u31aLTJdOi2Ps3k1RkuZXEyicFQ3DhX0aCoT3TXdN3YiMNXSjZLpO9HC3MerfYq
 Xqh3GeI+MfSWkjZIO0mIR5zvvoxwa6jA3f8m+FKykLWZHo402DRYmxDgu+Cgwa1BFFvkgLxhsq
 NV0PLKp6g9x+222jdh3MZnP6K8oFJxM8knuIJRXDXxzEAK/uHqADf0HNncGJsoTW+LOdOouHfv
 FpY0PzpKKBzN568u/n/vxX1c1Ds+Fhamqebho4O460A/1NE6HldZi1sVjdTIvrAIYezZJXLnGg
 7QY=
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="120996567"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2021 05:17:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 05:17:26 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Jul 2021 05:17:24 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <codrin.ciubotariu@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH] i2c: at91: remove #define CONFIG_PM
Date:   Mon, 5 Jul 2021 15:15:16 +0300
Message-ID: <20210705121516.622326-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove #define CONFIG_PM and use __maybe_unused for PM functions and
pm_ptr() for PM ops.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index e14edd236108..9f3c3e8e8011 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -286,9 +286,7 @@ static int at91_twi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-
-static int at91_twi_runtime_suspend(struct device *dev)
+static int __maybe_unused at91_twi_runtime_suspend(struct device *dev)
 {
 	struct at91_twi_dev *twi_dev = dev_get_drvdata(dev);
 
@@ -299,7 +297,7 @@ static int at91_twi_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int at91_twi_runtime_resume(struct device *dev)
+static int __maybe_unused at91_twi_runtime_resume(struct device *dev)
 {
 	struct at91_twi_dev *twi_dev = dev_get_drvdata(dev);
 
@@ -308,7 +306,7 @@ static int at91_twi_runtime_resume(struct device *dev)
 	return clk_prepare_enable(twi_dev->clk);
 }
 
-static int at91_twi_suspend_noirq(struct device *dev)
+static int __maybe_unused at91_twi_suspend_noirq(struct device *dev)
 {
 	if (!pm_runtime_status_suspended(dev))
 		at91_twi_runtime_suspend(dev);
@@ -316,7 +314,7 @@ static int at91_twi_suspend_noirq(struct device *dev)
 	return 0;
 }
 
-static int at91_twi_resume_noirq(struct device *dev)
+static int __maybe_unused at91_twi_resume_noirq(struct device *dev)
 {
 	struct at91_twi_dev *twi_dev = dev_get_drvdata(dev);
 	int ret;
@@ -342,11 +340,6 @@ static const struct dev_pm_ops at91_twi_pm = {
 	.runtime_resume		= at91_twi_runtime_resume,
 };
 
-#define at91_twi_pm_ops (&at91_twi_pm)
-#else
-#define at91_twi_pm_ops NULL
-#endif
-
 static struct platform_driver at91_twi_driver = {
 	.probe		= at91_twi_probe,
 	.remove		= at91_twi_remove,
@@ -354,7 +347,7 @@ static struct platform_driver at91_twi_driver = {
 	.driver		= {
 		.name	= "at91_i2c",
 		.of_match_table = of_match_ptr(atmel_twi_dt_ids),
-		.pm	= at91_twi_pm_ops,
+		.pm	= pm_ptr(&at91_twi_pm),
 	},
 };
 
-- 
2.25.1

