Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 855005F8B99
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Oct 2022 15:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbiJINmJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Oct 2022 09:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiJINmH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Oct 2022 09:42:07 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE0A21837;
        Sun,  9 Oct 2022 06:42:05 -0700 (PDT)
Received: from kwepemi500022.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mljlc5l0QzlXYb;
        Sun,  9 Oct 2022 21:37:32 +0800 (CST)
Received: from huawei.com (10.67.175.34) by kwepemi500022.china.huawei.com
 (7.221.188.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sun, 9 Oct
 2022 21:42:03 +0800
From:   Ren Zhijie <renzhijie2@huawei.com>
To:     <kblaiech@nvidia.com>, <asmaa@nvidia.com>, <vadimp@mellanox.com>,
        <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ren Zhijie <renzhijie2@huawei.com>
Subject: [PATCH -next] i2c: mlxbf: Fix unused-variable warning
Date:   Sun, 9 Oct 2022 13:38:22 +0000
Message-ID: <20221009133822.254122-1-renzhijie2@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.175.34]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500022.china.huawei.com (7.221.188.64)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If CONFIG_ACPI is not set,
gcc warns about unused variable:

drivers/i2c/busses/i2c-mlxbf.c:2206:35: error: ‘mlxbf_i2c_chip’ defined but not used [-Werror=unused-variable]
 static struct mlxbf_i2c_chip_info mlxbf_i2c_chip[] = {
                                   ^~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Mark these variables as __maybe_unused  to fix this.

Fixes: b5b5b32081cd ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC")
Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index e68e775f187e..087df1a53797 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2203,7 +2203,7 @@ static u32 mlxbf_i2c_functionality(struct i2c_adapter *adap)
 	return MLXBF_I2C_FUNC_ALL;
 }
 
-static struct mlxbf_i2c_chip_info mlxbf_i2c_chip[] = {
+static struct mlxbf_i2c_chip_info __maybe_unused mlxbf_i2c_chip[] = {
 	[MLXBF_I2C_CHIP_TYPE_1] = {
 		.type = MLXBF_I2C_CHIP_TYPE_1,
 		.shared_res = {
-- 
2.17.1

