Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B956343F5C
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 12:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhCVLNV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 07:13:21 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14057 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhCVLMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Mar 2021 07:12:50 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F3sGy07KczNq9b;
        Mon, 22 Mar 2021 19:10:18 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Mar 2021 19:12:39 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <andriy.shevchenko@linux.intel.com>, <digetx@gmail.com>,
        <treding@nvidia.com>, <jarkko.nikula@linux.intel.com>,
        <rmk+kernel@armlinux.org.uk>, <song.bao.hua@hisilicon.com>,
        <john.garry@huawei.com>, <yangyicong@hisilicon.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v3 3/3] MAINTAINERS: Add maintainer for HiSilicon I2C driver
Date:   Mon, 22 Mar 2021 19:10:13 +0800
Message-ID: <1616411413-7177-4-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add maintainer for HiSilicon I2C driver.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa84121..10aaa9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8040,6 +8040,13 @@ F:	drivers/crypto/hisilicon/hpre/hpre.h
 F:	drivers/crypto/hisilicon/hpre/hpre_crypto.c
 F:	drivers/crypto/hisilicon/hpre/hpre_main.c
 
+HISILICON I2C CONTROLLER DRIVER
+M:	Yicong Yang <yangyicong@hisilicon.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+W:	https://www.hisilicon.com
+F:	drivers/i2c/busses/i2c-hisi.c
+
 HISILICON LPC BUS DRIVER
 M:	john.garry@huawei.com
 S:	Maintained
-- 
2.8.1

