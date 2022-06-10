Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE2E2545DD1
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 09:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347023AbiFJHwW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 03:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346744AbiFJHwS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 03:52:18 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CBD1C28D9
        for <linux-i2c@vger.kernel.org>; Fri, 10 Jun 2022 00:52:15 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LKCpd3ylPzDql7;
        Fri, 10 Jun 2022 15:51:53 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 15:52:13 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <yangyicong@hisilicon.com>, <andriy.shevchenko@linux.intel.com>,
        <daniel.lezcano@linaro.org>
Subject: [PATCH] i2c: hisi: use HZ_PER_KHZ macro in units.h
Date:   Fri, 10 Jun 2022 15:51:06 +0800
Message-ID: <20220610075106.56268-1-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

HZ macros has been centralized in units.h since [1]. Use it to avoid
duplicated definition.

[1] commit e2c77032fcbe ("units: add the HZ macros")

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/busses/i2c-hisi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index acf394812061..76c3d8f6fc3c 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -15,6 +15,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/units.h>
 
 #define HISI_I2C_FRAME_CTRL		0x0000
 #define   HISI_I2C_FRAME_CTRL_SPEED_MODE	GENMASK(1, 0)
@@ -80,8 +81,6 @@
 #define HISI_I2C_TX_F_AE_THRESH		1
 #define HISI_I2C_RX_F_AF_THRESH		60
 
-#define HZ_PER_KHZ	1000
-
 #define NSEC_TO_CYCLES(ns, clk_rate_khz) \
 	DIV_ROUND_UP_ULL((clk_rate_khz) * (ns), NSEC_PER_MSEC)
 
-- 
2.24.0

