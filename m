Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD6C65F8A01
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Oct 2022 09:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiJIH2T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Oct 2022 03:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiJIH2T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Oct 2022 03:28:19 -0400
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E9E2F32BB8;
        Sun,  9 Oct 2022 00:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gZLx7
        JO3Vsm9hHDGDlzYQeEVv56/GNN07dbSXBKYJyM=; b=MsyXWucgV/AKVErcE6mBF
        6q5JWsB0Al5nw7mmilum/LzjwCWOMgi8eonQaO3+CAg0XcOXen64Zda02qF1KLlM
        mhWOnXJsSmNENxGauoTI/dqYiEWiqPTXEuV7Rl0ag/Hx36ixWODDG5lUtT2O49hY
        GgJuzCAeQMF+H1/GDQBJmw=
Received: from localhost.localdomain (unknown [111.48.58.12])
        by smtp7 (Coremail) with SMTP id C8CowAAnmyAGeEJjNgiNJw--.23039S2;
        Sun, 09 Oct 2022 15:28:07 +0800 (CST)
From:   Jiangshan Yi <13667453960@163.com>
To:     jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiangshan Yi <yijiangshan@kylinos.cn>,
        k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] i2c: sis630: fix spelling typo in comment
Date:   Sun,  9 Oct 2022 15:28:02 +0800
Message-Id: <20221009072802.2638945-1-13667453960@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowAAnmyAGeEJjNgiNJw--.23039S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7Jr47ZFy5JFW5trWfGrg_yoW3Arc_Kw
        18Gan7Zr1qk3Z5t3WFqaySvr109r4F9ry8C3Z2v3yYk3y3Zw1DGFWkZw4Sqw4Dur1jgF1Y
        ga1jgF4xCwnrtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0La93UUUUU==
X-Originating-IP: [111.48.58.12]
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/1tbi8AiV+1uoiZpzmwAAse
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jiangshan Yi <yijiangshan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/i2c/busses/i2c-sis630.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index cfb8e04a2a83..87d56250d78a 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -97,7 +97,7 @@ MODULE_PARM_DESC(high_clock,
 module_param(force, bool, 0);
 MODULE_PARM_DESC(force, "Forcibly enable the SIS630. DANGEROUS!");
 
-/* SMBus base adress */
+/* SMBus base address */
 static unsigned short smbus_base;
 
 /* supported chips */
-- 
2.25.1

