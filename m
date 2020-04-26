Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6111B8E7F
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 11:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgDZJnK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 05:43:10 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:33536 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726251AbgDZJnK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 05:43:10 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 701EC3D6693913F477B6;
        Sun, 26 Apr 2020 17:43:07 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sun, 26 Apr 2020
 17:43:01 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] i2c: powermac: use true,false for bool variable
Date:   Sun, 26 Apr 2020 17:42:28 +0800
Message-ID: <20200426094228.23829-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In i2c_powermac_register_devices(), variable 'found_onyx' is bool and
assigned '0' and 'true' in different places. Use 'false' instead of '0'.
This fixes the following coccicheck warning:

drivers/i2c/busses/i2c-powermac.c:318:6-16: WARNING: Assignment of 0/1
to bool variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/i2c/busses/i2c-powermac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index d565714c1f13..00a6fd42c1ae 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -315,7 +315,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 {
 	struct i2c_client *newdev;
 	struct device_node *node;
-	bool found_onyx = 0;
+	bool found_onyx = false;
 
 	/*
 	 * In some cases we end up with the via-pmu node itself, in this
-- 
2.21.1

