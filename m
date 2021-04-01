Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7C2351E2B
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 20:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235025AbhDASgB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 14:36:01 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16320 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239053AbhDASZX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Apr 2021 14:25:23 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FB41Z5yBVz9vB3;
        Thu,  1 Apr 2021 21:35:14 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 1 Apr 2021 21:37:18 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <f.fainelli@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>
CC:     <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: brcmstb: remove unused including <linux/version.h>
Date:   Thu, 1 Apr 2021 21:37:47 +0800
Message-ID: <1617284267-27743-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>
---
 drivers/i2c/busses/i2c-brcmstb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index ba766d2..490ee39 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -22,7 +22,6 @@
 #include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/version.h>
 
 #define N_DATA_REGS					8
 
-- 
2.7.4

