Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5CD57C5E4
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jul 2022 10:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiGUIMS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jul 2022 04:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiGUIMR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jul 2022 04:12:17 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9DDE5796A3
        for <linux-i2c@vger.kernel.org>; Thu, 21 Jul 2022 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=bk5M7
        T76Gl51w0D3Dl9MySRhcBVTAbZMRuc8csXzljw=; b=gFIuCMutuPxVbTFxSTi06
        QJ3BSiqIya3TMk0WmMUdQQlW3uV+m1K09z7R60Njwws+jn2miH5Ak9PGQHfrcX7g
        xcBxyFOBLl8cuzNEv4vaCpJbgGcfoBWYhjO00GtRSrPe7akhH23DWnmquEvGSx8I
        yh7VdOUHoxKzefy0DwJOjg=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowACn6PdUCtli0zzHFQ--.45146S2;
        Thu, 21 Jul 2022 16:12:05 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     peda@axentia.se, linux-i2c@vger.kernel.org, windhl@126.com
Subject: [PATCH] i2c: i2c-mux-gpmux: Add of_node_put() when breaking out of loop
Date:   Thu, 21 Jul 2022 16:12:02 +0800
Message-Id: <20220721081202.1300071-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowACn6PdUCtli0zzHFQ--.45146S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFW8JF17uw4UGF1UXF18Krg_yoW3CrX_CF
        1DW3W7Gr1jkrsxArnFyF4SvryYvr1DZFWxJF1jv34Fvw13Z3Z0yFyrua43GrWUZrZ7tFZ8
        Xw1DXr17ur1fJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRQa9-tUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AVEF1pED9L47gABse
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In i2c_mux_probe(), we should call of_node_put() when breaking out
of for_each_child_of_node() which will automatically increase and
decrease the refcount.

Fixes: ac8498f0ce53 ("i2c: i2c-mux-gpmux: new driver")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/i2c/muxes/i2c-mux-gpmux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
index d3acd8d66c32..30ab2fe88c8d 100644
--- a/drivers/i2c/muxes/i2c-mux-gpmux.c
+++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
@@ -115,6 +115,7 @@ static int i2c_mux_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			dev_err(dev, "no reg property for node '%pOFn'\n",
 				child);
+			of_node_put(child);
 			goto err_children;
 		}
 
-- 
2.25.1

