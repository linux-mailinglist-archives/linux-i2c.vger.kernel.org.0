Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98107DCF7D
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 15:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235659AbjJaOnI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 10:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344315AbjJaOnH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 10:43:07 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1B8EA
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 07:43:03 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231031144301euoutp026b75d17ec40a1c319570f4cc62c9e525~TOEuZa6IY2616126161euoutp02N
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 14:43:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231031144301euoutp026b75d17ec40a1c319570f4cc62c9e525~TOEuZa6IY2616126161euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698763381;
        bh=8ON5wqrvWN+W4pHTqNvTNUJDhMTrzS3lgDsmX//DvXQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EgELcqH/z4w1DiFJXtrHJqvNNtoOwSQJfm4qWlbRdBvTm4JCp6jlaQphiRwg9JERq
         8e8AI/ZOQLFyyibIr+cyKfA4s1PxDezR0IEWdWstXaFTPCE1BLPJTHDO1BjkPFAgZE
         H11OKGHVMAcYxr0JkXUb/ehA23lfwYHPeta2JbMo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231031144301eucas1p27a251b0cd8f345944185efa19d0a471f~TOEt8j1Op1404914049eucas1p2j;
        Tue, 31 Oct 2023 14:43:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 40.97.52736.57211456; Tue, 31
        Oct 2023 14:43:01 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231031144300eucas1p2edfb098f7dba134cdfa637abbf632987~TOEtoHii41407714077eucas1p2G;
        Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231031144300eusmtrp139d98cb873b7cc00247ed2378d82851c~TOEtneF4P0253802538eusmtrp1N;
        Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
X-AuditID: cbfec7f5-bb7ff7000000ce00-cb-65411275de4e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 54.1A.25043.47211456; Tue, 31
        Oct 2023 14:43:00 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231031144300eusmtip29456c88c794236613b3e8193051051cd~TOEtIhvbt1643916439eusmtip2s;
        Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 3/3] i2c: s3c24xx: add support for atomic transfers
