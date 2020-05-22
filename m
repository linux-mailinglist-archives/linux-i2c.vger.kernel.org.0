Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C3D1DE400
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 12:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730002AbgEVKPa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 06:15:30 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60924 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729997AbgEVKP1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 May 2020 06:15:27 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200522101525euoutp017b008676ce83d40b64ffef758c5a76eb~RUjOb8gDD2756727567euoutp01Q
        for <linux-i2c@vger.kernel.org>; Fri, 22 May 2020 10:15:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200522101525euoutp017b008676ce83d40b64ffef758c5a76eb~RUjOb8gDD2756727567euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1590142525;
        bh=3HYxB7x/RUYeYsXTIciTAB5xWK8LkdywlB5eocgLdQ0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=IekGMGPOzNhxP44nfZreaPriyNBk7hAoPdvbmvNiXz/ln33P04aQdABFviLn9mFCY
         B4oRMo0mEvEi+dU7Fk1aEsE05saDekiAouBBkglyiASqGrWEAkmNiQXWWO51ZR7etb
         jaCZluQmzgNXOpkA6YCdTUrejKKdsOzAooVFfMHM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200522101524eucas1p29f7a3412e8b0e5dac432cff706978a68~RUjOG-Jrb0131201312eucas1p2v;
        Fri, 22 May 2020 10:15:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 82.7F.60679.C36A7CE5; Fri, 22
        May 2020 11:15:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7~RUjNtIl9n1170811708eucas1p1o;
        Fri, 22 May 2020 10:15:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200522101524eusmtrp1e6df08f904aec341f6609ab7cbf267f0~RUjNscnWn2581025810eusmtrp1m;
        Fri, 22 May 2020 10:15:24 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-eb-5ec7a63c203f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C1.9B.07950.C36A7CE5; Fri, 22
        May 2020 11:15:24 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200522101523eusmtip1cdfc4bd183275555e857da2166e0bd3b~RUjNMSTAp2127421274eusmtip19;
        Fri, 22 May 2020 10:15:23 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        srv_heupstream@mediatek.com,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] i2c: core: fix NULL pointer dereference in suspend/resume
 callbacks
Date:   Fri, 22 May 2020 12:13:27 +0200
Message-Id: <20200522101327.13456-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42LZduznOV2bZcfjDG6dV7HYOGM9q8WXuadY
        LGZumMFi0fH3C6PF5V1z2Cw+9x5htJhxfh+Txdojd9ktpt8Vsvjc+o/NYuWJWcwO3B7vb7Sy
        e8xuuMji0XJyP4tH35ZVjB4nTz1h8fi8SS6ALYrLJiU1J7MstUjfLoEr48rJ66wFT5Qq1k+6
        wtLAuFW2i5GDQ0LAROL2NK4uRi4OIYEVjBLn+w8zQzhfGCVuNM9hhXA+M0q8X3+HpYuRE6xj
        291GJhBbSGA5o8TfIw5wHfPvfgIrYhMwlOh628UGYosIhEt8uXGbDaSIWeAUk8S1/72MIAlh
        gTCJV78fsILYLAKqEp9+PQebyitgK/Hl3h1miG3yEqs3HAC7SULgN5vE1ocXoBIuEkeWr4ay
        hSVeHd/CDmHLSJye3MMC0dDMKPHw3Fp2CKeHUeJy0wxGiCpriTvnfrGBgoBZQFNi/S59iLCj
        xKa/V5ghIcMnceOtIEiYGcictG06VJhXoqNNCKJaTWLW8XVwaw9euAR1jofE2xUnGSEhFCtx
        6fkX5gmMcrMQdi1gZFzFKJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmDxO/zv+ZQfjrj9J
        hxgFOBiVeHgfJB+LE2JNLCuuzD3EKMHBrCTCu5D/aJwQb0piZVVqUX58UWlOavEhRmkOFiVx
        XuNFL2OFBNITS1KzU1MLUotgskwcnFINjCZsCueNLx1Zel+yOfUZx7yYNK3DMxNv5Zi/bnP7
        MZn95g0e7qr+A3GJ7x2Ent4zC/iUsujJFk7j/t9Tgy7eaKp9oBqovlE9Xb5BdVbX4UxHfrtq
        QZlfe5Pdp7ca8q14W3h1c3395eaJHZGmOQffVckLGv/29UyQtffLfOpnUyWvJ7xFRPe+Ektx
        RqKhFnNRcSIAc7kAlhoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsVy+t/xu7o2y47HGdw6ym2xccZ6Vosvc0+x
        WMzcMIPFouPvF0aLy7vmsFl87j3CaDHj/D4mi7VH7rJbTL8rZPG59R+bxcoTs5gduD3e32hl
        95jdcJHFo+XkfhaPvi2rGD1OnnrC4vF5k1wAW5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJ
        pZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexpWT11kLnihVrJ90haWBcatsFyMnh4SAicS2u41M
        XYxcHEICSxklXn7rZ4RIyEicnNbACmELS/y51sUGUfSJUeLGhU5mkASbgKFE11uQBCeHiECk
        xOu9K8GKmAUuMEkcePwSrEhYIETiy8uL7CA2i4CqxKdfz5lAbF4BW4kv9+4wQ2yQl1i94QDz
        BEaeBYwMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQLDdtuxn1t2MHa9Cz7EKMDBqMTD+yD5
        WJwQa2JZcWXuIUYJDmYlEd6F/EfjhHhTEiurUovy44tKc1KLDzGaAi2fyCwlmpwPjKm8knhD
        U0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MPRPX/litvKYn8V5u8NSJ
        1aGexuaKDixSaxMXWhocquR0uewg/eUQe2zjk6uXnlzdN2Ebh/M8Ed7M07trPjA/ZU0J+/Iv
        f1/98j0imSvX30i8wcwZnchj0apSryf1qqb8gysji6/2Np64O51tVZOkfQUNma/M91/Eeey3
        QpDP8vdquc0W9xOUWIozEg21mIuKEwFeZN0KcQIAAA==
