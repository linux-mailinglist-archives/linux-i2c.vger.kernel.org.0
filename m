Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2847E5BA4
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 17:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjKHQoK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 11:44:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbjKHQoJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 11:44:09 -0500
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3DB1FCE
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 08:44:07 -0800 (PST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231108164405euoutp01e324c4eab46f340937267f1419e4eccf~Vs4t1_ujO1675616756euoutp01E
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 16:44:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231108164405euoutp01e324c4eab46f340937267f1419e4eccf~Vs4t1_ujO1675616756euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699461846;
        bh=NbOLdkZRq1ksTSN0R9GmLW+f9tkPmZRg76wbrp7/+aU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nOdMqBO6eLM6jhgmZ1enMJMlWEJbZSZxtSULgdvb2A6AG9Uzy9wsAqFG4FNluylJW
         0DLH0hxKuIgkYLcYWvT/6BJBD1LjwhM+5eFNoi7/wMmICpoicYY12/agyQCHG8A6Rb
         e3+xzIzWN2qc/LEpUXeqlK60dwNmF9LqYFmYk0bM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231108164405eucas1p147ff4a743fc8f883c07171faaaacc20d~Vs4tkalw62061420614eucas1p1J;
        Wed,  8 Nov 2023 16:44:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 62.82.52736.5DABB456; Wed,  8
        Nov 2023 16:44:05 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231108164405eucas1p13c761b67a4c5e3631ee245b00b997e4e~Vs4tLSHka2061420614eucas1p1I;
        Wed,  8 Nov 2023 16:44:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231108164405eusmtrp2efb98e103de690da400ef0e05c5caf0a~Vs4tKudFI2869928699eusmtrp2K;
        Wed,  8 Nov 2023 16:44:05 +0000 (GMT)
X-AuditID: cbfec7f5-bb7ff7000000ce00-d3-654bbad558a9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 2B.12.25043.5DABB456; Wed,  8
        Nov 2023 16:44:05 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231108164404eusmtip2dbc75dc5e98ecbef4c24bca757c98243~Vs4sil3Dt0430704307eusmtip21;
        Wed,  8 Nov 2023 16:44:04 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 3/3] i2c: s3c24xx: add support for atomic transfers