Date:   Tue, 31 Oct 2023 15:42:52 +0100
Message-Id: <20231031144252.2112593-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031144252.2112593-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djP87qlQo6pBo8WC1g8mLeNzeL+1w5G
        i8v7tS32vt7KbtHx9wujxYzz+5gs1h65y25xd/9cRgcOj02rOtk87lzbw+bRt2UVo8fnTXIB
        LFFcNimpOZllqUX6dglcGb9PvGcrWKhU0b3yIksD42rZLkZODgkBE4mG9j1sXYxcHEICKxgl
        +ju3MkI4XxglNi8+AJX5zCjR/O4nE0zL0hsdTBCJ5YwS/1YdYIJreblrDztIFZuAoUTX2y42
        EFtEwEFi3trvYHFmgX+MEt+/6HUxcnAIC7hJzHxtAxJmEVCV+Nb2gxnE5hWwl9h0bQk7xDJ5
        if0HzzKDlHMCjVl5pgqiRFDi5MwnLBAT5SWat85mBjlBQuAAh8Snj7sZIXpdJM5+nw51tLDE
        q+NboGbKSJye3MMC0dDOKLHg930mCGcCo0TD81tQ3dYSd879YgPZzCygKbF+lz5E2FFi7ax/
        LCBhCQE+iRtvBSGO4JOYtG06M0SYV6KjTQiiWk1i1vF1cGsPXrjEDGF7SDyeM4dxAqPiLCTv
        zELyziyEvQsYmVcxiqeWFuempxYb56WW6xUn5haX5qXrJefnbmIEJprT/45/3cG44tVHvUOM
        TByMhxglOJiVRHgPmzqkCvGmJFZWpRblxxeV5qQWH2KU5mBREudVTZFPFRJITyxJzU5NLUgt
        gskycXBKNTD1S6t3VP5a5Hv2bgpXWr112Ak/VSWhKXsjD0kFycX6abw+u0Om9O9b5XV6JvwH
        OXfNZlXcctX4s8HRVs7lbt1XJ+z1UX5R71bk8GPn/APnezJe9QnLm5o+nxadMsde82GlZ5gX
        x6Wmmjv5G3/X7VvA3NU2+fDMu21/bj65/DDy7DztS3L5r/q6OzK6Jit8dpxxS+7Usw31qbOP
        12UnnzxVJ3XrD9e0qxbVc/iV/2+W/RWtuHqOgPBaT4PqP6dlKz8Vdx7fuso9cwVXVJnGpYdG
        V8wvbjV6Ibx6Q46Rld3rRL4chpZuy7x973T8hFbpaWkGTNGvWWLXVKv44FzxjPuvxb+VKn/V
        jm8Ty3dmj1ZiKc5INNRiLipOBADd/epcowMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsVy+t/xe7olQo6pBve2mFs8mLeNzeL+1w5G
        i8v7tS32vt7KbtHx9wujxYzz+5gs1h65y25xd/9cRgcOj02rOtk87lzbw+bRt2UVo8fnTXIB
        LFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gb9P
        vGcrWKhU0b3yIksD42rZLkZODgkBE4mlNzqYuhi5OIQEljJKrLmxnBEiISNxcloDK4QtLPHn
        WhcbRNEnRol/+08wgSTYBAwlut6CJDg5RAScJG4vmsUKUsQs0MQk0XFiEXsXIweHsICbxMzX
        NiA1LAKqEt/afjCD2LwC9hKbri1hh1ggL7H/4FlmkHJOAQeJlWeqQMJCQCW3TrQzQZQLSpyc
        +YQFxGYGKm/eOpt5AqPALCSpWUhSCxiZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRGxLZj
        P7fsYFz56qPeIUYmDsZDjBIczEoivIdNHVKFeFMSK6tSi/Lji0pzUosPMZoCnT2RWUo0OR8Y
        k3kl8YZmBqaGJmaWBqaWZsZK4ryeBR2JQgLpiSWp2ampBalFMH1MHJxSDUyGgfMn+QnnLI2M
        WfgldJZho/iBC0mph/eGVmWlr/FN/Bh0OKtLWmD56ZKjB+WzFkae+hmyvlRszz5zxnNMvQox
        X2yufHBcfsxS/M2RiSnat8Qf3jc5XGM4+aVkOYvZli+M3fMU6hn3aMbHqYVviPhzhXnX01Va
        bsFVLAXuvv/eLPbbu2zWGtOcwP2HeLovnH3msK7n3IeMsm3vv+oUaD/JZPpdrLov66lxYOgf
        7uf8qi9jI0SneyxK0pm1Y9EssU1ir+8Gbcz5u+qh7Zutgsd2cD1YfHl594p5XRLveFsMpVNS
        62b/2da5KjnWy2eStc2Pn33B5scEXra6tByzVvrqE3vB7yKXx0qFAEaXZzZKLMUZiYZazEXF
        iQDf7GfDEQMAAA==
X-CMS-MailID: 20231031144300eucas1p2edfb098f7dba134cdfa637abbf632987
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231031144300eucas1p2edfb098f7dba134cdfa637abbf632987
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231031144300eucas1p2edfb098f7dba134cdfa637abbf632987
References: <20231031144252.2112593-1-m.szyprowski@samsung.com>
        <CGME20231031144300eucas1p2edfb098f7dba134cdfa637abbf632987@eucas1p2.samsung.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for atomic transfers using polling mode with interrupts
