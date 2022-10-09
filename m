Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8256D5F89FC
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Oct 2022 09:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiJIHUG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Oct 2022 03:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiJIHUF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Oct 2022 03:20:05 -0400
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1352015A32;
        Sun,  9 Oct 2022 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JiJlb
        dT6baCPksXG0vWckvJ73JhRKpNxaF3TIcVYVuk=; b=enwlX7/6U1O2PUhaN5fhk
        swk81d7Dmvc7joek4O62gATCXHKDI8QL+KVolDf0byYOz2bU1k0UJpQ1ShtwDRUJ
        Y3GtSR0U5ZX1mQMChUeRU/OlRL2S6ez0y5Irlegf8YdXRhXkoDp1Lt95flXthhg2
        7x7lfUQ/vKO3+MM6h/o4f4=
Received: from localhost.localdomain (unknown [111.48.58.12])
        by smtp11 (Coremail) with SMTP id D8CowAD3bEYKdkJjOTH7Fw--.38647S2;
        Sun, 09 Oct 2022 15:19:41 +0800 (CST)
From:   Jiangshan Yi <13667453960@163.com>
To:     vadimp@nvidia.com, michaelsh@nvidia.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiangshan Yi <yijiangshan@kylinos.cn>,
        k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] i2c: mlxcpld: fix spelling typo in comment
Date:   Sun,  9 Oct 2022 15:19:23 +0800
Message-Id: <20221009071923.2637423-1-13667453960@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowAD3bEYKdkJjOTH7Fw--.38647S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7Jr47ZFy5JFW5ArWxXrb_yoW3uFc_Ka
        48Zwn7Zw1DA3Zavr95CayYqr1YkFyS9rn5G3Z0vrWSka4qvwn8JayqyryfJwsFgrsIqFnx
        W3WDtF1xZ3ZrJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0leHDUUUUU==
X-Originating-IP: [111.48.58.12]
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/xtbBtg2V+11uQ013igAAsV
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-mlxcpld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 72fcfb17dd67..081f51ef0551 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -40,7 +40,7 @@
 #define MLXCPLD_LPCI2C_STATUS_REG	0x9
 #define MLXCPLD_LPCI2C_DATA_REG		0xa
 
-/* LPC I2C masks and parametres */
+/* LPC I2C masks and parameters */
 #define MLXCPLD_LPCI2C_RST_SEL_MASK	0x1
 #define MLXCPLD_LPCI2C_TRANS_END	0x1
 #define MLXCPLD_LPCI2C_STATUS_NACK	0x10
-- 
2.25.1

