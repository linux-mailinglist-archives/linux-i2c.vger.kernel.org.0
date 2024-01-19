Return-Path: <linux-i2c+bounces-1375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9059B8323FF
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 05:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FBBF286685
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 04:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D961870;
	Fri, 19 Jan 2024 04:07:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2084.outbound.protection.partner.outlook.cn [139.219.17.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E31C30;
	Fri, 19 Jan 2024 04:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705637262; cv=fail; b=ROAeq+8zqeMu4Mk3LR4WX6FriNtst1c4ib61vYKAt8JiHfHydcw02fi3GanwFteVGfe9SEqIBN1HP0rEQDAIIvo+l1N65NDNxw2zCd2bnyIczyGHeNdw2LzvO6F9d+xr5GJiQafTlPOeHTgO8wdtPg1kVrZSkICbyFurPsK0C8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705637262; c=relaxed/simple;
	bh=ZvL3V+AhywgSrOoq2sSvuSZDy3tF2fm83s+8ynxOPsk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AQJFGAemAGppoL8ukX6pX+f6av+aYQOcrN+OEXKlGcBZScdqPPooh6nhrvqNa0wzVtcaquo0uKnKwvntHXk7vXf/N+0ooWZXeAhJCGnuHyB8qBrhwuanOc5TdVgHwAlzJHQznlAwdzZmWHExuk4rOgLWoqape+0nGQGNTMECeI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/NV0tR8sfdeADM+fRIu0FY7DFOZHod0JU0BRzqN0Yz3BbtCV01o5GiHJOpcjtUNMyJRBtx+uMZNcSn5CBM0qfe526rg+Xv0LpYCSJAzX11qbfb5jnOTtPINYJ8wFNUrEYDqbW/S8HHVIHN20Pg9LzZjthMgwi6SitiZ8eh6NhOy48crmxFrmAjJ8AYXF+d+Mkgo/G2/Aob82LP3Xzn2XR5JE8TNkpUOXsrMlDUZDCpdeHFPWghGsWHkogfEmHG9STrL87l3SVK0owjxHHYr0yXzKMApGq0ZnjcdKlvpqbd5LVYTIMSanA+zpiwgAH6VJ4bF7fYnupXVfKQKEffOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHN2yRlgc83yoJrdYEEwnwT3hYYCyF7Hma4hPrSLxnU=;
 b=A0RImxqRWeeTRrqlFC5QlqVn/uBBWOG8BZt+IsJwbzrSE0btPYfLaSt7VvCQAyVkGoX2HPfZpisPUrQ/A2KDQudSrX/otYW1QC9O7jprlSQQkbIdpH16LSGK1pxYOqjjvvgof89TuO7B68FAFq7/WS2XGG5fgmGpOKOWNtfviKCakFX3IReuLGmHaPOdkTM8bAIfyt21LzA9ki1vqgqbK05RKaLxBBv84wp6z3xmyGMcT51RZvZx1IpbYG82cYSQp+DcYYZerBkVwKglRdNQ7Z8qIAaC3OxLZLKe27bgpTvLjXpLYLm+9nbCINwx4gEeOEJ+6egfHdCYa4jAZK9cHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB1272.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.32; Fri, 19 Jan
 2024 01:33:49 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::1dbb:b090:7d89:4e22]) by
 ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn ([fe80::1dbb:b090:7d89:4e22%4])
 with mapi id 15.20.7181.032; Fri, 19 Jan 2024 01:33:49 +0000
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] i2c: cadence: Add system suspend and resume PM support
Date: Fri, 19 Jan 2024 09:33:26 +0800
Message-ID: <20240119013326.3405484-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::7) To ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB1272:EE_
X-MS-Office365-Filtering-Correlation-Id: d89e61b0-d0ef-4615-f584-08dc188eafb8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wA+9CpdICGnhXRtYYppajEP7uvl4h/k5vRfuyW2MtpYttl4SefVxZFM9FIXKgyeWIeEuLxy6CVtaXoiXCzKzlOUuZs7HMVyU1hII2VSrEK0ZAF2Yx3NWxozxfcGO9WXtngo0QhFjRmO1tTn6Ynv/UJpYSel09rBMVm6mtfqLxp/szQaKsMe69aK4wUYTT+JJ/0BC/Q0ew2e8OdvHOqoHPW5vHh4eX1nEVyKYK8e2WBX4Pfkd+fJt4V52DLemU8Ma/MzvZ81QGXWRmVjbDSU73ERQvL5SRzlXOO0C+e+N9tuGS4bvEm83+vhFMDtc98H67UHnsPsCPT33OcauPIsT6s53PlXZVqOJUOOXtamJxN5jafTr57DwsmZF49D9QpdgdVVNvjjHCAW57VHA1UvNIMD/wCFNSr6AqDKigxT9jpBGH+sCsBukcBhpvoF9K6I7cLnPSCE5wVzHmRb+nh5fm4UKTPUl6e3KjTaBM/KfMEfSDare131Md2jI1CpT8I9rjyr6UB7QhSTc6IjwQJ3byFGjYrKgfQEMvkBpL9wP1wQlX34//jtKLnuJE5Is4ydl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38100700002)(26005)(1076003)(2616005)(6666004)(52116002)(2906002)(5660300002)(15650500001)(83380400001)(41300700001)(508600001)(966005)(4326008)(8676002)(8936002)(66556008)(66476007)(54906003)(110136005)(66946007)(40180700001)(40160700002)(86362001)(36756003)(38350700005)(41320700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EeGM9vJB3C/IM6uCUI9CrZAddFDqBdmyITWlf9oI5iuE0u5lzVEfCcDdumrg?=
 =?us-ascii?Q?dwzpQngcAyLewWK8+Jxl3orjnjwYrSA3em5ECX292+jPfMYemsl1Q1YtwRTE?=
 =?us-ascii?Q?yP9q4ILEV4TZ67+YuiVTyLLjy2yiaokcd+QAp5hqxxE5n8hIR3ge1WkD9UV0?=
 =?us-ascii?Q?x0OgRm6St57eJT8kX3svFkdxvF8exBjovn+nZMDtMWZXJciZyhf8zcYkqdX3?=
 =?us-ascii?Q?QG4n+KrV8GnQs0XKTZ9myjNYQvW9avwhN4IzaTEqd4hqcI7cYk20fVGZikxI?=
 =?us-ascii?Q?9WKJwsDR376eragAe8gmPoDy83HM8NIdVvVgLE4eDY+GcrbNtSHflDIQR1wU?=
 =?us-ascii?Q?RYwb32SfxBRw/P7tTPMbEnYTx/DeomfjQ1cnmYGlsRQTozixQQtAihkkXRVv?=
 =?us-ascii?Q?D7F8xT8UTPaMrvZXEdPmKhIzmBYoE3WqiL34+suwZJ1Zdb9bS3ELfFeXeQT0?=
 =?us-ascii?Q?U5S+6eCxDp5g6FneLBtKCcmGeWGJ4TX3YsSrB8WaRO69t0dZ6dKqxrCSw5pm?=
 =?us-ascii?Q?GF3jqbXcM1m696NZ+kSbXaFe/zEYHIb6r/a9OSudyE4s3A47hhsgx2E3ufR3?=
 =?us-ascii?Q?uXGRFXjcHfF3iL1t7HN2jhLK5WyMf9ucv59v7Kna/9u1lnMzels9n6tvlCzX?=
 =?us-ascii?Q?Jbrpav3lpkl3nUdL9nvtyfUp62gs5rn/gIoOhCTG4bjOYfQC0gx/r5aqTZcD?=
 =?us-ascii?Q?eSr+pDBppJil1SUMJyoVZI/T+6ZYEWf4p00XMhKdYxC08PegiaevI3tZ6gh+?=
 =?us-ascii?Q?XLxsqkr6XJnbo61CY4zj5oWC67IYgu25wGDT2IgQwcTpdyBANM8kr5DfIsBE?=
 =?us-ascii?Q?MgQrYE5wJ4AlVQPyB7oOes6rYloO+db42lj8XOebCvnD1Cp8My21x9DqhrlF?=
 =?us-ascii?Q?OAN5jF7Wzv+3XqZxF5LR15zGwRtfTdZ+18seLcrpQ5c/PHqctNFuCbIqmOlM?=
 =?us-ascii?Q?tTdoN1EvtSxEBoQLzzUvEGvxVy+NOhewH02xHhuaa/+zt7iiyjuNwUDTXjxH?=
 =?us-ascii?Q?pbpTTuPfLMzl+j6wDmjI2NzSQky5N4UNqE8HwBQcgo32z7yTLL4ihP9j6aL0?=
 =?us-ascii?Q?wD+kkRY55+mDQkqOvRNkizR9HJWEDvgg/ttoZa7m6z5J/MFxgzte4tzoIJG9?=
 =?us-ascii?Q?aiVxTAgX28WRtt0NwtZ/YKMjdMSSqe7qcAlJ1rjHrw79Z6QM4MdUet82r8Oy?=
 =?us-ascii?Q?5EiCIUH4NhnBm/gGPnId/x6tcrAq6tbjGmZXTiG2aAXDqLlWxckgGR4ZsDNG?=
 =?us-ascii?Q?+MVtgM6J5oztrGFv3xT8cOrVgjVX9yWpHs3TyGcwTEkoDA0yznryNnQO7qBR?=
 =?us-ascii?Q?1VHRZQyvD6DB9FdSk1zkPTEoMWmIm5wBHV8/ZOmRI7WwaFpETCYcsvzefHcE?=
 =?us-ascii?Q?ldn+TP79eF3LRfxDkHVm/0oNof9mryIOaYcfOOZV/ZVMXOASZI6yorAc83+t?=
 =?us-ascii?Q?kT6VuIdx4tHp9rLnROGFmT1K1HRfmXVMqGWGvk0NhyHXC5aBEl+lbxddxjl3?=
 =?us-ascii?Q?iUWaVtERGRSRdGcj9Kq6TJCjS1wHZjVUCy2HS1D7fZEqvYVqgYnMi3elaTHt?=
 =?us-ascii?Q?9+2Qo+FqWM1315c5zX06rPpKSCFplg8N28B9PMXIzOwoJSTdJHGcBmAJVDos?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89e61b0-d0ef-4615-f584-08dc188eafb8
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 01:33:49.4561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UP+mF4bJgGMVpqvG+w9rg91J08WDTvW/tAF36R366lVU/AkbXvYDopo0YCH1TtOxceWAjW5m8aSbdvfx1AwQNwr0zQLxoZACfPDy0xHTnls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1272