intentionally disabled to get rid of the following warning introduced by
commit 63b96983a5dd ("i2c: core: introduce callbacks for atomic
transfers") during system reboot and power-off:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1518 at drivers/i2c/i2c-core.h:40 i2c_transfer+0xe8/0xf4
No atomic I2C transfer handler for 'i2c-0'
Modules linked in:
CPU: 0 PID: 1518 Comm: reboot Not tainted 6.6.0-next-20231031 #7453
Hardware name: Samsung Exynos (Flattened Device Tree)
 unwind_backtrace from show_stack+0x10/0x14
 show_stack from dump_stack_lvl+0x40/0x4c
 dump_stack_lvl from __warn+0x7c/0x124
 __warn from warn_slowpath_fmt+0x110/0x178
 warn_slowpath_fmt from i2c_transfer+0xe8/0xf4
 i2c_transfer from regmap_i2c_read+0x58/0x88
 regmap_i2c_read from _regmap_raw_read+0xfc/0x260
 _regmap_raw_read from _regmap_bus_read+0x44/0x70
 _regmap_bus_read from _regmap_read+0x60/0x14c
 _regmap_read from regmap_read+0x3c/0x60
 regmap_read from regulator_get_voltage_sel_regmap+0x2c/0x74
 regulator_get_voltage_sel_regmap from regulator_get_voltage_rdev+0x64/0x15c
 regulator_get_voltage_rdev from _regulator_do_set_voltage+0x2c/0x5a8
 _regulator_do_set_voltage from regulator_set_voltage_rdev+0x90/0x248
 regulator_set_voltage_rdev from regulator_do_balance_voltage+0x350/0x4d0
 regulator_do_balance_voltage from regulator_set_voltage_unlocked+0xd4/0x118
 regulator_set_voltage_unlocked from regulator_set_voltage+0x40/0x74
 regulator_set_voltage from _opp_config_regulator_single+0x44/0x110
 _opp_config_regulator_single from _set_opp+0x118/0x500
 _set_opp from dev_pm_opp_set_rate+0x108/0x20c
 dev_pm_opp_set_rate from __cpufreq_driver_target+0x568/0x6cc
 __cpufreq_driver_target from cpufreq_generic_suspend+0x28/0x50
 cpufreq_generic_suspend from cpufreq_suspend+0xbc/0x124
 cpufreq_suspend from device_shutdown+0x18/0x230
 device_shutdown from kernel_restart+0x38/0x90
 kernel_restart from __do_sys_reboot+0x12c/0x1f8
 __do_sys_reboot from ret_fast_syscall+0x0/0x54
Exception stack(0xf0fedfa8 to 0xf0fedff0)
...
---[ end trace 0000000000000000 ]---

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 28114b6aadfa..cf55238fca71 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -76,6 +76,7 @@
 #define QUIRK_HDMIPHY		(1 << 1)
 #define QUIRK_NO_GPIO		(1 << 2)
 #define QUIRK_POLL		(1 << 3)
+#define QUIRK_ATOMIC		(1 << 4)
 
 /* Max time to wait for bus to become idle after a xfer (in us) */
 #define S3C2410_IDLE_TIMEOUT	5000
@@ -174,7 +175,7 @@ static inline void s3c24xx_i2c_master_complete(struct s3c24xx_i2c *i2c, int ret)
 	if (ret)
 		i2c->msg_idx = ret;
 
-	if (!(i2c->quirks & QUIRK_POLL))
+	if (!(i2c->quirks & (QUIRK_POLL | QUIRK_ATOMIC)))
 		wake_up(&i2c->wait);
 }
 
@@ -699,7 +700,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 	s3c24xx_i2c_enable_irq(i2c);
 	s3c24xx_i2c_message_start(i2c, msgs);
 
-	if (i2c->quirks & QUIRK_POLL) {
+	if (i2c->quirks & (QUIRK_POLL | QUIRK_ATOMIC)) {
 		while ((i2c->msg_num != 0) && is_ack(i2c)) {
 			unsigned long stat = readl(i2c->regs + S3C2410_IICSTAT);
 
@@ -771,6 +772,21 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	return -EREMOTEIO;
 }
 
+static int s3c24xx_i2c_xfer_atomic(struct i2c_adapter *adap,
+				   struct i2c_msg *msgs, int num)
+{
+	struct s3c24xx_i2c *i2c = (struct s3c24xx_i2c *)adap->algo_data;
+	int ret;
+
+	disable_irq(i2c->irq);
+	i2c->quirks |= QUIRK_ATOMIC;
+	ret = s3c24xx_i2c_xfer(adap, msgs, num);
+	i2c->quirks &= ~QUIRK_ATOMIC;
+	enable_irq(i2c->irq);
+
+	return ret;
+}
+
 /* declare our i2c functionality */
 static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
 {
@@ -781,6 +797,7 @@ static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
 /* i2c bus registration info */
 static const struct i2c_algorithm s3c24xx_i2c_algorithm = {
 	.master_xfer		= s3c24xx_i2c_xfer,
+	.master_xfer_atomic     = s3c24xx_i2c_xfer_atomic,
 	.functionality		= s3c24xx_i2c_func,
 };
 
-- 
2.34.1

