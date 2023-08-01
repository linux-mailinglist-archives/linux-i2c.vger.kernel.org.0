Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D62976A736
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 04:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjHACyK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 22:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbjHACyJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 22:54:09 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A591981
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jul 2023 19:54:06 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFKQY36GJzVjgd;
        Tue,  1 Aug 2023 10:52:21 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 10:54:03 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <michael.hennerich@analog.com>, <peda@axentia.se>,
        <linux-i2c@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] i2c: mux: ltc4306: Remove an unnecessary ternary operator
Date:   Tue, 1 Aug 2023 10:53:28 +0800
Message-ID: <20230801025328.3380963-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The true or false judgement of the ternary operator is unnecessary
in C language semantics. So remove it to clean Code.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 5a03031519be..637e25506490 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -62,7 +62,7 @@ static const struct chip_desc chips[] = {
 
 static bool ltc4306_is_volatile_reg(struct device *dev, unsigned int reg)
 {
-	return (reg == LTC_REG_CONFIG) ? true : false;
+	return reg == LTC_REG_CONFIG;
 }
 
 static const struct regmap_config ltc4306_regmap_config = {
-- 
2.34.1