Enable device system suspend and resume PM support, and mark the device
state as suspended during system suspend to reject any data transfer.

Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
---
Initial v2 was archived, previous discussion can be found in [1].
[1]: https://lore.kernel.org/all/20231209131516.1916550-1-jisheng.teoh@starfivetech.com/

Changes since v1:
- Add missing err assignment in cdns_i2c_resume().
---
 drivers/i2c/busses/i2c-cadence.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index de3f58b60dce..4bb7d6756947 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1176,6 +1176,18 @@ static int __maybe_unused cdns_i2c_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused cdns_i2c_suspend(struct device *dev)
+{
+	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
+
+	i2c_mark_adapter_suspended(&xi2c->adap);
+
+	if (!pm_runtime_status_suspended(dev))
+		return cdns_i2c_runtime_suspend(dev);
+
+	return 0;
+}
+
 /**
  * cdns_i2c_init -  Controller initialisation
  * @id:		Device private data structure
@@ -1219,7 +1231,28 @@ static int __maybe_unused cdns_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused cdns_i2c_resume(struct device *dev)
+{
+	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
+	int err;
+
+	err = cdns_i2c_runtime_resume(dev);
+	if (err)
+		return err;
+
+	if (pm_runtime_status_suspended(dev)) {
+		err = cdns_i2c_runtime_suspend(dev);
+		if (err)
+			return err;
+	}
+
+	i2c_mark_adapter_resumed(&xi2c->adap);
+
+	return 0;
+}
+
 static const struct dev_pm_ops cdns_i2c_dev_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(cdns_i2c_suspend, cdns_i2c_resume)
 	SET_RUNTIME_PM_OPS(cdns_i2c_runtime_suspend,
 			   cdns_i2c_runtime_resume, NULL)
 };
-- 
2.43.0


