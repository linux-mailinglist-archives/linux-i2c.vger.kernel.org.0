Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63AC939D33D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 05:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhFGDE0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Jun 2021 23:04:26 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:4329 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbhFGDE0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Jun 2021 23:04:26 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fyyj51S6Dz1BJnb;
        Mon,  7 Jun 2021 10:57:45 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 11:02:33 +0800
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 7 Jun 2021 11:02:32 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <jdelvare@suse.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] i2c: Fix missing pci_disable_device() on error in ali1535_setup()
Date:   Mon, 7 Jun 2021 11:21:08 +0800
Message-ID: <1623036068-30668-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the missing pci_disable_device() before return
from ali1535_setup() in the error handling case.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/i2c/busses/i2c-ali1535.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index fb93152..bdbaf79 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -206,6 +206,7 @@ static int ali1535_setup(struct pci_dev *dev)
 exit_free:
 	release_region(ali1535_smba, ALI1535_SMB_IOSIZE);
 exit:
+	pci_disable_device(dev);
 	return retval;
 }
 
-- 
2.6.2

