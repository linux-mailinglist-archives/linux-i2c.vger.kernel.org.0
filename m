Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5701196D0
	for <lists+linux-i2c@lfdr.de>; Fri, 10 May 2019 04:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfEJCyJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 May 2019 22:54:09 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:58082 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726944AbfEJCyJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 May 2019 22:54:09 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E06B1C6B32C2F792A9C6;
        Fri, 10 May 2019 10:54:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Fri, 10 May 2019 10:53:58 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <linux-kernel@vger.kernel.org>
CC:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH 3/3] i2c: i801: avoid panic if ioreamp fails
Date:   Fri, 10 May 2019 11:03:20 +0800
Message-ID: <20190510030320.109154-3-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190510030320.109154-1-wangkefeng.wang@huawei.com>
References: <20190510030320.109154-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If ioremap fails, NULL pointer dereference will happen and
leading to a kernel panic when access the virtual address
in check_signature().

Fix it by check the return value of ioremap.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/i2c/busses/i2c-i801.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 679c6c41f64b..fc6ccb8aba17 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1068,7 +1068,10 @@ static void __init input_apanel_init(void)
 	void __iomem *bios;
 	const void __iomem *p;
 
-	bios = ioremap(0xF0000, 0x10000); /* Can't fail */
+	bios = ioremap(0xF0000, 0x10000);
+	if (!base)
+		return -ENOMEM;
+
 	p = bios_signature(bios);
 	if (p) {
 		/* just use the first address */
-- 
2.20.1