Date:   Wed,  8 Nov 2023 17:43:54 +0100
Message-Id: <20231108164354.712406-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108164354.712406-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduznOd2ru7xTDX5fVbZ4MG8bm8X9rx2M
        Fpf3a1vsfb2V3aLj7xdGixnn9zFZrD1yl93i7v65jA4cHptWdbJ53Lm2h82jb8sqRo/Pm+QC
        WKK4bFJSczLLUov07RK4MiZdWcVccEmpYusSkwbG67JdjJwcEgImEg0vGhm7GLk4hARWMEps
        +L0QyvnCKLHwQCsLhPOZUWLa/ytsMC2zLuxmArGFBJYzStxfHQ/Xsen7fVaQBJuAoUTX2y6w
        BhEBB4l5a7+zg9jMAv8YJb5/0QOxhQXcJCa+WQhWzyKgKtH3oQesnlfATuJQ3wwWiGXyEvsP
        nmUGsTkF7CW6J8xmh6gRlDg58wkLxEx5ieats5lBjpAQ2MEhsWT2fiCHA8hxkbh4SgpijrDE
        q+Nb2CFsGYn/O+czQdS3M0os+H0fypnAKNHw/BYjRJW1xJ1zv9hABjELaEqs36UPEXaU6Ji5
        hxFiPp/EjbeCEDfwSUzaNh1qLa9ER5sQRLWaxKzj6+DWHrxwiRnC9pDovN/DPoFRcRaSb2Yh
        +WYWwt4FjMyrGMVTS4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAtPM6X/Hv+5gXPHqo94hRiYO
        xkOMEhzMSiK8f+09UoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzqqbIpwoJpCeWpGanphakFsFk
        mTg4pRqYNN9of3gYNVP17uac0CrNup4Jv7cEnHtTqPDmXUMv2x+hwpXVJbt5vSzeTZvgFrF2
        v83C6DSGg59Eq5N2bYpuO6JevfSVTh57jsOef0WH+/8u5742Y60CY/aMXB/lLB2B8JQHh6/s
        sjr6sehtzZENPfdEC16zWy8SFd7yVe1t98JNZW/OP9gzpy2d3/D6tOla2TaWlVb7b4ct33b9
        17sWkXX86x43cKzgXFa26NU/ta23bVe8tJm2vSS/Y5tt+bv9x3+dnrRonpt++IX2RRnnDjz9
        X1kTrVkhfcc2+2Z9+j87o+d1nw89eDy9wqVx+qo9GScFK7XdZZfePf5ozrMHS3s5tzf2bWq1
        PNEtWBUV8lmJpTgj0VCLuag4EQAELFlUogMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsVy+t/xe7pXd3mnGszcx2bxYN42Nov7XzsY
        LS7v17bY+3oru0XH3y+MFjPO72OyWHvkLrvF3f1zGR04PDat6mTzuHNtD5tH35ZVjB6fN8kF
        sETp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZUy6
        soq54JJSxdYlJg2M12W7GDk5JARMJGZd2M3UxcjFISSwlFHi5abjbBAJGYmT0xpYIWxhiT/X
        utggij4xSmz/84kJJMEmYCjR9bYLrEFEwEni9qJZrCBFzAJNTBIdJxaxgySEBdwkJr5ZCDaJ
        RUBVou9DD1gDr4CdxKG+GSwQG+Ql9h88ywxicwrYS3RPmA3WKwRU8/3CYah6QYmTM5+A1TMD
        1Tdvnc08gVFgFpLULCSpBYxMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQJjYtuxn1t2MK58
        9VHvECMTB+MhRgkOZiUR3r/2HqlCvCmJlVWpRfnxRaU5qcWHGE2B7p7ILCWanA+MyrySeEMz
        A1NDEzNLA1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqboxu+WJ8JvKdVMnXVkfXPB
        jE+/v2p6u/yYuPi4/PoEk3836r3WrTY6PXXJ2YdWt3l3xGnVhzocU5uuryu01n2uhuiuDSfl
        A7bF/UtgfVS9dE/8n7yWebuM+aTi9feoBJ3U/65ssyRi1dYX77+fV5228oquwmLbGtMIwXhx
        8boXLKlhQabHdeRZgqvD5d54H/NQMN14Ys3F+W+nzHJ8f+ne6jvxTWnHraI+XWxQN3NeOOlo
        itOxDanaYockDxzitz3EF820TCAlr8vG5sL0PSxsu9Ptt16ffOJGkxKT3Pn/0krlOz80zWHV
        /c/Sc3jXXxY2/kOZvxa+e5+18ZrayXy16WqmK/KPdxk/7WOrL5FUYinOSDTUYi4qTgQASMlQ
        bBIDAAA=
X-CMS-MailID: 20231108164405eucas1p13c761b67a4c5e3631ee245b00b997e4e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231108164405eucas1p13c761b67a4c5e3631ee245b00b997e4e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231108164405eucas1p13c761b67a4c5e3631ee245b00b997e4e
References: <20231108164354.712406-1-m.szyprowski@samsung.com>
        <CGME20231108164405eucas1p13c761b67a4c5e3631ee245b00b997e4e@eucas1p1.samsung.com>
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
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-s3c2410.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index c0fe96a4f2c4..275f7c42165c 100644
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
 
@@ -703,7 +704,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 	s3c24xx_i2c_enable_irq(i2c);
 	s3c24xx_i2c_message_start(i2c, msgs);
 
-	if (i2c->quirks & QUIRK_POLL) {
+	if (i2c->quirks & (QUIRK_POLL | QUIRK_ATOMIC)) {
 		while ((i2c->msg_num != 0) && is_ack(i2c)) {
 			unsigned long stat = readl(i2c->regs + S3C2410_IICSTAT);
 
@@ -775,6 +776,21 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
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
@@ -785,6 +801,7 @@ static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
 /* i2c bus registration info */
 static const struct i2c_algorithm s3c24xx_i2c_algorithm = {
 	.master_xfer		= s3c24xx_i2c_xfer,
+	.master_xfer_atomic     = s3c24xx_i2c_xfer_atomic,
 	.functionality		= s3c24xx_i2c_func,
 };
 
-- 
2.34.1