X-CMS-MailID: 20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7
References: <CGME20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7@eucas1p1.samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit 6fe12cdbcfe3 ("i2c: core: support bus regulator controlling in
adapter") added generic suspend and resume functions for i2c devices.
Those functions unconditionally access an i2c_client structure assigned
to the given i2c device. However, there exist i2c devices in the system
without a valid i2c_client. Add the needed check before accessing the
i2c_client.

This fixes the following issue observed on Samsung Exynos4412-based
Odroid U3 board:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000018
pgd = 2aed198a
[00000018] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 1 PID: 1295 Comm: rtcwake Not tainted 5.7.0-rc6-02700-g4773d1324da6 #739
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at i2c_suspend_late+0x20/0x48
LR is at dpm_run_callback+0xb4/0x3fc
pc : [<c07b404c>]    lr : [<c064b7cc>]    psr: 20000053
...
Process rtcwake (pid: 1295, stack limit = 0x7f1885cf)
Stack: (0xec8f3d70 to 0xec8f4000)
...
[<c07b404c>] (i2c_suspend_late) from [<c064b7cc>] (dpm_run_callback+0xb4/0x3fc)
[<c064b7cc>] (dpm_run_callback) from [<c064ce04>] (__device_suspend_late+0xcc/0x16c)
[<c064ce04>] (__device_suspend_late) from [<c064f0b0>] (dpm_suspend_late+0x10c/0x568)
[<c064f0b0>] (dpm_suspend_late) from [<c01996f0>] (suspend_devices_and_enter+0x31c/0xc70)
[<c01996f0>] (suspend_devices_and_enter) from [<c019a43c>] (pm_suspend+0x3f8/0x480)
[<c019a43c>] (pm_suspend) from [<c0198174>] (state_store+0x6c/0xc8)
[<c0198174>] (state_store) from [<c035cf4c>] (kernfs_fop_write+0x10c/0x228)
[<c035cf4c>] (kernfs_fop_write) from [<c02b94a4>] (__vfs_write+0x30/0x1d0)
[<c02b94a4>] (__vfs_write) from [<c02bc444>] (vfs_write+0xa4/0x170)
[<c02bc444>] (vfs_write) from [<c02bc690>] (ksys_write+0x60/0xd8)
[<c02bc690>] (ksys_write) from [<c0100060>] (ret_fast_syscall+0x0/0x28)
Exception stack(0xec8f3fa8 to 0xec8f3ff0)
...
---[ end trace a43afef431782f37 ]---

Fixes: 6fe12cdbcfe3 ("i2c: core: support bus regulator controlling in adapter")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This fixes suspend/resume issue observed on various board with linux-next
from 20200521.
---
 drivers/i2c/i2c-core-base.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5be24bf8a194..b531f5ad06b2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -454,11 +454,13 @@ static int i2c_device_remove(struct device *dev)
 static int i2c_resume_early(struct device *dev)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
-	struct i2c_adapter *adap = client->adapter;
 	int err;
 
+	if (!client)
+		return 0;
+
 	if (!pm_runtime_status_suspended(&client->dev)) {
-		err = regulator_enable(adap->bus_regulator);
+		err = regulator_enable(client->adapter->bus_regulator);
 		if (err)
 			return err;
 	}
@@ -469,15 +471,17 @@ static int i2c_resume_early(struct device *dev)
 static int i2c_suspend_late(struct device *dev)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
-	struct i2c_adapter *adap = client->adapter;
 	int err;
 
+	if (!client)
+		return 0;
+
 	err = pm_generic_suspend_late(&client->dev);
 	if (err)
 		return err;
 
 	if (!pm_runtime_status_suspended(&client->dev))
-		return regulator_disable(adap->bus_regulator);
+		return regulator_disable(client->adapter->bus_regulator);
 
 	return 0;
 }
@@ -487,10 +491,12 @@ static int i2c_suspend_late(struct device *dev)
 static int i2c_runtime_resume(struct device *dev)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
-	struct i2c_adapter *adap = client->adapter;
 	int err;
 
-	err = regulator_enable(adap->bus_regulator);
+	if (!client)
+		return 0;
+
+	err = regulator_enable(client->adapter->bus_regulator);
 	if (err)
 		return err;
 
@@ -500,14 +506,16 @@ static int i2c_runtime_resume(struct device *dev)
 static int i2c_runtime_suspend(struct device *dev)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
-	struct i2c_adapter *adap = client->adapter;
 	int err;
 
+	if (!client)
+		return 0;
+
 	err = pm_generic_runtime_suspend(&client->dev);
 	if (err)
 		return err;
 
-	return regulator_disable(adap->bus_regulator);
+	return regulator_disable(client->adapter->bus_regulator);
 }
 #endif
 
-- 
2.17.1

