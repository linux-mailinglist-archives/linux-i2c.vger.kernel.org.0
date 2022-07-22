Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7CF557D7FD
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jul 2022 03:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiGVBYL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jul 2022 21:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiGVBYK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jul 2022 21:24:10 -0400
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22ECE868B8
        for <linux-i2c@vger.kernel.org>; Thu, 21 Jul 2022 18:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=GRz6p
        PFhPRjUXFCc9YKkHqxGBf+g0qalvMWl3XjgOhs=; b=bYWYX9eUYLazlHBORMECl
        2nv/VQi4JHh+/8o8Pag9wezHKgTOjTEORMZUegwps4a2amAZADi0CkjYY5y+x/IJ
        410SB/6BElmsb8RJQl42BtWyjWDzXEMd1WE+plD85bed+eAUbmlR2KNdrukaAW+k
        8bHzxh3xXypy3wlht2TyVQ=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp10 (Coremail) with SMTP id NuRpCgBntXky_NliBrWHGw--.21187S2;
        Fri, 22 Jul 2022 09:24:02 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     peda@axentia.se, linux-i2c@vger.kernel.org, windhl@126.com
Subject: [PATCH v2] i2c: i2c-mux-gpmux: Add of_node_put() when breaking out of loop
Date:   Fri, 22 Jul 2022 09:24:01 +0800
Message-Id: <20220722012401.1303609-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgBntXky_NliBrWHGw--.21187S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFW8JF17uw4UGF1UJry7Wrg_yoWfuFc_CF
        4DW3WfGr1vkrsxCrnFyFWavr1jvr1UZFs5Aw1jvryruw13ZFnxAFW8Wa43GrWDZrZ7tFZ8
        X3yqqry7Zr43XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUOB_UUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BJGF1pED9oPpwAAs8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
 changelog:

 v2: make a correct patch pointed out by Peter 
 v1: https://lore.kernel.org/all/20220721081202.1300071-1-windhl@126.com/

 drivers/i2c/muxes/i2c-mux-gpmux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
index d3acd8d66c32..33024acaac02 100644
--- a/drivers/i2c/muxes/i2c-mux-gpmux.c
+++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
@@ -134,6 +134,7 @@ static int i2c_mux_probe(struct platform_device *pdev)
 	return 0;
 
 err_children:
+	of_node_put(child);
 	i2c_mux_del_adapters(muxc);
 err_parent:
 	i2c_put_adapter(parent);
-- 
2.25.1

